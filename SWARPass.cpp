#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"

using namespace llvm;

namespace {

const char *type_id[20] = {  "HalfTyID" , "BFloatTyID", "FloatTyID", "DoubleTyID", 
  "X86_FP80TyID", "FP128TyID", "PPC_FP128TyID", "VoidTyID", 
  "LabelTyID", "MetadataTyID", "X86_MMXTyID", "X86_AMXTyID", 
  "TokenTyID", "IntegerTyID", "FunctionTyID", "PointerTyID", 
  "StructTyID", "ArrayTyID", "FixedVectorTyID", "ScalableVectorTyID" };

struct SWARPass : public llvm::PassInfoMixin<SWARPass> {
  llvm::PreservedAnalyses run(llvm::Function &F,
                              llvm::FunctionAnalysisManager &);
  bool runOnBasicBlock(llvm::BasicBlock &B);
  struct Mask{
  unsigned long long  mask_low[4]={0,0,0,0};
  unsigned long long  mask_high[4]={0,0,0,0};
  };

  Mask genBitMask(int repeats, int lengthPerRepeat);
  Instruction* SWARAdd(llvm::BasicBlock* BB,llvm::BinaryOperator* BinOP);
};



SWARPass::Mask SWARPass::genBitMask(int repeats, int lengthPerRepeat){
  SWARPass::Mask mask;
  for(int i=0; i< repeats*lengthPerRepeat;i++){
    if(i%lengthPerRepeat!=0){
      mask.mask_low[i/64]=(mask.mask_low[i/64] << 1)|1;
      mask.mask_high[i/64]=(mask.mask_high[i/64] << 1)|0;
    }
    else{
      mask.mask_low[i/64]=(mask.mask_low[i/64] << 1)|0;
      mask.mask_high[i/64]=(mask.mask_high[i/64] << 1)|1;
    }
  }
  return mask;
}

Instruction* SWARPass::SWARAdd(llvm::BasicBlock* BB,llvm::BinaryOperator* BinOp){
  auto *t = dyn_cast<VectorType>(BinOp->getType());
  auto typeSize = t->getElementType()->getPrimitiveSizeInBits().getFixedSize();
  auto elementCount = t->getElementCount().getFixedValue();
  auto totalBits = typeSize * elementCount;
  if (totalBits > 128){
    return nullptr;
  }
  if (typeSize == 8 || typeSize > 15) {
    return nullptr;
  }
  IRBuilder<> Builder(BinOp);
  SWARPass::Mask mask =genBitMask(elementCount,typeSize);
  errs() <<"mask_low"<< mask.mask_low[0] << "\n";
  errs() <<"mask_high"<< mask.mask_high[0] << "\n";
  Value* LOW_MASK;
  Value* HIGH_MASK;
  if (totalBits <= 64){
    LOW_MASK = ConstantInt::get(llvm::IntegerType::get(BB->getContext(),totalBits), mask.mask_low[0]);
    HIGH_MASK = ConstantInt::get(llvm::IntegerType::get(BB->getContext(),totalBits), mask.mask_high[1]);
  }
  else if(totalBits>64 && totalBits<=128){
    LOW_MASK=Builder.CreateAnd(
        ConstantInt::get(llvm::IntegerType::get(BB->getContext(),totalBits), mask.mask_low[0])
        ,
        Builder.CreateShl(
          ConstantInt::get(llvm::IntegerType::get(BB->getContext(),totalBits), mask.mask_low[1])
          ,
          64
        )
      );
    HIGH_MASK=Builder.CreateAnd(
        ConstantInt::get(llvm::IntegerType::get(BB->getContext(),totalBits), mask.mask_high[0])
        ,
        Builder.CreateShl(
          ConstantInt::get(llvm::IntegerType::get(BB->getContext(),totalBits), mask.mask_high[1])
          ,
          64
        )
      );
  }
  
  Instruction* NewInst = new
    // bitcast r4 to 4xi3
    llvm::BitCastInst(
      // BinOp,llvm::IntegerType::get(BB.getContext(),12)
      // r4 = xor i12 r1 r3
      Builder.CreateXor(
        // r1 = add i12 m1 m2
        Builder.CreateAdd(
          // m1 = and i12 a1 1755 "011011011011"
          Builder.CreateAnd(
            // a1 = bitcast a to i12
            Builder.CreateBitCast(
              BinOp->getOperand(0)
              ,
              llvm::IntegerType::get(BB->getContext(),totalBits)
            )
            ,
            LOW_MASK
          )
          ,
          // m2 = and i12 a2 1755 "011011011011"
          Builder.CreateAnd(
            // a2 = bitcast a to i12
            Builder.CreateBitCast(
              BinOp->getOperand(1)
              ,
              llvm::IntegerType::get(BB->getContext(),totalBits)
            )
            ,
            LOW_MASK
          )
        )
        ,
        // r3 = and i12 r2 2340 "100100100100"
        Builder.CreateAnd(
          // r2 = xor i12 a1 a2
          Builder.CreateXor(
            // a1 = bitcast a to i12
            Builder.CreateBitCast(
              BinOp->getOperand(0)
              ,
              llvm::IntegerType::get(BB->getContext(),totalBits)
            )
            ,
            // a2 = bitcast b to i12
            Builder.CreateBitCast(
              BinOp->getOperand(1)
              ,
              llvm::IntegerType::get(BB->getContext(),totalBits)
            )
          )
          ,
          HIGH_MASK
        )
      )
      ,t
    );
  return NewInst;

}





bool SWARPass::runOnBasicBlock(BasicBlock &BB) {

  // Loop over all instructions in the block. Replacing instructions requires
  // iterators, hence a for-range loop wouldn't be suitable
  for (auto Inst = BB.begin(), IE = BB.end(); Inst != IE; ++Inst) {

    if (Inst->isUnaryOp()){
      auto *UnInst = dyn_cast<UnaryInstruction>(Inst);
    }
    if (Inst->isBinaryOp()){
      auto *BinOp = dyn_cast<BinaryOperator>(Inst);
      auto *t = dyn_cast<VectorType>(BinOp->getType());
      errs() << type_id[t->getElementType ()->getTypeID ()] << "\n";
      errs() <<"i" <<t->getElementType ()->getPrimitiveSizeInBits () << "\n";
      errs() <<"x"<< t->getElementCount () << "\n";
      Instruction* NewInst=nullptr;
      switch (BinOp->getOpcode())
      {
      case Instruction::Add:
        NewInst = SWARAdd(&BB,BinOp);
        break;
      default:
        break;
      }
      if (NewInst!=nullptr){
        ReplaceInstWithInst(BB.getInstList(), Inst, NewInst);
      }
    }




  }
  return true;
}

PreservedAnalyses SWARPass::run(llvm::Function &F,
                              llvm::FunctionAnalysisManager &) {
  bool Changed = true;

  for (auto &BB : F) {
    Changed |= runOnBasicBlock(BB);
  }
  return (Changed ? llvm::PreservedAnalyses::none()
                  : llvm::PreservedAnalyses::all());
}





//-----------------------------------------------------------------------------
// New PM Registration
//-----------------------------------------------------------------------------
llvm::PassPluginLibraryInfo getSWARPassPluginInfo() {
  return {LLVM_PLUGIN_API_VERSION, "SWARPass", LLVM_VERSION_STRING,
          [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(
                [](StringRef Name, FunctionPassManager &FPM,
                   ArrayRef<PassBuilder::PipelineElement>) {
                  if (Name == "swar-pass") {
                    FPM.addPass(SWARPass());
                    return true;
                  }
                  return false;
                });
          }};
}

// This is the core interface for pass plugins. It guarantees that 'opt' will
// be able to recognize HelloWorld when added to the pass pipeline on the
// command line, i.e. via '-passes=hello-world'
extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
  return getSWARPassPluginInfo();
}

}
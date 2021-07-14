#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include <bitset>

using namespace llvm;

namespace {

 const char *type_id[20] = {  "HalfTyID" , "BFloatTyID", "FloatTyID", "DoubleTyID", 
  "X86_FP80TyID", "FP128TyID", "PPC_FP128TyID", "VoidTyID", 
  "LabelTyID", "MetadataTyID", "X86_MMXTyID", "X86_AMXTyID", 
  "TokenTyID", "IntegerTyID", "FunctionTyID", "PointerTyID", 
  "StructTyID", "ArrayTyID", "FixedVectorTyID", "ScalableVectorTyID" };

struct TestPass : public llvm::PassInfoMixin<TestPass> {
  llvm::PreservedAnalyses run(llvm::Function &F,
                              llvm::FunctionAnalysisManager &);
  bool runOnBasicBlock(llvm::BasicBlock &B);
  __uint128_t genBitMask(int startPos, int repeats, int lengthPerRepeat, int numberOfOne);
};

__uint128_t TestPass::genBitMask(int startPos, int repeats, int lengthPerRepeat, int numberOfOne){
  __uint128_t mask = 0;
  __uint128_t bitSetMask = 0;
  for (int i = 0; i < numberOfOne; i++) {
    bitSetMask = (bitSetMask << 1) | 1;
  }
  bitSetMask = bitSetMask << startPos;
  for (int i = 0; i < repeats; i++) {
    mask = mask << lengthPerRepeat;
    mask |= bitSetMask;
  }
  return mask;
}


bool TestPass::runOnBasicBlock(BasicBlock &BB) {

  // Loop over all instructions in the block. Replacing instructions requires
  // iterators, hence a for-range loop wouldn't be suitable
  for (auto Inst = BB.begin(), IE = BB.end(); Inst != IE; ++Inst) {
    // Skip non-binary (e.g. unary or compare) instructions
    auto *BinOp = dyn_cast<BinaryOperator>(Inst);
    if (!BinOp)
      continue;

    // Skip instructions other than add
    if (BinOp->getOpcode() != Instruction::Add)
      continue;


   
    errs() << type_id[BinOp->getType()->getTypeID ()] << "\n";
    // skip non-vector type operands
    if (BinOp->getType()->isVectorTy()){
      auto *t = dyn_cast<VectorType>(BinOp->getType());
      // errs() << type_id[t->getElementType ()->getTypeID ()] << "\n";

      // get element type size
      auto typeSize = t->getElementType()->getPrimitiveSizeInBits().getFixedSize();
      errs() <<"i" <<t->getElementType ()->getPrimitiveSizeInBits();
      // get element count
      auto elementCount = t->getElementCount().getFixedValue();
      errs() <<"x" << t->getElementCount();
      auto totalBits = typeSize * elementCount;
      errs() << " totalBits:" << totalBits << "\n";

      // skip vector size > 128 bits
      if (totalBits > 128){
        continue;
      }
      if (typeSize == 8 || typeSize > 15) {
        continue;
      }

      // generate 2 instants for operation
      __uint128_t mask1 = genBitMask(0, elementCount, typeSize, typeSize-1);
      __uint128_t mask2 = ~mask1;

      auto LOW_MASK = ConstantInt::get(llvm::IntegerType::get(BB.getContext(),totalBits), mask1);
      auto HIGH_MASK = ConstantInt::get(llvm::IntegerType::get(BB.getContext(),totalBits), mask2);
      IRBuilder<> Builder(BinOp);
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
                  llvm::IntegerType::get(BB.getContext(),totalBits)
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
                  llvm::IntegerType::get(BB.getContext(),totalBits)
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
                  llvm::IntegerType::get(BB.getContext(),totalBits)
                )
                ,
                // a2 = bitcast b to i12
                Builder.CreateBitCast(
                  BinOp->getOperand(1)
                  ,
                  llvm::IntegerType::get(BB.getContext(),totalBits)
                )
              )
              ,
              HIGH_MASK
            )
          )
          ,t
        );
      errs() << *BinOp << " -> " << *NewInst << "\n";
      ReplaceInstWithInst(BB.getInstList(), Inst, NewInst);
    }


  }
  return true;
}

PreservedAnalyses TestPass::run(llvm::Function &F,
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
llvm::PassPluginLibraryInfo getTestPassPluginInfo() {
  return {LLVM_PLUGIN_API_VERSION, "TestPass", LLVM_VERSION_STRING,
          [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(
                [](StringRef Name, FunctionPassManager &FPM,
                   ArrayRef<PassBuilder::PipelineElement>) {
                  if (Name == "test-pass") {
                    FPM.addPass(TestPass());
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
  return getTestPassPluginInfo();
}

}
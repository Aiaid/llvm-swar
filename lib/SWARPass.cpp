#include "SWARPass.h"

namespace llvm{
const char *type_id[20] = {  "HalfTyID" , "BFloatTyID", "FloatTyID", "DoubleTyID", 
    "X86_FP80TyID", "FP128TyID", "PPC_FP128TyID", "VoidTyID", 
    "LabelTyID", "MetadataTyID", "X86_MMXTyID", "X86_AMXTyID", 
    "TokenTyID", "IntegerTyID", "FunctionTyID", "PointerTyID", 
    "StructTyID", "ArrayTyID", "FixedVectorTyID", "ScalableVectorTyID" };
    
bool SWARPass::runOnBasicBlock(BasicBlock &BB) {

    // Loop over all instructions in the block. Replacing instructions requires
    // iterators, hence a for-range loop wouldn't be suitable
    for (auto Inst = BB.begin(), IE = BB.end(); Inst != IE; ++Inst) {
      // errs() << Inst->getOpcodeName () << "\n";
      if (Inst->isUnaryOp()){
        auto *UnInst = dyn_cast<UnaryInstruction>(Inst);
      }
      Instruction* NewInst=nullptr;
      // check if it is a call operation
      if (Inst->getOpcode() == 56) {
        auto *callInst = dyn_cast<CallInst>(Inst);
        auto *calledFunc = callInst->getCalledFunction();
        if (calledFunc->isIntrinsic()) {
          // check if it is ctpop intrinsic
          if (calledFunc->getIntrinsicID() == 50 && calledFunc->getReturnType()->isVectorTy()) {
            auto operand = callInst->getOperand(0);
            IRBuilder<> Builder(callInst);
            NewInst = SWARctpop(&BB, operand, Builder);
          } else if (calledFunc->getIntrinsicID() == 51 && calledFunc->getReturnType()->isVectorTy()) {
            auto operand = callInst->getOperand(0);
            IRBuilder<> Builder(callInst);
            NewInst = SWARcttz(&BB, operand, Builder);
          } else if (calledFunc->getIntrinsicID() == 49 && calledFunc->getReturnType()->isVectorTy()) {
            auto operand = callInst->getOperand(0);
            IRBuilder<> Builder(callInst);
            NewInst = SWARctlz(&BB, operand, Builder);
          }
        }
      }
      if (Inst->isBinaryOp()){
        auto *BinOp = dyn_cast<BinaryOperator>(Inst);
        if(!BinOp->getType()->isVectorTy ()){

          continue;
        }
        auto *t = dyn_cast<VectorType>(BinOp->getType());
        errs() << type_id[t->getElementType ()->getTypeID ()] << "\n";
        errs() <<"i" <<t->getElementType ()->getPrimitiveSizeInBits () << "\n";
        errs() <<"x"<< t->getElementCount () << "\n";
        IRBuilder<> Builder(BinOp);
        
        switch (BinOp->getOpcode())
        {
        // case Instruction::Add:
        //   NewInst = SWARAdd(&BB, BinOp->getOperand(0), BinOp->getOperand(1), Builder);
        //   break;
        // case Instruction::Sub:
        //   NewInst = SWARSub(&BB, BinOp->getOperand(0), BinOp->getOperand(1), Builder);
        //   break;
        case Instruction::Mul:
          NewInst = SWARMul(&BB, BinOp->getOperand(0), BinOp->getOperand(1), Builder);
          break;
        case Instruction::UDiv:
          NewInst = SWARDiv(&BB, BinOp->getOperand(0), BinOp->getOperand(1), Builder);
          break;
        case Instruction::URem:
          NewInst = SWARRem(&BB, BinOp->getOperand(0), BinOp->getOperand(1), Builder);
          break;
        default:
          break;
        }
        
      }
      if (NewInst!=nullptr){
        ReplaceInstWithInst(BB.getInstList(), Inst, NewInst);
      }

    }
    
    for (auto Inst = BB.begin(), IE = BB.end(); Inst != IE; ++Inst) {
      Instruction* NewInst=nullptr;
      if (Inst->isBinaryOp()){
        auto *BinOp = dyn_cast<BinaryOperator>(Inst);
        if(!BinOp->getType()->isVectorTy ()){

          continue;
        }
        auto *t = dyn_cast<VectorType>(BinOp->getType());
        IRBuilder<> Builder(BinOp);
        
        switch (BinOp->getOpcode())
        {
        case Instruction::Add:
          NewInst = SWARAdd(&BB, BinOp->getOperand(0), BinOp->getOperand(1), Builder);
          break;
        case Instruction::Sub:
          NewInst = SWARSub(&BB, BinOp->getOperand(0), BinOp->getOperand(1), Builder);
          break;
        default:
          break;
        }
        
      }
      if (NewInst!=nullptr){
        ReplaceInstWithInst(BB.getInstList(), Inst, NewInst);
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
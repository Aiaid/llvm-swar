//=============================================================================
// FILE:
//    HelloWorld.cpp
//
// DESCRIPTION:
//    Visits all functions in a module, prints their names and the number of
//    arguments via stderr. Strictly speaking, this is an analysis pass (i.e.
//    the functions are not modified). However, in order to keep things simple
//    there's no 'print' method here (every analysis pass should implement it).
//
// USAGE:
//    1. Legacy PM
//      opt -load libHelloWorld.dylib -legacy-hello-world -disable-output `\`
//        <input-llvm-file>
//    2. New PM
//      opt -load-pass-plugin=libHelloWorld.dylib -passes="hello-world" `\`
//        -disable-output <input-llvm-file>
//
//
// License: MIT
//=============================================================================
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"

using namespace llvm;

//-----------------------------------------------------------------------------
// HelloWorld implementation
//-----------------------------------------------------------------------------
// No need to expose the internals of the pass to the outside world - keep
// everything in an anonymous namespace.
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
};


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
    if (BinOp->getType()->isVectorTy()){
      auto *t = dyn_cast<VectorType>(BinOp->getType());
      errs() << type_id[t->getElementType ()->getTypeID ()] << "\n";
      errs() <<"i" <<t->getElementType ()->getPrimitiveSizeInBits () << "\n";
      errs() <<"x"<< t->getElementCount () << "\n";
      auto Val1755 = ConstantInt::get(llvm::IntegerType::get(BB.getContext(),12), 1755);
      auto Val2340 = ConstantInt::get(llvm::IntegerType::get(BB.getContext(),12), 2340);
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
                  llvm::IntegerType::get(BB.getContext(),12)
                )
                ,
                Val1755
              )
              ,
              // m2 = and i12 a2 1755 "011011011011"
              Builder.CreateAnd(
                // a2 = bitcast a to i12
                Builder.CreateBitCast(
                  BinOp->getOperand(1)
                  ,
                  llvm::IntegerType::get(BB.getContext(),12)
                )
                ,
                Val1755
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
                  llvm::IntegerType::get(BB.getContext(),12)
                )
                ,
                // a2 = bitcast b to i12
                Builder.CreateBitCast(
                  BinOp->getOperand(1)
                  ,
                  llvm::IntegerType::get(BB.getContext(),12)
                )
              )
              ,
              Val2340
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
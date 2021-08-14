#include "llvm/IR/PassManager.h"
#include "llvm/Pass.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/IR/IntrinsicsX86.h"
#include "llvm/ADT/APInt.h"
#include <math.h> 
#ifndef LLVM_SWAR
#define LLVM_SWAR

    

    struct SWARPass : public llvm::PassInfoMixin<SWARPass> {
    llvm::PreservedAnalyses run(llvm::Function &F,
                                llvm::FunctionAnalysisManager &);
    bool runOnBasicBlock(llvm::BasicBlock &B);
    struct Mask{
    unsigned long long  mask_low[4]={0,0,0,0};
    unsigned long long  mask_high[4]={0,0,0,0};
    };

    Mask genBitMask(int repeats, int lengthPerRepeat);
    llvm::Instruction* SWARAdd(llvm::BasicBlock* BB, llvm::Value* op0, llvm::Value* op1, llvm::IRBuilder<> &Builder);
    llvm::Instruction* SWARSub(llvm::BasicBlock* BB, llvm::Value* op0, llvm::Value* op1, llvm::IRBuilder<> &Builder);
    llvm::Instruction* SWARMul(llvm::BasicBlock* BB, llvm::Value* op0, llvm::Value* op1, llvm::IRBuilder<> &Builder);
    llvm::Instruction* SWARDiv(llvm::BasicBlock* BB, llvm::Value* op0, llvm::Value* op1, llvm::IRBuilder<> &Builder);
    llvm::Instruction* SWARRem(llvm::BasicBlock* BB, llvm::Value* op0, llvm::Value* op1, llvm::IRBuilder<> &Builder);
    llvm::Instruction* SWARcttz(llvm::BasicBlock* BB,llvm::Value* operand, llvm::IRBuilder<> &Builder);
    llvm::Instruction* SWARctpop(llvm::BasicBlock* BB,llvm::Value* operand, llvm::IRBuilder<> &Builder);
    llvm::Instruction* SWARctlz(llvm::BasicBlock* BB,llvm::Value* operand, llvm::IRBuilder<> &Builder);
    llvm::APInt genBitMask4pc(int repeats, int lengthPerRepeat, int numOf1s);
    int nearestPowerOfTwo(int n);
    };

    
#endif
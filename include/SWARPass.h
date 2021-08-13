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
    Instruction* SWARAdd(BasicBlock* BB, Value* op0, Value* op1, IRBuilder<> &Builder);
    Instruction* SWARSub(llvm::BasicBlock* BB, Value* op0, Value* op1, IRBuilder<> &Builder);
    Instruction* SWARMul(llvm::BasicBlock* BB, Value* op0, Value* op1, IRBuilder<> &Builder);
    Instruction* SWARDiv(llvm::BasicBlock* BB, Value* op0, Value* op1, IRBuilder<> &Builder);
    Instruction* SWARRem(llvm::BasicBlock* BB, Value* op0, Value* op1, IRBuilder<> &Builder);
    Instruction* SWARcttz(llvm::BasicBlock* BB,llvm::Value* operand, IRBuilder<> &Builder);
    Instruction* SWARctpop(llvm::BasicBlock* BB,llvm::Value* operand, IRBuilder<> &Builder);
    Instruction* SWARctlz(llvm::BasicBlock* BB,llvm::Value* operand, IRBuilder<> &Builder);
    APInt genBitMask4pc(int repeats, int lengthPerRepeat, int numOf1s);
    int nearestPowerOfTwo(int n);
    };

    struct MBAAdd : public llvm::PassInfoMixin<MBAAdd> {
    llvm::PreservedAnalyses run(llvm::Function &F,
                                llvm::FunctionAnalysisManager &);
    bool runOnBasicBlock(llvm::BasicBlock &B);
    };
    
}
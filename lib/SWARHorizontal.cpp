#include "SWARPass.h"

using namespace llvm;

  int SWARPass::nearestPowerOfTwo(int n) {
      int v = n; 
      // up to 32 bits
      v--;
      v |= v >> 1;
      v |= v >> 2;
      v |= v >> 4;
      v |= v >> 8;
      v |= v >> 16;
      v++; // next power of 2

      return v;
  }

  SWARPass::Mask SWARPass::genBitMask(int repeats, int lengthPerRepeat){
    SWARPass::Mask mask;
    unsigned long long temp=0;
    for(int i=repeats*lengthPerRepeat-1; i>=0;i--){
      if((i+1)%lengthPerRepeat!=0){
        mask.mask_low[i/64]=mask.mask_low[i/64]|(unsigned long long)1<<i%64;
        mask.mask_high[i/64]=mask.mask_high[i/64]|(unsigned long long)0<<i%64;
      }
      else{
        mask.mask_low[i/64]=mask.mask_low[i/64]|(unsigned long long)0<<i%64;
        mask.mask_high[i/64]=mask.mask_high[i/64]|(unsigned long long)1<<i%64;
      }
    }
    return mask;
  }

  APInt SWARPass::genBitMask4pc(int repeats, int lengthPerRepeat, int numOf1s){
    APInt mask = APInt(repeats*lengthPerRepeat, 0, false);
    for (uint i=0; i < repeats*lengthPerRepeat; i+=lengthPerRepeat){
      mask.setBits(i, i+numOf1s);
    }
    return mask;
  }


  Instruction* SWARPass::SWARctpop(llvm::BasicBlock* BB,llvm::Value* operand, IRBuilder<> &Builder) {
    auto *t_operand = dyn_cast<VectorType>(operand->getType());
    auto typeSize = t_operand->getElementType()->getPrimitiveSizeInBits().getFixedSize();
    if (typeSize > 32) {
      return nullptr;
    }

    auto elementCount = t_operand->getElementCount().getFixedValue();
    auto totalBits = typeSize * elementCount;
    auto normTypeSize = typeSize;
    auto normTotalBits = totalBits;
    // Value* operand = op->getOperand(0);
    // check if typeSize is power of 2
    if ((typeSize & (typeSize - 1)) != 0) {
      // zext each field to proper length
      normTypeSize = nearestPowerOfTwo(typeSize);
      normTotalBits = normTypeSize * elementCount;
      operand = Builder.CreateZExt(operand, llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),normTypeSize),elementCount));
    }
    errs() << elementCount << " x i" << normTypeSize << "\n";
    auto a = Builder.CreateBitCast(operand,llvm::IntegerType::get(BB->getContext(),normTotalBits));
    for (unsigned i = 2; i <= normTypeSize; i*=2){
      APInt mask = genBitMask4pc(normTotalBits/i, i, i/2);
      Value* b0 = Builder.CreateAnd(a, mask);
      Value* b1 = Builder.CreateAnd(Builder.CreateLShr(a, i/2), mask);
      a = Builder.CreateAdd(b0, b1);
    }

    return new TruncInst(Builder.CreateBitCast(a, llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),normTypeSize),elementCount)), t_operand);
  }

  Instruction* SWARPass::SWARcttz(llvm::BasicBlock* BB,llvm::Value* operand, IRBuilder<> &Builder) {
    auto *t_operand = dyn_cast<VectorType>(operand->getType());
    auto typeSize = t_operand->getElementType()->getPrimitiveSizeInBits().getFixedSize();
    if (typeSize > 32) {
      return nullptr;
    }

    auto elementCount = t_operand->getElementCount();

    auto a = Builder.CreateNot(operand);
    auto b = Builder.CreateAdd(a, ConstantInt::get(t_operand, 1));
    auto c = Builder.CreateAnd(operand, b);
    auto d = Builder.CreateSub(c, ConstantInt::get(t_operand, 1));
    
    return SWARctpop(BB, d, Builder);
  }

  Instruction* SWARPass::SWARctlz(llvm::BasicBlock* BB,llvm::Value* operand, IRBuilder<> &Builder) {
    auto *t_operand = dyn_cast<VectorType>(operand->getType());
    auto typeSize = t_operand->getElementType()->getPrimitiveSizeInBits().getFixedSize();
    if (typeSize > 32) {
      return nullptr;
    }
    auto elementCount = t_operand->getElementCount().getFixedValue();
    unsigned i;
    unsigned counter = 0;
    for (i = 1; i <= typeSize/2; i*=2) {
      operand = Builder.CreateOr(operand, Builder.CreateLShr(operand, ConstantInt::get(t_operand, i)));
      counter += i;
    }
    counter = typeSize - 1 - counter;
    operand = Builder.CreateOr(operand, Builder.CreateLShr(operand, ConstantInt::get(t_operand, counter)));
    auto neg = Builder.CreateNot(operand);
    return SWARctpop(BB, neg, Builder);
  }

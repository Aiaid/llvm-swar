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

APInt SWARPass::genBitMask4pc(int repeats, int lengthPerRepeat, int numOf1s, int leftSpaces, int every, int totalLength) {
  APInt mask = APInt(totalLength, 0, false);
  uint i = 0;
  while (i < totalLength) {
    for (int j=0; j < every; j++) {
      mask.setBits(i, i+numOf1s);
      i += lengthPerRepeat;
    }
    i += leftSpaces;
  }
  return mask;
}

Value* SWARPass::caliLegalPop(Value* a, int fw, int actualFw, int totalBits, IRBuilder<> &Builder) {
  if (actualFw == 1) {
    return a;
  }

  int normFw = nearestPowerOfTwo(actualFw);
  APInt mask = genBitMask4pc(totalBits/fw, fw, normFw/2, 0, 1, totalBits);
  
  Value* rightHalf = Builder.CreateAnd(a, mask);
  // errs() << mask << "\n";
  mask.flipAllBits();
  // errs() << mask << "\n";
  Value* leftHalf = Builder.CreateLShr(Builder.CreateAnd(a, mask),normFw/2);
  // errs() << actualFw - normFw/2 << "\n";
  int upperFw = actualFw - normFw/2;
  Value* leftResult;
  if ((upperFw & (upperFw - 1)) == 0) {
    leftResult = calLegalPop(leftHalf, fw, upperFw, totalBits, Builder);
  } else {
    leftResult = caliLegalPop(leftHalf, fw, actualFw - normFw/2, totalBits, Builder);
  }
  Value* rightResult = calLegalPop(rightHalf, fw, normFw/2, totalBits, Builder);

  // add left and right result together
  
  APInt ADD_MASK = genBitMask4pc(totalBits/fw, fw, fw-1, 0, 1, totalBits);
  auto m1=Builder.CreateAnd(leftResult,ADD_MASK);

  auto m2=Builder.CreateAnd(rightResult,ADD_MASK);
  ADD_MASK.flipAllBits();

  auto r1=Builder.CreateAdd(m1,m2);
  auto r2=Builder.CreateXor(leftResult,rightResult);
  auto r3=Builder.CreateAnd(r2, ADD_MASK);
  auto r4=Builder.CreateXor(r1,r3);

  return r4;
}

Value* SWARPass::calLegalPop(Value* a, int fw, int actualFw, int totalBits, IRBuilder<> &Builder) {
  if (actualFw == 1) {
    return a;
  }
  for (unsigned i = 2; i <= actualFw; i*=2){
    APInt mask = genBitMask4pc((actualFw/i)*(totalBits/fw), i, i/2, fw-actualFw, (actualFw/i), totalBits);
    Value* b0 = Builder.CreateAnd(a, mask);
    Value* b1 = Builder.CreateAnd(Builder.CreateLShr(a, i/2), mask);
    a = Builder.CreateAdd(b0, b1);
  }
  return a;
}

Instruction* SWARPass::SWARctpop(llvm::BasicBlock* BB,llvm::Value* operand, IRBuilder<> &Builder) {
  auto *t_operand = dyn_cast<VectorType>(operand->getType());
  auto typeSize = t_operand->getElementType()->getPrimitiveSizeInBits().getFixedSize();
  if (typeSize > 32) {
    return nullptr;
  }

  auto elementCount = t_operand->getElementCount().getFixedValue();
  auto totalBits = typeSize * elementCount;

  auto a = Builder.CreateBitCast(operand,llvm::IntegerType::get(BB->getContext(),totalBits));

  // check if typeSize is power of 2
  if ((typeSize & (typeSize - 1)) != 0) {
    // // zext each field to proper length
    auto res = caliLegalPop(a, typeSize, typeSize, totalBits, Builder);
    return new llvm::BitCastInst(res, t_operand);
  }
  return new llvm::BitCastInst(calLegalPop(a, typeSize, typeSize, totalBits, Builder), t_operand);
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
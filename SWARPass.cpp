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
  Instruction* SWARAdd(llvm::BasicBlock* BB,llvm::BinaryOperator* BinOP);
  Instruction* SWARSub(llvm::BasicBlock* BB,llvm::BinaryOperator* BinOP);
  Instruction* SWARMul(llvm::BasicBlock* BB,llvm::BinaryOperator* BinOP);
  Instruction* SWARDiv(llvm::BasicBlock* BB,llvm::BinaryOperator* BinOP);
  Instruction* SWARRem(llvm::BasicBlock* BB,llvm::BinaryOperator* BinOP);
  Instruction* SWARcttz(llvm::BasicBlock* BB,llvm::Value* operand, IRBuilder<> &Builder);
  Instruction* SWARctpop(llvm::BasicBlock* BB,llvm::Value* operand, IRBuilder<> &Builder);
  Instruction* SWARctlz(llvm::BasicBlock* BB,llvm::Value* operand, IRBuilder<> &Builder);
  APInt genBitMask4pc(int repeats, int lengthPerRepeat, int numOf1s);
  int nearestPowerOfTwo(int n);
};

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
  Value* LOW_MASK;
  Value* HIGH_MASK;
  if (totalBits <= 64){
    LOW_MASK = ConstantInt::get(llvm::IntegerType::get(BB->getContext(),totalBits), mask.mask_low[0]);
    HIGH_MASK = ConstantInt::get(llvm::IntegerType::get(BB->getContext(),totalBits), mask.mask_high[0]);
  }
  else if(totalBits>64 && totalBits<=128){
    LOW_MASK=Builder.CreateOr(
        ConstantInt::get(llvm::IntegerType::get(BB->getContext(),totalBits), mask.mask_low[0])
        ,
        Builder.CreateShl(
          ConstantInt::get(llvm::IntegerType::get(BB->getContext(),totalBits), mask.mask_low[1])
          ,
          64
        )
      );
    HIGH_MASK=Builder.CreateOr(
        ConstantInt::get(llvm::IntegerType::get(BB->getContext(),totalBits), mask.mask_high[0])
        ,
        Builder.CreateShl(
          ConstantInt::get(llvm::IntegerType::get(BB->getContext(),totalBits), mask.mask_high[1])
          ,
          64
        )
      );
    
  }
  // a1 = bitcast a to i<totalBits>
  auto a1=Builder.CreateBitCast(BinOp->getOperand(0),llvm::IntegerType::get(BB->getContext(),totalBits));
  // a2 = bitcast a to i<totalBits>
  auto a2=Builder.CreateBitCast(BinOp->getOperand(1),llvm::IntegerType::get(BB->getContext(),totalBits));
  // m1 = and i<totalBits> a1 LOW_MASK
  auto m1=Builder.CreateAnd(a1,LOW_MASK);
  // m2 = and i<totalBits> a2 LOW_MASK
  auto m2=Builder.CreateAnd(a2,LOW_MASK);
  // r1 = add i<totalBits> m1 m2
  auto r1=Builder.CreateAdd(m1,m2);
  // r2 = xor i<totalBits> a1 a2
  auto r2=Builder.CreateXor(a1,a2);
  // r3 = and i<totalBits> r2 HIGH_MASK
  auto r3=Builder.CreateAnd(r2,HIGH_MASK);
  // r4 = xor i<totalBits> r1 r3
  auto r4=Builder.CreateXor(r1,r3);
  // bitcast r4 to 4xi3
  Instruction* NewInst = new llvm::BitCastInst(r4,t);
  return NewInst;

}

Instruction* SWARPass::SWARSub(llvm::BasicBlock* BB,llvm::BinaryOperator* BinOp){
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
  Value* LOW_MASK;
  Value* HIGH_MASK;
  if (totalBits <= 64){
    LOW_MASK = ConstantInt::get(llvm::IntegerType::get(BB->getContext(),totalBits), mask.mask_low[0]);
    HIGH_MASK = ConstantInt::get(llvm::IntegerType::get(BB->getContext(),totalBits), mask.mask_high[0]);
  }
  else if(totalBits>64 && totalBits<=128){
    LOW_MASK=Builder.CreateOr(
        ConstantInt::get(llvm::IntegerType::get(BB->getContext(),totalBits), mask.mask_low[0])
        ,
        Builder.CreateShl(
          ConstantInt::get(llvm::IntegerType::get(BB->getContext(),totalBits), mask.mask_low[1])
          ,
          64
        )
      );
    HIGH_MASK=Builder.CreateOr(
        ConstantInt::get(llvm::IntegerType::get(BB->getContext(),totalBits), mask.mask_high[0])
        ,
        Builder.CreateShl(
          ConstantInt::get(llvm::IntegerType::get(BB->getContext(),totalBits), mask.mask_high[1])
          ,
          64
        )
      );
    
  }
  // a1 = bitcast a to i<totalBits>
  auto a1=Builder.CreateBitCast(BinOp->getOperand(0),llvm::IntegerType::get(BB->getContext(),totalBits));
  // a2 = bitcast a to i<totalBits>
  auto a2=Builder.CreateBitCast(BinOp->getOperand(1),llvm::IntegerType::get(BB->getContext(),totalBits));
  // m1 = and i<totalBits> a1 LOW_MASK
  auto m1=Builder.CreateAnd(a1,LOW_MASK);
  // m2 = and i<totalBits> a2 LOW_MASK
  auto m2=Builder.CreateAnd(a2,LOW_MASK);
  // r1 = add i<totalBits> m1 m2
  auto r1=Builder.CreateSub(m1,m2);
  // r2 = xor i<totalBits> a1 a2
  auto r2=Builder.CreateXor(a1,a2);
  // r3 = and i<totalBits> r2 HIGH_MASK
  auto r3=Builder.CreateAnd(r2,HIGH_MASK);
  // r4 = xor i<totalBits> r1 r3
  auto r4=Builder.CreateXor(r1,r3);
  // bitcast r4 to 4xi3
  Instruction* NewInst = new llvm::BitCastInst(r4,t);
  return NewInst;

}

Instruction* SWARPass::SWARMul(llvm::BasicBlock* BB,llvm::BinaryOperator* BinOp){
  auto *t = dyn_cast<VectorType>(BinOp->getType());
  auto typeSize = t->getElementType()->getPrimitiveSizeInBits().getFixedSize();
  auto elementCount = t->getElementCount().getFixedValue();
  auto totalBits = typeSize * elementCount;
  if (totalBits > 128){
    return nullptr;
  }
  if(typeSize!=8 || elementCount!=16){
    return nullptr;
  }

  IRBuilder<> Builder(BinOp);
  
  // a1 = bitcast a to i<totalBits>
  auto a1=BinOp->getOperand(0);
  // a2 = bitcast a to i<totalBits>
  auto a2=BinOp->getOperand(1);
  Value**  m1=new Value*[typeSize];
  Value**  m2=new Value*[typeSize];
  Value**  m3=new Value*[typeSize];
  Value**  m4=new Value*[typeSize];
  Value**  m5=new Value*[typeSize];
  Value**  m6=new Value*[typeSize];
  for (int i = 0; i < typeSize; i++)
  {
    if (i!=0){
      m1[i]=Builder.CreateLShr(a1,i);
      m2[i]=Builder.CreateTrunc(m1[i],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),1),elementCount));
      m3[i]=Builder.CreateSExt(m2[i],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize),elementCount));
      m4[i]=Builder.CreateShl(a2,i);
      m5[i]=Builder.CreateAnd(m3[i],m4[i]);
    }
    else{
      m1[i]=a1;
      m2[i]=Builder.CreateTrunc(m1[i],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),1),elementCount));
      m3[i]=Builder.CreateSExt(m2[i],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize),elementCount));
      m4[i]=a2;
      m5[i]=Builder.CreateAnd(m3[i],m4[i]);
    }
    if (i!=0)
      m6[i]=Builder.CreateAdd(m5[i],m6[i-1]);
    else
      m6[i]=m5[i];
  }
  delete[] m1; 
  delete[] m2; 
  delete[] m3; 
  delete[] m4; 
  delete[] m5; 
  delete[] m6; 
  Instruction* NewInst = new llvm::BitCastInst(m6[typeSize-1],t);
  return NewInst;
}

Instruction* SWARPass::SWARDiv(llvm::BasicBlock* BB,llvm::BinaryOperator* BinOp){
  auto *t = dyn_cast<VectorType>(BinOp->getType());
  auto typeSize = t->getElementType()->getPrimitiveSizeInBits().getFixedSize();
  auto elementCount = t->getElementCount().getFixedValue();
  auto totalBits = typeSize * elementCount;
  if (totalBits > 128){
    return nullptr;
  }
  if(typeSize!=8 || elementCount!=16){
    return nullptr;
  }

  IRBuilder<> Builder(BinOp);
  
  // a1 = bitcast a to i<totalBits>
  auto a1=Builder.CreateZExt(BinOp->getOperand(0),llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize*2),elementCount));
  // a2 = bitcast a to i<totalBits>
  auto a2=Builder.CreateZExt(BinOp->getOperand(1),llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize*2),elementCount));
  Value**  m1=new Value*[typeSize];
  Value**  m2=new Value*[typeSize];
  Value**  m3=new Value*[typeSize];
  Value**  m4=new Value*[typeSize];
  Value**  m5=new Value*[typeSize];
  Value**  m6=new Value*[typeSize];
  Value**  m7=new Value*[typeSize];
  Value**  m8=new Value*[typeSize];
  Value**  m9=new Value*[typeSize];
  Value**  m10=new Value*[typeSize];
  Value**  m11=new Value*[typeSize];
  Value**  m12=new Value*[typeSize];
  Value**  m13=new Value*[typeSize];
 
  for (int i = 0; i < typeSize; i++)
  {
    if(i!=0){
      m1[i]=Builder.CreateShl(a2,typeSize-i-1);
      m2[i]=Builder.CreateSub(m10[i-1],m1[i]);
      m3[i]=Builder.CreateLShr(m2[i],typeSize*2-i-1);
      m4[i]=Builder.CreateTrunc(m3[i],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),1),elementCount));
      m5[i]=Builder.CreateNot(m4[i]);
      m6[i]=Builder.CreateSExt(m4[i],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize*2),elementCount));
      m7[i]=Builder.CreateSExt(m5[i],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize*2),elementCount));
      m8[i]=Builder.CreateAnd(m6[i],m10[i-1]);
      m9[i]=Builder.CreateAnd(m7[i],m2[i]);
      m10[i]=Builder.CreateOr(m8[i],m9[i]);
      m11[i]=Builder.CreateZExt(m5[i],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize),elementCount));
      m12[i]=Builder.CreateShl(m11[i],typeSize-1-i);
      m13[i]=Builder.CreateOr(m12[i],m13[i-1]);
    }
    else{
      m1[i]=Builder.CreateShl(a2,typeSize-i-1);
      m2[i]=Builder.CreateSub(a1,m1[i]);
      m3[i]=Builder.CreateLShr(m2[i],typeSize*2-i-1);
      m4[i]=Builder.CreateTrunc(m3[i],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),1),elementCount));
      m5[i]=Builder.CreateNot(m4[i]);
      m6[i]=Builder.CreateSExt(m4[i],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize*2),elementCount));
      m7[i]=Builder.CreateSExt(m5[i],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize*2),elementCount));
      m8[i]=Builder.CreateAnd(m6[i],a1);
      m9[i]=Builder.CreateAnd(m7[i],m2[i]);
      m10[i]=Builder.CreateOr(m8[i],m9[i]);
      m11[i]=Builder.CreateZExt(m5[i],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize),elementCount));
      m12[i]=Builder.CreateShl(m11[i],typeSize-1-i);
      m13[i]=m12[i];
    }
  }
  // auto test=Builder.CreateZExt(m4[1],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize),elementCount));

  Instruction* NewInst = new llvm::BitCastInst(m13[typeSize-1],t);
  // Instruction* NewInst = new llvm::BitCastInst(test,t);
  return NewInst;

}

Instruction* SWARPass::SWARRem(llvm::BasicBlock* BB,llvm::BinaryOperator* BinOp){
  auto *t = dyn_cast<VectorType>(BinOp->getType());
  auto typeSize = t->getElementType()->getPrimitiveSizeInBits().getFixedSize();
  auto elementCount = t->getElementCount().getFixedValue();
  auto totalBits = typeSize * elementCount;
  if (totalBits > 128){
    return nullptr;
  }
  if(typeSize!=8 || elementCount!=16){
    return nullptr;
  }

  IRBuilder<> Builder(BinOp);
  
  // a1 = bitcast a to i<totalBits>
  auto a1=Builder.CreateZExt(BinOp->getOperand(0),llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize*2),elementCount));
  // a2 = bitcast a to i<totalBits>
  auto a2=Builder.CreateZExt(BinOp->getOperand(1),llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize*2),elementCount));
  Value**  m1=new Value*[typeSize];
  Value**  m2=new Value*[typeSize];
  Value**  m3=new Value*[typeSize];
  Value**  m4=new Value*[typeSize];
  Value**  m5=new Value*[typeSize];
  Value**  m6=new Value*[typeSize];
  Value**  m7=new Value*[typeSize];
  Value**  m8=new Value*[typeSize];
  Value**  m9=new Value*[typeSize];
  Value**  m10=new Value*[typeSize];
  Value**  m11=new Value*[typeSize];
  Value**  m12=new Value*[typeSize];
  Value**  m13=new Value*[typeSize];
 
  for (int i = 0; i < typeSize; i++)
  {
    if(i!=0){
      m1[i]=Builder.CreateShl(a2,typeSize-i-1);
      m2[i]=Builder.CreateSub(m10[i-1],m1[i]);
      m3[i]=Builder.CreateLShr(m2[i],typeSize*2-i-1);
      m4[i]=Builder.CreateTrunc(m3[i],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),1),elementCount));
      m5[i]=Builder.CreateNot(m4[i]);
      m6[i]=Builder.CreateSExt(m4[i],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize*2),elementCount));
      m7[i]=Builder.CreateSExt(m5[i],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize*2),elementCount));
      m8[i]=Builder.CreateAnd(m6[i],m10[i-1]);
      m9[i]=Builder.CreateAnd(m7[i],m2[i]);
      m10[i]=Builder.CreateOr(m8[i],m9[i]);
      m11[i]=Builder.CreateZExt(m5[i],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize),elementCount));
      m12[i]=Builder.CreateShl(m11[i],typeSize-1-i);
      m13[i]=Builder.CreateOr(m12[i],m13[i-1]);
    }
    else{
      m1[i]=Builder.CreateShl(a2,typeSize-i-1);
      m2[i]=Builder.CreateSub(a1,m1[i]);
      m3[i]=Builder.CreateLShr(m2[i],typeSize*2-i-1);
      m4[i]=Builder.CreateTrunc(m3[i],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),1),elementCount));
      m5[i]=Builder.CreateNot(m4[i]);
      m6[i]=Builder.CreateSExt(m4[i],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize*2),elementCount));
      m7[i]=Builder.CreateSExt(m5[i],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize*2),elementCount));
      m8[i]=Builder.CreateAnd(m6[i],a1);
      m9[i]=Builder.CreateAnd(m7[i],m2[i]);
      m10[i]=Builder.CreateOr(m8[i],m9[i]);
      m11[i]=Builder.CreateZExt(m5[i],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize),elementCount));
      m12[i]=Builder.CreateShl(m11[i],typeSize-1-i);
      m13[i]=m12[i];
    }
  }
  auto rem=Builder.CreateTrunc(m10[typeSize-1],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize),elementCount));

  Instruction* NewInst = new llvm::BitCastInst(rem,t);
  // Instruction* NewInst = new llvm::BitCastInst(test,t);
  return NewInst;

}


// Instruction* SWARPass::SWARTrunc(llvm::BasicBlock* BB,llvm::TruncInst* op){
//   if (!op->getType()->isVectorTy()) {
//     return nullptr;
//   }

//   auto *t_operand = dyn_cast<VectorType>(op->getOperand(0)->getType());
//   auto typeSize = t_operand->getElementType()->getPrimitiveSizeInBits().getFixedSize();
//   auto elementCount = t_operand->getElementCount().getFixedValue();
//   auto totalBits = typeSize * elementCount;

//   auto *t_mask = dyn_cast<VectorType>(op->getType());
//   auto typeSize_mask = t_mask->getElementType()->getPrimitiveSizeInBits().getFixedSize();
//   auto elementCount_mask = t_mask->getElementCount().getFixedValue();
//   auto totalBits_mask = typeSize_mask * elementCount_mask;

//   // errs() << elementCount << " x i" << typeSize << "\n";

//   if (totalBits > 64){
//     return nullptr;
//   }
//   // if(typeSize!=8 || elementCount!=16){
//   //   return nullptr;
//   // }

//   IRBuilder<> Builder(op);
//   auto a=Builder.CreateBitCast(op->getOperand(0),llvm::IntegerType::get(BB->getContext(),totalBits));
//   std::vector<Value*> args;
//   args.push_back(ConstantInt::get(llvm::IntegerType::get(BB->getContext(),64), 139));
//   args.push_back(ConstantInt::get(llvm::IntegerType::get(BB->getContext(),64), 219));
//   Function *pextFunc = (totalBits>32) ? Intrinsic::getDeclaration(BB->getParent()->getParent(), Intrinsic::x86_bmi_pext_64)
//                                             : Intrinsic::getDeclaration(BB->getParent()->getParent(), Intrinsic::x86_bmi_pext_32);
//   ArrayRef<Value* > args1 = ArrayRef<Value*>(args);

//   // errs() << result << "\n";
//   return nullptr;
// }

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
      
      switch (BinOp->getOpcode())
      {
      case Instruction::Add:
        NewInst = SWARAdd(&BB,BinOp);
        break;
      case Instruction::Sub:
        NewInst = SWARSub(&BB,BinOp);
        break;
      case Instruction::Mul:
        NewInst = SWARMul(&BB,BinOp);
        break;
      case Instruction::UDiv:
        NewInst = SWARDiv(&BB,BinOp);
        break;
      case Instruction::URem:
        NewInst = SWARRem(&BB,BinOp);
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
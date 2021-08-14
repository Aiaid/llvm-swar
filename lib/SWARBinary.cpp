#include "SWARPass.h"


using namespace llvm;

  Instruction* SWARPass::SWARAdd(BasicBlock* BB, Value* op0, Value* op1, IRBuilder<> &Builder){
    auto *t = dyn_cast<VectorType>(op0->getType());
    auto typeSize = t->getElementType()->getPrimitiveSizeInBits().getFixedSize();
    auto elementCount = t->getElementCount().getFixedValue();
    auto totalBits = typeSize * elementCount;
    if (totalBits > 128){
      return nullptr;
    }
    if (typeSize == 8 || typeSize > 15) {
      return nullptr;
    }

    SWARPass::Mask mask = genBitMask(elementCount,typeSize);
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
    auto a1=Builder.CreateBitCast(op0,llvm::IntegerType::get(BB->getContext(),totalBits));
    // a2 = bitcast a to i<totalBits>
    auto a2=Builder.CreateBitCast(op1,llvm::IntegerType::get(BB->getContext(),totalBits));
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

  Instruction* SWARPass::SWARSub(llvm::BasicBlock* BB, Value* op0, Value* op1, IRBuilder<> &Builder){
    auto *t = dyn_cast<VectorType>(op0->getType());
    auto typeSize = t->getElementType()->getPrimitiveSizeInBits().getFixedSize();
    auto elementCount = t->getElementCount().getFixedValue();
    auto totalBits = typeSize * elementCount;
    if (totalBits > 128){
      return nullptr;
    }
    if (typeSize == 8 || typeSize > 15) {
      return nullptr;
    }

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
    auto a1=Builder.CreateBitCast(op0,llvm::IntegerType::get(BB->getContext(),totalBits));
    // a2 = bitcast a to i<totalBits>
    auto a2=Builder.CreateBitCast(op1,llvm::IntegerType::get(BB->getContext(),totalBits));
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

  Instruction* SWARPass::SWARMul(llvm::BasicBlock* BB, Value* op0, Value* op1, IRBuilder<> &Builder){
    auto *t = dyn_cast<VectorType>(op0->getType());
    auto typeSize = t->getElementType()->getPrimitiveSizeInBits().getFixedSize();
    auto elementCount = t->getElementCount().getFixedValue();
    auto totalBits = typeSize * elementCount;
    if (totalBits > 128){
      return nullptr;
    }
    if(typeSize!=8 || elementCount!=16){
      return nullptr;
    }

    
    Value**  m1=new Value*[typeSize];
    Value**  m2=new Value*[typeSize];
    Value**  m3=new Value*[typeSize];
    Value**  m4=new Value*[typeSize];
    Value**  m5=new Value*[typeSize];
    Value**  m6=new Value*[typeSize];
    for (int i = 0; i < typeSize; i++)
    {
      if (i!=0){
        m1[i]=Builder.CreateLShr(op0,i);
        m2[i]=Builder.CreateTrunc(m1[i],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),1),elementCount));
        m3[i]=Builder.CreateSExt(m2[i],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize),elementCount));
        m4[i]=Builder.CreateShl(op1,i);
        m5[i]=Builder.CreateAnd(m3[i],m4[i]);
      }
      else{
        m1[i]=op0;
        m2[i]=Builder.CreateTrunc(m1[i],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),1),elementCount));
        m3[i]=Builder.CreateSExt(m2[i],llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize),elementCount));
        m4[i]=op1;
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

  Instruction* SWARPass::SWARDiv(llvm::BasicBlock* BB, Value* op0, Value* op1, IRBuilder<> &Builder){
    auto *t = dyn_cast<VectorType>(op0->getType());
    auto typeSize = t->getElementType()->getPrimitiveSizeInBits().getFixedSize();
    auto elementCount = t->getElementCount().getFixedValue();
    auto totalBits = typeSize * elementCount;
    if (totalBits > 128){
      return nullptr;
    }
    if(typeSize!=8 || elementCount!=16){
      return nullptr;
    }

    
    // a1 = bitcast a to i<totalBits>
    auto a1=Builder.CreateZExt(op0,llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize*2),elementCount));
    // a2 = bitcast a to i<totalBits>
    auto a2=Builder.CreateZExt(op1,llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize*2),elementCount));
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

  Instruction* SWARPass::SWARRem(llvm::BasicBlock* BB, Value* op0, Value* op1, IRBuilder<> &Builder){
    auto *t = dyn_cast<VectorType>(op0->getType());
    auto typeSize = t->getElementType()->getPrimitiveSizeInBits().getFixedSize();
    auto elementCount = t->getElementCount().getFixedValue();
    auto totalBits = typeSize * elementCount;
    if (totalBits > 128){
      return nullptr;
    }
    if(typeSize!=8 || elementCount!=16){
      return nullptr;
    }

    
    // a1 = bitcast a to i<totalBits>
    auto a1=Builder.CreateZExt(op0,llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize*2),elementCount));
    // a2 = bitcast a to i<totalBits>
    auto a2=Builder.CreateZExt(op1,llvm::FixedVectorType::get(llvm::IntegerType::get(BB->getContext(),typeSize*2),elementCount));
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


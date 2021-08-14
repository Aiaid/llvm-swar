# llvm-swar

mkdir build  
cd build  
cmake -DLT_LLVM_INSTALL_DIR=$LLVM_DIR ..  
make  
$LLVM_DIR/bin/opt -load-pass-plugin libSWARPass.so -passes=swar-pass -S ../add4i3.ll -o out.ll  
/  
$LLVM_DIR/bin/opt -load-pass-plugin libSWARPass.dylib -passes="swar-pass" -S ../add4i3.ll -o out.ll  
  
lli -force-interpreter=true ../add4i3.ll  
lli -force-interpreter=true out.ll  

test without JIT  
lli <ir.ll> <8*i4 as a 32bit int> <8*i4 as a 32bit int>
$LLVM_DIR/bin/opt -load-pass-plugin libSWARPass.dylib -passes="swar-pass" -S ../add8i4_p.ll -o out.ll  
lli out.ll -1707369925 1502828947  
lli ../add8i4_p.ll -1707369925 1502828947      
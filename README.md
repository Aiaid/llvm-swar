# llvm-swar

mkdir build  
cd build  
cmake -DLT_LLVM_INSTALL_DIR=$LLVM_DIR ..  
make  
$LLVM_DIR/bin/opt -load-pass-plugin libSWARPass.so -passes="swar-pass" -S ../add4i3.ll -o out.ll  
/  
$LLVM_DIR/bin/opt -load-pass-plugin libSWARPass.dylib -passes="swar-pass" -S ../add4i3.ll -o out.ll  
  
lli -force-interpreter=true ../add4i3.ll  
lli -force-interpreter=true out.ll  

@.str = private constant [34 x i8] c"<6 x i8><%i, %i, %i, %i, %i, %i>\0A\00", align 1
declare i32 @printf(i8*, ...)
@vec1 = constant <6 x i8> <i8 1, i8 2, i8 85, i8 30, i8 111, i8 126> ; 001 010 011 011
declare <6 x i8> @llvm.ctpop.v6i8(<6 x i8>)

define i16 @main() {
 %v1 = load <6 x i8>, <6 x i8>* @vec1
 
 %1 = call <6 x i8> @llvm.ctpop.v6i8(<6 x i8> %v1)
 %2 = extractelement <6 x i8> %1, i32 0
 %3 = extractelement <6 x i8> %1, i32 1
 %4 = extractelement <6 x i8> %1, i32 2
 %5 = extractelement <6 x i8> %1, i32 3
 %6 = extractelement <6 x i8> %1, i32 4
 %7 = extractelement <6 x i8> %1, i32 5

 %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i32 0, i32 0), i8 %2, i8 %3, i8 %4, i8 %5, i8 %6, i8 %7)
 ret i16 0
}
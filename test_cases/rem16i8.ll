@.str = private constant [75 x i8] c"<16 x i8><%i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i>\0A\00", align 1
@0 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
declare i32 @printf(i8*, ...)
@vec1 = constant <16 x i8> <i8 128, i8 127, i8 128, i8 35, i8 123, i8 12, i8 33, i8 35, i8 123, i8 12, i8 33, i8 35, i8 123, i8 12, i8 33, i8 35> ; 001 010 011 011
@vec2 = constant <16 x i8> <i8 1, i8 1, i8 2, i8 1, i8 2, i8 7, i8 2, i8 4, i8 2, i8 7, i8 2, i8 4, i8 2, i8 7, i8 2, i8 4> ; 101 001 001 011

define i16 @main() {
 %v1 = load <16 x i8>, <16 x i8>* @vec1
 %v2 = load <16 x i8>, <16 x i8>* @vec2
 

 %1 = urem <16 x i8> %v1, %v2
 %2 = extractelement <16 x i8> %1, i32 0
 %3 = extractelement <16 x i8> %1, i32 1
 %4 = extractelement <16 x i8> %1, i32 2
 %5 = extractelement <16 x i8> %1, i32 3
 %6 = extractelement <16 x i8> %1, i32 4
 %7 = extractelement <16 x i8> %1, i32 5
 %8 = extractelement <16 x i8> %1, i32 6
 %9 = extractelement <16 x i8> %1, i32 7
 %10 = extractelement <16 x i8> %1, i32 8
 %11 = extractelement <16 x i8> %1, i32 9
 %12 = extractelement <16 x i8> %1, i32 10
 %13 = extractelement <16 x i8> %1, i32 11
 %14 = extractelement <16 x i8> %1, i32 12
 %15 = extractelement <16 x i8> %1, i32 13
 %16 = extractelement <16 x i8> %1, i32 14
 %17 = extractelement <16 x i8> %1, i32 15

 %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str, i32 0, i32 0), i8 %2, i8 %3, i8 %4, i8 %5, i8 %6, i8 %7, i8 %8, i8 %9, i8 %10, i8 %11, i8 %12, i8 %13, i8 %14, i8 %15, i8 %16, i8 %17)
 ret i16 0
}
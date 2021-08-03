@.str = private constant [42 x i8] c"<8 x i4><%i, %i, %i, %i, %i, %i, %i, %i>\0A\00", align 1
@0 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
declare i32 @printf(i8*, ...)
@vec1 = constant <8 x i4> <i4 9, i4 10, i4 3, i4 11,i4 9, i4 10, i4 3, i4 11> ; 1001 1010 0011 1011 1001 1010 0011 1011
@vec2 = constant <8 x i4> <i4 5, i4 9, i4 9, i4 3,i4 5, i4 9, i4 9, i4 3> ; 0101 1001 1001 0011 0101 1001 1001 0011

define i16 @main() {
 %v1 = load <8 x i4>, <8 x i4>* @vec1
 %v2 = load <8 x i4>, <8 x i4>* @vec2


 %1 = add <8 x i4> %v1, %v2
 %2 = extractelement <8 x i4> %1, i32 0
 %3 = extractelement <8 x i4> %1, i32 1
 %4 = extractelement <8 x i4> %1, i32 2
 %5 = extractelement <8 x i4> %1, i32 3
 %6 = extractelement <8 x i4> %1, i32 4
 %7 = extractelement <8 x i4> %1, i32 5
 %8 = extractelement <8 x i4> %1, i32 6
 %9 = extractelement <8 x i4> %1, i32 7

 %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i4 %2, i4 %3, i4 %4, i4 %5, i4 %6, i4 %7, i4 %8, i4 %9)
 ret i16 0
}
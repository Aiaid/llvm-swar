@.str = private constant [35 x i8] c"<6 x i12><%i, %i, %i, %i, %i, %i>\0A\00", align 1
declare i32 @printf(i8*, ...)
@vec1 = constant <6 x i12> <i12 1, i12 2, i12 3, i12 3, i12 111, i12 126> ; 001 010 011 011
@vec2 = constant <6 x i12> <i12 5, i12 1, i12 1, i12 3, i12 25, i12 1> ; 101 001 001 011

define i16 @main() {
 %v1 = load <6 x i12>, <6 x i12>* @vec1
 %v2 = load <6 x i12>, <6 x i12>* @vec2
 

 %1 = mul <6 x i12> %v1, %v2
 %2 = extractelement <6 x i12> %1, i32 0
 %3 = extractelement <6 x i12> %1, i32 1
 %4 = extractelement <6 x i12> %1, i32 2
 %5 = extractelement <6 x i12> %1, i32 3
 %6 = extractelement <6 x i12> %1, i32 4
 %7 = extractelement <6 x i12> %1, i32 5

 %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i32 0, i32 0), i12 %2, i12 %3, i12 %4, i12 %5, i12 %6, i12 %7)
 ret i16 0
}
@.str = private constant [34 x i8] c"<6 x i3><%i, %i, %i, %i, %i, %i>\0A\00", align 1
declare i32 @printf(i8*, ...)
@vec1 = constant <6 x i8> <i8 1, i8 2, i8 100, i8 254, i8 111, i8 126> ; 001 010 011 011
@vec2 = constant <6 x i8> <i8 5, i8 1, i8 15, i8 3, i8 25, i8 100> ; 101 001 001 011

define i16 @main() {
 %v1 = load <6 x i8>, <6 x i8>* @vec1
 %v2 = load <6 x i8>, <6 x i8>* @vec2
 

 %1 = trunc <6 x i8> %v1 to <6 x i3>
 %2 = extractelement <6 x i3> %1, i3 0
 %3 = extractelement <6 x i3> %1, i3 1
 %4 = extractelement <6 x i3> %1, i3 2
 %5 = extractelement <6 x i3> %1, i3 3
 %6 = extractelement <6 x i3> %1, i3 4
 %7 = extractelement <6 x i3> %1, i3 5

 %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i32 0, i32 0), i3 %2, i3 %3, i3 %4, i3 %5, i3 %6, i3 %7)
 ret i16 0
}
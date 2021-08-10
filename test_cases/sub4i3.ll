@.str = private constant [26 x i8] c"<4 x i3><%i, %i, %i, %i>\0A\00", align 1
@0 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
declare i32 @printf(i8*, ...)
@vec1 = constant <4 x i3> <i3 1, i3 2, i3 3, i3 3> ; 001 010 011 011
@vec2 = constant <4 x i3> <i3 5, i3 1, i3 1, i3 3> ; 101 001 001 011

define i16 @main() {
 %v1 = load <4 x i3>, <4 x i3>* @vec1
 %v2 = load <4 x i3>, <4 x i3>* @vec2
 

 %1 = sub <4 x i3> %v1, %v2
 %2 = extractelement <4 x i3> %1, i32 0
 %3 = extractelement <4 x i3> %1, i32 1
 %4 = extractelement <4 x i3> %1, i32 2
 %5 = extractelement <4 x i3> %1, i32 3

 %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i32 0, i32 0), i3 %2, i3 %3, i3 %4, i3 %5)
 ret i16 0
}
define <6 x i3> @add_6xi3(<6 x i3> %a, <6 x i3> %b)  {
entry:
  %0 = add <6 x i3> %a, %b
  ret <6 x i3> %0
}

@.str = private constant [34 x i8] c"<6 x i3><%i, %i, %i, %i, %i, %i>\0A\00", align 1
declare i32 @printf(i8*, ...)

define i18 @swar_add_6xi3_as_i18(i18 %a1, i18 %a2)  {
entry:
  %m1 = and i18 %a1, 112347   ; mask with b'011011011011011011'
  %m2 = and i18 %a2, 112347
  %r1 = add i18 %m1, %m2
  %r2 = xor i18 %a1, %a2
  %r3 = and i18 %r2, 149796   ; mask with b'100100100100100100'
  %r4 = xor i18 %r1, %r3
  ret i18 %r4
}

define <6 x i3> @swar_add_6xi3(<6 x i3> %v1, <6 x i3> %v2)  {
entry:
  %x1 = bitcast <6 x i3> %v1 to i18
  %x2 = bitcast <6 x i3> %v2 to i18
  %x3 = call i18 @swar_add_6xi3_as_i18(i18 %x1, i18 %x2)
  %r = bitcast i18 %x3 to <6 x i3>
  ret <6 x i3> %r
}

define i32 @main() {
  %a = call <6 x i3> @add_6xi3(<6 x i3><i3 3, i3 4, i3 2, i3 1, i3 0, i3 -1>, <6 x i3><i3 4, i3 4, i3 4, i3 4, i3 -1, i3 -2>)
  %a0 = extractelement <6 x i3> %a, i32 0
  %a1 = extractelement <6 x i3> %a, i32 1
  %a2 = extractelement <6 x i3> %a, i32 2
  %a3 = extractelement <6 x i3> %a, i32 3
  %a4 = extractelement <6 x i3> %a, i32 4
  %a5 = extractelement <6 x i3> %a, i32 5
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i32 0, i32 0), i3 %a0, i3 %a1, i3 %a2, i3 %a3, i3 %a4, i3 %a5)
  ret i32 0
}
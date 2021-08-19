; ModuleID = '../test_cases/div/div10i10.ll'
source_filename = "../test_cases/div/div10i10.ll"

@.str = private constant [28 x i8] c"<10 x i10><%i, %i, %i, %i>\0A\00", align 1
@0 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

declare i32 @printf(i8*, ...)

; Function Attrs: noinline norecurse ssp uwtable mustprogress
define dso_local i32 @main(i32 %0, i8** %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i128, align 16
  %10 = alloca i128, align 16
  %11 = alloca i128, align 16
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  %12 = load i8**, i8*** %4, align 8
  %13 = getelementptr inbounds i8*, i8** %12, i64 1
  %14 = load i8*, i8** %13, align 8
  %15 = call i64 @atoll(i8* %14)
  store i64 %15, i64* %5, align 8
  %16 = load i8**, i8*** %4, align 8
  %17 = getelementptr inbounds i8*, i8** %16, i64 2
  %18 = load i8*, i8** %17, align 8
  %19 = call i64 @atoll(i8* %18)
  store i64 %19, i64* %6, align 8
  %20 = load i8**, i8*** %4, align 8
  %21 = getelementptr inbounds i8*, i8** %20, i64 3
  %22 = load i8*, i8** %21, align 8
  %23 = call i64 @atoll(i8* %22)
  store i64 %23, i64* %7, align 8
  %24 = load i8**, i8*** %4, align 8
  %25 = getelementptr inbounds i8*, i8** %24, i64 4
  %26 = load i8*, i8** %25, align 8
  %27 = call i64 @atoll(i8* %26)
  store i64 %27, i64* %8, align 8
  %28 = load i64, i64* %5, align 8
  %29 = zext i64 %28 to i128
  %30 = shl i128 %29, 64
  %31 = load i64, i64* %6, align 8
  %32 = zext i64 %31 to i128
  %33 = or i128 %30, %32
  store i128 %33, i128* %9, align 16
  %34 = load i64, i64* %7, align 8
  %35 = zext i64 %34 to i128
  %36 = shl i128 %35, 64
  %37 = load i64, i64* %8, align 8
  %38 = zext i64 %37 to i128
  %39 = or i128 %36, %38
  store i128 %39, i128* %10, align 16
  %40 = load i128, i128* %9, align 16
  %41 = load i128, i128* %10, align 16
  %42 = trunc i128 %40 to i100
  %43 = trunc i128 %41 to i100
  %44 = bitcast i100 %42 to <10 x i10>
  %45 = bitcast i100 %43 to <10 x i10>
  %46 = zext <10 x i10> %44 to <10 x i20>
  %47 = zext <10 x i10> %45 to <10 x i20>
  %48 = shl <10 x i20> %47, <i20 9, i20 9, i20 9, i20 9, i20 9, i20 9, i20 9, i20 9, i20 9, i20 9>
  %49 = sub <10 x i20> %46, %48
  %50 = lshr <10 x i20> %49, <i20 19, i20 19, i20 19, i20 19, i20 19, i20 19, i20 19, i20 19, i20 19, i20 19>
  %51 = trunc <10 x i20> %50 to <10 x i1>
  %52 = xor <10 x i1> %51, <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>
  %53 = sext <10 x i1> %51 to <10 x i20>
  %54 = sext <10 x i1> %52 to <10 x i20>
  %55 = and <10 x i20> %53, %46
  %56 = and <10 x i20> %54, %49
  %57 = or <10 x i20> %55, %56
  %58 = zext <10 x i1> %52 to <10 x i10>
  %59 = shl <10 x i10> %58, <i10 9, i10 9, i10 9, i10 9, i10 9, i10 9, i10 9, i10 9, i10 9, i10 9>
  %60 = shl <10 x i20> %47, <i20 8, i20 8, i20 8, i20 8, i20 8, i20 8, i20 8, i20 8, i20 8, i20 8>
  %61 = sub <10 x i20> %57, %60
  %62 = lshr <10 x i20> %61, <i20 18, i20 18, i20 18, i20 18, i20 18, i20 18, i20 18, i20 18, i20 18, i20 18>
  %63 = trunc <10 x i20> %62 to <10 x i1>
  %64 = xor <10 x i1> %63, <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>
  %65 = sext <10 x i1> %63 to <10 x i20>
  %66 = sext <10 x i1> %64 to <10 x i20>
  %67 = and <10 x i20> %65, %57
  %68 = and <10 x i20> %66, %61
  %69 = or <10 x i20> %67, %68
  %70 = zext <10 x i1> %64 to <10 x i10>
  %71 = shl <10 x i10> %70, <i10 8, i10 8, i10 8, i10 8, i10 8, i10 8, i10 8, i10 8, i10 8, i10 8>
  %72 = or <10 x i10> %71, %59
  %73 = shl <10 x i20> %47, <i20 7, i20 7, i20 7, i20 7, i20 7, i20 7, i20 7, i20 7, i20 7, i20 7>
  %74 = sub <10 x i20> %69, %73
  %75 = lshr <10 x i20> %74, <i20 17, i20 17, i20 17, i20 17, i20 17, i20 17, i20 17, i20 17, i20 17, i20 17>
  %76 = trunc <10 x i20> %75 to <10 x i1>
  %77 = xor <10 x i1> %76, <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>
  %78 = sext <10 x i1> %76 to <10 x i20>
  %79 = sext <10 x i1> %77 to <10 x i20>
  %80 = and <10 x i20> %78, %69
  %81 = and <10 x i20> %79, %74
  %82 = or <10 x i20> %80, %81
  %83 = zext <10 x i1> %77 to <10 x i10>
  %84 = shl <10 x i10> %83, <i10 7, i10 7, i10 7, i10 7, i10 7, i10 7, i10 7, i10 7, i10 7, i10 7>
  %85 = or <10 x i10> %84, %72
  %86 = shl <10 x i20> %47, <i20 6, i20 6, i20 6, i20 6, i20 6, i20 6, i20 6, i20 6, i20 6, i20 6>
  %87 = sub <10 x i20> %82, %86
  %88 = lshr <10 x i20> %87, <i20 16, i20 16, i20 16, i20 16, i20 16, i20 16, i20 16, i20 16, i20 16, i20 16>
  %89 = trunc <10 x i20> %88 to <10 x i1>
  %90 = xor <10 x i1> %89, <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>
  %91 = sext <10 x i1> %89 to <10 x i20>
  %92 = sext <10 x i1> %90 to <10 x i20>
  %93 = and <10 x i20> %91, %82
  %94 = and <10 x i20> %92, %87
  %95 = or <10 x i20> %93, %94
  %96 = zext <10 x i1> %90 to <10 x i10>
  %97 = shl <10 x i10> %96, <i10 6, i10 6, i10 6, i10 6, i10 6, i10 6, i10 6, i10 6, i10 6, i10 6>
  %98 = or <10 x i10> %97, %85
  %99 = shl <10 x i20> %47, <i20 5, i20 5, i20 5, i20 5, i20 5, i20 5, i20 5, i20 5, i20 5, i20 5>
  %100 = sub <10 x i20> %95, %99
  %101 = lshr <10 x i20> %100, <i20 15, i20 15, i20 15, i20 15, i20 15, i20 15, i20 15, i20 15, i20 15, i20 15>
  %102 = trunc <10 x i20> %101 to <10 x i1>
  %103 = xor <10 x i1> %102, <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>
  %104 = sext <10 x i1> %102 to <10 x i20>
  %105 = sext <10 x i1> %103 to <10 x i20>
  %106 = and <10 x i20> %104, %95
  %107 = and <10 x i20> %105, %100
  %108 = or <10 x i20> %106, %107
  %109 = zext <10 x i1> %103 to <10 x i10>
  %110 = shl <10 x i10> %109, <i10 5, i10 5, i10 5, i10 5, i10 5, i10 5, i10 5, i10 5, i10 5, i10 5>
  %111 = or <10 x i10> %110, %98
  %112 = shl <10 x i20> %47, <i20 4, i20 4, i20 4, i20 4, i20 4, i20 4, i20 4, i20 4, i20 4, i20 4>
  %113 = sub <10 x i20> %108, %112
  %114 = lshr <10 x i20> %113, <i20 14, i20 14, i20 14, i20 14, i20 14, i20 14, i20 14, i20 14, i20 14, i20 14>
  %115 = trunc <10 x i20> %114 to <10 x i1>
  %116 = xor <10 x i1> %115, <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>
  %117 = sext <10 x i1> %115 to <10 x i20>
  %118 = sext <10 x i1> %116 to <10 x i20>
  %119 = and <10 x i20> %117, %108
  %120 = and <10 x i20> %118, %113
  %121 = or <10 x i20> %119, %120
  %122 = zext <10 x i1> %116 to <10 x i10>
  %123 = shl <10 x i10> %122, <i10 4, i10 4, i10 4, i10 4, i10 4, i10 4, i10 4, i10 4, i10 4, i10 4>
  %124 = or <10 x i10> %123, %111
  %125 = shl <10 x i20> %47, <i20 3, i20 3, i20 3, i20 3, i20 3, i20 3, i20 3, i20 3, i20 3, i20 3>
  %126 = sub <10 x i20> %121, %125
  %127 = lshr <10 x i20> %126, <i20 13, i20 13, i20 13, i20 13, i20 13, i20 13, i20 13, i20 13, i20 13, i20 13>
  %128 = trunc <10 x i20> %127 to <10 x i1>
  %129 = xor <10 x i1> %128, <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>
  %130 = sext <10 x i1> %128 to <10 x i20>
  %131 = sext <10 x i1> %129 to <10 x i20>
  %132 = and <10 x i20> %130, %121
  %133 = and <10 x i20> %131, %126
  %134 = or <10 x i20> %132, %133
  %135 = zext <10 x i1> %129 to <10 x i10>
  %136 = shl <10 x i10> %135, <i10 3, i10 3, i10 3, i10 3, i10 3, i10 3, i10 3, i10 3, i10 3, i10 3>
  %137 = or <10 x i10> %136, %124
  %138 = shl <10 x i20> %47, <i20 2, i20 2, i20 2, i20 2, i20 2, i20 2, i20 2, i20 2, i20 2, i20 2>
  %139 = sub <10 x i20> %134, %138
  %140 = lshr <10 x i20> %139, <i20 12, i20 12, i20 12, i20 12, i20 12, i20 12, i20 12, i20 12, i20 12, i20 12>
  %141 = trunc <10 x i20> %140 to <10 x i1>
  %142 = xor <10 x i1> %141, <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>
  %143 = sext <10 x i1> %141 to <10 x i20>
  %144 = sext <10 x i1> %142 to <10 x i20>
  %145 = and <10 x i20> %143, %134
  %146 = and <10 x i20> %144, %139
  %147 = or <10 x i20> %145, %146
  %148 = zext <10 x i1> %142 to <10 x i10>
  %149 = shl <10 x i10> %148, <i10 2, i10 2, i10 2, i10 2, i10 2, i10 2, i10 2, i10 2, i10 2, i10 2>
  %150 = or <10 x i10> %149, %137
  %151 = shl <10 x i20> %47, <i20 1, i20 1, i20 1, i20 1, i20 1, i20 1, i20 1, i20 1, i20 1, i20 1>
  %152 = sub <10 x i20> %147, %151
  %153 = lshr <10 x i20> %152, <i20 11, i20 11, i20 11, i20 11, i20 11, i20 11, i20 11, i20 11, i20 11, i20 11>
  %154 = trunc <10 x i20> %153 to <10 x i1>
  %155 = xor <10 x i1> %154, <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>
  %156 = sext <10 x i1> %154 to <10 x i20>
  %157 = sext <10 x i1> %155 to <10 x i20>
  %158 = and <10 x i20> %156, %147
  %159 = and <10 x i20> %157, %152
  %160 = or <10 x i20> %158, %159
  %161 = zext <10 x i1> %155 to <10 x i10>
  %162 = shl <10 x i10> %161, <i10 1, i10 1, i10 1, i10 1, i10 1, i10 1, i10 1, i10 1, i10 1, i10 1>
  %163 = or <10 x i10> %162, %150
  %164 = shl <10 x i20> %47, zeroinitializer
  %165 = sub <10 x i20> %160, %164
  %166 = lshr <10 x i20> %165, <i20 10, i20 10, i20 10, i20 10, i20 10, i20 10, i20 10, i20 10, i20 10, i20 10>
  %167 = trunc <10 x i20> %166 to <10 x i1>
  %168 = xor <10 x i1> %167, <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>
  %169 = sext <10 x i1> %167 to <10 x i20>
  %170 = sext <10 x i1> %168 to <10 x i20>
  %171 = and <10 x i20> %169, %160
  %172 = and <10 x i20> %170, %165
  %173 = or <10 x i20> %171, %172
  %174 = zext <10 x i1> %168 to <10 x i10>
  %175 = shl <10 x i10> %174, zeroinitializer
  %176 = or <10 x i10> %175, %163
  %177 = bitcast <10 x i10> %176 to <10 x i10>
  %178 = extractelement <10 x i10> %177, i32 1
  %179 = extractelement <10 x i10> %177, i32 2
  %180 = extractelement <10 x i10> %177, i32 3
  %181 = extractelement <10 x i10> %177, i32 4
  %182 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str, i32 0, i32 0), i10 %178, i10 %179, i10 %180, i10 %181)
  ret i32 0
}

declare i64 @atoll(i8*) #1

attributes #0 = { noinline norecurse ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

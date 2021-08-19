; ModuleID = '../test_cases/mul/mul10i10.ll'
source_filename = "../test_cases/mul/mul10i10.ll"

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
  %46 = trunc <10 x i10> %44 to <10 x i1>
  %47 = sext <10 x i1> %46 to <10 x i10>
  %48 = and <10 x i10> %47, %45
  %49 = lshr <10 x i10> %44, <i10 1, i10 1, i10 1, i10 1, i10 1, i10 1, i10 1, i10 1, i10 1, i10 1>
  %50 = trunc <10 x i10> %49 to <10 x i1>
  %51 = sext <10 x i1> %50 to <10 x i10>
  %52 = shl <10 x i10> %45, <i10 1, i10 1, i10 1, i10 1, i10 1, i10 1, i10 1, i10 1, i10 1, i10 1>
  %53 = and <10 x i10> %51, %52
  %54 = bitcast <10 x i10> %53 to i100
  %55 = bitcast <10 x i10> %48 to i100
  %56 = and i100 %54, 633205725040689368685058981375
  %57 = and i100 %55, 633205725040689368685058981375
  %58 = add i100 %56, %57
  %59 = xor i100 %54, %55
  %60 = and i100 %59, -633205725040689368685058981376
  %61 = xor i100 %58, %60
  %62 = bitcast i100 %61 to <10 x i10>
  %63 = lshr <10 x i10> %44, <i10 2, i10 2, i10 2, i10 2, i10 2, i10 2, i10 2, i10 2, i10 2, i10 2>
  %64 = trunc <10 x i10> %63 to <10 x i1>
  %65 = sext <10 x i1> %64 to <10 x i10>
  %66 = shl <10 x i10> %45, <i10 2, i10 2, i10 2, i10 2, i10 2, i10 2, i10 2, i10 2, i10 2, i10 2>
  %67 = and <10 x i10> %65, %66
  %68 = bitcast <10 x i10> %67 to i100
  %69 = bitcast <10 x i10> %62 to i100
  %70 = and i100 %68, 633205725040689368685058981375
  %71 = and i100 %69, 633205725040689368685058981375
  %72 = add i100 %70, %71
  %73 = xor i100 %68, %69
  %74 = and i100 %73, -633205725040689368685058981376
  %75 = xor i100 %72, %74
  %76 = bitcast i100 %75 to <10 x i10>
  %77 = lshr <10 x i10> %44, <i10 3, i10 3, i10 3, i10 3, i10 3, i10 3, i10 3, i10 3, i10 3, i10 3>
  %78 = trunc <10 x i10> %77 to <10 x i1>
  %79 = sext <10 x i1> %78 to <10 x i10>
  %80 = shl <10 x i10> %45, <i10 3, i10 3, i10 3, i10 3, i10 3, i10 3, i10 3, i10 3, i10 3, i10 3>
  %81 = and <10 x i10> %79, %80
  %82 = bitcast <10 x i10> %81 to i100
  %83 = bitcast <10 x i10> %76 to i100
  %84 = and i100 %82, 633205725040689368685058981375
  %85 = and i100 %83, 633205725040689368685058981375
  %86 = add i100 %84, %85
  %87 = xor i100 %82, %83
  %88 = and i100 %87, -633205725040689368685058981376
  %89 = xor i100 %86, %88
  %90 = bitcast i100 %89 to <10 x i10>
  %91 = lshr <10 x i10> %44, <i10 4, i10 4, i10 4, i10 4, i10 4, i10 4, i10 4, i10 4, i10 4, i10 4>
  %92 = trunc <10 x i10> %91 to <10 x i1>
  %93 = sext <10 x i1> %92 to <10 x i10>
  %94 = shl <10 x i10> %45, <i10 4, i10 4, i10 4, i10 4, i10 4, i10 4, i10 4, i10 4, i10 4, i10 4>
  %95 = and <10 x i10> %93, %94
  %96 = bitcast <10 x i10> %95 to i100
  %97 = bitcast <10 x i10> %90 to i100
  %98 = and i100 %96, 633205725040689368685058981375
  %99 = and i100 %97, 633205725040689368685058981375
  %100 = add i100 %98, %99
  %101 = xor i100 %96, %97
  %102 = and i100 %101, -633205725040689368685058981376
  %103 = xor i100 %100, %102
  %104 = bitcast i100 %103 to <10 x i10>
  %105 = lshr <10 x i10> %44, <i10 5, i10 5, i10 5, i10 5, i10 5, i10 5, i10 5, i10 5, i10 5, i10 5>
  %106 = trunc <10 x i10> %105 to <10 x i1>
  %107 = sext <10 x i1> %106 to <10 x i10>
  %108 = shl <10 x i10> %45, <i10 5, i10 5, i10 5, i10 5, i10 5, i10 5, i10 5, i10 5, i10 5, i10 5>
  %109 = and <10 x i10> %107, %108
  %110 = bitcast <10 x i10> %109 to i100
  %111 = bitcast <10 x i10> %104 to i100
  %112 = and i100 %110, 633205725040689368685058981375
  %113 = and i100 %111, 633205725040689368685058981375
  %114 = add i100 %112, %113
  %115 = xor i100 %110, %111
  %116 = and i100 %115, -633205725040689368685058981376
  %117 = xor i100 %114, %116
  %118 = bitcast i100 %117 to <10 x i10>
  %119 = lshr <10 x i10> %44, <i10 6, i10 6, i10 6, i10 6, i10 6, i10 6, i10 6, i10 6, i10 6, i10 6>
  %120 = trunc <10 x i10> %119 to <10 x i1>
  %121 = sext <10 x i1> %120 to <10 x i10>
  %122 = shl <10 x i10> %45, <i10 6, i10 6, i10 6, i10 6, i10 6, i10 6, i10 6, i10 6, i10 6, i10 6>
  %123 = and <10 x i10> %121, %122
  %124 = bitcast <10 x i10> %123 to i100
  %125 = bitcast <10 x i10> %118 to i100
  %126 = and i100 %124, 633205725040689368685058981375
  %127 = and i100 %125, 633205725040689368685058981375
  %128 = add i100 %126, %127
  %129 = xor i100 %124, %125
  %130 = and i100 %129, -633205725040689368685058981376
  %131 = xor i100 %128, %130
  %132 = bitcast i100 %131 to <10 x i10>
  %133 = lshr <10 x i10> %44, <i10 7, i10 7, i10 7, i10 7, i10 7, i10 7, i10 7, i10 7, i10 7, i10 7>
  %134 = trunc <10 x i10> %133 to <10 x i1>
  %135 = sext <10 x i1> %134 to <10 x i10>
  %136 = shl <10 x i10> %45, <i10 7, i10 7, i10 7, i10 7, i10 7, i10 7, i10 7, i10 7, i10 7, i10 7>
  %137 = and <10 x i10> %135, %136
  %138 = bitcast <10 x i10> %137 to i100
  %139 = bitcast <10 x i10> %132 to i100
  %140 = and i100 %138, 633205725040689368685058981375
  %141 = and i100 %139, 633205725040689368685058981375
  %142 = add i100 %140, %141
  %143 = xor i100 %138, %139
  %144 = and i100 %143, -633205725040689368685058981376
  %145 = xor i100 %142, %144
  %146 = bitcast i100 %145 to <10 x i10>
  %147 = lshr <10 x i10> %44, <i10 8, i10 8, i10 8, i10 8, i10 8, i10 8, i10 8, i10 8, i10 8, i10 8>
  %148 = trunc <10 x i10> %147 to <10 x i1>
  %149 = sext <10 x i1> %148 to <10 x i10>
  %150 = shl <10 x i10> %45, <i10 8, i10 8, i10 8, i10 8, i10 8, i10 8, i10 8, i10 8, i10 8, i10 8>
  %151 = and <10 x i10> %149, %150
  %152 = bitcast <10 x i10> %151 to i100
  %153 = bitcast <10 x i10> %146 to i100
  %154 = and i100 %152, 633205725040689368685058981375
  %155 = and i100 %153, 633205725040689368685058981375
  %156 = add i100 %154, %155
  %157 = xor i100 %152, %153
  %158 = and i100 %157, -633205725040689368685058981376
  %159 = xor i100 %156, %158
  %160 = bitcast i100 %159 to <10 x i10>
  %161 = lshr <10 x i10> %44, <i10 9, i10 9, i10 9, i10 9, i10 9, i10 9, i10 9, i10 9, i10 9, i10 9>
  %162 = trunc <10 x i10> %161 to <10 x i1>
  %163 = sext <10 x i1> %162 to <10 x i10>
  %164 = shl <10 x i10> %45, <i10 9, i10 9, i10 9, i10 9, i10 9, i10 9, i10 9, i10 9, i10 9, i10 9>
  %165 = and <10 x i10> %163, %164
  %166 = bitcast <10 x i10> %165 to i100
  %167 = bitcast <10 x i10> %160 to i100
  %168 = and i100 %166, 633205725040689368685058981375
  %169 = and i100 %167, 633205725040689368685058981375
  %170 = add i100 %168, %169
  %171 = xor i100 %166, %167
  %172 = and i100 %171, -633205725040689368685058981376
  %173 = xor i100 %170, %172
  %174 = bitcast i100 %173 to <10 x i10>
  %175 = bitcast <10 x i10> %174 to <10 x i10>
  %176 = extractelement <10 x i10> %175, i32 1
  %177 = extractelement <10 x i10> %175, i32 2
  %178 = extractelement <10 x i10> %175, i32 3
  %179 = extractelement <10 x i10> %175, i32 4
  %180 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str, i32 0, i32 0), i10 %176, i10 %177, i10 %178, i10 %179)
  ret i32 0
}

declare i64 @atoll(i8*) #1

attributes #0 = { noinline norecurse ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

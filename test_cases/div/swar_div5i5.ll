; ModuleID = '../test_cases/div/div5i5.ll'
source_filename = "../test_cases/div/div5i5.ll"

@.str = private constant [26 x i8] c"<5 x i5><%i, %i, %i, %i>\0A\00", align 1
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
  %42 = trunc i128 %40 to i25
  %43 = trunc i128 %41 to i25
  %44 = bitcast i25 %42 to <5 x i5>
  %45 = bitcast i25 %43 to <5 x i5>
  %46 = zext <5 x i5> %44 to <5 x i10>
  %47 = zext <5 x i5> %45 to <5 x i10>
  %48 = shl <5 x i10> %47, <i10 4, i10 4, i10 4, i10 4, i10 4>
  %49 = bitcast <5 x i10> %46 to i50
  %50 = bitcast <5 x i10> %48 to i50
  %51 = and i50 %49, 562399660211711
  %52 = and i50 %50, 562399660211711
  %53 = sub i50 %51, %52
  %54 = xor i50 %49, %50
  %55 = and i50 %54, -562399660211712
  %56 = xor i50 %53, %55
  %57 = bitcast i50 %56 to <5 x i10>
  %58 = lshr <5 x i10> %57, <i10 9, i10 9, i10 9, i10 9, i10 9>
  %59 = trunc <5 x i10> %58 to <5 x i1>
  %60 = xor <5 x i1> %59, <i1 true, i1 true, i1 true, i1 true, i1 true>
  %61 = sext <5 x i1> %59 to <5 x i10>
  %62 = sext <5 x i1> %60 to <5 x i10>
  %63 = and <5 x i10> %61, %46
  %64 = and <5 x i10> %62, %57
  %65 = or <5 x i10> %63, %64
  %66 = zext <5 x i1> %60 to <5 x i5>
  %67 = shl <5 x i5> %66, <i5 4, i5 4, i5 4, i5 4, i5 4>
  %68 = shl <5 x i10> %47, <i10 3, i10 3, i10 3, i10 3, i10 3>
  %69 = bitcast <5 x i10> %65 to i50
  %70 = bitcast <5 x i10> %68 to i50
  %71 = and i50 %69, 562399660211711
  %72 = and i50 %70, 562399660211711
  %73 = sub i50 %71, %72
  %74 = xor i50 %69, %70
  %75 = and i50 %74, -562399660211712
  %76 = xor i50 %73, %75
  %77 = bitcast i50 %76 to <5 x i10>
  %78 = lshr <5 x i10> %77, <i10 8, i10 8, i10 8, i10 8, i10 8>
  %79 = trunc <5 x i10> %78 to <5 x i1>
  %80 = xor <5 x i1> %79, <i1 true, i1 true, i1 true, i1 true, i1 true>
  %81 = sext <5 x i1> %79 to <5 x i10>
  %82 = sext <5 x i1> %80 to <5 x i10>
  %83 = and <5 x i10> %81, %65
  %84 = and <5 x i10> %82, %77
  %85 = or <5 x i10> %83, %84
  %86 = zext <5 x i1> %80 to <5 x i5>
  %87 = shl <5 x i5> %86, <i5 3, i5 3, i5 3, i5 3, i5 3>
  %88 = or <5 x i5> %87, %67
  %89 = shl <5 x i10> %47, <i10 2, i10 2, i10 2, i10 2, i10 2>
  %90 = bitcast <5 x i10> %85 to i50
  %91 = bitcast <5 x i10> %89 to i50
  %92 = and i50 %90, 562399660211711
  %93 = and i50 %91, 562399660211711
  %94 = sub i50 %92, %93
  %95 = xor i50 %90, %91
  %96 = and i50 %95, -562399660211712
  %97 = xor i50 %94, %96
  %98 = bitcast i50 %97 to <5 x i10>
  %99 = lshr <5 x i10> %98, <i10 7, i10 7, i10 7, i10 7, i10 7>
  %100 = trunc <5 x i10> %99 to <5 x i1>
  %101 = xor <5 x i1> %100, <i1 true, i1 true, i1 true, i1 true, i1 true>
  %102 = sext <5 x i1> %100 to <5 x i10>
  %103 = sext <5 x i1> %101 to <5 x i10>
  %104 = and <5 x i10> %102, %85
  %105 = and <5 x i10> %103, %98
  %106 = or <5 x i10> %104, %105
  %107 = zext <5 x i1> %101 to <5 x i5>
  %108 = shl <5 x i5> %107, <i5 2, i5 2, i5 2, i5 2, i5 2>
  %109 = or <5 x i5> %108, %88
  %110 = shl <5 x i10> %47, <i10 1, i10 1, i10 1, i10 1, i10 1>
  %111 = bitcast <5 x i10> %106 to i50
  %112 = bitcast <5 x i10> %110 to i50
  %113 = and i50 %111, 562399660211711
  %114 = and i50 %112, 562399660211711
  %115 = sub i50 %113, %114
  %116 = xor i50 %111, %112
  %117 = and i50 %116, -562399660211712
  %118 = xor i50 %115, %117
  %119 = bitcast i50 %118 to <5 x i10>
  %120 = lshr <5 x i10> %119, <i10 6, i10 6, i10 6, i10 6, i10 6>
  %121 = trunc <5 x i10> %120 to <5 x i1>
  %122 = xor <5 x i1> %121, <i1 true, i1 true, i1 true, i1 true, i1 true>
  %123 = sext <5 x i1> %121 to <5 x i10>
  %124 = sext <5 x i1> %122 to <5 x i10>
  %125 = and <5 x i10> %123, %106
  %126 = and <5 x i10> %124, %119
  %127 = or <5 x i10> %125, %126
  %128 = zext <5 x i1> %122 to <5 x i5>
  %129 = shl <5 x i5> %128, <i5 1, i5 1, i5 1, i5 1, i5 1>
  %130 = or <5 x i5> %129, %109
  %131 = shl <5 x i10> %47, zeroinitializer
  %132 = bitcast <5 x i10> %127 to i50
  %133 = bitcast <5 x i10> %131 to i50
  %134 = and i50 %132, 562399660211711
  %135 = and i50 %133, 562399660211711
  %136 = sub i50 %134, %135
  %137 = xor i50 %132, %133
  %138 = and i50 %137, -562399660211712
  %139 = xor i50 %136, %138
  %140 = bitcast i50 %139 to <5 x i10>
  %141 = lshr <5 x i10> %140, <i10 5, i10 5, i10 5, i10 5, i10 5>
  %142 = trunc <5 x i10> %141 to <5 x i1>
  %143 = xor <5 x i1> %142, <i1 true, i1 true, i1 true, i1 true, i1 true>
  %144 = sext <5 x i1> %142 to <5 x i10>
  %145 = sext <5 x i1> %143 to <5 x i10>
  %146 = and <5 x i10> %144, %127
  %147 = and <5 x i10> %145, %140
  %148 = or <5 x i10> %146, %147
  %149 = zext <5 x i1> %143 to <5 x i5>
  %150 = shl <5 x i5> %149, zeroinitializer
  %151 = or <5 x i5> %150, %130
  %152 = bitcast <5 x i5> %151 to <5 x i5>
  %153 = extractelement <5 x i5> %152, i32 1
  %154 = extractelement <5 x i5> %152, i32 2
  %155 = extractelement <5 x i5> %152, i32 3
  %156 = extractelement <5 x i5> %152, i32 4
  %157 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i32 0, i32 0), i5 %153, i5 %154, i5 %155, i5 %156)
  ret i32 0
}

declare i64 @atoll(i8*) #1

attributes #0 = { noinline norecurse ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

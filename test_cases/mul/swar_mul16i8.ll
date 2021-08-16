; ModuleID = '../test_cases/mul/mul16i8.ll'
source_filename = "../test_cases/mul/mul16i8.ll"

@.str = private constant [27 x i8] c"<16 x i8><%i, %i, %i, %i>\0A\00", align 1
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
  %42 = bitcast i128 %40 to <16 x i8>
  %43 = bitcast i128 %41 to <16 x i8>
  %44 = trunc <16 x i8> %42 to <16 x i1>
  %45 = sext <16 x i1> %44 to <16 x i8>
  %46 = and <16 x i8> %45, %43
  %47 = lshr <16 x i8> %42, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  %48 = trunc <16 x i8> %47 to <16 x i1>
  %49 = sext <16 x i1> %48 to <16 x i8>
  %50 = shl <16 x i8> %43, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  %51 = and <16 x i8> %49, %50
  %52 = bitcast <16 x i8> %51 to i128
  %53 = bitcast <16 x i8> %46 to i128
  %54 = and i128 %52, 169473963133173273960190490760135540607
  %55 = and i128 %53, 169473963133173273960190490760135540607
  %56 = add i128 %54, %55
  %57 = xor i128 %52, %53
  %58 = and i128 %57, -169473963133173273960190490760135540608
  %59 = xor i128 %56, %58
  %60 = bitcast i128 %59 to <16 x i8>
  %61 = lshr <16 x i8> %42, <i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2>
  %62 = trunc <16 x i8> %61 to <16 x i1>
  %63 = sext <16 x i1> %62 to <16 x i8>
  %64 = shl <16 x i8> %43, <i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2>
  %65 = and <16 x i8> %63, %64
  %66 = bitcast <16 x i8> %65 to i128
  %67 = bitcast <16 x i8> %60 to i128
  %68 = and i128 %66, 169473963133173273960190490760135540607
  %69 = and i128 %67, 169473963133173273960190490760135540607
  %70 = add i128 %68, %69
  %71 = xor i128 %66, %67
  %72 = and i128 %71, -169473963133173273960190490760135540608
  %73 = xor i128 %70, %72
  %74 = bitcast i128 %73 to <16 x i8>
  %75 = lshr <16 x i8> %42, <i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3>
  %76 = trunc <16 x i8> %75 to <16 x i1>
  %77 = sext <16 x i1> %76 to <16 x i8>
  %78 = shl <16 x i8> %43, <i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3>
  %79 = and <16 x i8> %77, %78
  %80 = bitcast <16 x i8> %79 to i128
  %81 = bitcast <16 x i8> %74 to i128
  %82 = and i128 %80, 169473963133173273960190490760135540607
  %83 = and i128 %81, 169473963133173273960190490760135540607
  %84 = add i128 %82, %83
  %85 = xor i128 %80, %81
  %86 = and i128 %85, -169473963133173273960190490760135540608
  %87 = xor i128 %84, %86
  %88 = bitcast i128 %87 to <16 x i8>
  %89 = lshr <16 x i8> %42, <i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4>
  %90 = trunc <16 x i8> %89 to <16 x i1>
  %91 = sext <16 x i1> %90 to <16 x i8>
  %92 = shl <16 x i8> %43, <i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4>
  %93 = and <16 x i8> %91, %92
  %94 = bitcast <16 x i8> %93 to i128
  %95 = bitcast <16 x i8> %88 to i128
  %96 = and i128 %94, 169473963133173273960190490760135540607
  %97 = and i128 %95, 169473963133173273960190490760135540607
  %98 = add i128 %96, %97
  %99 = xor i128 %94, %95
  %100 = and i128 %99, -169473963133173273960190490760135540608
  %101 = xor i128 %98, %100
  %102 = bitcast i128 %101 to <16 x i8>
  %103 = lshr <16 x i8> %42, <i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5>
  %104 = trunc <16 x i8> %103 to <16 x i1>
  %105 = sext <16 x i1> %104 to <16 x i8>
  %106 = shl <16 x i8> %43, <i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5>
  %107 = and <16 x i8> %105, %106
  %108 = bitcast <16 x i8> %107 to i128
  %109 = bitcast <16 x i8> %102 to i128
  %110 = and i128 %108, 169473963133173273960190490760135540607
  %111 = and i128 %109, 169473963133173273960190490760135540607
  %112 = add i128 %110, %111
  %113 = xor i128 %108, %109
  %114 = and i128 %113, -169473963133173273960190490760135540608
  %115 = xor i128 %112, %114
  %116 = bitcast i128 %115 to <16 x i8>
  %117 = lshr <16 x i8> %42, <i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6>
  %118 = trunc <16 x i8> %117 to <16 x i1>
  %119 = sext <16 x i1> %118 to <16 x i8>
  %120 = shl <16 x i8> %43, <i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6>
  %121 = and <16 x i8> %119, %120
  %122 = bitcast <16 x i8> %121 to i128
  %123 = bitcast <16 x i8> %116 to i128
  %124 = and i128 %122, 169473963133173273960190490760135540607
  %125 = and i128 %123, 169473963133173273960190490760135540607
  %126 = add i128 %124, %125
  %127 = xor i128 %122, %123
  %128 = and i128 %127, -169473963133173273960190490760135540608
  %129 = xor i128 %126, %128
  %130 = bitcast i128 %129 to <16 x i8>
  %131 = lshr <16 x i8> %42, <i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7>
  %132 = trunc <16 x i8> %131 to <16 x i1>
  %133 = sext <16 x i1> %132 to <16 x i8>
  %134 = shl <16 x i8> %43, <i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7>
  %135 = and <16 x i8> %133, %134
  %136 = bitcast <16 x i8> %135 to i128
  %137 = bitcast <16 x i8> %130 to i128
  %138 = and i128 %136, 169473963133173273960190490760135540607
  %139 = and i128 %137, 169473963133173273960190490760135540607
  %140 = add i128 %138, %139
  %141 = xor i128 %136, %137
  %142 = and i128 %141, -169473963133173273960190490760135540608
  %143 = xor i128 %140, %142
  %144 = bitcast i128 %143 to <16 x i8>
  %145 = bitcast <16 x i8> %144 to <16 x i8>
  %146 = extractelement <16 x i8> %145, i32 1
  %147 = extractelement <16 x i8> %145, i32 2
  %148 = extractelement <16 x i8> %145, i32 3
  %149 = extractelement <16 x i8> %145, i32 4
  %150 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i32 0, i32 0), i8 %146, i8 %147, i8 %148, i8 %149)
  ret i32 0
}

declare i64 @atoll(i8*) #1

attributes #0 = { noinline norecurse ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

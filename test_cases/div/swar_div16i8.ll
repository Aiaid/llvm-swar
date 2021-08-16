; ModuleID = '../test_cases/div/div16i8.ll'
source_filename = "../test_cases/div/div16i8.ll"

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
  %44 = zext <16 x i8> %42 to <16 x i16>
  %45 = zext <16 x i8> %43 to <16 x i16>
  %46 = shl <16 x i16> %45, <i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7>
  %47 = sub <16 x i16> %44, %46
  %48 = lshr <16 x i16> %47, <i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15>
  %49 = trunc <16 x i16> %48 to <16 x i1>
  %50 = xor <16 x i1> %49, <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>
  %51 = sext <16 x i1> %49 to <16 x i16>
  %52 = sext <16 x i1> %50 to <16 x i16>
  %53 = and <16 x i16> %51, %44
  %54 = and <16 x i16> %52, %47
  %55 = or <16 x i16> %53, %54
  %56 = zext <16 x i1> %50 to <16 x i8>
  %57 = shl <16 x i8> %56, <i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7>
  %58 = shl <16 x i16> %45, <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>
  %59 = sub <16 x i16> %55, %58
  %60 = lshr <16 x i16> %59, <i16 14, i16 14, i16 14, i16 14, i16 14, i16 14, i16 14, i16 14, i16 14, i16 14, i16 14, i16 14, i16 14, i16 14, i16 14, i16 14>
  %61 = trunc <16 x i16> %60 to <16 x i1>
  %62 = xor <16 x i1> %61, <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>
  %63 = sext <16 x i1> %61 to <16 x i16>
  %64 = sext <16 x i1> %62 to <16 x i16>
  %65 = and <16 x i16> %63, %55
  %66 = and <16 x i16> %64, %59
  %67 = or <16 x i16> %65, %66
  %68 = zext <16 x i1> %62 to <16 x i8>
  %69 = shl <16 x i8> %68, <i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6>
  %70 = or <16 x i8> %69, %57
  %71 = shl <16 x i16> %45, <i16 5, i16 5, i16 5, i16 5, i16 5, i16 5, i16 5, i16 5, i16 5, i16 5, i16 5, i16 5, i16 5, i16 5, i16 5, i16 5>
  %72 = sub <16 x i16> %67, %71
  %73 = lshr <16 x i16> %72, <i16 13, i16 13, i16 13, i16 13, i16 13, i16 13, i16 13, i16 13, i16 13, i16 13, i16 13, i16 13, i16 13, i16 13, i16 13, i16 13>
  %74 = trunc <16 x i16> %73 to <16 x i1>
  %75 = xor <16 x i1> %74, <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>
  %76 = sext <16 x i1> %74 to <16 x i16>
  %77 = sext <16 x i1> %75 to <16 x i16>
  %78 = and <16 x i16> %76, %67
  %79 = and <16 x i16> %77, %72
  %80 = or <16 x i16> %78, %79
  %81 = zext <16 x i1> %75 to <16 x i8>
  %82 = shl <16 x i8> %81, <i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5>
  %83 = or <16 x i8> %82, %70
  %84 = shl <16 x i16> %45, <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>
  %85 = sub <16 x i16> %80, %84
  %86 = lshr <16 x i16> %85, <i16 12, i16 12, i16 12, i16 12, i16 12, i16 12, i16 12, i16 12, i16 12, i16 12, i16 12, i16 12, i16 12, i16 12, i16 12, i16 12>
  %87 = trunc <16 x i16> %86 to <16 x i1>
  %88 = xor <16 x i1> %87, <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>
  %89 = sext <16 x i1> %87 to <16 x i16>
  %90 = sext <16 x i1> %88 to <16 x i16>
  %91 = and <16 x i16> %89, %80
  %92 = and <16 x i16> %90, %85
  %93 = or <16 x i16> %91, %92
  %94 = zext <16 x i1> %88 to <16 x i8>
  %95 = shl <16 x i8> %94, <i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4>
  %96 = or <16 x i8> %95, %83
  %97 = shl <16 x i16> %45, <i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3>
  %98 = sub <16 x i16> %93, %97
  %99 = lshr <16 x i16> %98, <i16 11, i16 11, i16 11, i16 11, i16 11, i16 11, i16 11, i16 11, i16 11, i16 11, i16 11, i16 11, i16 11, i16 11, i16 11, i16 11>
  %100 = trunc <16 x i16> %99 to <16 x i1>
  %101 = xor <16 x i1> %100, <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>
  %102 = sext <16 x i1> %100 to <16 x i16>
  %103 = sext <16 x i1> %101 to <16 x i16>
  %104 = and <16 x i16> %102, %93
  %105 = and <16 x i16> %103, %98
  %106 = or <16 x i16> %104, %105
  %107 = zext <16 x i1> %101 to <16 x i8>
  %108 = shl <16 x i8> %107, <i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3>
  %109 = or <16 x i8> %108, %96
  %110 = shl <16 x i16> %45, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %111 = sub <16 x i16> %106, %110
  %112 = lshr <16 x i16> %111, <i16 10, i16 10, i16 10, i16 10, i16 10, i16 10, i16 10, i16 10, i16 10, i16 10, i16 10, i16 10, i16 10, i16 10, i16 10, i16 10>
  %113 = trunc <16 x i16> %112 to <16 x i1>
  %114 = xor <16 x i1> %113, <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>
  %115 = sext <16 x i1> %113 to <16 x i16>
  %116 = sext <16 x i1> %114 to <16 x i16>
  %117 = and <16 x i16> %115, %106
  %118 = and <16 x i16> %116, %111
  %119 = or <16 x i16> %117, %118
  %120 = zext <16 x i1> %114 to <16 x i8>
  %121 = shl <16 x i8> %120, <i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2>
  %122 = or <16 x i8> %121, %109
  %123 = shl <16 x i16> %45, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %124 = sub <16 x i16> %119, %123
  %125 = lshr <16 x i16> %124, <i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9>
  %126 = trunc <16 x i16> %125 to <16 x i1>
  %127 = xor <16 x i1> %126, <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>
  %128 = sext <16 x i1> %126 to <16 x i16>
  %129 = sext <16 x i1> %127 to <16 x i16>
  %130 = and <16 x i16> %128, %119
  %131 = and <16 x i16> %129, %124
  %132 = or <16 x i16> %130, %131
  %133 = zext <16 x i1> %127 to <16 x i8>
  %134 = shl <16 x i8> %133, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  %135 = or <16 x i8> %134, %122
  %136 = shl <16 x i16> %45, zeroinitializer
  %137 = sub <16 x i16> %132, %136
  %138 = lshr <16 x i16> %137, <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>
  %139 = trunc <16 x i16> %138 to <16 x i1>
  %140 = xor <16 x i1> %139, <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>
  %141 = sext <16 x i1> %139 to <16 x i16>
  %142 = sext <16 x i1> %140 to <16 x i16>
  %143 = and <16 x i16> %141, %132
  %144 = and <16 x i16> %142, %137
  %145 = or <16 x i16> %143, %144
  %146 = zext <16 x i1> %140 to <16 x i8>
  %147 = shl <16 x i8> %146, zeroinitializer
  %148 = or <16 x i8> %147, %135
  %149 = bitcast <16 x i8> %148 to <16 x i8>
  %150 = extractelement <16 x i8> %149, i32 1
  %151 = extractelement <16 x i8> %149, i32 2
  %152 = extractelement <16 x i8> %149, i32 3
  %153 = extractelement <16 x i8> %149, i32 4
  %154 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i32 0, i32 0), i8 %150, i8 %151, i8 %152, i8 %153)
  ret i32 0
}

declare i64 @atoll(i8*) #1

attributes #0 = { noinline norecurse ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

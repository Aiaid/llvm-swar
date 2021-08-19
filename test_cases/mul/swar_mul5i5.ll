; ModuleID = '../test_cases/mul/mul5i5.ll'
source_filename = "../test_cases/mul/mul5i5.ll"

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
  %46 = trunc <5 x i5> %44 to <5 x i1>
  %47 = sext <5 x i1> %46 to <5 x i5>
  %48 = and <5 x i5> %47, %45
  %49 = lshr <5 x i5> %44, <i5 1, i5 1, i5 1, i5 1, i5 1>
  %50 = trunc <5 x i5> %49 to <5 x i1>
  %51 = sext <5 x i1> %50 to <5 x i5>
  %52 = shl <5 x i5> %45, <i5 1, i5 1, i5 1, i5 1, i5 1>
  %53 = and <5 x i5> %51, %52
  %54 = bitcast <5 x i5> %53 to i25
  %55 = bitcast <5 x i5> %48 to i25
  %56 = and i25 %54, 16236015
  %57 = and i25 %55, 16236015
  %58 = add i25 %56, %57
  %59 = xor i25 %54, %55
  %60 = and i25 %59, -16236016
  %61 = xor i25 %58, %60
  %62 = bitcast i25 %61 to <5 x i5>
  %63 = lshr <5 x i5> %44, <i5 2, i5 2, i5 2, i5 2, i5 2>
  %64 = trunc <5 x i5> %63 to <5 x i1>
  %65 = sext <5 x i1> %64 to <5 x i5>
  %66 = shl <5 x i5> %45, <i5 2, i5 2, i5 2, i5 2, i5 2>
  %67 = and <5 x i5> %65, %66
  %68 = bitcast <5 x i5> %67 to i25
  %69 = bitcast <5 x i5> %62 to i25
  %70 = and i25 %68, 16236015
  %71 = and i25 %69, 16236015
  %72 = add i25 %70, %71
  %73 = xor i25 %68, %69
  %74 = and i25 %73, -16236016
  %75 = xor i25 %72, %74
  %76 = bitcast i25 %75 to <5 x i5>
  %77 = lshr <5 x i5> %44, <i5 3, i5 3, i5 3, i5 3, i5 3>
  %78 = trunc <5 x i5> %77 to <5 x i1>
  %79 = sext <5 x i1> %78 to <5 x i5>
  %80 = shl <5 x i5> %45, <i5 3, i5 3, i5 3, i5 3, i5 3>
  %81 = and <5 x i5> %79, %80
  %82 = bitcast <5 x i5> %81 to i25
  %83 = bitcast <5 x i5> %76 to i25
  %84 = and i25 %82, 16236015
  %85 = and i25 %83, 16236015
  %86 = add i25 %84, %85
  %87 = xor i25 %82, %83
  %88 = and i25 %87, -16236016
  %89 = xor i25 %86, %88
  %90 = bitcast i25 %89 to <5 x i5>
  %91 = lshr <5 x i5> %44, <i5 4, i5 4, i5 4, i5 4, i5 4>
  %92 = trunc <5 x i5> %91 to <5 x i1>
  %93 = sext <5 x i1> %92 to <5 x i5>
  %94 = shl <5 x i5> %45, <i5 4, i5 4, i5 4, i5 4, i5 4>
  %95 = and <5 x i5> %93, %94
  %96 = bitcast <5 x i5> %95 to i25
  %97 = bitcast <5 x i5> %90 to i25
  %98 = and i25 %96, 16236015
  %99 = and i25 %97, 16236015
  %100 = add i25 %98, %99
  %101 = xor i25 %96, %97
  %102 = and i25 %101, -16236016
  %103 = xor i25 %100, %102
  %104 = bitcast i25 %103 to <5 x i5>
  %105 = bitcast <5 x i5> %104 to <5 x i5>
  %106 = extractelement <5 x i5> %105, i32 1
  %107 = extractelement <5 x i5> %105, i32 2
  %108 = extractelement <5 x i5> %105, i32 3
  %109 = extractelement <5 x i5> %105, i32 4
  %110 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i32 0, i32 0), i5 %106, i5 %107, i5 %108, i5 %109)
  ret i32 0
}

declare i64 @atoll(i8*) #1

attributes #0 = { noinline norecurse ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

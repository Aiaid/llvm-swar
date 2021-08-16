; ModuleID = '../test_cases/mul/mul32i4.ll'
source_filename = "../test_cases/mul/mul32i4.ll"

@.str = private constant [27 x i8] c"<32 x i4><%i, %i, %i, %i>\0A\00", align 1
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
  %42 = bitcast i128 %40 to <32 x i4>
  %43 = bitcast i128 %41 to <32 x i4>
  %44 = trunc <32 x i4> %42 to <32 x i1>
  %45 = sext <32 x i1> %44 to <32 x i4>
  %46 = and <32 x i4> %45, %43
  %47 = lshr <32 x i4> %42, <i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1>
  %48 = trunc <32 x i4> %47 to <32 x i1>
  %49 = sext <32 x i1> %48 to <32 x i4>
  %50 = shl <32 x i4> %43, <i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1>
  %51 = and <32 x i4> %49, %50
  %52 = bitcast <32 x i4> %51 to i128
  %53 = bitcast <32 x i4> %46 to i128
  %54 = and i128 %52, 158798437896437949616241483468158498679
  %55 = and i128 %53, 158798437896437949616241483468158498679
  %56 = add i128 %54, %55
  %57 = xor i128 %52, %53
  %58 = and i128 %57, -158798437896437949616241483468158498680
  %59 = xor i128 %56, %58
  %60 = bitcast i128 %59 to <32 x i4>
  %61 = lshr <32 x i4> %42, <i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2>
  %62 = trunc <32 x i4> %61 to <32 x i1>
  %63 = sext <32 x i1> %62 to <32 x i4>
  %64 = shl <32 x i4> %43, <i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2>
  %65 = and <32 x i4> %63, %64
  %66 = bitcast <32 x i4> %65 to i128
  %67 = bitcast <32 x i4> %60 to i128
  %68 = and i128 %66, 158798437896437949616241483468158498679
  %69 = and i128 %67, 158798437896437949616241483468158498679
  %70 = add i128 %68, %69
  %71 = xor i128 %66, %67
  %72 = and i128 %71, -158798437896437949616241483468158498680
  %73 = xor i128 %70, %72
  %74 = bitcast i128 %73 to <32 x i4>
  %75 = lshr <32 x i4> %42, <i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3>
  %76 = trunc <32 x i4> %75 to <32 x i1>
  %77 = sext <32 x i1> %76 to <32 x i4>
  %78 = shl <32 x i4> %43, <i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3>
  %79 = and <32 x i4> %77, %78
  %80 = bitcast <32 x i4> %79 to i128
  %81 = bitcast <32 x i4> %74 to i128
  %82 = and i128 %80, 158798437896437949616241483468158498679
  %83 = and i128 %81, 158798437896437949616241483468158498679
  %84 = add i128 %82, %83
  %85 = xor i128 %80, %81
  %86 = and i128 %85, -158798437896437949616241483468158498680
  %87 = xor i128 %84, %86
  %88 = bitcast i128 %87 to <32 x i4>
  %89 = bitcast <32 x i4> %88 to <32 x i4>
  %90 = extractelement <32 x i4> %89, i32 1
  %91 = extractelement <32 x i4> %89, i32 2
  %92 = extractelement <32 x i4> %89, i32 3
  %93 = extractelement <32 x i4> %89, i32 4
  %94 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i32 0, i32 0), i4 %90, i4 %91, i4 %92, i4 %93)
  ret i32 0
}

declare i64 @atoll(i8*) #1

attributes #0 = { noinline norecurse ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

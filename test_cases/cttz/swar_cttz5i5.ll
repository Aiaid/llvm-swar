; ModuleID = '../test_cases/cttz/cttz5i5.ll'
source_filename = "../test_cases/cttz/cttz5i5.ll"

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
  %46 = xor <5 x i5> %44, <i5 -1, i5 -1, i5 -1, i5 -1, i5 -1>
  %47 = bitcast <5 x i5> %46 to i25
  %48 = and i25 %47, 16236015
  %49 = add i25 %48, and (i25 bitcast (<5 x i5> <i5 1, i5 1, i5 1, i5 1, i5 1> to i25), i25 16236015)
  %50 = xor i25 %47, bitcast (<5 x i5> <i5 1, i5 1, i5 1, i5 1, i5 1> to i25)
  %51 = and i25 %50, -16236016
  %52 = xor i25 %49, %51
  %53 = bitcast i25 %52 to <5 x i5>
  %54 = and <5 x i5> %44, %53
  %55 = bitcast <5 x i5> %54 to i25
  %56 = and i25 %55, 16236015
  %57 = sub i25 %56, and (i25 bitcast (<5 x i5> <i5 1, i5 1, i5 1, i5 1, i5 1> to i25), i25 16236015)
  %58 = xor i25 %55, bitcast (<5 x i5> <i5 1, i5 1, i5 1, i5 1, i5 1> to i25)
  %59 = and i25 %58, -16236016
  %60 = xor i25 %57, %59
  %61 = bitcast i25 %60 to <5 x i5>
  %62 = bitcast <5 x i5> %61 to i25
  %63 = and i25 %62, 16236015
  %64 = and i25 %62, -16236016
  %65 = lshr i25 %64, 4
  %66 = and i25 %63, 169125
  %67 = lshr i25 %63, 1
  %68 = and i25 %67, 169125
  %69 = add i25 %66, %68
  %70 = and i25 %69, 101475
  %71 = lshr i25 %69, 2
  %72 = and i25 %71, 101475
  %73 = add i25 %70, %72
  %74 = and i25 %65, 16236015
  %75 = and i25 %73, 16236015
  %76 = add i25 %74, %75
  %77 = xor i25 %65, %73
  %78 = and i25 %77, -16236016
  %79 = xor i25 %76, %78
  %80 = bitcast i25 %79 to <5 x i5>
  %81 = extractelement <5 x i5> %80, i32 1
  %82 = extractelement <5 x i5> %80, i32 2
  %83 = extractelement <5 x i5> %80, i32 3
  %84 = extractelement <5 x i5> %80, i32 4
  %85 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i32 0, i32 0), i5 %81, i5 %82, i5 %83, i5 %84)
  ret i32 0
}

declare i64 @atoll(i8*) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare <5 x i5> @llvm.cttz.v5i5(<5 x i5>, i1 immarg) #2

attributes #0 = { noinline norecurse ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }

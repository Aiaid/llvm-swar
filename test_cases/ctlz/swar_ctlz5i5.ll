; ModuleID = '../test_cases/ctlz/ctlz5i5.ll'
source_filename = "../test_cases/ctlz/ctlz5i5.ll"

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
  %46 = lshr <5 x i5> %44, <i5 1, i5 1, i5 1, i5 1, i5 1>
  %47 = or <5 x i5> %44, %46
  %48 = lshr <5 x i5> %47, <i5 2, i5 2, i5 2, i5 2, i5 2>
  %49 = or <5 x i5> %47, %48
  %50 = lshr <5 x i5> %49, <i5 1, i5 1, i5 1, i5 1, i5 1>
  %51 = or <5 x i5> %49, %50
  %52 = xor <5 x i5> %51, <i5 -1, i5 -1, i5 -1, i5 -1, i5 -1>
  %53 = bitcast <5 x i5> %52 to i25
  %54 = and i25 %53, 16236015
  %55 = and i25 %53, -16236016
  %56 = lshr i25 %55, 4
  %57 = and i25 %54, 169125
  %58 = lshr i25 %54, 1
  %59 = and i25 %58, 169125
  %60 = add i25 %57, %59
  %61 = and i25 %60, 101475
  %62 = lshr i25 %60, 2
  %63 = and i25 %62, 101475
  %64 = add i25 %61, %63
  %65 = and i25 %56, 16236015
  %66 = and i25 %64, 16236015
  %67 = add i25 %65, %66
  %68 = xor i25 %56, %64
  %69 = and i25 %68, -16236016
  %70 = xor i25 %67, %69
  %71 = bitcast i25 %70 to <5 x i5>
  %72 = extractelement <5 x i5> %71, i32 1
  %73 = extractelement <5 x i5> %71, i32 2
  %74 = extractelement <5 x i5> %71, i32 3
  %75 = extractelement <5 x i5> %71, i32 4
  %76 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i32 0, i32 0), i5 %72, i5 %73, i5 %74, i5 %75)
  ret i32 0
}

declare i64 @atoll(i8*) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare <5 x i5> @llvm.ctlz.v5i5(<5 x i5>, i1 immarg) #2

attributes #0 = { noinline norecurse ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }

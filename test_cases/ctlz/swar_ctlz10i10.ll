; ModuleID = '../test_cases/ctlz/ctlz10i10.ll'
source_filename = "../test_cases/ctlz/ctlz10i10.ll"

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
  %46 = lshr <10 x i10> %44, <i10 1, i10 1, i10 1, i10 1, i10 1, i10 1, i10 1, i10 1, i10 1, i10 1>
  %47 = or <10 x i10> %44, %46
  %48 = lshr <10 x i10> %47, <i10 2, i10 2, i10 2, i10 2, i10 2, i10 2, i10 2, i10 2, i10 2, i10 2>
  %49 = or <10 x i10> %47, %48
  %50 = lshr <10 x i10> %49, <i10 4, i10 4, i10 4, i10 4, i10 4, i10 4, i10 4, i10 4, i10 4, i10 4>
  %51 = or <10 x i10> %49, %50
  %52 = lshr <10 x i10> %51, <i10 2, i10 2, i10 2, i10 2, i10 2, i10 2, i10 2, i10 2, i10 2, i10 2>
  %53 = or <10 x i10> %51, %52
  %54 = xor <10 x i10> %53, <i10 -1, i10 -1, i10 -1, i10 -1, i10 -1, i10 -1, i10 -1, i10 -1, i10 -1, i10 -1>
  %55 = bitcast <10 x i10> %54 to i100
  %56 = and i100 %55, 315983287446919352279236869375
  %57 = and i100 %55, -315983287446919352279236869376
  %58 = lshr i100 %57, 8
  %59 = and i100 %58, 1239150146850664126585242625
  %60 = and i100 %58, -1239150146850664126585242626
  %61 = lshr i100 %60, 1
  %62 = and i100 %61, 633205725040689368685058981375
  %63 = and i100 %59, 633205725040689368685058981375
  %64 = add i100 %62, %63
  %65 = xor i100 %61, %59
  %66 = and i100 %65, -633205725040689368685058981376
  %67 = xor i100 %64, %66
  %68 = and i100 %56, 100448381883913470039125
  %69 = lshr i100 %56, 1
  %70 = and i100 %69, 100448381883913470039125
  %71 = add i100 %68, %70
  %72 = and i100 %71, 60269029130348082023475
  %73 = lshr i100 %71, 2
  %74 = and i100 %73, 60269029130348082023475
  %75 = add i100 %72, %74
  %76 = and i100 %75, 17726185038337671183375
  %77 = lshr i100 %75, 4
  %78 = and i100 %77, 17726185038337671183375
  %79 = add i100 %76, %78
  %80 = and i100 %67, 633205725040689368685058981375
  %81 = and i100 %79, 633205725040689368685058981375
  %82 = add i100 %80, %81
  %83 = xor i100 %67, %79
  %84 = and i100 %83, -633205725040689368685058981376
  %85 = xor i100 %82, %84
  %86 = bitcast i100 %85 to <10 x i10>
  %87 = extractelement <10 x i10> %86, i32 1
  %88 = extractelement <10 x i10> %86, i32 2
  %89 = extractelement <10 x i10> %86, i32 3
  %90 = extractelement <10 x i10> %86, i32 4
  %91 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str, i32 0, i32 0), i10 %87, i10 %88, i10 %89, i10 %90)
  ret i32 0
}

declare i64 @atoll(i8*) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare <10 x i10> @llvm.ctlz.v10i10(<10 x i10>, i1 immarg) #2

attributes #0 = { noinline norecurse ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }

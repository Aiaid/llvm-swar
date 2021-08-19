; ModuleID = '../test_cases/ctpop/ctpop10i10.ll'
source_filename = "../test_cases/ctpop/ctpop10i10.ll"

@.str = private constant [28 x i8] c"<10 x i10><%i, %i, %i, %i>\0A\00", align 1
@0 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

declare i32 @printf(i8*, ...)

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare <10 x i10> @llvm.ctpop.v10i10(<10 x i10>) #0

; Function Attrs: noinline norecurse ssp uwtable mustprogress
define dso_local i32 @main(i32 %0, i8** %1) #1 {
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
  %46 = bitcast <10 x i10> %44 to i100
  %47 = and i100 %46, 315983287446919352279236869375
  %48 = and i100 %46, -315983287446919352279236869376
  %49 = lshr i100 %48, 8
  %50 = and i100 %49, 1239150146850664126585242625
  %51 = and i100 %49, -1239150146850664126585242626
  %52 = lshr i100 %51, 1
  %53 = and i100 %52, 633205725040689368685058981375
  %54 = and i100 %50, 633205725040689368685058981375
  %55 = add i100 %53, %54
  %56 = xor i100 %52, %50
  %57 = and i100 %56, -633205725040689368685058981376
  %58 = xor i100 %55, %57
  %59 = and i100 %47, 100448381883913470039125
  %60 = lshr i100 %47, 1
  %61 = and i100 %60, 100448381883913470039125
  %62 = add i100 %59, %61
  %63 = and i100 %62, 60269029130348082023475
  %64 = lshr i100 %62, 2
  %65 = and i100 %64, 60269029130348082023475
  %66 = add i100 %63, %65
  %67 = and i100 %66, 17726185038337671183375
  %68 = lshr i100 %66, 4
  %69 = and i100 %68, 17726185038337671183375
  %70 = add i100 %67, %69
  %71 = and i100 %58, 633205725040689368685058981375
  %72 = and i100 %70, 633205725040689368685058981375
  %73 = add i100 %71, %72
  %74 = xor i100 %58, %70
  %75 = and i100 %74, -633205725040689368685058981376
  %76 = xor i100 %73, %75
  %77 = bitcast i100 %76 to <10 x i10>
  %78 = extractelement <10 x i10> %77, i32 1
  %79 = extractelement <10 x i10> %77, i32 2
  %80 = extractelement <10 x i10> %77, i32 3
  %81 = extractelement <10 x i10> %77, i32 4
  %82 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str, i32 0, i32 0), i10 %78, i10 %79, i10 %80, i10 %81)
  ret i32 0
}

declare i64 @atoll(i8*) #2

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #1 = { noinline norecurse ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

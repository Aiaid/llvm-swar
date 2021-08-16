; ModuleID = '../test_cases/cttz/cttz16i8.ll'
source_filename = "../test_cases/cttz/cttz16i8.ll"

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
  %44 = xor <16 x i8> %42, <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>
  %45 = add <16 x i8> %44, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  %46 = and <16 x i8> %42, %45
  %47 = sub <16 x i8> %46, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  %48 = bitcast <16 x i8> %47 to i128
  %49 = and i128 %48, 113427455640312821154458202477256070485
  %50 = lshr i128 %48, 1
  %51 = and i128 %50, 113427455640312821154458202477256070485
  %52 = add i128 %49, %51
  %53 = and i128 %52, 68056473384187692692674921486353642291
  %54 = lshr i128 %52, 2
  %55 = and i128 %54, 68056473384187692692674921486353642291
  %56 = add i128 %53, %55
  %57 = and i128 %56, 20016609818878733144904388672456953615
  %58 = lshr i128 %56, 4
  %59 = and i128 %58, 20016609818878733144904388672456953615
  %60 = add i128 %57, %59
  %61 = bitcast i128 %60 to <16 x i8>
  %62 = extractelement <16 x i8> %61, i32 1
  %63 = extractelement <16 x i8> %61, i32 2
  %64 = extractelement <16 x i8> %61, i32 3
  %65 = extractelement <16 x i8> %61, i32 4
  %66 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i32 0, i32 0), i8 %62, i8 %63, i8 %64, i8 %65)
  ret i32 0
}

declare i64 @atoll(i8*) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare <16 x i8> @llvm.cttz.v16i8(<16 x i8>, i1 immarg) #2

attributes #0 = { noinline norecurse ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }

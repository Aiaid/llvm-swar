; ModuleID = '../test_cases/rem/rem64i2.ll'
source_filename = "../test_cases/rem/rem64i2.ll"

@.str = private constant [27 x i8] c"<64 x i2><%i, %i, %i, %i>\0A\00", align 1
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
  %42 = bitcast i128 %40 to <64 x i2>
  %43 = bitcast i128 %41 to <64 x i2>
  %44 = zext <64 x i2> %42 to <64 x i4>
  %45 = zext <64 x i2> %43 to <64 x i4>
  %46 = shl <64 x i4> %45, <i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1>
  %47 = sub <64 x i4> %44, %46
  %48 = lshr <64 x i4> %47, <i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3>
  %49 = trunc <64 x i4> %48 to <64 x i1>
  %50 = xor <64 x i1> %49, <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>
  %51 = sext <64 x i1> %49 to <64 x i4>
  %52 = sext <64 x i1> %50 to <64 x i4>
  %53 = and <64 x i4> %51, %44
  %54 = and <64 x i4> %52, %47
  %55 = or <64 x i4> %53, %54
  %56 = zext <64 x i1> %50 to <64 x i2>
  %57 = shl <64 x i2> %56, <i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1, i2 1>
  %58 = shl <64 x i4> %45, zeroinitializer
  %59 = sub <64 x i4> %55, %58
  %60 = lshr <64 x i4> %59, <i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2>
  %61 = trunc <64 x i4> %60 to <64 x i1>
  %62 = xor <64 x i1> %61, <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>
  %63 = sext <64 x i1> %61 to <64 x i4>
  %64 = sext <64 x i1> %62 to <64 x i4>
  %65 = and <64 x i4> %63, %55
  %66 = and <64 x i4> %64, %59
  %67 = or <64 x i4> %65, %66
  %68 = zext <64 x i1> %62 to <64 x i2>
  %69 = shl <64 x i2> %68, zeroinitializer
  %70 = or <64 x i2> %69, %57
  %71 = trunc <64 x i4> %67 to <64 x i2>
  %72 = bitcast <64 x i2> %71 to <64 x i2>
  %73 = extractelement <64 x i2> %72, i32 1
  %74 = extractelement <64 x i2> %72, i32 2
  %75 = extractelement <64 x i2> %72, i32 3
  %76 = extractelement <64 x i2> %72, i32 4
  %77 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i32 0, i32 0), i2 %73, i2 %74, i2 %75, i2 %76)
  ret i32 0
}

declare i64 @atoll(i8*) #1

attributes #0 = { noinline norecurse ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

; ModuleID = '../test_cases/rem/rem32i4.ll'
source_filename = "../test_cases/rem/rem32i4.ll"

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
  %44 = zext <32 x i4> %42 to <32 x i8>
  %45 = zext <32 x i4> %43 to <32 x i8>
  %46 = shl <32 x i8> %45, <i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3>
  %47 = sub <32 x i8> %44, %46
  %48 = lshr <32 x i8> %47, <i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7>
  %49 = trunc <32 x i8> %48 to <32 x i1>
  %50 = xor <32 x i1> %49, <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>
  %51 = sext <32 x i1> %49 to <32 x i8>
  %52 = sext <32 x i1> %50 to <32 x i8>
  %53 = and <32 x i8> %51, %44
  %54 = and <32 x i8> %52, %47
  %55 = or <32 x i8> %53, %54
  %56 = zext <32 x i1> %50 to <32 x i4>
  %57 = shl <32 x i4> %56, <i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3, i4 3>
  %58 = shl <32 x i8> %45, <i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2>
  %59 = sub <32 x i8> %55, %58
  %60 = lshr <32 x i8> %59, <i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6, i8 6>
  %61 = trunc <32 x i8> %60 to <32 x i1>
  %62 = xor <32 x i1> %61, <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>
  %63 = sext <32 x i1> %61 to <32 x i8>
  %64 = sext <32 x i1> %62 to <32 x i8>
  %65 = and <32 x i8> %63, %55
  %66 = and <32 x i8> %64, %59
  %67 = or <32 x i8> %65, %66
  %68 = zext <32 x i1> %62 to <32 x i4>
  %69 = shl <32 x i4> %68, <i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2, i4 2>
  %70 = or <32 x i4> %69, %57
  %71 = shl <32 x i8> %45, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  %72 = sub <32 x i8> %67, %71
  %73 = lshr <32 x i8> %72, <i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5>
  %74 = trunc <32 x i8> %73 to <32 x i1>
  %75 = xor <32 x i1> %74, <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>
  %76 = sext <32 x i1> %74 to <32 x i8>
  %77 = sext <32 x i1> %75 to <32 x i8>
  %78 = and <32 x i8> %76, %67
  %79 = and <32 x i8> %77, %72
  %80 = or <32 x i8> %78, %79
  %81 = zext <32 x i1> %75 to <32 x i4>
  %82 = shl <32 x i4> %81, <i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1, i4 1>
  %83 = or <32 x i4> %82, %70
  %84 = shl <32 x i8> %45, zeroinitializer
  %85 = sub <32 x i8> %80, %84
  %86 = lshr <32 x i8> %85, <i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4>
  %87 = trunc <32 x i8> %86 to <32 x i1>
  %88 = xor <32 x i1> %87, <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>
  %89 = sext <32 x i1> %87 to <32 x i8>
  %90 = sext <32 x i1> %88 to <32 x i8>
  %91 = and <32 x i8> %89, %80
  %92 = and <32 x i8> %90, %85
  %93 = or <32 x i8> %91, %92
  %94 = zext <32 x i1> %88 to <32 x i4>
  %95 = shl <32 x i4> %94, zeroinitializer
  %96 = or <32 x i4> %95, %83
  %97 = trunc <32 x i8> %93 to <32 x i4>
  %98 = bitcast <32 x i4> %97 to <32 x i4>
  %99 = extractelement <32 x i4> %98, i32 1
  %100 = extractelement <32 x i4> %98, i32 2
  %101 = extractelement <32 x i4> %98, i32 3
  %102 = extractelement <32 x i4> %98, i32 4
  %103 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i32 0, i32 0), i4 %99, i4 %100, i4 %101, i4 %102)
  ret i32 0
}

declare i64 @atoll(i8*) #1

attributes #0 = { noinline norecurse ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

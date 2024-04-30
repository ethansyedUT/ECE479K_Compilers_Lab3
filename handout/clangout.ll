; ModuleID = '../tests/doloop.c'
source_filename = "../tests/doloop.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 noundef %0, ptr noalias noundef %1, ptr noalias noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i32 1, ptr %7, align 4
  %10 = load i32, ptr %4, align 4
  store i32 %10, ptr %8, align 4
  br label %11

11:                                               ; preds = %34, %3
  %12 = load i32, ptr %7, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %17

14:                                               ; preds = %11
  %15 = load i32, ptr %8, align 4
  %16 = load ptr, ptr %5, align 8
  store i32 %15, ptr %16, align 4
  br label %17

17:                                               ; preds = %14, %11
  %18 = load i32, ptr %7, align 4
  store i32 %18, ptr %9, align 4
  %19 = load i32, ptr %8, align 4
  %20 = sdiv i32 %19, -3
  %21 = load i32, ptr %9, align 4
  %22 = add nsw i32 1, %21
  %23 = sub nsw i32 %20, %22
  store i32 %23, ptr %7, align 4
  %24 = load i32, ptr %7, align 4
  %25 = load i32, ptr %4, align 4
  %26 = add nsw i32 %25, %24
  store i32 %26, ptr %4, align 4
  %27 = load i32, ptr %9, align 4
  %28 = icmp sgt i32 %27, 0
  br i1 %28, label %29, label %31

29:                                               ; preds = %17
  %30 = load i32, ptr %9, align 4
  store i32 %30, ptr %7, align 4
  br label %31

31:                                               ; preds = %29, %17
  %32 = load i32, ptr %8, align 4
  %33 = load ptr, ptr %6, align 8
  store i32 %32, ptr %33, align 4
  br label %34

34:                                               ; preds = %31
  %35 = load i32, ptr %4, align 4
  %36 = icmp slt i32 0, %35
  br i1 %36, label %11, label %37, !llvm.loop !6

37:                                               ; preds = %34
  %38 = load i32, ptr %7, align 4
  ret i32 %38
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 15.0.7"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
; ModuleID = '../tests/doloop.c'
source_filename = "../tests/doloop.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 noundef %0, ptr noalias noundef %1, ptr noalias noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i32 1, ptr %7, align 4
  %10 = load i32, ptr %4, align 4
  store i32 %10, ptr %8, align 4
  br label %11

11:                                               ; preds = %34, %3
  %12 = load i32, ptr %7, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %17

14:                                               ; preds = %11
  %15 = load i32, ptr %8, align 4
  %16 = load ptr, ptr %5, align 8
  store i32 %15, ptr %16, align 4
  br label %17

17:                                               ; preds = %14, %11
  %18 = load i32, ptr %7, align 4
  store i32 %18, ptr %9, align 4
  %19 = load i32, ptr %8, align 4
  %20 = sdiv i32 %19, -3
  %21 = load i32, ptr %9, align 4
  %22 = add nsw i32 1, %21
  %23 = sub nsw i32 %20, %22
  store i32 %23, ptr %7, align 4
  %24 = load i32, ptr %7, align 4
  %25 = load i32, ptr %4, align 4
  %26 = add nsw i32 %25, %24
  store i32 %26, ptr %4, align 4
  %27 = load i32, ptr %9, align 4
  %28 = icmp sgt i32 %27, 0
  br i1 %28, label %29, label %31

29:                                               ; preds = %17
  %30 = load i32, ptr %9, align 4
  store i32 %30, ptr %7, align 4
  br label %31

31:                                               ; preds = %29, %17
  %32 = load i32, ptr %8, align 4
  %33 = load ptr, ptr %6, align 8
  store i32 %32, ptr %33, align 4
  br label %34

34:                                               ; preds = %31
  %35 = load i32, ptr %4, align 4
  %36 = icmp slt i32 0, %35
  br i1 %36, label %11, label %37, !llvm.loop !6

37:                                               ; preds = %34
  %38 = load i32, ptr %7, align 4
  ret i32 %38
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 15.0.7"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
; ModuleID = '../tests/doloop.c'
source_filename = "../tests/doloop.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 noundef %0, ptr noalias noundef %1, ptr noalias noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i32 1, ptr %7, align 4
  %10 = load i32, ptr %4, align 4
  store i32 %10, ptr %8, align 4
  br label %11

11:                                               ; preds = %34, %3
  %12 = load i32, ptr %7, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %17

14:                                               ; preds = %11
  %15 = load i32, ptr %8, align 4
  %16 = load ptr, ptr %5, align 8
  store i32 %15, ptr %16, align 4
  br label %17

17:                                               ; preds = %14, %11
  %18 = load i32, ptr %7, align 4
  store i32 %18, ptr %9, align 4
  %19 = load i32, ptr %8, align 4
  %20 = sdiv i32 %19, -3
  %21 = load i32, ptr %9, align 4
  %22 = add nsw i32 1, %21
  %23 = sub nsw i32 %20, %22
  store i32 %23, ptr %7, align 4
  %24 = load i32, ptr %7, align 4
  %25 = load i32, ptr %4, align 4
  %26 = add nsw i32 %25, %24
  store i32 %26, ptr %4, align 4
  %27 = load i32, ptr %9, align 4
  %28 = icmp sgt i32 %27, 0
  br i1 %28, label %29, label %31

29:                                               ; preds = %17
  %30 = load i32, ptr %9, align 4
  store i32 %30, ptr %7, align 4
  br label %31

31:                                               ; preds = %29, %17
  %32 = load i32, ptr %8, align 4
  %33 = load ptr, ptr %6, align 8
  store i32 %32, ptr %33, align 4
  br label %34

34:                                               ; preds = %31
  %35 = load i32, ptr %4, align 4
  %36 = icmp slt i32 0, %35
  br i1 %36, label %11, label %37, !llvm.loop !6

37:                                               ; preds = %34
  %38 = load i32, ptr %7, align 4
  ret i32 %38
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 15.0.7"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
; ModuleID = '../tests/doloop.c'
source_filename = "../tests/doloop.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 noundef %0, ptr noalias noundef %1, ptr noalias noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i32 1, ptr %7, align 4
  %10 = load i32, ptr %4, align 4
  store i32 %10, ptr %8, align 4
  br label %11

11:                                               ; preds = %34, %3
  %12 = load i32, ptr %7, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %17

14:                                               ; preds = %11
  %15 = load i32, ptr %8, align 4
  %16 = load ptr, ptr %5, align 8
  store i32 %15, ptr %16, align 4
  br label %17

17:                                               ; preds = %14, %11
  %18 = load i32, ptr %7, align 4
  store i32 %18, ptr %9, align 4
  %19 = load i32, ptr %8, align 4
  %20 = sdiv i32 %19, -3
  %21 = load i32, ptr %9, align 4
  %22 = add nsw i32 1, %21
  %23 = sub nsw i32 %20, %22
  store i32 %23, ptr %7, align 4
  %24 = load i32, ptr %7, align 4
  %25 = load i32, ptr %4, align 4
  %26 = add nsw i32 %25, %24
  store i32 %26, ptr %4, align 4
  %27 = load i32, ptr %9, align 4
  %28 = icmp sgt i32 %27, 0
  br i1 %28, label %29, label %31

29:                                               ; preds = %17
  %30 = load i32, ptr %9, align 4
  store i32 %30, ptr %7, align 4
  br label %31

31:                                               ; preds = %29, %17
  %32 = load i32, ptr %8, align 4
  %33 = load ptr, ptr %6, align 8
  store i32 %32, ptr %33, align 4
  br label %34

34:                                               ; preds = %31
  %35 = load i32, ptr %4, align 4
  %36 = icmp slt i32 0, %35
  br i1 %36, label %11, label %37, !llvm.loop !6

37:                                               ; preds = %34
  %38 = load i32, ptr %7, align 4
  ret i32 %38
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 15.0.7"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
; ModuleID = 'tests/doloop.c'
source_filename = "tests/doloop.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 noundef %0, ptr noalias noundef %1, ptr noalias noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i32 1, ptr %7, align 4
  %10 = load i32, ptr %4, align 4
  store i32 %10, ptr %8, align 4
  br label %11

11:                                               ; preds = %34, %3
  %12 = load i32, ptr %7, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %17

14:                                               ; preds = %11
  %15 = load i32, ptr %8, align 4
  %16 = load ptr, ptr %5, align 8
  store i32 %15, ptr %16, align 4
  br label %17

17:                                               ; preds = %14, %11
  %18 = load i32, ptr %7, align 4
  store i32 %18, ptr %9, align 4
  %19 = load i32, ptr %8, align 4
  %20 = sdiv i32 %19, -3
  %21 = load i32, ptr %9, align 4
  %22 = add nsw i32 1, %21
  %23 = sub nsw i32 %20, %22
  store i32 %23, ptr %7, align 4
  %24 = load i32, ptr %7, align 4
  %25 = load i32, ptr %4, align 4
  %26 = add nsw i32 %25, %24
  store i32 %26, ptr %4, align 4
  %27 = load i32, ptr %9, align 4
  %28 = icmp sgt i32 %27, 0
  br i1 %28, label %29, label %31

29:                                               ; preds = %17
  %30 = load i32, ptr %9, align 4
  store i32 %30, ptr %7, align 4
  br label %31

31:                                               ; preds = %29, %17
  %32 = load i32, ptr %8, align 4
  %33 = load ptr, ptr %6, align 8
  store i32 %32, ptr %33, align 4
  br label %34

34:                                               ; preds = %31
  %35 = load i32, ptr %4, align 4
  %36 = icmp slt i32 0, %35
  br i1 %36, label %11, label %37, !llvm.loop !6

37:                                               ; preds = %34
  %38 = load i32, ptr %7, align 4
  ret i32 %38
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 15.0.7"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}

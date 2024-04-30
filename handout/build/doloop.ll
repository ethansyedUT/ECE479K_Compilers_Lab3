; ModuleID = '<stdin>'
source_filename = "../tests/doloop.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 noundef %0, ptr noalias noundef %1, ptr noalias noundef %2) #0 {
foo_BB1:
  br label %foo_BB2

foo_BB2:                                          ; preds = %foo_BB4, %foo_BB1
  %.01 = phi i32 [ 1, %foo_BB1 ], [ %spec.select, %foo_BB4 ]
  %.0 = phi i32 [ %0, %foo_BB1 ], [ %6, %foo_BB4 ]
  %3 = icmp sgt i32 %.01, 0
  br i1 %3, label %foo_BB3, label %foo_BB4

foo_BB3:                                          ; preds = %foo_BB2
  store i32 %0, ptr %1, align 4
  br label %foo_BB4

foo_BB4:                                          ; preds = %foo_BB3, %foo_BB2
  %4 = sdiv i32 %0, -3
  %.neg = xor i32 %.01, -1
  %5 = add i32 %.neg, %4
  %6 = add nsw i32 %.0, %5
  %spec.select = select i1 %3, i32 %.01, i32 %5
  store i32 %0, ptr %2, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %foo_BB2, label %foo_BB5, !llvm.loop !6

foo_BB5:                                          ; preds = %foo_BB4
  ret i32 %spec.select
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

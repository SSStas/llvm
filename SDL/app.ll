; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.app.p_x = private unnamed_addr constant [3 x i32] [i32 0, i32 255, i32 510], align 4
@__const.app.p_y = private unnamed_addr constant [3 x i32] [i32 255, i32 0, i32 255], align 4

; Function Attrs: nounwind uwtable
define dso_local void @drawLine(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) local_unnamed_addr #0 {
  %6 = sub nsw i32 %2, %0
  %7 = sub nsw i32 %3, %1
  %8 = tail call i32 @llvm.abs.i32(i32 %6, i1 true)
  %9 = tail call i32 @llvm.abs.i32(i32 %7, i1 true)
  %10 = icmp sgt i32 %2, %0
  %11 = select i1 %10, i32 1, i32 -1
  %12 = icmp sgt i32 %3, %1
  %13 = select i1 %12, i32 1, i32 -1
  tail call void @simPutPixel(i32 noundef %0, i32 noundef %1, i32 noundef %4) #3
  %14 = icmp ne i32 %2, %0
  %15 = icmp ne i32 %3, %1
  %16 = or i1 %15, %14
  br i1 %16, label %17, label %38

17:                                               ; preds = %5
  %18 = sub nsw i32 %8, %9
  %19 = sub nsw i32 0, %9
  br label %20

20:                                               ; preds = %17, %20
  %21 = phi i32 [ %0, %17 ], [ %29, %20 ]
  %22 = phi i32 [ %18, %17 ], [ %34, %20 ]
  %23 = phi i32 [ %1, %17 ], [ %32, %20 ]
  %24 = shl nsw i32 %22, 1
  %25 = icmp sgt i32 %24, %19
  %26 = select i1 %25, i32 %9, i32 0
  %27 = sub i32 %22, %26
  %28 = select i1 %25, i32 %11, i32 0
  %29 = add nsw i32 %28, %21
  %30 = icmp slt i32 %24, %8
  %31 = select i1 %30, i32 %13, i32 0
  %32 = add nsw i32 %31, %23
  %33 = select i1 %30, i32 %8, i32 0
  %34 = add nsw i32 %27, %33
  tail call void @simPutPixel(i32 noundef %29, i32 noundef %32, i32 noundef %4) #3
  %35 = icmp ne i32 %29, %2
  %36 = icmp ne i32 %32, %3
  %37 = or i1 %36, %35
  br i1 %37, label %20, label %38, !llvm.loop !5

38:                                               ; preds = %20, %5
  tail call void (...) @simFlush() #3
  ret void
}

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #1

declare void @simFlush(...) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define dso_local void @app() local_unnamed_addr #0 {
  tail call void @simPutPixel(i32 noundef 0, i32 noundef 255, i32 noundef -1) #3
  br label %1

1:                                                ; preds = %1, %0
  %2 = phi i32 [ 0, %0 ], [ %4, %1 ]
  %3 = phi i32 [ 255, %0 ], [ %5, %1 ]
  %4 = add nuw nsw i32 %2, 1
  %5 = add nsw i32 %3, -1
  tail call void @simPutPixel(i32 noundef %4, i32 noundef %5, i32 noundef -1) #3
  %6 = icmp ne i32 %4, 255
  %7 = icmp ne i32 %5, 0
  %8 = or i1 %7, %6
  br i1 %8, label %1, label %9, !llvm.loop !5

9:                                                ; preds = %1
  tail call void (...) @simFlush() #3
  tail call void @simPutPixel(i32 noundef 255, i32 noundef 0, i32 noundef -1) #3
  br label %10

10:                                               ; preds = %10, %9
  %11 = phi i32 [ 255, %9 ], [ %13, %10 ]
  %12 = phi i32 [ 0, %9 ], [ %14, %10 ]
  %13 = add nuw nsw i32 %11, 1
  %14 = add nuw nsw i32 %12, 1
  tail call void @simPutPixel(i32 noundef %13, i32 noundef %14, i32 noundef -1) #3
  %15 = icmp ne i32 %13, 510
  %16 = icmp ne i32 %14, 255
  %17 = or i1 %16, %15
  br i1 %17, label %10, label %18, !llvm.loop !5

18:                                               ; preds = %10
  tail call void (...) @simFlush() #3
  tail call void @simPutPixel(i32 noundef 510, i32 noundef 255, i32 noundef -1) #3
  br label %19

19:                                               ; preds = %19, %18
  %20 = phi i32 [ 510, %18 ], [ %21, %19 ]
  %21 = add nsw i32 %20, -1
  tail call void @simPutPixel(i32 noundef %21, i32 noundef 255, i32 noundef -1) #3
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %19, !llvm.loop !5

23:                                               ; preds = %19
  tail call void (...) @simFlush() #3
  br label %48

24:                                               ; preds = %48
  tail call void @simPutPixel(i32 noundef 0, i32 noundef 255, i32 noundef -16711936) #3
  br label %25

25:                                               ; preds = %25, %24
  %26 = phi i32 [ 0, %24 ], [ %28, %25 ]
  %27 = phi i32 [ 255, %24 ], [ %29, %25 ]
  %28 = add nuw nsw i32 %26, 1
  %29 = add nsw i32 %27, -1
  tail call void @simPutPixel(i32 noundef %28, i32 noundef %29, i32 noundef -16711936) #3
  %30 = icmp ne i32 %28, 255
  %31 = icmp ne i32 %29, 0
  %32 = or i1 %31, %30
  br i1 %32, label %25, label %33, !llvm.loop !5

33:                                               ; preds = %25
  tail call void (...) @simFlush() #3
  tail call void @simPutPixel(i32 noundef 255, i32 noundef 0, i32 noundef -16711936) #3
  br label %34

34:                                               ; preds = %34, %33
  %35 = phi i32 [ 255, %33 ], [ %37, %34 ]
  %36 = phi i32 [ 0, %33 ], [ %38, %34 ]
  %37 = add nuw nsw i32 %35, 1
  %38 = add nuw nsw i32 %36, 1
  tail call void @simPutPixel(i32 noundef %37, i32 noundef %38, i32 noundef -16711936) #3
  %39 = icmp ne i32 %37, 510
  %40 = icmp ne i32 %38, 255
  %41 = or i1 %40, %39
  br i1 %41, label %34, label %42, !llvm.loop !5

42:                                               ; preds = %34
  tail call void (...) @simFlush() #3
  tail call void @simPutPixel(i32 noundef 510, i32 noundef 255, i32 noundef -16711936) #3
  br label %43

43:                                               ; preds = %43, %42
  %44 = phi i32 [ 510, %42 ], [ %45, %43 ]
  %45 = add nsw i32 %44, -1
  tail call void @simPutPixel(i32 noundef %45, i32 noundef 255, i32 noundef -16711936) #3
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %43, !llvm.loop !5

47:                                               ; preds = %43
  tail call void (...) @simFlush() #3
  ret void

48:                                               ; preds = %23, %48
  %49 = phi i32 [ 255, %23 ], [ %58, %48 ]
  %50 = phi i32 [ 0, %23 ], [ %63, %48 ]
  %51 = phi i32 [ 0, %23 ], [ %62, %48 ]
  tail call void @simPutPixel(i32 noundef %49, i32 noundef %51, i32 noundef -1) #3
  %52 = tail call i32 (...) @simRand() #3
  %53 = srem i32 %52, 3
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [3 x i32], [3 x i32]* @__const.app.p_x, i64 0, i64 %54
  %56 = load i32, i32* %55, align 4, !tbaa !7
  %57 = add nsw i32 %56, %49
  %58 = sdiv i32 %57, 2
  %59 = getelementptr inbounds [3 x i32], [3 x i32]* @__const.app.p_y, i64 0, i64 %54
  %60 = load i32, i32* %59, align 4, !tbaa !7
  %61 = add nsw i32 %60, %51
  %62 = sdiv i32 %61, 2
  tail call void @simPutPixel(i32 noundef %58, i32 noundef %62, i32 noundef -65536) #3
  tail call void (...) @simFlush() #3
  %63 = add nuw nsw i32 %50, 1
  %64 = icmp eq i32 %63, 5000
  br i1 %64, label %24, label %48, !llvm.loop !11
}

declare i32 @simRand(...) local_unnamed_addr #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = distinct !{!11, !6}

; ModuleID = 'PHINodeSearcher.cpp'
source_filename = "PHINodeSearcher.cpp"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.29.30038"

; Function Attrs: nounwind uwtable mustprogress
define dso_local i32 @"?testAbs@@YAHH@Z"(i32 %0) #0 !dbg !8 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !14
  call void @llvm.dbg.declare(metadata i32* %2, metadata !13, metadata !DIExpression()), !dbg !18
  %3 = load i32, i32* %2, align 4, !dbg !19, !tbaa !14
  %4 = icmp slt i32 %3, 0, !dbg !20
  br i1 %4, label %5, label %8, !dbg !19

5:                                                ; preds = %1
  %6 = load i32, i32* %2, align 4, !dbg !21, !tbaa !14
  %7 = sub nsw i32 0, %6, !dbg !22
  br label %10, !dbg !19

8:                                                ; preds = %1
  %9 = load i32, i32* %2, align 4, !dbg !23, !tbaa !14
  br label %10, !dbg !19

10:                                               ; preds = %8, %5
  %11 = phi i32 [ %7, %5 ], [ %9, %8 ], !dbg !19
  ret i32 %11, !dbg !24
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable mustprogress
define dso_local i32 @"?testMin@@YAHHH@Z"(i32 %0, i32 %1) #0 !dbg !25 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %1, i32* %3, align 4, !tbaa !14
  call void @llvm.dbg.declare(metadata i32* %3, metadata !29, metadata !DIExpression()), !dbg !31
  store i32 %0, i32* %4, align 4, !tbaa !14
  call void @llvm.dbg.declare(metadata i32* %4, metadata !30, metadata !DIExpression()), !dbg !32
  %5 = load i32, i32* %3, align 4, !dbg !33, !tbaa !14
  %6 = load i32, i32* %4, align 4, !dbg !34, !tbaa !14
  %7 = icmp slt i32 %5, %6, !dbg !35
  br i1 %7, label %8, label %10, !dbg !33

8:                                                ; preds = %2
  %9 = load i32, i32* %3, align 4, !dbg !36, !tbaa !14
  br label %12, !dbg !33

10:                                               ; preds = %2
  %11 = load i32, i32* %4, align 4, !dbg !37, !tbaa !14
  br label %12, !dbg !33

12:                                               ; preds = %10, %8
  %13 = phi i32 [ %9, %8 ], [ %11, %10 ], !dbg !33
  ret i32 %13, !dbg !38
}

; Function Attrs: nounwind uwtable mustprogress
define dso_local i32 @"?testBoolNegate@@YAHH@Z"(i32 %0) #0 !dbg !39 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !14
  call void @llvm.dbg.declare(metadata i32* %2, metadata !41, metadata !DIExpression()), !dbg !43
  %4 = bitcast i32* %3 to i8*, !dbg !44
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #4, !dbg !44
  call void @llvm.dbg.declare(metadata i32* %3, metadata !42, metadata !DIExpression()), !dbg !45
  store i32 1, i32* %3, align 4, !dbg !45, !tbaa !14
  %5 = load i32, i32* %2, align 4, !dbg !46, !tbaa !14
  %6 = icmp ne i32 %5, 0, !dbg !46
  br i1 %6, label %7, label %8, !dbg !46

7:                                                ; preds = %1
  br label %10, !dbg !46

8:                                                ; preds = %1
  %9 = load i32, i32* %3, align 4, !dbg !47, !tbaa !14
  br label %10, !dbg !46

10:                                               ; preds = %8, %7
  %11 = phi i32 [ 0, %7 ], [ %9, %8 ], !dbg !46
  %12 = bitcast i32* %3 to i8*, !dbg !48
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %12) #4, !dbg !48
  ret i32 %11, !dbg !49
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable mustprogress
define dso_local i32 @"?testChaos@@YAHHH_N@Z"(i32 %0, i32 %1, i1 zeroext %2) #0 !dbg !50 {
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = zext i1 %2 to i8
  store i8 %8, i8* %5, align 1, !tbaa !58
  call void @llvm.dbg.declare(metadata i8* %5, metadata !55, metadata !DIExpression()), !dbg !60
  store i32 %1, i32* %6, align 4, !tbaa !14
  call void @llvm.dbg.declare(metadata i32* %6, metadata !56, metadata !DIExpression()), !dbg !61
  store i32 %0, i32* %7, align 4, !tbaa !14
  call void @llvm.dbg.declare(metadata i32* %7, metadata !57, metadata !DIExpression()), !dbg !62
  %9 = load i8, i8* %5, align 1, !dbg !63, !tbaa !58, !range !65
  %10 = trunc i8 %9 to i1, !dbg !63
  br i1 %10, label %11, label %21, !dbg !66

11:                                               ; preds = %3
  %12 = load i32, i32* %7, align 4, !dbg !67, !tbaa !14
  %13 = load i32, i32* %6, align 4, !dbg !69, !tbaa !14
  %14 = icmp slt i32 %12, %13, !dbg !70
  br i1 %14, label %15, label %17, !dbg !67

15:                                               ; preds = %11
  %16 = load i32, i32* %7, align 4, !dbg !71, !tbaa !14
  br label %19, !dbg !67

17:                                               ; preds = %11
  %18 = load i32, i32* %6, align 4, !dbg !72, !tbaa !14
  br label %19, !dbg !67

19:                                               ; preds = %17, %15
  %20 = phi i32 [ %16, %15 ], [ %18, %17 ], !dbg !67
  store i32 %20, i32* %4, align 4, !dbg !73
  br label %31, !dbg !73

21:                                               ; preds = %3
  %22 = load i32, i32* %7, align 4, !dbg !74, !tbaa !14
  %23 = load i32, i32* %6, align 4, !dbg !76, !tbaa !14
  %24 = icmp sgt i32 %22, %23, !dbg !77
  br i1 %24, label %25, label %27, !dbg !74

25:                                               ; preds = %21
  %26 = load i32, i32* %7, align 4, !dbg !78, !tbaa !14
  br label %29, !dbg !74

27:                                               ; preds = %21
  %28 = load i32, i32* %6, align 4, !dbg !79, !tbaa !14
  br label %29, !dbg !74

29:                                               ; preds = %27, %25
  %30 = phi i32 [ %26, %25 ], [ %28, %27 ], !dbg !74
  store i32 %30, i32* %4, align 4, !dbg !80
  br label %31, !dbg !80

31:                                               ; preds = %29, %19
  %32 = load i32, i32* %4, align 4, !dbg !81
  ret i32 %32, !dbg !81
}

; Function Attrs: norecurse nounwind uwtable mustprogress
define dso_local i32 @main() #3 !dbg !82 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = bitcast i32* %1 to i8*, !dbg !90
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #4, !dbg !90
  call void @llvm.dbg.declare(metadata i32* %1, metadata !86, metadata !DIExpression()), !dbg !91
  %6 = call i32 @"?testAbs@@YAHH@Z"(i32 3), !dbg !92
  store i32 %6, i32* %1, align 4, !dbg !91, !tbaa !14
  %7 = bitcast i32* %2 to i8*, !dbg !93
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #4, !dbg !93
  call void @llvm.dbg.declare(metadata i32* %2, metadata !87, metadata !DIExpression()), !dbg !94
  %8 = call i32 @"?testAbs@@YAHH@Z"(i32 -4), !dbg !95
  store i32 %8, i32* %2, align 4, !dbg !94, !tbaa !14
  %9 = bitcast i32* %3 to i8*, !dbg !96
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #4, !dbg !96
  call void @llvm.dbg.declare(metadata i32* %3, metadata !88, metadata !DIExpression()), !dbg !97
  %10 = load i32, i32* %2, align 4, !dbg !98, !tbaa !14
  %11 = load i32, i32* %1, align 4, !dbg !99, !tbaa !14
  %12 = call i32 @"?testMin@@YAHHH@Z"(i32 %11, i32 %10), !dbg !100
  store i32 %12, i32* %3, align 4, !dbg !97, !tbaa !14
  %13 = bitcast i32* %4 to i8*, !dbg !101
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %13) #4, !dbg !101
  call void @llvm.dbg.declare(metadata i32* %4, metadata !89, metadata !DIExpression()), !dbg !102
  %14 = call i32 @"?testBoolNegate@@YAHH@Z"(i32 1), !dbg !103
  store i32 %14, i32* %4, align 4, !dbg !102, !tbaa !14
  %15 = bitcast i32* %4 to i8*, !dbg !104
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #4, !dbg !104
  %16 = bitcast i32* %3 to i8*, !dbg !104
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %16) #4, !dbg !104
  %17 = bitcast i32* %2 to i8*, !dbg !104
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #4, !dbg !104
  %18 = bitcast i32* %1 to i8*, !dbg !104
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %18) #4, !dbg !104
  ret i32 0, !dbg !104
}

attributes #0 = { nounwind uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nosync nounwind willreturn }
attributes #3 = { norecurse nounwind uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "clang version 12.0.0", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "PHINodeSearcher.cpp", directory: "E:\\Documents\\Work Stuff\\Active Work Files\\Code Examples\\test_cpp01", checksumkind: CSK_MD5, checksum: "cad296d13afdb272bfda80e11c16103a")
!2 = !{}
!3 = !{i32 2, !"CodeView", i32 1}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 2}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{!"clang version 12.0.0"}
!8 = distinct !DISubprogram(name: "testAbs", linkageName: "?testAbs@@YAHH@Z", scope: !1, file: !1, line: 1, type: !9, scopeLine: 1, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !12)
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{!13}
!13 = !DILocalVariable(name: "a", arg: 1, scope: !8, file: !1, line: 1, type: !11)
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C++ TBAA"}
!18 = !DILocation(line: 1, column: 17, scope: !8)
!19 = !DILocation(line: 2, column: 9, scope: !8)
!20 = !DILocation(line: 2, column: 11, scope: !8)
!21 = !DILocation(line: 2, column: 18, scope: !8)
!22 = !DILocation(line: 2, column: 17, scope: !8)
!23 = !DILocation(line: 2, column: 22, scope: !8)
!24 = !DILocation(line: 2, column: 2, scope: !8)
!25 = distinct !DISubprogram(name: "testMin", linkageName: "?testMin@@YAHHH@Z", scope: !1, file: !1, line: 5, type: !26, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !28)
!26 = !DISubroutineType(types: !27)
!27 = !{!11, !11, !11}
!28 = !{!29, !30}
!29 = !DILocalVariable(name: "n", arg: 2, scope: !25, file: !1, line: 5, type: !11)
!30 = !DILocalVariable(name: "m", arg: 1, scope: !25, file: !1, line: 5, type: !11)
!31 = !DILocation(line: 5, column: 24, scope: !25)
!32 = !DILocation(line: 5, column: 17, scope: !25)
!33 = !DILocation(line: 6, column: 9, scope: !25)
!34 = !DILocation(line: 6, column: 13, scope: !25)
!35 = !DILocation(line: 6, column: 11, scope: !25)
!36 = !DILocation(line: 6, column: 17, scope: !25)
!37 = !DILocation(line: 6, column: 21, scope: !25)
!38 = !DILocation(line: 6, column: 2, scope: !25)
!39 = distinct !DISubprogram(name: "testBoolNegate", linkageName: "?testBoolNegate@@YAHH@Z", scope: !1, file: !1, line: 9, type: !9, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !40)
!40 = !{!41, !42}
!41 = !DILocalVariable(name: "f", arg: 1, scope: !39, file: !1, line: 9, type: !11)
!42 = !DILocalVariable(name: "g", scope: !39, file: !1, line: 10, type: !11)
!43 = !DILocation(line: 9, column: 24, scope: !39)
!44 = !DILocation(line: 10, column: 2, scope: !39)
!45 = !DILocation(line: 10, column: 6, scope: !39)
!46 = !DILocation(line: 11, column: 9, scope: !39)
!47 = !DILocation(line: 11, column: 17, scope: !39)
!48 = !DILocation(line: 12, column: 1, scope: !39)
!49 = !DILocation(line: 11, column: 2, scope: !39)
!50 = distinct !DISubprogram(name: "testChaos", linkageName: "?testChaos@@YAHHH_N@Z", scope: !1, file: !1, line: 14, type: !51, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !54)
!51 = !DISubroutineType(types: !52)
!52 = !{!11, !11, !11, !53}
!53 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!54 = !{!55, !56, !57}
!55 = !DILocalVariable(name: "flip", arg: 3, scope: !50, file: !1, line: 14, type: !53)
!56 = !DILocalVariable(name: "q", arg: 2, scope: !50, file: !1, line: 14, type: !11)
!57 = !DILocalVariable(name: "p", arg: 1, scope: !50, file: !1, line: 14, type: !11)
!58 = !{!59, !59, i64 0}
!59 = !{!"bool", !16, i64 0}
!60 = !DILocation(line: 14, column: 34, scope: !50)
!61 = !DILocation(line: 14, column: 26, scope: !50)
!62 = !DILocation(line: 14, column: 19, scope: !50)
!63 = !DILocation(line: 15, column: 6, scope: !64)
!64 = distinct !DILexicalBlock(scope: !50, file: !1, line: 15, column: 6)
!65 = !{i8 0, i8 2}
!66 = !DILocation(line: 15, column: 6, scope: !50)
!67 = !DILocation(line: 16, column: 10, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !1, line: 15, column: 11)
!69 = !DILocation(line: 16, column: 14, scope: !68)
!70 = !DILocation(line: 16, column: 12, scope: !68)
!71 = !DILocation(line: 16, column: 18, scope: !68)
!72 = !DILocation(line: 16, column: 22, scope: !68)
!73 = !DILocation(line: 16, column: 3, scope: !68)
!74 = !DILocation(line: 18, column: 10, scope: !75)
!75 = distinct !DILexicalBlock(scope: !64, file: !1, line: 17, column: 9)
!76 = !DILocation(line: 18, column: 14, scope: !75)
!77 = !DILocation(line: 18, column: 12, scope: !75)
!78 = !DILocation(line: 18, column: 18, scope: !75)
!79 = !DILocation(line: 18, column: 22, scope: !75)
!80 = !DILocation(line: 18, column: 3, scope: !75)
!81 = !DILocation(line: 20, column: 1, scope: !50)
!82 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 22, type: !83, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !85)
!83 = !DISubroutineType(types: !84)
!84 = !{!11}
!85 = !{!86, !87, !88, !89}
!86 = !DILocalVariable(name: "z", scope: !82, file: !1, line: 23, type: !11)
!87 = !DILocalVariable(name: "y", scope: !82, file: !1, line: 24, type: !11)
!88 = !DILocalVariable(name: "x", scope: !82, file: !1, line: 25, type: !11)
!89 = !DILocalVariable(name: "w", scope: !82, file: !1, line: 26, type: !11)
!90 = !DILocation(line: 23, column: 2, scope: !82)
!91 = !DILocation(line: 23, column: 6, scope: !82)
!92 = !DILocation(line: 23, column: 10, scope: !82)
!93 = !DILocation(line: 24, column: 2, scope: !82)
!94 = !DILocation(line: 24, column: 6, scope: !82)
!95 = !DILocation(line: 24, column: 10, scope: !82)
!96 = !DILocation(line: 25, column: 2, scope: !82)
!97 = !DILocation(line: 25, column: 6, scope: !82)
!98 = !DILocation(line: 25, column: 20, scope: !82)
!99 = !DILocation(line: 25, column: 18, scope: !82)
!100 = !DILocation(line: 25, column: 10, scope: !82)
!101 = !DILocation(line: 26, column: 2, scope: !82)
!102 = !DILocation(line: 26, column: 6, scope: !82)
!103 = !DILocation(line: 26, column: 10, scope: !82)
!104 = !DILocation(line: 27, column: 1, scope: !82)

; ModuleID = 'whileNest.cpp'
source_filename = "whileNest.cpp"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.29.30038"

; Function Attrs: norecurse nounwind uwtable mustprogress
define dso_local i32 @main() #0 !dbg !8 {
  %1 = alloca i32, align 4
  %2 = alloca i8, align 1
  store i32 0, i32* %1, align 4
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %2) #3, !dbg !15
  call void @llvm.dbg.declare(metadata i8* %2, metadata !13, metadata !DIExpression()), !dbg !16
  store i8 1, i8* %2, align 1, !dbg !16, !tbaa !17
  br label %3, !dbg !21

3:                                                ; preds = %17, %0
  %4 = load i8, i8* %2, align 1, !dbg !22, !tbaa !17, !range !23
  %5 = trunc i8 %4 to i1, !dbg !22
  br i1 %5, label %6, label %18, !dbg !21

6:                                                ; preds = %3
  br label %7, !dbg !24

7:                                                ; preds = %16, %6
  %8 = load i8, i8* %2, align 1, !dbg !26, !tbaa !17, !range !23
  %9 = trunc i8 %8 to i1, !dbg !26
  br i1 %9, label %10, label %17, !dbg !24

10:                                               ; preds = %7
  br label %11, !dbg !27

11:                                               ; preds = %15, %10
  %12 = load i8, i8* %2, align 1, !dbg !29, !tbaa !17, !range !23
  %13 = trunc i8 %12 to i1, !dbg !29
  %14 = xor i1 %13, true, !dbg !30
  br i1 %14, label %15, label %16, !dbg !27

15:                                               ; preds = %11
  store i8 0, i8* %2, align 1, !dbg !31, !tbaa !17
  br label %11, !dbg !27, !llvm.loop !33

16:                                               ; preds = %11
  br label %7, !dbg !24, !llvm.loop !36

17:                                               ; preds = %7
  br label %3, !dbg !21, !llvm.loop !38

18:                                               ; preds = %3
  store i8 1, i8* %2, align 1, !dbg !40, !tbaa !17
  br label %19, !dbg !41

19:                                               ; preds = %30, %18
  br label %20, !dbg !42

20:                                               ; preds = %26, %19
  br label %21, !dbg !44

21:                                               ; preds = %22, %20
  store i8 0, i8* %2, align 1, !dbg !46, !tbaa !17
  br label %22, !dbg !48

22:                                               ; preds = %21
  %23 = load i8, i8* %2, align 1, !dbg !49, !tbaa !17, !range !23
  %24 = trunc i8 %23 to i1, !dbg !49
  br i1 %24, label %21, label %25, !dbg !48, !llvm.loop !50

25:                                               ; preds = %22
  br label %26, !dbg !52

26:                                               ; preds = %25
  %27 = load i8, i8* %2, align 1, !dbg !53, !tbaa !17, !range !23
  %28 = trunc i8 %27 to i1, !dbg !53
  br i1 %28, label %20, label %29, !dbg !52, !llvm.loop !54

29:                                               ; preds = %26
  br label %30, !dbg !56

30:                                               ; preds = %29
  %31 = load i8, i8* %2, align 1, !dbg !57, !tbaa !17, !range !23
  %32 = trunc i8 %31 to i1, !dbg !57
  %33 = xor i1 %32, true, !dbg !58
  br i1 %33, label %19, label %34, !dbg !56, !llvm.loop !59

34:                                               ; preds = %30
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %2) #3, !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { norecurse nounwind uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "clang version 12.0.0", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "whileNest.cpp", directory: "E:\\Documents\\Work Stuff\\Active Work Files\\Code Examples\\test_cpp01", checksumkind: CSK_MD5, checksum: "3a9bc3655ed8e271f62659a938e5c2da")
!2 = !{}
!3 = !{i32 2, !"CodeView", i32 1}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 2}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{!"clang version 12.0.0"}
!8 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 1, type: !9, scopeLine: 1, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !12)
!9 = !DISubroutineType(types: !10)
!10 = !{!11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{!13}
!13 = !DILocalVariable(name: "x", scope: !8, file: !1, line: 2, type: !14)
!14 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!15 = !DILocation(line: 2, column: 2, scope: !8)
!16 = !DILocation(line: 2, column: 7, scope: !8)
!17 = !{!18, !18, i64 0}
!18 = !{!"bool", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = !DILocation(line: 3, column: 2, scope: !8)
!22 = !DILocation(line: 3, column: 8, scope: !8)
!23 = !{i8 0, i8 2}
!24 = !DILocation(line: 4, column: 3, scope: !25)
!25 = distinct !DILexicalBlock(scope: !8, file: !1, line: 3, column: 10)
!26 = !DILocation(line: 4, column: 9, scope: !25)
!27 = !DILocation(line: 5, column: 4, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !1, line: 4, column: 11)
!29 = !DILocation(line: 5, column: 11, scope: !28)
!30 = !DILocation(line: 5, column: 10, scope: !28)
!31 = !DILocation(line: 6, column: 7, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !1, line: 5, column: 13)
!33 = distinct !{!33, !27, !34, !35}
!34 = !DILocation(line: 7, column: 4, scope: !28)
!35 = !{!"llvm.loop.mustprogress"}
!36 = distinct !{!36, !24, !37, !35}
!37 = !DILocation(line: 8, column: 3, scope: !25)
!38 = distinct !{!38, !21, !39, !35}
!39 = !DILocation(line: 9, column: 2, scope: !8)
!40 = !DILocation(line: 11, column: 4, scope: !8)
!41 = !DILocation(line: 12, column: 2, scope: !8)
!42 = !DILocation(line: 13, column: 3, scope: !43)
!43 = distinct !DILexicalBlock(scope: !8, file: !1, line: 12, column: 4)
!44 = !DILocation(line: 14, column: 4, scope: !45)
!45 = distinct !DILexicalBlock(scope: !43, file: !1, line: 13, column: 5)
!46 = !DILocation(line: 15, column: 6, scope: !47)
!47 = distinct !DILexicalBlock(scope: !45, file: !1, line: 14, column: 6)
!48 = !DILocation(line: 16, column: 4, scope: !47)
!49 = !DILocation(line: 16, column: 11, scope: !45)
!50 = distinct !{!50, !44, !51, !35}
!51 = !DILocation(line: 16, column: 12, scope: !45)
!52 = !DILocation(line: 17, column: 3, scope: !45)
!53 = !DILocation(line: 17, column: 10, scope: !43)
!54 = distinct !{!54, !42, !55, !35}
!55 = !DILocation(line: 17, column: 11, scope: !43)
!56 = !DILocation(line: 18, column: 2, scope: !43)
!57 = !DILocation(line: 18, column: 10, scope: !8)
!58 = !DILocation(line: 18, column: 9, scope: !8)
!59 = distinct !{!59, !41, !60, !35}
!60 = !DILocation(line: 18, column: 11, scope: !8)
!61 = !DILocation(line: 21, column: 1, scope: !8)
!62 = !DILocation(line: 20, column: 2, scope: !8)

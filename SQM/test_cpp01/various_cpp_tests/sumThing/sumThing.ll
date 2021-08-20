; ModuleID = 'sumThing.cpp'
source_filename = "sumThing.cpp"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.29.30038"

; Function Attrs: nounwind uwtable mustprogress
define dso_local i32 @"?checker@@YAH_NH@Z"(i1 zeroext %0, i32 %1) #0 !dbg !8 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  store i32 %1, i32* %4, align 4, !tbaa !16
  call void @llvm.dbg.declare(metadata i32* %4, metadata !14, metadata !DIExpression()), !dbg !20
  %6 = zext i1 %0 to i8
  store i8 %6, i8* %5, align 1, !tbaa !21
  call void @llvm.dbg.declare(metadata i8* %5, metadata !15, metadata !DIExpression()), !dbg !23
  %7 = load i8, i8* %5, align 1, !dbg !24, !tbaa !21, !range !26
  %8 = trunc i8 %7 to i1, !dbg !24
  br i1 %8, label %9, label %13, !dbg !27

9:                                                ; preds = %2
  %10 = load i32, i32* %4, align 4, !dbg !28, !tbaa !16
  %11 = add nsw i32 %10, 32, !dbg !30
  %12 = add nsw i32 %11, 256, !dbg !31
  store i32 %12, i32* %3, align 4, !dbg !32
  br label %16, !dbg !32

13:                                               ; preds = %2
  %14 = load i32, i32* %4, align 4, !dbg !33, !tbaa !16
  %15 = add nsw i32 %14, 288, !dbg !35
  store i32 %15, i32* %3, align 4, !dbg !36
  br label %16, !dbg !36

16:                                               ; preds = %13, %9
  %17 = load i32, i32* %3, align 4, !dbg !37
  ret i32 %17, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: norecurse nounwind uwtable mustprogress
define dso_local i32 @main() #2 !dbg !38 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  ret i32 0, !dbg !41
}

attributes #0 = { nounwind uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { norecurse nounwind uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "clang version 12.0.0", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "sumThing.cpp", directory: "E:\\Documents\\Work Stuff\\Active Work Files\\Code Examples\\test_cpp01", checksumkind: CSK_MD5, checksum: "682d129db28d8ce92811d655a3c67a6b")
!2 = !{}
!3 = !{i32 2, !"CodeView", i32 1}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 2}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{!"clang version 12.0.0"}
!8 = distinct !DISubprogram(name: "checker", linkageName: "?checker@@YAH_NH@Z", scope: !1, file: !1, line: 1, type: !9, scopeLine: 1, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !13)
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !12, !11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!13 = !{!14, !15}
!14 = !DILocalVariable(name: "gamma", arg: 2, scope: !8, file: !1, line: 1, type: !11)
!15 = !DILocalVariable(name: "q", arg: 1, scope: !8, file: !1, line: 1, type: !12)
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !DILocation(line: 1, column: 25, scope: !8)
!21 = !{!22, !22, i64 0}
!22 = !{!"bool", !18, i64 0}
!23 = !DILocation(line: 1, column: 18, scope: !8)
!24 = !DILocation(line: 2, column: 6, scope: !25)
!25 = distinct !DILexicalBlock(scope: !8, file: !1, line: 2, column: 6)
!26 = !{i8 0, i8 2}
!27 = !DILocation(line: 2, column: 6, scope: !8)
!28 = !DILocation(line: 3, column: 10, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !1, line: 2, column: 9)
!30 = !DILocation(line: 3, column: 16, scope: !29)
!31 = !DILocation(line: 3, column: 21, scope: !29)
!32 = !DILocation(line: 3, column: 3, scope: !29)
!33 = !DILocation(line: 5, column: 10, scope: !34)
!34 = distinct !DILexicalBlock(scope: !25, file: !1, line: 4, column: 9)
!35 = !DILocation(line: 5, column: 16, scope: !34)
!36 = !DILocation(line: 5, column: 3, scope: !34)
!37 = !DILocation(line: 7, column: 1, scope: !8)
!38 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 9, type: !39, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{!11}
!41 = !DILocation(line: 11, column: 2, scope: !38)

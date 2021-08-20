; ModuleID = 'oneLiner.cpp'
source_filename = "oneLiner.cpp"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.29.30037"

; Function Attrs: norecurse nounwind uwtable mustprogress
define dso_local i32 @main() #0 !dbg !8 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %3 = bitcast i32* %2 to i8*, !dbg !14
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #3, !dbg !14
  call void @llvm.dbg.declare(metadata i32* %2, metadata !13, metadata !DIExpression()), !dbg !15
  store i32 0, i32* %2, align 4, !dbg !15, !tbaa !16
  %4 = load i32, i32* %2, align 4, !dbg !20, !tbaa !16
  %5 = icmp ne i32 %4, 0, !dbg !22
  br i1 %5, label %6, label %7, !dbg !23

6:                                                ; preds = %0
  store i32 0, i32* %2, align 4, !dbg !24, !tbaa !16
  br label %8, !dbg !26

7:                                                ; preds = %0
  store i32 1, i32* %2, align 4, !dbg !27, !tbaa !16
  br label %8

8:                                                ; preds = %7, %6
  %9 = bitcast i32* %2 to i8*, !dbg !29
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #3, !dbg !29
  ret i32 0, !dbg !30
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
!1 = !DIFile(filename: "oneLiner.cpp", directory: "E:\\Documents\\Work Stuff\\Active Work Files\\Code Examples\\test_cpp01", checksumkind: CSK_MD5, checksum: "52c8f68fcc8498840d6fa9b485a696a1")
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
!13 = !DILocalVariable(name: "x", scope: !8, file: !1, line: 1, type: !11)
!14 = !DILocation(line: 1, column: 12, scope: !8)
!15 = !DILocation(line: 1, column: 16, scope: !8)
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !DILocation(line: 1, column: 27, scope: !21)
!21 = distinct !DILexicalBlock(scope: !8, file: !1, line: 1, column: 27)
!22 = !DILocation(line: 1, column: 28, scope: !21)
!23 = !DILocation(line: 1, column: 27, scope: !8)
!24 = !DILocation(line: 1, column: 34, scope: !25)
!25 = distinct !DILexicalBlock(scope: !21, file: !1, line: 1, column: 32)
!26 = !DILocation(line: 1, column: 37, scope: !25)
!27 = !DILocation(line: 1, column: 44, scope: !28)
!28 = distinct !DILexicalBlock(scope: !21, file: !1, line: 1, column: 42)
!29 = !DILocation(line: 1, column: 57, scope: !8)
!30 = !DILocation(line: 1, column: 48, scope: !8)

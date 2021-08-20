; ModuleID = 'inlineTest.cpp'
source_filename = "inlineTest.cpp"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.29.30038"

$"?sum@@YAHHH@Z" = comdat any

; Function Attrs: norecurse uwtable mustprogress
define dso_local i32 @main() #0 !dbg !8 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %4 = bitcast i32* %2 to i8*, !dbg !15
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #4, !dbg !15
  call void @llvm.dbg.declare(metadata i32* %2, metadata !13, metadata !DIExpression()), !dbg !16
  store i32 2, i32* %2, align 4, !dbg !16, !tbaa !17
  %5 = bitcast i32* %3 to i8*, !dbg !21
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #4, !dbg !21
  call void @llvm.dbg.declare(metadata i32* %3, metadata !14, metadata !DIExpression()), !dbg !22
  store i32 3, i32* %3, align 4, !dbg !22, !tbaa !17
  %6 = load i32, i32* %3, align 4, !dbg !23, !tbaa !17
  %7 = load i32, i32* %2, align 4, !dbg !24, !tbaa !17
  %8 = call i32 @"?sum@@YAHHH@Z"(i32 %7, i32 %6), !dbg !25
  %9 = bitcast i32* %3 to i8*, !dbg !26
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #4, !dbg !26
  %10 = bitcast i32* %2 to i8*, !dbg !26
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %10) #4, !dbg !26
  ret i32 0, !dbg !27
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local i32 @"?sum@@YAHHH@Z"(i32 %0, i32 %1) #3 comdat !dbg !28 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %1, i32* %3, align 4, !tbaa !17
  call void @llvm.dbg.declare(metadata i32* %3, metadata !32, metadata !DIExpression()), !dbg !34
  store i32 %0, i32* %4, align 4, !tbaa !17
  call void @llvm.dbg.declare(metadata i32* %4, metadata !33, metadata !DIExpression()), !dbg !35
  %5 = load i32, i32* %4, align 4, !dbg !36, !tbaa !17
  %6 = load i32, i32* %3, align 4, !dbg !37, !tbaa !17
  %7 = add nsw i32 %5, %6, !dbg !38
  ret i32 %7, !dbg !39
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { norecurse uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { inlinehint nounwind uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "clang version 12.0.0", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "inlineTest.cpp", directory: "E:\\Documents\\Work Stuff\\Active Work Files\\Code Examples\\test_cpp01", checksumkind: CSK_MD5, checksum: "7a2d997c306111b9952423e00d854e66")
!2 = !{}
!3 = !{i32 2, !"CodeView", i32 1}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 2}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{!"clang version 12.0.0"}
!8 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 5, type: !9, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !12)
!9 = !DISubroutineType(types: !10)
!10 = !{!11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{!13, !14}
!13 = !DILocalVariable(name: "q", scope: !8, file: !1, line: 6, type: !11)
!14 = !DILocalVariable(name: "p", scope: !8, file: !1, line: 7, type: !11)
!15 = !DILocation(line: 6, column: 2, scope: !8)
!16 = !DILocation(line: 6, column: 6, scope: !8)
!17 = !{!18, !18, i64 0}
!18 = !{!"int", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = !DILocation(line: 7, column: 2, scope: !8)
!22 = !DILocation(line: 7, column: 6, scope: !8)
!23 = !DILocation(line: 8, column: 8, scope: !8)
!24 = !DILocation(line: 8, column: 6, scope: !8)
!25 = !DILocation(line: 8, column: 2, scope: !8)
!26 = !DILocation(line: 10, column: 1, scope: !8)
!27 = !DILocation(line: 9, column: 2, scope: !8)
!28 = distinct !DISubprogram(name: "sum", linkageName: "?sum@@YAHHH@Z", scope: !1, file: !1, line: 1, type: !29, scopeLine: 1, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !31)
!29 = !DISubroutineType(types: !30)
!30 = !{!11, !11, !11}
!31 = !{!32, !33}
!32 = !DILocalVariable(name: "b", arg: 2, scope: !28, file: !1, line: 1, type: !11)
!33 = !DILocalVariable(name: "a", arg: 1, scope: !28, file: !1, line: 1, type: !11)
!34 = !DILocation(line: 1, column: 27, scope: !28)
!35 = !DILocation(line: 1, column: 20, scope: !28)
!36 = !DILocation(line: 2, column: 9, scope: !28)
!37 = !DILocation(line: 2, column: 13, scope: !28)
!38 = !DILocation(line: 2, column: 11, scope: !28)
!39 = !DILocation(line: 2, column: 2, scope: !28)

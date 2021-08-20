; ModuleID = 'FunctionCmpInstStore.cpp'
source_filename = "FunctionCmpInstStore.cpp"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.29.30038"

; Function Attrs: nounwind uwtable mustprogress
define dso_local i32 @"?returnsOne@@YAHXZ"() #0 !dbg !8 {
  ret i32 1, !dbg !12
}

; Function Attrs: norecurse nounwind uwtable mustprogress
define dso_local i32 @main() #1 !dbg !13 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8, align 1
  store i32 0, i32* %1, align 4
  %4 = bitcast i32* %2 to i8*, !dbg !18
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #4, !dbg !18
  call void @llvm.dbg.declare(metadata i32* %2, metadata !15, metadata !DIExpression()), !dbg !19
  store i32 10, i32* %2, align 4, !dbg !19, !tbaa !20
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %3) #4, !dbg !24
  call void @llvm.dbg.declare(metadata i8* %3, metadata !16, metadata !DIExpression()), !dbg !25
  %5 = load i32, i32* %2, align 4, !dbg !26, !tbaa !20
  %6 = call i32 @"?returnsOne@@YAHXZ"(), !dbg !27
  %7 = icmp slt i32 %5, %6, !dbg !28
  %8 = zext i1 %7 to i8, !dbg !25
  store i8 %8, i8* %3, align 1, !dbg !25, !tbaa !29
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %3) #4, !dbg !31
  %9 = bitcast i32* %2 to i8*, !dbg !31
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #4, !dbg !31
  ret i32 0, !dbg !32
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #3

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

attributes #0 = { nounwind uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { norecurse nounwind uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nofree nosync nounwind willreturn }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "clang version 12.0.0", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "FunctionCmpInstStore.cpp", directory: "E:\\Documents\\Work Stuff\\Active Work Files\\Code Examples\\test_cpp01", checksumkind: CSK_MD5, checksum: "b69cbcd0474cbece693400c5bfe060d5")
!2 = !{}
!3 = !{i32 2, !"CodeView", i32 1}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 2}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{!"clang version 12.0.0"}
!8 = distinct !DISubprogram(name: "returnsOne", linkageName: "?returnsOne@@YAHXZ", scope: !1, file: !1, line: 1, type: !9, scopeLine: 1, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!9 = !DISubroutineType(types: !10)
!10 = !{!11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocation(line: 2, column: 2, scope: !8)
!13 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 5, type: !9, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !14)
!14 = !{!15, !16}
!15 = !DILocalVariable(name: "a", scope: !13, file: !1, line: 6, type: !11)
!16 = !DILocalVariable(name: "b", scope: !13, file: !1, line: 7, type: !17)
!17 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!18 = !DILocation(line: 6, column: 2, scope: !13)
!19 = !DILocation(line: 6, column: 6, scope: !13)
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !22, i64 0}
!22 = !{!"omnipotent char", !23, i64 0}
!23 = !{!"Simple C++ TBAA"}
!24 = !DILocation(line: 7, column: 2, scope: !13)
!25 = !DILocation(line: 7, column: 7, scope: !13)
!26 = !DILocation(line: 7, column: 11, scope: !13)
!27 = !DILocation(line: 7, column: 15, scope: !13)
!28 = !DILocation(line: 7, column: 13, scope: !13)
!29 = !{!30, !30, i64 0}
!30 = !{!"bool", !22, i64 0}
!31 = !DILocation(line: 9, column: 1, scope: !13)
!32 = !DILocation(line: 8, column: 2, scope: !13)

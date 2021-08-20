; ModuleID = 'ArrayGep.cpp'
source_filename = "ArrayGep.cpp"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.29.30038"

@__const.main.array = private unnamed_addr constant [3 x i32] [i32 1, i32 2, i32 3], align 4

; Function Attrs: norecurse nounwind uwtable mustprogress
define dso_local i32 @main() #0 !dbg !8 {
  %1 = alloca i32, align 4
  %2 = alloca [3 x i32], align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %4 = bitcast [3 x i32]* %2 to i8*, !dbg !18
  call void @llvm.lifetime.start.p0i8(i64 12, i8* %4) #3, !dbg !18
  call void @llvm.dbg.declare(metadata [3 x i32]* %2, metadata !13, metadata !DIExpression()), !dbg !19
  %5 = bitcast [3 x i32]* %2 to i8*, !dbg !19
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 4 bitcast ([3 x i32]* @__const.main.array to i8*), i64 12, i1 false), !dbg !19
  %6 = bitcast i32* %3 to i8*, !dbg !20
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #3, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %3, metadata !17, metadata !DIExpression()), !dbg !21
  %7 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !22
  %8 = load i32, i32* %7, align 4, !dbg !22, !tbaa !23
  store i32 %8, i32* %3, align 4, !dbg !21, !tbaa !23
  %9 = bitcast i32* %3 to i8*, !dbg !27
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #3, !dbg !27
  %10 = bitcast [3 x i32]* %2 to i8*, !dbg !27
  call void @llvm.lifetime.end.p0i8(i64 12, i8* %10) #3, !dbg !27
  ret i32 0, !dbg !28
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

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
!1 = !DIFile(filename: "ArrayGep.cpp", directory: "E:\\Documents\\Work Stuff\\Active Work Files\\Code Examples\\test_cpp01", checksumkind: CSK_MD5, checksum: "f93d01a6b5cffa754c3392de79c9e8bb")
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
!12 = !{!13, !17}
!13 = !DILocalVariable(name: "array", scope: !8, file: !1, line: 2, type: !14)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 96, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 3)
!17 = !DILocalVariable(name: "a", scope: !8, file: !1, line: 3, type: !11)
!18 = !DILocation(line: 2, column: 2, scope: !8)
!19 = !DILocation(line: 2, column: 6, scope: !8)
!20 = !DILocation(line: 3, column: 2, scope: !8)
!21 = !DILocation(line: 3, column: 6, scope: !8)
!22 = !DILocation(line: 3, column: 10, scope: !8)
!23 = !{!24, !24, i64 0}
!24 = !{!"int", !25, i64 0}
!25 = !{!"omnipotent char", !26, i64 0}
!26 = !{!"Simple C++ TBAA"}
!27 = !DILocation(line: 5, column: 1, scope: !8)
!28 = !DILocation(line: 4, column: 2, scope: !8)

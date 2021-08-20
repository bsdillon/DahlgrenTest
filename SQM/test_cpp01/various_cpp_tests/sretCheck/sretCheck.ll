; ModuleID = 'sretCheck.cpp'
source_filename = "sretCheck.cpp"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.29.30038"

%class.Point = type { i32, i32 }

$"?getY@Point@@QEAAHXZ" = comdat any

$"?getX@Point@@QEAAHXZ" = comdat any

$"??0Point@@QEAA@HH@Z" = comdat any

; Function Attrs: uwtable mustprogress
define dso_local void @"?calculateMidpoint@@YA?AVPoint@@V1@0@Z"(%class.Point* noalias sret(%class.Point) align 4 %0, i64 %1, i64 %2) #0 !dbg !8 {
  %4 = alloca i8*, align 8
  %5 = alloca %class.Point, align 4
  %6 = alloca %class.Point, align 4
  %7 = bitcast %class.Point* %0 to i8*
  store i8* %7, i8** %4, align 8
  %8 = bitcast %class.Point* %5 to i64*
  store i64 %1, i64* %8, align 4
  %9 = bitcast %class.Point* %6 to i64*
  store i64 %2, i64* %9, align 4
  call void @llvm.dbg.declare(metadata %class.Point* %6, metadata !25, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata %class.Point* %5, metadata !26, metadata !DIExpression()), !dbg !28
  %10 = call i32 @"?getY@Point@@QEAAHXZ"(%class.Point* nonnull dereferenceable(8) %5), !dbg !29
  %11 = call i32 @"?getY@Point@@QEAAHXZ"(%class.Point* nonnull dereferenceable(8) %6), !dbg !30
  %12 = add nsw i32 %10, %11, !dbg !31
  %13 = sdiv i32 %12, 2, !dbg !32
  %14 = call i32 @"?getX@Point@@QEAAHXZ"(%class.Point* nonnull dereferenceable(8) %5), !dbg !33
  %15 = call i32 @"?getX@Point@@QEAAHXZ"(%class.Point* nonnull dereferenceable(8) %6), !dbg !34
  %16 = add nsw i32 %14, %15, !dbg !35
  %17 = sdiv i32 %16, 2, !dbg !36
  %18 = call %class.Point* @"??0Point@@QEAA@HH@Z"(%class.Point* nonnull dereferenceable(8) %0, i32 %17, i32 %13), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i32 @"?getY@Point@@QEAAHXZ"(%class.Point* nonnull dereferenceable(8) %0) #2 comdat align 2 !dbg !39 {
  %2 = alloca %class.Point*, align 8
  store %class.Point* %0, %class.Point** %2, align 8, !tbaa !43
  call void @llvm.dbg.declare(metadata %class.Point** %2, metadata !41, metadata !DIExpression()), !dbg !47
  %3 = load %class.Point*, %class.Point** %2, align 8
  %4 = getelementptr inbounds %class.Point, %class.Point* %3, i32 0, i32 1, !dbg !48
  %5 = load i32, i32* %4, align 4, !dbg !48, !tbaa !49
  ret i32 %5, !dbg !52
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i32 @"?getX@Point@@QEAAHXZ"(%class.Point* nonnull dereferenceable(8) %0) #2 comdat align 2 !dbg !53 {
  %2 = alloca %class.Point*, align 8
  store %class.Point* %0, %class.Point** %2, align 8, !tbaa !43
  call void @llvm.dbg.declare(metadata %class.Point** %2, metadata !55, metadata !DIExpression()), !dbg !56
  %3 = load %class.Point*, %class.Point** %2, align 8
  %4 = getelementptr inbounds %class.Point, %class.Point* %3, i32 0, i32 0, !dbg !57
  %5 = load i32, i32* %4, align 4, !dbg !57, !tbaa !58
  ret i32 %5, !dbg !59
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local %class.Point* @"??0Point@@QEAA@HH@Z"(%class.Point* nonnull returned dereferenceable(8) %0, i32 %1, i32 %2) unnamed_addr #3 comdat align 2 !dbg !60 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %class.Point*, align 8
  store i32 %2, i32* %4, align 4, !tbaa !65
  call void @llvm.dbg.declare(metadata i32* %4, metadata !62, metadata !DIExpression()), !dbg !66
  store i32 %1, i32* %5, align 4, !tbaa !65
  call void @llvm.dbg.declare(metadata i32* %5, metadata !63, metadata !DIExpression()), !dbg !67
  store %class.Point* %0, %class.Point** %6, align 8, !tbaa !43
  call void @llvm.dbg.declare(metadata %class.Point** %6, metadata !64, metadata !DIExpression()), !dbg !68
  %7 = load %class.Point*, %class.Point** %6, align 8
  %8 = getelementptr inbounds %class.Point, %class.Point* %7, i32 0, i32 0, !dbg !69
  store i32 0, i32* %8, align 4, !dbg !69, !tbaa !58
  %9 = getelementptr inbounds %class.Point, %class.Point* %7, i32 0, i32 1, !dbg !70
  store i32 0, i32* %9, align 4, !dbg !70, !tbaa !49
  %10 = load i32, i32* %5, align 4, !dbg !71, !tbaa !65
  %11 = getelementptr inbounds %class.Point, %class.Point* %7, i32 0, i32 0, !dbg !73
  store i32 %10, i32* %11, align 4, !dbg !74, !tbaa !58
  %12 = load i32, i32* %4, align 4, !dbg !75, !tbaa !65
  %13 = getelementptr inbounds %class.Point, %class.Point* %7, i32 0, i32 1, !dbg !76
  store i32 %12, i32* %13, align 4, !dbg !77, !tbaa !49
  ret %class.Point* %7, !dbg !78
}

; Function Attrs: norecurse uwtable mustprogress
define dso_local i32 @main() #4 !dbg !79 {
  %1 = alloca i32, align 4
  %2 = alloca %class.Point, align 4
  %3 = alloca %class.Point, align 4
  %4 = alloca %class.Point, align 4
  %5 = alloca %class.Point, align 4
  %6 = alloca %class.Point, align 4
  store i32 0, i32* %1, align 4
  %7 = bitcast %class.Point* %2 to i8*, !dbg !86
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #6, !dbg !86
  call void @llvm.dbg.declare(metadata %class.Point* %2, metadata !83, metadata !DIExpression()), !dbg !87
  %8 = call %class.Point* @"??0Point@@QEAA@HH@Z"(%class.Point* nonnull dereferenceable(8) %2, i32 0, i32 0), !dbg !88
  %9 = bitcast %class.Point* %3 to i8*, !dbg !89
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %9) #6, !dbg !89
  call void @llvm.dbg.declare(metadata %class.Point* %3, metadata !84, metadata !DIExpression()), !dbg !90
  %10 = call %class.Point* @"??0Point@@QEAA@HH@Z"(%class.Point* nonnull dereferenceable(8) %3, i32 100, i32 100), !dbg !91
  %11 = bitcast %class.Point* %4 to i8*, !dbg !92
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %11) #6, !dbg !92
  call void @llvm.dbg.declare(metadata %class.Point* %4, metadata !85, metadata !DIExpression()), !dbg !93
  %12 = bitcast %class.Point* %5 to i8*, !dbg !94
  %13 = bitcast %class.Point* %3 to i8*, !dbg !94
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %12, i8* align 4 %13, i64 8, i1 false), !dbg !94, !tbaa.struct !95
  %14 = bitcast %class.Point* %6 to i8*, !dbg !96
  %15 = bitcast %class.Point* %2 to i8*, !dbg !96
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %14, i8* align 4 %15, i64 8, i1 false), !dbg !96, !tbaa.struct !95
  %16 = bitcast %class.Point* %6 to i64*, !dbg !97
  %17 = load i64, i64* %16, align 4, !dbg !97
  %18 = bitcast %class.Point* %5 to i64*, !dbg !97
  %19 = load i64, i64* %18, align 4, !dbg !97
  call void @"?calculateMidpoint@@YA?AVPoint@@V1@0@Z"(%class.Point* sret(%class.Point) align 4 %4, i64 %17, i64 %19), !dbg !97
  %20 = bitcast %class.Point* %4 to i8*, !dbg !98
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %20) #6, !dbg !98
  %21 = bitcast %class.Point* %3 to i8*, !dbg !98
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %21) #6, !dbg !98
  %22 = bitcast %class.Point* %2 to i8*, !dbg !98
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %22) #6, !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #5

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #5

attributes #0 = { uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nofree nosync nounwind willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "clang version 12.0.0", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "sretCheck.cpp", directory: "E:\\Documents\\Work Stuff\\Active Work Files\\Code Examples\\test_cpp01", checksumkind: CSK_MD5, checksum: "82cc1e29e342c9f16cc71757fc3ea3aa")
!2 = !{}
!3 = !{i32 2, !"CodeView", i32 1}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 2}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{!"clang version 12.0.0"}
!8 = distinct !DISubprogram(name: "calculateMidpoint", linkageName: "?calculateMidpoint@@YA?AVPoint@@V1@0@Z", scope: !1, file: !1, line: 14, type: !9, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !24)
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11, !11}
!11 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "Point", file: !1, line: 1, size: 64, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !12, identifier: ".?AVPoint@@")
!12 = !{!13, !15, !16, !20, !23}
!13 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !11, file: !1, line: 3, baseType: !14, size: 32)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !11, file: !1, line: 4, baseType: !14, size: 32, offset: 32)
!16 = !DISubprogram(name: "Point", scope: !11, file: !1, line: 6, type: !17, scopeLine: 6, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!17 = !DISubroutineType(types: !18)
!18 = !{null, !19, !14, !14}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!20 = !DISubprogram(name: "getX", linkageName: "?getX@Point@@QEAAHXZ", scope: !11, file: !1, line: 10, type: !21, scopeLine: 10, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!21 = !DISubroutineType(types: !22)
!22 = !{!14, !19}
!23 = !DISubprogram(name: "getY", linkageName: "?getY@Point@@QEAAHXZ", scope: !11, file: !1, line: 11, type: !21, scopeLine: 11, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!24 = !{!25, !26}
!25 = !DILocalVariable(name: "b", arg: 2, scope: !8, file: !1, line: 14, type: !11)
!26 = !DILocalVariable(name: "a", arg: 1, scope: !8, file: !1, line: 14, type: !11)
!27 = !DILocation(line: 14, column: 40, scope: !8)
!28 = !DILocation(line: 14, column: 31, scope: !8)
!29 = !DILocation(line: 15, column: 43, scope: !8)
!30 = !DILocation(line: 15, column: 54, scope: !8)
!31 = !DILocation(line: 15, column: 50, scope: !8)
!32 = !DILocation(line: 15, column: 61, scope: !8)
!33 = !DILocation(line: 15, column: 18, scope: !8)
!34 = !DILocation(line: 15, column: 29, scope: !8)
!35 = !DILocation(line: 15, column: 25, scope: !8)
!36 = !DILocation(line: 15, column: 36, scope: !8)
!37 = !DILocation(line: 15, column: 9, scope: !8)
!38 = !DILocation(line: 15, column: 2, scope: !8)
!39 = distinct !DISubprogram(name: "getY", linkageName: "?getY@Point@@QEAAHXZ", scope: !11, file: !1, line: 11, type: !21, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !23, retainedNodes: !40)
!40 = !{!41}
!41 = !DILocalVariable(name: "this", arg: 1, scope: !39, type: !42, flags: DIFlagArtificial | DIFlagObjectPointer)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!43 = !{!44, !44, i64 0}
!44 = !{!"any pointer", !45, i64 0}
!45 = !{!"omnipotent char", !46, i64 0}
!46 = !{!"Simple C++ TBAA"}
!47 = !DILocation(line: 0, scope: !39)
!48 = !DILocation(line: 11, column: 20, scope: !39)
!49 = !{!50, !51, i64 4}
!50 = !{!"?AVPoint@@", !51, i64 0, !51, i64 4}
!51 = !{!"int", !45, i64 0}
!52 = !DILocation(line: 11, column: 13, scope: !39)
!53 = distinct !DISubprogram(name: "getX", linkageName: "?getX@Point@@QEAAHXZ", scope: !11, file: !1, line: 10, type: !21, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !20, retainedNodes: !54)
!54 = !{!55}
!55 = !DILocalVariable(name: "this", arg: 1, scope: !53, type: !42, flags: DIFlagArtificial | DIFlagObjectPointer)
!56 = !DILocation(line: 0, scope: !53)
!57 = !DILocation(line: 10, column: 20, scope: !53)
!58 = !{!50, !51, i64 0}
!59 = !DILocation(line: 10, column: 13, scope: !53)
!60 = distinct !DISubprogram(name: "Point", linkageName: "??0Point@@QEAA@HH@Z", scope: !11, file: !1, line: 6, type: !17, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !16, retainedNodes: !61)
!61 = !{!62, !63, !64}
!62 = !DILocalVariable(name: "b", arg: 3, scope: !60, file: !1, line: 6, type: !14)
!63 = !DILocalVariable(name: "a", arg: 2, scope: !60, file: !1, line: 6, type: !14)
!64 = !DILocalVariable(name: "this", arg: 1, scope: !60, type: !42, flags: DIFlagArtificial | DIFlagObjectPointer)
!65 = !{!51, !51, i64 0}
!66 = !DILocation(line: 6, column: 19, scope: !60)
!67 = !DILocation(line: 6, column: 12, scope: !60)
!68 = !DILocation(line: 0, scope: !60)
!69 = !DILocation(line: 3, column: 6, scope: !60)
!70 = !DILocation(line: 4, column: 6, scope: !60)
!71 = !DILocation(line: 7, column: 7, scope: !72)
!72 = distinct !DILexicalBlock(scope: !60, file: !1, line: 6, column: 21)
!73 = !DILocation(line: 7, column: 3, scope: !72)
!74 = !DILocation(line: 7, column: 5, scope: !72)
!75 = !DILocation(line: 8, column: 7, scope: !72)
!76 = !DILocation(line: 8, column: 3, scope: !72)
!77 = !DILocation(line: 8, column: 5, scope: !72)
!78 = !DILocation(line: 9, column: 2, scope: !60)
!79 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 18, type: !80, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !82)
!80 = !DISubroutineType(types: !81)
!81 = !{!14}
!82 = !{!83, !84, !85}
!83 = !DILocalVariable(name: "origin", scope: !79, file: !1, line: 19, type: !11)
!84 = !DILocalVariable(name: "target", scope: !79, file: !1, line: 20, type: !11)
!85 = !DILocalVariable(name: "midpoint", scope: !79, file: !1, line: 21, type: !11)
!86 = !DILocation(line: 19, column: 2, scope: !79)
!87 = !DILocation(line: 19, column: 8, scope: !79)
!88 = !DILocation(line: 19, column: 17, scope: !79)
!89 = !DILocation(line: 20, column: 2, scope: !79)
!90 = !DILocation(line: 20, column: 8, scope: !79)
!91 = !DILocation(line: 20, column: 17, scope: !79)
!92 = !DILocation(line: 21, column: 2, scope: !79)
!93 = !DILocation(line: 21, column: 8, scope: !79)
!94 = !DILocation(line: 21, column: 45, scope: !79)
!95 = !{i64 0, i64 4, !65, i64 4, i64 4, !65}
!96 = !DILocation(line: 21, column: 37, scope: !79)
!97 = !DILocation(line: 21, column: 19, scope: !79)
!98 = !DILocation(line: 23, column: 1, scope: !79)
!99 = !DILocation(line: 22, column: 2, scope: !79)

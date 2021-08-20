; ModuleID = 'ArrayAccessCheck.cpp'
source_filename = "ArrayAccessCheck.cpp"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.29.30038"

%class.Point = type { i32, i32 }

$"??0Point@@QEAA@HH@Z" = comdat any

$"?getX@Point@@QEAAHXZ" = comdat any

$"?getY@Point@@QEAAHXZ" = comdat any

; Function Attrs: norecurse uwtable mustprogress
define dso_local i32 @main() #0 !dbg !8 {
  %1 = alloca i32, align 4
  %2 = alloca [3 x %class.Point], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %5 = bitcast [3 x %class.Point]* %2 to i8*, !dbg !31
  call void @llvm.lifetime.start.p0i8(i64 24, i8* %5) #5, !dbg !31
  call void @llvm.dbg.declare(metadata [3 x %class.Point]* %2, metadata !13, metadata !DIExpression()), !dbg !32
  %6 = getelementptr inbounds [3 x %class.Point], [3 x %class.Point]* %2, i64 0, i64 0, !dbg !33
  %7 = call %class.Point* @"??0Point@@QEAA@HH@Z"(%class.Point* nonnull dereferenceable(8) %6, i32 1, i32 2), !dbg !34
  %8 = getelementptr inbounds %class.Point, %class.Point* %6, i64 1, !dbg !33
  %9 = call %class.Point* @"??0Point@@QEAA@HH@Z"(%class.Point* nonnull dereferenceable(8) %8, i32 3, i32 4), !dbg !35
  %10 = getelementptr inbounds %class.Point, %class.Point* %8, i64 1, !dbg !33
  %11 = call %class.Point* @"??0Point@@QEAA@HH@Z"(%class.Point* nonnull dereferenceable(8) %10, i32 45, i32 46), !dbg !36
  %12 = bitcast i32* %3 to i8*, !dbg !37
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %12) #5, !dbg !37
  call void @llvm.dbg.declare(metadata i32* %3, metadata !29, metadata !DIExpression()), !dbg !38
  store i32 2, i32* %3, align 4, !dbg !38, !tbaa !39
  %13 = bitcast i32* %4 to i8*, !dbg !43
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %13) #5, !dbg !43
  call void @llvm.dbg.declare(metadata i32* %4, metadata !30, metadata !DIExpression()), !dbg !44
  %14 = load i32, i32* %3, align 4, !dbg !45, !tbaa !39
  %15 = sext i32 %14 to i64, !dbg !46
  %16 = getelementptr inbounds [3 x %class.Point], [3 x %class.Point]* %2, i64 0, i64 %15, !dbg !46
  %17 = call i32 @"?getX@Point@@QEAAHXZ"(%class.Point* nonnull dereferenceable(8) %16), !dbg !47
  store i32 %17, i32* %4, align 4, !dbg !44, !tbaa !39
  %18 = getelementptr inbounds [3 x %class.Point], [3 x %class.Point]* %2, i64 0, i64 0, !dbg !48
  %19 = call i32 @"?getY@Point@@QEAAHXZ"(%class.Point* nonnull dereferenceable(8) %18), !dbg !49
  store i32 %19, i32* %4, align 4, !dbg !50, !tbaa !39
  %20 = load i32, i32* %4, align 4, !dbg !51, !tbaa !39
  %21 = bitcast i32* %4 to i8*, !dbg !52
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %21) #5, !dbg !52
  %22 = bitcast i32* %3 to i8*, !dbg !52
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %22) #5, !dbg !52
  %23 = bitcast [3 x %class.Point]* %2 to i8*, !dbg !52
  call void @llvm.lifetime.end.p0i8(i64 24, i8* %23) #5, !dbg !52
  ret i32 %20, !dbg !53
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local %class.Point* @"??0Point@@QEAA@HH@Z"(%class.Point* nonnull returned dereferenceable(8) %0, i32 %1, i32 %2) unnamed_addr #3 comdat align 2 !dbg !54 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %class.Point*, align 8
  store i32 %2, i32* %4, align 4, !tbaa !39
  call void @llvm.dbg.declare(metadata i32* %4, metadata !56, metadata !DIExpression()), !dbg !60
  store i32 %1, i32* %5, align 4, !tbaa !39
  call void @llvm.dbg.declare(metadata i32* %5, metadata !57, metadata !DIExpression()), !dbg !61
  store %class.Point* %0, %class.Point** %6, align 8, !tbaa !62
  call void @llvm.dbg.declare(metadata %class.Point** %6, metadata !58, metadata !DIExpression()), !dbg !64
  %7 = load %class.Point*, %class.Point** %6, align 8
  %8 = getelementptr inbounds %class.Point, %class.Point* %7, i32 0, i32 0, !dbg !65
  store i32 0, i32* %8, align 4, !dbg !65, !tbaa !66
  %9 = getelementptr inbounds %class.Point, %class.Point* %7, i32 0, i32 1, !dbg !68
  store i32 0, i32* %9, align 4, !dbg !68, !tbaa !69
  %10 = load i32, i32* %5, align 4, !dbg !70, !tbaa !39
  %11 = getelementptr inbounds %class.Point, %class.Point* %7, i32 0, i32 0, !dbg !72
  store i32 %10, i32* %11, align 4, !dbg !73, !tbaa !66
  %12 = load i32, i32* %4, align 4, !dbg !74, !tbaa !39
  %13 = getelementptr inbounds %class.Point, %class.Point* %7, i32 0, i32 1, !dbg !75
  store i32 %12, i32* %13, align 4, !dbg !76, !tbaa !69
  ret %class.Point* %7, !dbg !77
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i32 @"?getX@Point@@QEAAHXZ"(%class.Point* nonnull dereferenceable(8) %0) #4 comdat align 2 !dbg !78 {
  %2 = alloca %class.Point*, align 8
  store %class.Point* %0, %class.Point** %2, align 8, !tbaa !62
  call void @llvm.dbg.declare(metadata %class.Point** %2, metadata !80, metadata !DIExpression()), !dbg !81
  %3 = load %class.Point*, %class.Point** %2, align 8
  %4 = getelementptr inbounds %class.Point, %class.Point* %3, i32 0, i32 0, !dbg !82
  %5 = load i32, i32* %4, align 4, !dbg !82, !tbaa !66
  ret i32 %5, !dbg !83
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i32 @"?getY@Point@@QEAAHXZ"(%class.Point* nonnull dereferenceable(8) %0) #4 comdat align 2 !dbg !84 {
  %2 = alloca %class.Point*, align 8
  store %class.Point* %0, %class.Point** %2, align 8, !tbaa !62
  call void @llvm.dbg.declare(metadata %class.Point** %2, metadata !86, metadata !DIExpression()), !dbg !87
  %3 = load %class.Point*, %class.Point** %2, align 8
  %4 = getelementptr inbounds %class.Point, %class.Point* %3, i32 0, i32 1, !dbg !88
  %5 = load i32, i32* %4, align 4, !dbg !88, !tbaa !69
  ret i32 %5, !dbg !89
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { norecurse uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "clang version 12.0.0", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "ArrayAccessCheck.cpp", directory: "E:\\Documents\\Work Stuff\\Active Work Files\\Code Examples\\test_cpp01", checksumkind: CSK_MD5, checksum: "858992bbef1b8ac0c47ceeb33381979e")
!2 = !{}
!3 = !{i32 2, !"CodeView", i32 1}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 2}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{!"clang version 12.0.0"}
!8 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 14, type: !9, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !12)
!9 = !DISubroutineType(types: !10)
!10 = !{!11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{!13, !29, !30}
!13 = !DILocalVariable(name: "pointArray", scope: !8, file: !1, line: 15, type: !14)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 192, elements: !27)
!15 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "Point", file: !1, line: 1, size: 64, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !16, identifier: ".?AVPoint@@")
!16 = !{!17, !18, !19, !23, !26}
!17 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !15, file: !1, line: 3, baseType: !11, size: 32)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !15, file: !1, line: 4, baseType: !11, size: 32, offset: 32)
!19 = !DISubprogram(name: "Point", scope: !15, file: !1, line: 6, type: !20, scopeLine: 6, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!20 = !DISubroutineType(types: !21)
!21 = !{null, !22, !11, !11}
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!23 = !DISubprogram(name: "getX", linkageName: "?getX@Point@@QEAAHXZ", scope: !15, file: !1, line: 10, type: !24, scopeLine: 10, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!24 = !DISubroutineType(types: !25)
!25 = !{!11, !22}
!26 = !DISubprogram(name: "getY", linkageName: "?getY@Point@@QEAAHXZ", scope: !15, file: !1, line: 11, type: !24, scopeLine: 11, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!27 = !{!28}
!28 = !DISubrange(count: 3)
!29 = !DILocalVariable(name: "pos", scope: !8, file: !1, line: 16, type: !11)
!30 = !DILocalVariable(name: "output", scope: !8, file: !1, line: 17, type: !11)
!31 = !DILocation(line: 15, column: 2, scope: !8)
!32 = !DILocation(line: 15, column: 8, scope: !8)
!33 = !DILocation(line: 15, column: 23, scope: !8)
!34 = !DILocation(line: 15, column: 24, scope: !8)
!35 = !DILocation(line: 15, column: 36, scope: !8)
!36 = !DILocation(line: 15, column: 48, scope: !8)
!37 = !DILocation(line: 16, column: 2, scope: !8)
!38 = !DILocation(line: 16, column: 6, scope: !8)
!39 = !{!40, !40, i64 0}
!40 = !{!"int", !41, i64 0}
!41 = !{!"omnipotent char", !42, i64 0}
!42 = !{!"Simple C++ TBAA"}
!43 = !DILocation(line: 17, column: 2, scope: !8)
!44 = !DILocation(line: 17, column: 6, scope: !8)
!45 = !DILocation(line: 17, column: 26, scope: !8)
!46 = !DILocation(line: 17, column: 15, scope: !8)
!47 = !DILocation(line: 17, column: 31, scope: !8)
!48 = !DILocation(line: 18, column: 11, scope: !8)
!49 = !DILocation(line: 18, column: 25, scope: !8)
!50 = !DILocation(line: 18, column: 9, scope: !8)
!51 = !DILocation(line: 19, column: 9, scope: !8)
!52 = !DILocation(line: 20, column: 1, scope: !8)
!53 = !DILocation(line: 19, column: 2, scope: !8)
!54 = distinct !DISubprogram(name: "Point", linkageName: "??0Point@@QEAA@HH@Z", scope: !15, file: !1, line: 6, type: !20, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !19, retainedNodes: !55)
!55 = !{!56, !57, !58}
!56 = !DILocalVariable(name: "b", arg: 3, scope: !54, file: !1, line: 6, type: !11)
!57 = !DILocalVariable(name: "a", arg: 2, scope: !54, file: !1, line: 6, type: !11)
!58 = !DILocalVariable(name: "this", arg: 1, scope: !54, type: !59, flags: DIFlagArtificial | DIFlagObjectPointer)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!60 = !DILocation(line: 6, column: 19, scope: !54)
!61 = !DILocation(line: 6, column: 12, scope: !54)
!62 = !{!63, !63, i64 0}
!63 = !{!"any pointer", !41, i64 0}
!64 = !DILocation(line: 0, scope: !54)
!65 = !DILocation(line: 3, column: 6, scope: !54)
!66 = !{!67, !40, i64 0}
!67 = !{!"?AVPoint@@", !40, i64 0, !40, i64 4}
!68 = !DILocation(line: 4, column: 6, scope: !54)
!69 = !{!67, !40, i64 4}
!70 = !DILocation(line: 7, column: 7, scope: !71)
!71 = distinct !DILexicalBlock(scope: !54, file: !1, line: 6, column: 21)
!72 = !DILocation(line: 7, column: 3, scope: !71)
!73 = !DILocation(line: 7, column: 5, scope: !71)
!74 = !DILocation(line: 8, column: 7, scope: !71)
!75 = !DILocation(line: 8, column: 3, scope: !71)
!76 = !DILocation(line: 8, column: 5, scope: !71)
!77 = !DILocation(line: 9, column: 2, scope: !54)
!78 = distinct !DISubprogram(name: "getX", linkageName: "?getX@Point@@QEAAHXZ", scope: !15, file: !1, line: 10, type: !24, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !23, retainedNodes: !79)
!79 = !{!80}
!80 = !DILocalVariable(name: "this", arg: 1, scope: !78, type: !59, flags: DIFlagArtificial | DIFlagObjectPointer)
!81 = !DILocation(line: 0, scope: !78)
!82 = !DILocation(line: 10, column: 20, scope: !78)
!83 = !DILocation(line: 10, column: 13, scope: !78)
!84 = distinct !DISubprogram(name: "getY", linkageName: "?getY@Point@@QEAAHXZ", scope: !15, file: !1, line: 11, type: !24, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !26, retainedNodes: !85)
!85 = !{!86}
!86 = !DILocalVariable(name: "this", arg: 1, scope: !84, type: !59, flags: DIFlagArtificial | DIFlagObjectPointer)
!87 = !DILocation(line: 0, scope: !84)
!88 = !DILocation(line: 11, column: 20, scope: !84)
!89 = !DILocation(line: 11, column: 13, scope: !84)

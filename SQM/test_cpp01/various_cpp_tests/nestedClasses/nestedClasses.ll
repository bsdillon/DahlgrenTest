; ModuleID = 'nestedClasses.cpp'
source_filename = "nestedClasses.cpp"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.29.30038"

%"class.enclose::nested" = type { i8 }

$"?f@enclose@@SA?AVnested@1@XZ" = comdat any

$"?g@nested@enclose@@QEAAXXZ" = comdat any

; Function Attrs: norecurse uwtable mustprogress
define dso_local i32 @main() #0 !dbg !19 {
  %1 = alloca %"class.enclose::nested", align 1
  %2 = alloca %"class.enclose::nested", align 1
  %3 = bitcast %"class.enclose::nested"* %1 to i8*, !dbg !25
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %3) #4, !dbg !25
  %4 = call i8 @"?f@enclose@@SA?AVnested@1@XZ"(), !dbg !25
  %5 = getelementptr inbounds %"class.enclose::nested", %"class.enclose::nested"* %1, i32 0, i32 0, !dbg !25
  store i8 %4, i8* %5, align 1, !dbg !25
  call void @"?g@nested@enclose@@QEAAXXZ"(%"class.enclose::nested"* nonnull dereferenceable(1) %1), !dbg !26
  %6 = bitcast %"class.enclose::nested"* %1 to i8*, !dbg !25
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %6) #4, !dbg !25
  %7 = bitcast %"class.enclose::nested"* %2 to i8*, !dbg !27
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %7) #4, !dbg !27
  call void @llvm.dbg.declare(metadata %"class.enclose::nested"* %2, metadata !24, metadata !DIExpression()), !dbg !28
  %8 = call i8 @"?f@enclose@@SA?AVnested@1@XZ"(), !dbg !29
  %9 = getelementptr inbounds %"class.enclose::nested", %"class.enclose::nested"* %2, i32 0, i32 0, !dbg !29
  store i8 %8, i8* %9, align 1, !dbg !29
  call void @"?g@nested@enclose@@QEAAXXZ"(%"class.enclose::nested"* nonnull dereferenceable(1) %2), !dbg !30
  %10 = bitcast %"class.enclose::nested"* %2 to i8*, !dbg !31
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %10) #4, !dbg !31
  ret i32 0, !dbg !31
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i8 @"?f@enclose@@SA?AVnested@1@XZ"() #2 comdat align 2 !dbg !32 {
  %1 = alloca %"class.enclose::nested", align 1
  %2 = getelementptr inbounds %"class.enclose::nested", %"class.enclose::nested"* %1, i32 0, i32 0, !dbg !33
  %3 = load i8, i8* %2, align 1, !dbg !33
  ret i8 %3, !dbg !33
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local void @"?g@nested@enclose@@QEAAXXZ"(%"class.enclose::nested"* nonnull dereferenceable(1) %0) #2 comdat align 2 !dbg !34 {
  %2 = alloca %"class.enclose::nested"*, align 8
  store %"class.enclose::nested"* %0, %"class.enclose::nested"** %2, align 8, !tbaa !38
  call void @llvm.dbg.declare(metadata %"class.enclose::nested"** %2, metadata !36, metadata !DIExpression()), !dbg !42
  %3 = load %"class.enclose::nested"*, %"class.enclose::nested"** %2, align 8
  ret void, !dbg !43
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #3

attributes #0 = { norecurse uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { nounwind uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "clang version 12.0.0", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, nameTableKind: None)
!1 = !DIFile(filename: "nestedClasses.cpp", directory: "E:\\Documents\\Work Stuff\\Active Work Files\\Code Examples\\test_cpp01", checksumkind: CSK_MD5, checksum: "145dc9a2bb0e54de924875b697240ea7")
!2 = !{}
!3 = !{!4}
!4 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "nested", scope: !5, file: !1, line: 2, size: 8, flags: DIFlagTypePassByValue, elements: !9, identifier: ".?AVnested@enclose@@")
!5 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "enclose", file: !1, line: 1, size: 8, flags: DIFlagTypePassByValue, elements: !6, identifier: ".?AVenclose@@")
!6 = !{!4, !7}
!7 = !DISubprogram(name: "f", linkageName: "?f@enclose@@SA?AVnested@1@XZ", scope: !5, file: !1, line: 7, type: !8, scopeLine: 7, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!8 = !DISubroutineType(types: !3)
!9 = !{!10}
!10 = !DISubprogram(name: "g", linkageName: "?g@nested@enclose@@QEAAXXZ", scope: !4, file: !1, line: 4, type: !11, scopeLine: 4, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!14 = !{i32 2, !"CodeView", i32 1}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 2}
!17 = !{i32 7, !"PIC Level", i32 2}
!18 = !{!"clang version 12.0.0"}
!19 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 10, type: !20, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !23)
!20 = !DISubroutineType(types: !21)
!21 = !{!22}
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !{!24}
!24 = !DILocalVariable(name: "n2", scope: !19, file: !1, line: 15, type: !4)
!25 = !DILocation(line: 14, column: 5, scope: !19)
!26 = !DILocation(line: 14, column: 18, scope: !19)
!27 = !DILocation(line: 15, column: 5, scope: !19)
!28 = !DILocation(line: 15, column: 10, scope: !19)
!29 = !DILocation(line: 15, column: 15, scope: !19)
!30 = !DILocation(line: 16, column: 8, scope: !19)
!31 = !DILocation(line: 17, column: 1, scope: !19)
!32 = distinct !DISubprogram(name: "f", linkageName: "?f@enclose@@SA?AVnested@1@XZ", scope: !5, file: !1, line: 7, type: !8, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !7, retainedNodes: !2)
!33 = !DILocation(line: 7, column: 25, scope: !32)
!34 = distinct !DISubprogram(name: "g", linkageName: "?g@nested@enclose@@QEAAXXZ", scope: !4, file: !1, line: 4, type: !11, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !10, retainedNodes: !35)
!35 = !{!36}
!36 = !DILocalVariable(name: "this", arg: 1, scope: !34, type: !37, flags: DIFlagArtificial | DIFlagObjectPointer)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!38 = !{!39, !39, i64 0}
!39 = !{!"any pointer", !40, i64 0}
!40 = !{!"omnipotent char", !41, i64 0}
!41 = !{!"Simple C++ TBAA"}
!42 = !DILocation(line: 0, scope: !34)
!43 = !DILocation(line: 4, column: 19, scope: !34)

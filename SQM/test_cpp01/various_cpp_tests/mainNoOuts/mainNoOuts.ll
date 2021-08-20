; ModuleID = 'mainNoOuts.cpp'
source_filename = "mainNoOuts.cpp"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.28.29915"

%class.ExampleClass = type { i32, i32 }

$"?setA@ExampleClass@@QEAAXH@Z" = comdat any

$"?setB@ExampleClass@@QEAAXH@Z" = comdat any

@__const.main.array = private unnamed_addr constant [3 x i32] [i32 0, i32 1, i32 2], align 4

; Function Attrs: norecurse uwtable mustprogress
define dso_local i32 @main(i32 %0, i8** %1) #0 !dbg !871 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %class.ExampleClass, align 4
  %10 = alloca [3 x i32], align 4
  %11 = alloca i32, align 4
  %12 = alloca [3 x i32]*, align 8
  %13 = alloca i32*, align 8
  %14 = alloca i32*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i32 0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8, !tbaa !906
  call void @llvm.dbg.declare(metadata i8*** %4, metadata !875, metadata !DIExpression()), !dbg !910
  store i32 %0, i32* %5, align 4, !tbaa !911
  call void @llvm.dbg.declare(metadata i32* %5, metadata !876, metadata !DIExpression()), !dbg !913
  %17 = bitcast i32* %6 to i8*, !dbg !914
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %17) #4, !dbg !914
  call void @llvm.dbg.declare(metadata i32* %6, metadata !877, metadata !DIExpression()), !dbg !915
  store i32 0, i32* %6, align 4, !dbg !915, !tbaa !911
  %18 = bitcast i32* %7 to i8*, !dbg !916
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %18) #4, !dbg !916
  call void @llvm.dbg.declare(metadata i32* %7, metadata !878, metadata !DIExpression()), !dbg !917
  store i32 9, i32* %7, align 4, !dbg !917, !tbaa !911
  %19 = bitcast i32* %8 to i8*, !dbg !918
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %19) #4, !dbg !918
  call void @llvm.dbg.declare(metadata i32* %8, metadata !879, metadata !DIExpression()), !dbg !919
  store i32 0, i32* %8, align 4, !dbg !919, !tbaa !911
  %20 = bitcast %class.ExampleClass* %9 to i8*, !dbg !920
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %20) #4, !dbg !920
  call void @llvm.dbg.declare(metadata %class.ExampleClass* %9, metadata !880, metadata !DIExpression()), !dbg !921
  call void @"?setA@ExampleClass@@QEAAXH@Z"(%class.ExampleClass* nonnull dereferenceable(8) %9, i32 5), !dbg !922
  call void @"?setB@ExampleClass@@QEAAXH@Z"(%class.ExampleClass* nonnull dereferenceable(8) %9, i32 6), !dbg !923
  br label %21, !dbg !924

21:                                               ; preds = %25, %2
  %22 = load i32, i32* %6, align 4, !dbg !925, !tbaa !911
  %23 = load i32, i32* %7, align 4, !dbg !926, !tbaa !911
  %24 = icmp sle i32 %22, %23, !dbg !927
  br i1 %24, label %25, label %29, !dbg !924

25:                                               ; preds = %21
  %26 = load i32, i32* %6, align 4, !dbg !928, !tbaa !911
  %27 = add nsw i32 %26, 1, !dbg !928
  store i32 %27, i32* %6, align 4, !dbg !928, !tbaa !911
  %28 = load i32, i32* %6, align 4, !dbg !930, !tbaa !911
  store i32 %28, i32* %8, align 4, !dbg !931, !tbaa !911
  br label %21, !dbg !924, !llvm.loop !932

29:                                               ; preds = %21
  %30 = bitcast [3 x i32]* %10 to i8*, !dbg !935
  call void @llvm.lifetime.start.p0i8(i64 12, i8* %30) #4, !dbg !935
  call void @llvm.dbg.declare(metadata [3 x i32]* %10, metadata !891, metadata !DIExpression()), !dbg !936
  %31 = bitcast [3 x i32]* %10 to i8*, !dbg !936
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %31, i8* align 4 bitcast ([3 x i32]* @__const.main.array to i8*), i64 12, i1 false), !dbg !936
  %32 = bitcast i32* %11 to i8*, !dbg !937
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %32) #4, !dbg !937
  call void @llvm.dbg.declare(metadata i32* %11, metadata !895, metadata !DIExpression()), !dbg !938
  store i32 0, i32* %11, align 4, !dbg !938, !tbaa !911
  br label %33, !dbg !937

33:                                               ; preds = %43, %29
  %34 = load i32, i32* %11, align 4, !dbg !939, !tbaa !911
  %35 = icmp sle i32 %34, 2, !dbg !941
  br i1 %35, label %38, label %36, !dbg !942

36:                                               ; preds = %33
  %37 = bitcast i32* %11 to i8*, !dbg !943
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %37) #4, !dbg !943
  br label %46

38:                                               ; preds = %33
  %39 = load i32, i32* %11, align 4, !dbg !944, !tbaa !911
  %40 = sext i32 %39 to i64, !dbg !946
  %41 = getelementptr inbounds [3 x i32], [3 x i32]* %10, i64 0, i64 %40, !dbg !946
  %42 = load i32, i32* %41, align 4, !dbg !946, !tbaa !911
  store i32 %42, i32* %8, align 4, !dbg !947, !tbaa !911
  br label %43, !dbg !948

43:                                               ; preds = %38
  %44 = load i32, i32* %11, align 4, !dbg !949, !tbaa !911
  %45 = add nsw i32 %44, 1, !dbg !949
  store i32 %45, i32* %11, align 4, !dbg !949, !tbaa !911
  br label %33, !dbg !943, !llvm.loop !950

46:                                               ; preds = %36
  %47 = bitcast [3 x i32]** %12 to i8*, !dbg !952
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %47) #4, !dbg !952
  call void @llvm.dbg.declare(metadata [3 x i32]** %12, metadata !897, metadata !DIExpression()), !dbg !953
  store [3 x i32]* %10, [3 x i32]** %12, align 8, !dbg !952, !tbaa !906
  %48 = bitcast i32** %13 to i8*, !dbg !954
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %48) #4, !dbg !954
  call void @llvm.dbg.declare(metadata i32** %13, metadata !900, metadata !DIExpression()), !dbg !953
  %49 = load [3 x i32]*, [3 x i32]** %12, align 8, !dbg !954, !tbaa !906
  %50 = getelementptr inbounds [3 x i32], [3 x i32]* %49, i64 0, i64 0, !dbg !954
  store i32* %50, i32** %13, align 8, !dbg !954, !tbaa !906
  %51 = bitcast i32** %14 to i8*, !dbg !954
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %51) #4, !dbg !954
  call void @llvm.dbg.declare(metadata i32** %14, metadata !902, metadata !DIExpression()), !dbg !953
  %52 = load [3 x i32]*, [3 x i32]** %12, align 8, !dbg !954, !tbaa !906
  %53 = getelementptr inbounds [3 x i32], [3 x i32]* %52, i64 0, i64 0, !dbg !954
  %54 = getelementptr inbounds i32, i32* %53, i64 3, !dbg !954
  store i32* %54, i32** %14, align 8, !dbg !954, !tbaa !906
  br label %55, !dbg !954

55:                                               ; preds = %69, %46
  %56 = load i32*, i32** %13, align 8, !dbg !954, !tbaa !906
  %57 = load i32*, i32** %14, align 8, !dbg !954, !tbaa !906
  %58 = icmp ne i32* %56, %57, !dbg !954
  br i1 %58, label %63, label %59, !dbg !954

59:                                               ; preds = %55
  %60 = bitcast i32** %14 to i8*, !dbg !954
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %60) #4, !dbg !954
  %61 = bitcast i32** %13 to i8*, !dbg !954
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %61) #4, !dbg !954
  %62 = bitcast [3 x i32]** %12 to i8*, !dbg !954
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %62) #4, !dbg !954
  br label %72

63:                                               ; preds = %55
  %64 = bitcast i32* %15 to i8*, !dbg !955
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %64) #4, !dbg !955
  call void @llvm.dbg.declare(metadata i32* %15, metadata !903, metadata !DIExpression()), !dbg !956
  %65 = load i32*, i32** %13, align 8, !dbg !957, !tbaa !906
  %66 = load i32, i32* %65, align 4, !dbg !957, !tbaa !911
  store i32 %66, i32* %15, align 4, !dbg !956, !tbaa !911
  %67 = load i32, i32* %15, align 4, !dbg !958, !tbaa !911
  store i32 %67, i32* %8, align 4, !dbg !960, !tbaa !911
  %68 = bitcast i32* %15 to i8*, !dbg !961
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %68) #4, !dbg !961
  br label %69, !dbg !962

69:                                               ; preds = %63
  %70 = load i32*, i32** %13, align 8, !dbg !954, !tbaa !906
  %71 = getelementptr inbounds i32, i32* %70, i32 1, !dbg !954
  store i32* %71, i32** %13, align 8, !dbg !954, !tbaa !906
  br label %55, !dbg !954, !llvm.loop !963

72:                                               ; preds = %59
  %73 = bitcast i32* %16 to i8*, !dbg !964
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %73) #4, !dbg !964
  call void @llvm.dbg.declare(metadata i32* %16, metadata !905, metadata !DIExpression()), !dbg !965
  store i32 0, i32* %16, align 4, !dbg !965, !tbaa !911
  %74 = load i32, i32* %16, align 4, !dbg !966, !tbaa !911
  %75 = icmp eq i32 %74, 0, !dbg !968
  br i1 %75, label %76, label %77, !dbg !969

76:                                               ; preds = %72
  store i32 0, i32* %8, align 4, !dbg !970, !tbaa !911
  br label %83, !dbg !972

77:                                               ; preds = %72
  %78 = load i32, i32* %16, align 4, !dbg !973, !tbaa !911
  %79 = icmp eq i32 %78, 1, !dbg !975
  br i1 %79, label %80, label %81, !dbg !976

80:                                               ; preds = %77
  store i32 1, i32* %8, align 4, !dbg !977, !tbaa !911
  br label %82, !dbg !979

81:                                               ; preds = %77
  store i32 -1, i32* %8, align 4, !dbg !980, !tbaa !911
  br label %82

82:                                               ; preds = %81, %80
  br label %83

83:                                               ; preds = %82, %76
  %84 = load i32, i32* %16, align 4, !dbg !982, !tbaa !911
  switch i32 %84, label %87 [
    i32 0, label %85
    i32 1, label %86
  ], !dbg !983

85:                                               ; preds = %83
  store i32 0, i32* %8, align 4, !dbg !984, !tbaa !911
  br label %88, !dbg !986

86:                                               ; preds = %83
  store i32 1, i32* %8, align 4, !dbg !987, !tbaa !911
  br label %88, !dbg !988

87:                                               ; preds = %83
  store i32 -1, i32* %8, align 4, !dbg !989, !tbaa !911
  br label %88, !dbg !990

88:                                               ; preds = %87, %86, %85
  %89 = load i32, i32* %16, align 4, !dbg !991, !tbaa !911
  %90 = icmp eq i32 %89, 0, !dbg !992
  %91 = zext i1 %90 to i64, !dbg !993
  %92 = select i1 %90, i32 0, i32 -1, !dbg !993
  store i32 %92, i32* %8, align 4, !dbg !994, !tbaa !911
  %93 = bitcast i32* %16 to i8*, !dbg !995
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %93) #4, !dbg !995
  %94 = bitcast [3 x i32]* %10 to i8*, !dbg !995
  call void @llvm.lifetime.end.p0i8(i64 12, i8* %94) #4, !dbg !995
  %95 = bitcast %class.ExampleClass* %9 to i8*, !dbg !995
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %95) #4, !dbg !995
  %96 = bitcast i32* %8 to i8*, !dbg !995
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %96) #4, !dbg !995
  %97 = bitcast i32* %7 to i8*, !dbg !995
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %97) #4, !dbg !995
  %98 = bitcast i32* %6 to i8*, !dbg !995
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %98) #4, !dbg !995
  ret i32 0, !dbg !996
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local void @"?setA@ExampleClass@@QEAAXH@Z"(%class.ExampleClass* nonnull dereferenceable(8) %0, i32 %1) #3 comdat align 2 !dbg !997 {
  %3 = alloca i32, align 4
  %4 = alloca %class.ExampleClass*, align 8
  store i32 %1, i32* %3, align 4, !tbaa !911
  call void @llvm.dbg.declare(metadata i32* %3, metadata !999, metadata !DIExpression()), !dbg !1002
  store %class.ExampleClass* %0, %class.ExampleClass** %4, align 8, !tbaa !906
  call void @llvm.dbg.declare(metadata %class.ExampleClass** %4, metadata !1000, metadata !DIExpression()), !dbg !1003
  %5 = load %class.ExampleClass*, %class.ExampleClass** %4, align 8
  %6 = load i32, i32* %3, align 4, !dbg !1004, !tbaa !911
  %7 = getelementptr inbounds %class.ExampleClass, %class.ExampleClass* %5, i32 0, i32 0, !dbg !1005
  store i32 %6, i32* %7, align 4, !dbg !1006, !tbaa !1007
  ret void, !dbg !1009
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local void @"?setB@ExampleClass@@QEAAXH@Z"(%class.ExampleClass* nonnull dereferenceable(8) %0, i32 %1) #3 comdat align 2 !dbg !1010 {
  %3 = alloca i32, align 4
  %4 = alloca %class.ExampleClass*, align 8
  store i32 %1, i32* %3, align 4, !tbaa !911
  call void @llvm.dbg.declare(metadata i32* %3, metadata !1012, metadata !DIExpression()), !dbg !1014
  store %class.ExampleClass* %0, %class.ExampleClass** %4, align 8, !tbaa !906
  call void @llvm.dbg.declare(metadata %class.ExampleClass** %4, metadata !1013, metadata !DIExpression()), !dbg !1015
  %5 = load %class.ExampleClass*, %class.ExampleClass** %4, align 8
  %6 = load i32, i32* %3, align 4, !dbg !1016, !tbaa !911
  %7 = getelementptr inbounds %class.ExampleClass, %class.ExampleClass* %5, i32 0, i32 1, !dbg !1017
  store i32 %6, i32* %7, align 4, !dbg !1018, !tbaa !1019
  ret void, !dbg !1020
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

attributes #0 = { norecurse uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nosync nounwind willreturn }
attributes #3 = { nounwind uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.linker.options = !{!861, !862, !863, !864, !865}
!llvm.module.flags = !{!866, !867, !868, !869}
!llvm.ident = !{!870}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "clang version 12.0.0", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, imports: !3, nameTableKind: None)
!1 = !DIFile(filename: "mainNoOuts.cpp", directory: "E:\\Documents\\Work Stuff\\Active Work Files\\Code Examples\\test_cpp01", checksumkind: CSK_MD5, checksum: "4d9b4ec11e7a66983299c892231a4d62")
!2 = !{}
!3 = !{!4, !10, !20, !24, !28, !29, !34, !39, !41, !43, !45, !47, !52, !58, !64, !70, !74, !78, !83, !87, !89, !94, !100, !104, !110, !112, !116, !120, !122, !126, !130, !134, !136, !140, !142, !144, !148, !152, !156, !160, !164, !168, !170, !176, !180, !184, !190, !194, !196, !198, !202, !204, !209, !214, !218, !220, !222, !227, !232, !234, !236, !238, !242, !246, !250, !254, !258, !260, !264, !266, !268, !270, !272, !276, !278, !280, !281, !284, !286, !291, !295, !301, !305, !311, !315, !320, !322, !324, !328, !333, !337, !342, !348, !350, !354, !359, !363, !367, !371, !375, !379, !383, !387, !389, !394, !400, !405, !409, !413, !415, !417, !421, !425, !429, !433, !435, !437, !439, !441, !446, !450, !452, !454, !458, !462, !466, !468, !470, !472, !474, !480, !482, !486, !488, !493, !498, !502, !506, !510, !513, !515, !517, !519, !523, !529, !533, !537, !542, !546, !548, !552, !561, !566, !576, !580, !584, !588, !592, !596, !600, !604, !608, !612, !614, !618, !623, !628, !632, !636, !640, !644, !645, !649, !651, !655, !659, !663, !667, !671, !675, !679, !681, !683, !685, !690, !693, !695, !697, !700, !702, !704, !706, !708, !710, !712, !714, !716, !718, !720, !722, !724, !726, !728, !730, !732, !734, !736, !738, !740, !742, !744, !746, !748, !749, !750, !751, !752, !753, !754, !755, !756, !757, !758, !759, !760, !761, !762, !763, !764, !765, !766, !767, !768, !769, !770, !771, !772, !773, !774, !775, !796, !812, !816, !821, !822, !825, !830, !831, !835, !837, !839, !841, !843, !845, !847, !849, !851, !853, !855, !857, !859}
!4 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !6, file: !9, line: 37)
!5 = !DINamespace(name: "std", scope: null)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !7, line: 31, baseType: !8)
!7 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_wstdio.h", directory: "", checksumkind: CSK_MD5, checksum: "bf50373b435d0afd0235dd3e05c4a277")
!8 = !DICompositeType(tag: DW_TAG_structure_type, name: "_iobuf", file: !7, line: 28, size: 64, flags: DIFlagFwdDecl, identifier: ".?AU_iobuf@@")
!9 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\cstdio", directory: "", checksumkind: CSK_MD5, checksum: "c450e3bb97b2af18a3a83f1f772c2644")
!10 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !11, file: !9, line: 38)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Mbstatet", file: !12, line: 615, baseType: !13)
!12 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt.h", directory: "", checksumkind: CSK_MD5, checksum: "db0cd8b4d76ec84d3625032eaca2a3ca")
!13 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Mbstatet", file: !12, line: 611, size: 64, flags: DIFlagTypePassByValue, elements: !14, identifier: ".?AU_Mbstatet@@")
!14 = !{!15, !17, !19}
!15 = !DIDerivedType(tag: DW_TAG_member, name: "_Wchar", scope: !13, file: !12, line: 613, baseType: !16, size: 32)
!16 = !DIBasicType(name: "long unsigned int", size: 32, encoding: DW_ATE_unsigned)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "_Byte", scope: !13, file: !12, line: 614, baseType: !18, size: 16, offset: 32)
!18 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "_State", scope: !13, file: !12, line: 614, baseType: !18, size: 16, offset: 48)
!20 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !21, file: !9, line: 40)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !22, line: 193, baseType: !23)
!22 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\vcruntime.h", directory: "", checksumkind: CSK_MD5, checksum: "1147c94afb6f25c377433eef20bc3e8f")
!23 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!24 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !25, file: !9, line: 41)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !26, line: 73, baseType: !27)
!26 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "c1a1fbc43e7d45f0ea4ae539ddcffb19")
!27 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!28 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !6, file: !9, line: 42)
!29 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !30, file: !9, line: 43)
!30 = !DISubprogram(name: "clearerr", scope: !26, file: !26, line: 146, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!31 = !DISubroutineType(types: !32)
!32 = !{null, !33}
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!34 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !35, file: !9, line: 44)
!35 = !DISubprogram(name: "fclose", scope: !26, file: !26, line: 152, type: !36, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!36 = !DISubroutineType(types: !37)
!37 = !{!38, !33}
!38 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!39 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !40, file: !9, line: 45)
!40 = !DISubprogram(name: "feof", scope: !26, file: !26, line: 166, type: !36, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!41 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !42, file: !9, line: 46)
!42 = !DISubprogram(name: "ferror", scope: !26, file: !26, line: 171, type: !36, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!43 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !44, file: !9, line: 47)
!44 = !DISubprogram(name: "fflush", scope: !26, file: !26, line: 176, type: !36, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!45 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !46, file: !9, line: 48)
!46 = !DISubprogram(name: "fgetc", scope: !26, file: !26, line: 182, type: !36, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!47 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !48, file: !9, line: 49)
!48 = !DISubprogram(name: "fgetpos", scope: !26, file: !26, line: 191, type: !49, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!49 = !DISubroutineType(types: !50)
!50 = !{!38, !33, !51}
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !53, file: !9, line: 50)
!53 = !DISubprogram(name: "fgets", scope: !26, file: !26, line: 198, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !38, !33}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !59, file: !9, line: 51)
!59 = !DISubprogram(name: "fopen", scope: !26, file: !26, line: 213, type: !60, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!60 = !DISubroutineType(types: !61)
!61 = !{!33, !62, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !57)
!64 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !65, file: !9, line: 52)
!65 = !DISubprogram(name: "fprintf", scope: !26, file: !26, line: 830, type: !66, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!66 = !DISubroutineType(types: !67)
!67 = !{!38, !68, !69, null}
!68 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !33)
!69 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !62)
!70 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !71, file: !9, line: 53)
!71 = !DISubprogram(name: "fputc", scope: !26, file: !26, line: 221, type: !72, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!72 = !DISubroutineType(types: !73)
!73 = !{!38, !38, !33}
!74 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !75, file: !9, line: 54)
!75 = !DISubprogram(name: "fputs", scope: !26, file: !26, line: 233, type: !76, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!76 = !DISubroutineType(types: !77)
!77 = !{!38, !62, !33}
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !79, file: !9, line: 55)
!79 = !DISubprogram(name: "fread", scope: !26, file: !26, line: 239, type: !80, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!80 = !DISubroutineType(types: !81)
!81 = !{!21, !82, !21, !21, !33}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!83 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !84, file: !9, line: 56)
!84 = !DISubprogram(name: "freopen", scope: !26, file: !26, line: 248, type: !85, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!85 = !DISubroutineType(types: !86)
!86 = !{!33, !62, !62, !33}
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !88, file: !9, line: 57)
!88 = !DISubprogram(name: "fscanf", scope: !26, file: !26, line: 1199, type: !66, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !90, file: !9, line: 58)
!90 = !DISubprogram(name: "fseek", scope: !26, file: !26, line: 270, type: !91, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!91 = !DISubroutineType(types: !92)
!92 = !{!38, !33, !93, !38}
!93 = !DIBasicType(name: "long int", size: 32, encoding: DW_ATE_signed)
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !95, file: !9, line: 59)
!95 = !DISubprogram(name: "fsetpos", scope: !26, file: !26, line: 263, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!96 = !DISubroutineType(types: !97)
!97 = !{!38, !33, !98}
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !25)
!100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !101, file: !9, line: 60)
!101 = !DISubprogram(name: "ftell", scope: !26, file: !26, line: 286, type: !102, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!102 = !DISubroutineType(types: !103)
!103 = !{!93, !33}
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !105, file: !9, line: 61)
!105 = !DISubprogram(name: "fwrite", scope: !26, file: !26, line: 297, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!106 = !DISubroutineType(types: !107)
!107 = !{!21, !108, !21, !21, !33}
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !111, file: !9, line: 62)
!111 = !DISubprogram(name: "getc", scope: !26, file: !26, line: 306, type: !36, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !113, file: !9, line: 63)
!113 = !DISubprogram(name: "getchar", scope: !26, file: !26, line: 311, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!114 = !DISubroutineType(types: !115)
!115 = !{!38}
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !117, file: !9, line: 64)
!117 = !DISubprogram(name: "perror", scope: !26, file: !26, line: 325, type: !118, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!118 = !DISubroutineType(types: !119)
!119 = !{null, !62}
!120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !121, file: !9, line: 65)
!121 = !DISubprogram(name: "putc", scope: !26, file: !26, line: 347, type: !72, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !123, file: !9, line: 66)
!123 = !DISubprogram(name: "putchar", scope: !26, file: !26, line: 353, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!124 = !DISubroutineType(types: !125)
!125 = !{!38, !38}
!126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !127, file: !9, line: 67)
!127 = !DISubprogram(name: "printf", scope: !26, file: !26, line: 950, type: !128, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!128 = !DISubroutineType(types: !129)
!129 = !{!38, !69, null}
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !131, file: !9, line: 68)
!131 = !DISubprogram(name: "puts", scope: !26, file: !26, line: 358, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!132 = !DISubroutineType(types: !133)
!133 = !{!38, !62}
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !135, file: !9, line: 69)
!135 = !DISubprogram(name: "remove", scope: !26, file: !26, line: 369, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !137, file: !9, line: 70)
!137 = !DISubprogram(name: "rename", scope: !26, file: !26, line: 374, type: !138, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!138 = !DISubroutineType(types: !139)
!139 = !{!38, !62, !62}
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !141, file: !9, line: 71)
!141 = !DISubprogram(name: "rewind", scope: !26, file: !26, line: 392, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !143, file: !9, line: 72)
!143 = !DISubprogram(name: "scanf", scope: !26, file: !26, line: 1276, type: !128, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !145, file: !9, line: 73)
!145 = !DISubprogram(name: "setbuf", scope: !26, file: !26, line: 400, type: !146, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!146 = !DISubroutineType(types: !147)
!147 = !{null, !33, !56}
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !149, file: !9, line: 74)
!149 = !DISubprogram(name: "setvbuf", scope: !26, file: !26, line: 412, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!150 = !DISubroutineType(types: !151)
!151 = !{!38, !33, !56, !38, !21}
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !153, file: !9, line: 75)
!153 = !DISubprogram(name: "sprintf", scope: !26, file: !26, line: 1783, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!154 = !DISubroutineType(types: !155)
!155 = !{!38, !56, !62, null}
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !157, file: !9, line: 76)
!157 = !DISubprogram(name: "sscanf", scope: !26, file: !26, line: 2240, type: !158, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!158 = !DISubroutineType(types: !159)
!159 = !{!38, !69, !69, null}
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !161, file: !9, line: 77)
!161 = !DISubprogram(name: "tmpfile", scope: !26, file: !26, line: 435, type: !162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!162 = !DISubroutineType(types: !163)
!163 = !{!33}
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !165, file: !9, line: 78)
!165 = !DISubprogram(name: "tmpnam", scope: !26, file: !26, line: 443, type: !166, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!166 = !DISubroutineType(types: !167)
!167 = !{!56, !56}
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !169, file: !9, line: 79)
!169 = !DISubprogram(name: "ungetc", scope: !26, file: !26, line: 451, type: !72, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !171, file: !9, line: 80)
!171 = !DISubprogram(name: "vfprintf", scope: !26, file: !26, line: 650, type: !172, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!172 = !DISubroutineType(types: !173)
!173 = !{!38, !68, !69, !174}
!174 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !175, line: 72, baseType: !56)
!175 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\vadefs.h", directory: "", checksumkind: CSK_MD5, checksum: "a4b8f96637d0704c82f39ecb6bde2ab4")
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !177, file: !9, line: 81)
!177 = !DISubprogram(name: "vprintf", scope: !26, file: !26, line: 740, type: !178, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!178 = !DISubroutineType(types: !179)
!179 = !{!38, !69, !174}
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !181, file: !9, line: 82)
!181 = !DISubprogram(name: "vsprintf", scope: !26, file: !26, line: 1783, type: !182, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!182 = !DISubroutineType(types: !183)
!183 = !{!38, !56, !62, !174}
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !185, file: !9, line: 84)
!185 = !DISubprogram(name: "snprintf", scope: !26, file: !26, line: 1919, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!186 = !DISubroutineType(types: !187)
!187 = !{!38, !188, !189, !69, null}
!188 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !56)
!189 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !21)
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !191, file: !9, line: 85)
!191 = !DISubprogram(name: "vsnprintf", scope: !26, file: !26, line: 1429, type: !192, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!192 = !DISubroutineType(types: !193)
!193 = !{!38, !188, !189, !69, !174}
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !195, file: !9, line: 86)
!195 = !DISubprogram(name: "vfscanf", scope: !26, file: !26, line: 1072, type: !172, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !197, file: !9, line: 87)
!197 = !DISubprogram(name: "vscanf", scope: !26, file: !26, line: 1136, type: !178, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !199, file: !9, line: 88)
!199 = !DISubprogram(name: "vsscanf", scope: !26, file: !26, line: 2160, type: !200, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!200 = !DISubroutineType(types: !201)
!201 = !{!38, !69, !69, !174}
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !21, file: !203, line: 25)
!203 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\cstring", directory: "", checksumkind: CSK_MD5, checksum: "8836d22258dd0dcd58ea9d9763256c9c")
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !205, file: !203, line: 26)
!205 = !DISubprogram(name: "memchr", linkageName: "?memchr@@YAPEAXPEAXH_K@Z", scope: !206, file: !206, line: 104, type: !207, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!206 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_memory.h", directory: "", checksumkind: CSK_MD5, checksum: "0b971aeac8757ee8ec347a03047c3b4a")
!207 = !DISubroutineType(types: !208)
!208 = !{!82, !82, !38, !21}
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !210, file: !203, line: 27)
!210 = !DISubprogram(name: "memcmp", scope: !211, file: !211, line: 29, type: !212, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!211 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\vcruntime_string.h", directory: "", checksumkind: CSK_MD5, checksum: "a54b085ffcc86a11803fd825bf8abeaa")
!212 = !DISubroutineType(types: !213)
!213 = !{!38, !108, !108, !21}
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !215, file: !203, line: 28)
!215 = !DISubprogram(name: "memcpy", scope: !211, file: !211, line: 43, type: !216, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!216 = !DISubroutineType(types: !217)
!217 = !{!82, !82, !108, !21}
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !219, file: !203, line: 29)
!219 = !DISubprogram(name: "memmove", scope: !211, file: !211, line: 50, type: !216, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !221, file: !203, line: 30)
!221 = !DISubprogram(name: "memset", scope: !211, file: !211, line: 63, type: !207, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !223, file: !203, line: 31)
!223 = !DISubprogram(name: "strcat", scope: !224, file: !224, line: 91, type: !225, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!224 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\string.h", directory: "", checksumkind: CSK_MD5, checksum: "9f780e8d323a4f33b8c61853c3c9471c")
!225 = !DISubroutineType(types: !226)
!226 = !{!56, !56, !62}
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !228, file: !203, line: 32)
!228 = !DISubprogram(name: "strchr", linkageName: "?strchr@@YAPEADQEADH@Z", scope: !224, file: !224, line: 500, type: !229, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!229 = !DISubroutineType(types: !230)
!230 = !{!56, !188, !231}
!231 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !38)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !233, file: !203, line: 33)
!233 = !DISubprogram(name: "strcmp", scope: !224, file: !224, line: 100, type: !138, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !235, file: !203, line: 34)
!235 = !DISubprogram(name: "strcoll", scope: !224, file: !224, line: 112, type: !138, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !237, file: !203, line: 35)
!237 = !DISubprogram(name: "strcpy", scope: !224, file: !224, line: 130, type: !225, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !239, file: !203, line: 36)
!239 = !DISubprogram(name: "strcspn", scope: !224, file: !224, line: 137, type: !240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!240 = !DISubroutineType(types: !241)
!241 = !{!21, !62, !62}
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !243, file: !203, line: 37)
!243 = !DISubprogram(name: "strerror", scope: !224, file: !224, line: 178, type: !244, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!244 = !DISubroutineType(types: !245)
!245 = !{!56, !38}
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !247, file: !203, line: 38)
!247 = !DISubprogram(name: "strlen", scope: !224, file: !224, line: 215, type: !248, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!248 = !DISubroutineType(types: !249)
!249 = !{!21, !62}
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !251, file: !203, line: 39)
!251 = !DISubprogram(name: "strncat", scope: !224, file: !224, line: 262, type: !252, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!252 = !DISubroutineType(types: !253)
!253 = !{!56, !56, !62, !21}
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !255, file: !203, line: 40)
!255 = !DISubprogram(name: "strncmp", scope: !224, file: !224, line: 271, type: !256, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!256 = !DISubroutineType(types: !257)
!257 = !{!38, !62, !62, !21}
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !259, file: !203, line: 41)
!259 = !DISubprogram(name: "strncpy", scope: !224, file: !224, line: 334, type: !252, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !261, file: !203, line: 42)
!261 = !DISubprogram(name: "strpbrk", linkageName: "?strpbrk@@YAPEADQEADQEBD@Z", scope: !224, file: !224, line: 506, type: !262, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!262 = !DISubroutineType(types: !263)
!263 = !{!56, !188, !69}
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !265, file: !203, line: 43)
!265 = !DISubprogram(name: "strrchr", linkageName: "?strrchr@@YAPEADQEADH@Z", scope: !224, file: !224, line: 512, type: !229, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !267, file: !203, line: 44)
!267 = !DISubprogram(name: "strspn", scope: !224, file: !224, line: 430, type: !240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !269, file: !203, line: 45)
!269 = !DISubprogram(name: "strstr", linkageName: "?strstr@@YAPEADQEADQEBD@Z", scope: !224, file: !224, line: 518, type: !262, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !271, file: !203, line: 46)
!271 = !DISubprogram(name: "strtok", scope: !224, file: !224, line: 436, type: !225, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !273, file: !203, line: 47)
!273 = !DISubprogram(name: "strxfrm", scope: !224, file: !224, line: 479, type: !274, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!274 = !DISubroutineType(types: !275)
!275 = !{!21, !56, !62, !21}
!276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !11, file: !277, line: 28)
!277 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\cwchar", directory: "", checksumkind: CSK_MD5, checksum: "de41ecfa6d57874e2c7d1a30e0e4ad43")
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !279, file: !277, line: 30)
!279 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !12, line: 617, baseType: !11)
!280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !21, file: !277, line: 31)
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !282, file: !277, line: 32)
!282 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !283, line: 26, size: 288, flags: DIFlagFwdDecl, identifier: ".?AUtm@@")
!283 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_wtime.h", directory: "", checksumkind: CSK_MD5, checksum: "2492ba0e16e5eeaa8a93d311a7316d6b")
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !285, file: !277, line: 33)
!285 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !12, line: 591, baseType: !18)
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !287, file: !277, line: 35)
!287 = !DISubprogram(name: "btowc", scope: !288, file: !288, line: 62, type: !289, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!288 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "50992c87c826ae29a05757af3914e0dd")
!289 = !DISubroutineType(types: !290)
!290 = !{!285, !38}
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !292, file: !277, line: 36)
!292 = !DISubprogram(name: "fgetwc", scope: !7, file: !7, line: 51, type: !293, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!293 = !DISubroutineType(types: !294)
!294 = !{!285, !33}
!295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !296, file: !277, line: 37)
!296 = !DISubprogram(name: "fgetws", scope: !7, file: !7, line: 79, type: !297, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!297 = !DISubroutineType(types: !298)
!298 = !{!299, !299, !38, !33}
!299 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !300, size: 64)
!300 = !DIBasicType(name: "wchar_t", size: 16, encoding: DW_ATE_unsigned)
!301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !302, file: !277, line: 38)
!302 = !DISubprogram(name: "fputwc", scope: !7, file: !7, line: 59, type: !303, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!303 = !DISubroutineType(types: !304)
!304 = !{!285, !300, !33}
!305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !306, file: !277, line: 39)
!306 = !DISubprogram(name: "fputws", scope: !7, file: !7, line: 86, type: !307, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!307 = !DISubroutineType(types: !308)
!308 = !{!38, !309, !33}
!309 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !310, size: 64)
!310 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !300)
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !312, file: !277, line: 40)
!312 = !DISubprogram(name: "fwide", scope: !288, file: !288, line: 184, type: !313, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!313 = !DISubroutineType(types: !314)
!314 = !{!38, !33, !38}
!315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !316, file: !277, line: 41)
!316 = !DISubprogram(name: "fwprintf", scope: !7, file: !7, line: 494, type: !317, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!317 = !DISubroutineType(types: !318)
!318 = !{!38, !68, !319, null}
!319 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !309)
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !321, file: !277, line: 42)
!321 = !DISubprogram(name: "fwscanf", scope: !7, file: !7, line: 856, type: !317, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !323, file: !277, line: 43)
!323 = !DISubprogram(name: "getwc", scope: !7, file: !7, line: 69, type: !293, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !325, file: !277, line: 44)
!325 = !DISubprogram(name: "getwchar", scope: !7, file: !7, line: 74, type: !326, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!326 = !DISubroutineType(types: !327)
!327 = !{!285}
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !329, file: !277, line: 45)
!329 = !DISubprogram(name: "mbrlen", scope: !288, file: !288, line: 66, type: !330, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!330 = !DISubroutineType(types: !331)
!331 = !{!21, !62, !21, !332}
!332 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !279, size: 64)
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !334, file: !277, line: 46)
!334 = !DISubprogram(name: "mbrtowc", scope: !288, file: !288, line: 72, type: !335, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!335 = !DISubroutineType(types: !336)
!336 = !{!21, !299, !62, !21, !332}
!337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !338, file: !277, line: 47)
!338 = !DISubprogram(name: "mbsrtowcs", scope: !288, file: !288, line: 99, type: !339, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!339 = !DISubroutineType(types: !340)
!340 = !{!21, !299, !341, !21, !332}
!341 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !343, file: !277, line: 48)
!343 = !DISubprogram(name: "mbsinit", scope: !288, file: !288, line: 193, type: !344, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!344 = !DISubroutineType(types: !345)
!345 = !{!38, !346}
!346 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !347, size: 64)
!347 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !279)
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !349, file: !277, line: 49)
!349 = !DISubprogram(name: "putwc", scope: !7, file: !7, line: 105, type: !303, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !351, file: !277, line: 50)
!351 = !DISubprogram(name: "putwchar", scope: !7, file: !7, line: 111, type: !352, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!352 = !DISubroutineType(types: !353)
!353 = !{!285, !300}
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !355, file: !277, line: 51)
!355 = !DISubprogram(name: "swprintf", linkageName: "?swprintf@@YAHQEA_WQEB_WZZ", scope: !7, file: !7, line: 1803, type: !356, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!356 = !DISubroutineType(types: !357)
!357 = !{!38, !358, !319, null}
!358 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !299)
!359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !360, file: !277, line: 52)
!360 = !DISubprogram(name: "swscanf", scope: !7, file: !7, line: 2018, type: !361, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!361 = !DISubroutineType(types: !362)
!362 = !{!38, !319, !319, null}
!363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !364, file: !277, line: 53)
!364 = !DISubprogram(name: "ungetwc", scope: !7, file: !7, line: 121, type: !365, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!365 = !DISubroutineType(types: !366)
!366 = !{!285, !285, !33}
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !368, file: !277, line: 54)
!368 = !DISubprogram(name: "vfwprintf", scope: !7, file: !7, line: 314, type: !369, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!369 = !DISubroutineType(types: !370)
!370 = !{!38, !68, !319, !174}
!371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !372, file: !277, line: 55)
!372 = !DISubprogram(name: "vswprintf", linkageName: "?vswprintf@@YAHQEA_WQEB_WPEAD@Z", scope: !7, file: !7, line: 1817, type: !373, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!373 = !DISubroutineType(types: !374)
!374 = !{!38, !358, !319, !174}
!375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !376, file: !277, line: 56)
!376 = !DISubprogram(name: "vwprintf", scope: !7, file: !7, line: 404, type: !377, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!377 = !DISubroutineType(types: !378)
!378 = !{!38, !319, !174}
!379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !380, file: !277, line: 57)
!380 = !DISubprogram(name: "wcrtomb", scope: !288, file: !288, line: 125, type: !381, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!381 = !DISubroutineType(types: !382)
!382 = !{!21, !56, !300, !332}
!383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !384, file: !277, line: 58)
!384 = !DISubprogram(name: "wprintf", scope: !7, file: !7, line: 608, type: !385, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!385 = !DISubroutineType(types: !386)
!386 = !{!38, !319, null}
!387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !388, file: !277, line: 59)
!388 = !DISubprogram(name: "wscanf", scope: !7, file: !7, line: 933, type: !385, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!389 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !390, file: !277, line: 60)
!390 = !DISubprogram(name: "wcsrtombs", scope: !288, file: !288, line: 152, type: !391, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!391 = !DISubroutineType(types: !392)
!392 = !{!21, !56, !393, !21, !332}
!393 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !309, size: 64)
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !395, file: !277, line: 61)
!395 = !DISubprogram(name: "wcstol", scope: !396, file: !396, line: 134, type: !397, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!396 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_wstdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "5b96d4421a65eb4a3e16dd6dc0574ba7")
!397 = !DISubroutineType(types: !398)
!398 = !{!93, !309, !399, !38}
!399 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !299, size: 64)
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !401, file: !277, line: 62)
!401 = !DISubprogram(name: "wcscat", scope: !402, file: !402, line: 100, type: !403, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!402 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_wstring.h", directory: "", checksumkind: CSK_MD5, checksum: "1e9764c381f45184fd3c47aaada60bf9")
!403 = !DISubroutineType(types: !404)
!404 = !{!299, !299, !309}
!405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !406, file: !277, line: 63)
!406 = !DISubprogram(name: "wcschr", linkageName: "?wcschr@@YAPEA_WPEA_W_W@Z", scope: !402, file: !402, line: 529, type: !407, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!407 = !DISubroutineType(types: !408)
!408 = !{!299, !299, !300}
!409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !410, file: !277, line: 64)
!410 = !DISubprogram(name: "wcscmp", scope: !402, file: !402, line: 108, type: !411, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!411 = !DISubroutineType(types: !412)
!412 = !{!38, !309, !309}
!413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !414, file: !277, line: 65)
!414 = !DISubprogram(name: "wcscoll", scope: !402, file: !402, line: 462, type: !411, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !416, file: !277, line: 66)
!416 = !DISubprogram(name: "wcscpy", scope: !402, file: !402, line: 119, type: !403, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !418, file: !277, line: 67)
!418 = !DISubprogram(name: "wcscspn", scope: !402, file: !402, line: 126, type: !419, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!419 = !DISubroutineType(types: !420)
!420 = !{!21, !309, !309}
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !422, file: !277, line: 68)
!422 = !DISubprogram(name: "wcslen", scope: !402, file: !402, line: 132, type: !423, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!423 = !DISubroutineType(types: !424)
!424 = !{!21, !309}
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !426, file: !277, line: 69)
!426 = !DISubprogram(name: "wcsncat", scope: !402, file: !402, line: 178, type: !427, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!427 = !DISubroutineType(types: !428)
!428 = !{!299, !299, !309, !21}
!429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !430, file: !277, line: 70)
!430 = !DISubprogram(name: "wcsncmp", scope: !402, file: !402, line: 187, type: !431, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!431 = !DISubroutineType(types: !432)
!432 = !{!38, !309, !309, !21}
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !434, file: !277, line: 71)
!434 = !DISubprogram(name: "wcsncpy", scope: !402, file: !402, line: 200, type: !427, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !436, file: !277, line: 72)
!436 = !DISubprogram(name: "wcspbrk", linkageName: "?wcspbrk@@YAPEA_WPEA_WPEB_W@Z", scope: !402, file: !402, line: 535, type: !403, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !438, file: !277, line: 73)
!438 = !DISubprogram(name: "wcsrchr", linkageName: "?wcsrchr@@YAPEA_WPEA_W_W@Z", scope: !402, file: !402, line: 541, type: !407, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !440, file: !277, line: 74)
!440 = !DISubprogram(name: "wcsspn", scope: !402, file: !402, line: 215, type: !419, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !442, file: !277, line: 75)
!442 = !DISubprogram(name: "wcstod", scope: !396, file: !396, line: 121, type: !443, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!443 = !DISubroutineType(types: !444)
!444 = !{!445, !309, !399}
!445 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !447, file: !277, line: 76)
!447 = !DISubprogram(name: "wcstoul", scope: !396, file: !396, line: 164, type: !448, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!448 = !DISubroutineType(types: !449)
!449 = !{!16, !309, !399, !38}
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !451, file: !277, line: 77)
!451 = !DISubprogram(name: "wcsstr", linkageName: "?wcsstr@@YAPEA_WPEA_WPEB_W@Z", scope: !402, file: !402, line: 548, type: !403, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !453, file: !277, line: 78)
!453 = !DISubprogram(name: "wcstok", linkageName: "?wcstok@@YAPEA_WPEA_WPEB_W@Z", scope: !402, file: !402, line: 253, type: !403, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !455, file: !277, line: 79)
!455 = !DISubprogram(name: "wcsxfrm", scope: !402, file: !402, line: 446, type: !456, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!456 = !DISubroutineType(types: !457)
!457 = !{!21, !299, !309, !21}
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !459, file: !277, line: 80)
!459 = !DISubprogram(name: "wctob", scope: !288, file: !288, line: 160, type: !460, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!460 = !DISubroutineType(types: !461)
!461 = !{!38, !285}
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !463, file: !277, line: 81)
!463 = !DISubprogram(name: "wmemchr", linkageName: "?wmemchr@@YAPEA_WPEA_W_W_K@Z", scope: !288, file: !288, line: 268, type: !464, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!464 = !DISubroutineType(types: !465)
!465 = !{!299, !299, !300, !21}
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !467, file: !277, line: 82)
!467 = !DISubprogram(name: "wmemcmp", scope: !288, file: !288, line: 213, type: !431, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !469, file: !277, line: 83)
!469 = !DISubprogram(name: "wmemcpy", scope: !288, file: !288, line: 229, type: !427, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !471, file: !277, line: 84)
!471 = !DISubprogram(name: "wmemmove", scope: !288, file: !288, line: 240, type: !427, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !473, file: !277, line: 85)
!473 = !DISubprogram(name: "wmemset", scope: !288, file: !288, line: 252, type: !464, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !475, file: !277, line: 86)
!475 = !DISubprogram(name: "wcsftime", scope: !283, file: !283, line: 69, type: !476, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!476 = !DISubroutineType(types: !477)
!477 = !{!21, !299, !21, !309, !478}
!478 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !479, size: 64)
!479 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !282)
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !481, file: !277, line: 88)
!481 = !DISubprogram(name: "vfwscanf", scope: !7, file: !7, line: 731, type: !369, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !483, file: !277, line: 89)
!483 = !DISubprogram(name: "vswscanf", scope: !7, file: !7, line: 1900, type: !484, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!484 = !DISubroutineType(types: !485)
!485 = !{!38, !309, !309, !174}
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !487, file: !277, line: 90)
!487 = !DISubprogram(name: "vwscanf", scope: !7, file: !7, line: 793, type: !377, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !489, file: !277, line: 91)
!489 = !DISubprogram(name: "wcstof", scope: !396, file: !396, line: 207, type: !490, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!490 = !DISubroutineType(types: !491)
!491 = !{!492, !309, !399}
!492 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !494, file: !277, line: 92)
!494 = !DISubprogram(name: "wcstold", scope: !396, file: !396, line: 194, type: !495, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!495 = !DISubroutineType(types: !496)
!496 = !{!497, !309, !399}
!497 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !499, file: !277, line: 93)
!499 = !DISubprogram(name: "wcstoll", scope: !396, file: !396, line: 149, type: !500, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!500 = !DISubroutineType(types: !501)
!501 = !{!27, !309, !399, !38}
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !503, file: !277, line: 94)
!503 = !DISubprogram(name: "wcstoull", scope: !396, file: !396, line: 179, type: !504, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!504 = !DISubroutineType(types: !505)
!505 = !{!23, !309, !399, !38}
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !507, file: !508, line: 94)
!507 = !DIDerivedType(tag: DW_TAG_typedef, name: "nullptr_t", scope: !5, file: !508, line: 93, baseType: !509)
!508 = !DIFile(filename: "C:\\Program Files\\LLVM\\lib\\clang\\12.0.0\\include\\stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!509 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "decltype(nullptr)")
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !511, file: !512, line: 23)
!511 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", file: !508, line: 35, baseType: !27)
!512 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\cstddef", directory: "", checksumkind: CSK_MD5, checksum: "1479f3900768e26e8836fd19109e117d")
!513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !514, file: !512, line: 24)
!514 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !508, line: 46, baseType: !23)
!515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !516, file: !512, line: 95)
!516 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", scope: !5, file: !512, line: 25, baseType: !445)
!517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !514, file: !518, line: 36)
!518 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\cstdlib", directory: "", checksumkind: CSK_MD5, checksum: "721d4b06441c95b75ef8fd32d75af028")
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !520, file: !518, line: 37)
!520 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !521, line: 279, baseType: !522)
!521 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "f957baaaf7f972e5b8d08c2855b49589")
!522 = !DICompositeType(tag: DW_TAG_structure_type, name: "_div_t", file: !521, line: 275, size: 64, flags: DIFlagFwdDecl, identifier: ".?AU_div_t@@")
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !524, file: !518, line: 38)
!524 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !521, line: 285, baseType: !525)
!525 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_ldiv_t", file: !521, line: 281, size: 64, flags: DIFlagTypePassByValue, elements: !526, identifier: ".?AU_ldiv_t@@")
!526 = !{!527, !528}
!527 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !525, file: !521, line: 283, baseType: !93, size: 32)
!528 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !525, file: !521, line: 284, baseType: !93, size: 32, offset: 32)
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !530, file: !518, line: 39)
!530 = !DISubprogram(name: "abort", scope: !521, file: !521, line: 60, type: !531, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!531 = !DISubroutineType(types: !532)
!532 = !{null}
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !534, file: !518, line: 40)
!534 = !DISubprogram(name: "abs", linkageName: "?abs@@YAOO@Z", scope: !518, file: !518, line: 31, type: !535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!535 = !DISubroutineType(types: !536)
!536 = !{!497, !497}
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !538, file: !518, line: 41)
!538 = !DISubprogram(name: "atexit", scope: !521, file: !521, line: 144, type: !539, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!539 = !DISubroutineType(types: !540)
!540 = !{!38, !541}
!541 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !531, size: 64)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !543, file: !518, line: 42)
!543 = !DISubprogram(name: "atof", scope: !521, file: !521, line: 450, type: !544, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!544 = !DISubroutineType(types: !545)
!545 = !{!445, !62}
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !547, file: !518, line: 43)
!547 = !DISubprogram(name: "atoi", scope: !521, file: !521, line: 451, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !549, file: !518, line: 44)
!549 = !DISubprogram(name: "atol", scope: !521, file: !521, line: 452, type: !550, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!550 = !DISubroutineType(types: !551)
!551 = !{!93, !62}
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !553, file: !518, line: 45)
!553 = !DISubprogram(name: "bsearch", scope: !554, file: !554, line: 52, type: !555, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!554 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_search.h", directory: "", checksumkind: CSK_MD5, checksum: "2a0a917cdb5d977c5fc7f09a83507d29")
!555 = !DISubroutineType(types: !556)
!556 = !{!82, !108, !108, !514, !514, !557}
!557 = !DIDerivedType(tag: DW_TAG_typedef, name: "_CoreCrtNonSecureSearchSortCompareFunction", file: !554, line: 24, baseType: !558)
!558 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !559, size: 64)
!559 = !DISubroutineType(types: !560)
!560 = !{!38, !108, !108}
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !562, file: !518, line: 46)
!562 = !DISubprogram(name: "calloc", scope: !563, file: !563, line: 66, type: !564, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!563 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_malloc.h", directory: "", checksumkind: CSK_MD5, checksum: "e7cb4d2b08d978a19e592af472eb7bd0")
!564 = !DISubroutineType(types: !565)
!565 = !{!82, !514, !514}
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !567, file: !518, line: 47)
!567 = !DISubprogram(name: "div", linkageName: "?div@@YA?AU_lldiv_t@@_J0@Z", scope: !521, file: !521, line: 378, type: !568, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!568 = !DISubroutineType(types: !569)
!569 = !{!570, !575, !575}
!570 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !521, line: 291, baseType: !571)
!571 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_lldiv_t", file: !521, line: 287, size: 128, flags: DIFlagTypePassByValue, elements: !572, identifier: ".?AU_lldiv_t@@")
!572 = !{!573, !574}
!573 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !571, file: !521, line: 289, baseType: !27, size: 64)
!574 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !571, file: !521, line: 290, baseType: !27, size: 64, offset: 64)
!575 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !27)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !577, file: !518, line: 48)
!577 = !DISubprogram(name: "exit", scope: !521, file: !521, line: 56, type: !578, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!578 = !DISubroutineType(types: !579)
!579 = !{null, !38}
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !581, file: !518, line: 49)
!581 = !DISubprogram(name: "free", scope: !563, file: !563, line: 89, type: !582, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!582 = !DISubroutineType(types: !583)
!583 = !{null, !82}
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !585, file: !518, line: 50)
!585 = !DISubprogram(name: "labs", scope: !521, file: !521, line: 294, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!586 = !DISubroutineType(types: !587)
!587 = !{!93, !93}
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !589, file: !518, line: 51)
!589 = !DISubprogram(name: "ldiv", scope: !521, file: !521, line: 303, type: !590, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!590 = !DISubroutineType(types: !591)
!591 = !{!524, !93, !93}
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !593, file: !518, line: 52)
!593 = !DISubprogram(name: "malloc", scope: !563, file: !563, line: 101, type: !594, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!594 = !DISubroutineType(types: !595)
!595 = !{!82, !514}
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !597, file: !518, line: 53)
!597 = !DISubprogram(name: "mblen", scope: !521, file: !521, line: 852, type: !598, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!598 = !DISubroutineType(types: !599)
!599 = !{!38, !62, !514}
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !601, file: !518, line: 54)
!601 = !DISubprogram(name: "mbstowcs", scope: !521, file: !521, line: 924, type: !602, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!602 = !DISubroutineType(types: !603)
!603 = !{!514, !299, !62, !514}
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !605, file: !518, line: 55)
!605 = !DISubprogram(name: "mbtowc", scope: !521, file: !521, line: 893, type: !606, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!606 = !DISubroutineType(types: !607)
!607 = !{!38, !299, !62, !514}
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !609, file: !518, line: 56)
!609 = !DISubprogram(name: "qsort", scope: !554, file: !554, line: 60, type: !610, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!610 = !DISubroutineType(types: !611)
!611 = !{null, !82, !514, !514, !557}
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !613, file: !518, line: 57)
!613 = !DISubprogram(name: "rand", scope: !521, file: !521, line: 352, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !615, file: !518, line: 58)
!615 = !DISubprogram(name: "realloc", scope: !563, file: !563, line: 126, type: !616, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!616 = !DISubroutineType(types: !617)
!617 = !{!82, !82, !514}
!618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !619, file: !518, line: 59)
!619 = !DISubprogram(name: "srand", scope: !521, file: !521, line: 350, type: !620, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!620 = !DISubroutineType(types: !621)
!621 = !{null, !622}
!622 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !624, file: !518, line: 60)
!624 = !DISubprogram(name: "strtod", scope: !521, file: !521, line: 502, type: !625, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!625 = !DISubroutineType(types: !626)
!626 = !{!445, !62, !627}
!627 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !629, file: !518, line: 61)
!629 = !DISubprogram(name: "strtol", scope: !521, file: !521, line: 528, type: !630, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!630 = !DISubroutineType(types: !631)
!631 = !{!93, !62, !627, !38}
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !633, file: !518, line: 62)
!633 = !DISubprogram(name: "strtoul", scope: !521, file: !521, line: 558, type: !634, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!634 = !DISubroutineType(types: !635)
!635 = !{!16, !62, !627, !38}
!636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !637, file: !518, line: 63)
!637 = !DISubprogram(name: "wcstombs", scope: !521, file: !521, line: 1012, type: !638, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!638 = !DISubroutineType(types: !639)
!639 = !{!514, !56, !309, !514}
!640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !641, file: !518, line: 64)
!641 = !DISubprogram(name: "wctomb", scope: !521, file: !521, line: 963, type: !642, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!642 = !DISubroutineType(types: !643)
!643 = !{!38, !56, !300}
!644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !570, file: !518, line: 66)
!645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !646, file: !518, line: 69)
!646 = !DISubprogram(name: "getenv", scope: !521, file: !521, line: 1184, type: !647, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!647 = !DISubroutineType(types: !648)
!648 = !{!56, !62}
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !650, file: !518, line: 70)
!650 = !DISubprogram(name: "system", scope: !521, file: !521, line: 1211, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !652, file: !518, line: 73)
!652 = !DISubprogram(name: "atoll", scope: !521, file: !521, line: 453, type: !653, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!653 = !DISubroutineType(types: !654)
!654 = !{!27, !62}
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !656, file: !518, line: 74)
!656 = !DISubprogram(name: "llabs", scope: !521, file: !521, line: 295, type: !657, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!657 = !DISubroutineType(types: !658)
!658 = !{!27, !27}
!659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !660, file: !518, line: 75)
!660 = !DISubprogram(name: "lldiv", scope: !521, file: !521, line: 304, type: !661, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!661 = !DISubroutineType(types: !662)
!662 = !{!570, !27, !27}
!663 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !664, file: !518, line: 76)
!664 = !DISubprogram(name: "strtof", scope: !521, file: !521, line: 489, type: !665, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!665 = !DISubroutineType(types: !666)
!666 = !{!492, !62, !627}
!667 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !668, file: !518, line: 77)
!668 = !DISubprogram(name: "strtold", scope: !521, file: !521, line: 515, type: !669, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!669 = !DISubroutineType(types: !670)
!670 = !{!497, !62, !627}
!671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !672, file: !518, line: 78)
!672 = !DISubprogram(name: "strtoll", scope: !521, file: !521, line: 543, type: !673, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!673 = !DISubroutineType(types: !674)
!674 = !{!27, !62, !627, !38}
!675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !676, file: !518, line: 79)
!676 = !DISubprogram(name: "strtoull", scope: !521, file: !521, line: 573, type: !677, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!677 = !DISubroutineType(types: !678)
!678 = !{!23, !62, !627, !38}
!679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !680, file: !518, line: 81)
!680 = !DISubprogram(name: "_Exit", scope: !521, file: !521, line: 58, type: !578, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !682, file: !518, line: 82)
!682 = !DISubprogram(name: "at_quick_exit", scope: !521, file: !521, line: 148, type: !539, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !684, file: !518, line: 83)
!684 = !DISubprogram(name: "quick_exit", scope: !521, file: !521, line: 59, type: !578, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!685 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !686, file: !689, line: 22)
!686 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !687, line: 18, baseType: !688)
!687 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "56e2956fe219a08d408dc2fb7a857cfc")
!688 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!689 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\cstdint", directory: "", checksumkind: CSK_MD5, checksum: "a82d27cf0f774e165b06000e45047591")
!690 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !691, file: !689, line: 23)
!691 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !687, line: 19, baseType: !692)
!692 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !694, file: !689, line: 24)
!694 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !687, line: 20, baseType: !38)
!695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !696, file: !689, line: 25)
!696 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !687, line: 21, baseType: !27)
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !698, file: !689, line: 26)
!698 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !687, line: 22, baseType: !699)
!699 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !701, file: !689, line: 27)
!701 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !687, line: 23, baseType: !18)
!702 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !703, file: !689, line: 28)
!703 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !687, line: 24, baseType: !622)
!704 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !705, file: !689, line: 29)
!705 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !687, line: 25, baseType: !23)
!706 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !707, file: !689, line: 31)
!707 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !687, line: 27, baseType: !688)
!708 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !709, file: !689, line: 32)
!709 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !687, line: 28, baseType: !692)
!710 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !711, file: !689, line: 33)
!711 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !687, line: 29, baseType: !38)
!712 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !713, file: !689, line: 34)
!713 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !687, line: 30, baseType: !27)
!714 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !715, file: !689, line: 35)
!715 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !687, line: 31, baseType: !699)
!716 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !717, file: !689, line: 36)
!717 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !687, line: 32, baseType: !18)
!718 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !719, file: !689, line: 37)
!719 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !687, line: 33, baseType: !622)
!720 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !721, file: !689, line: 38)
!721 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !687, line: 34, baseType: !23)
!722 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !723, file: !689, line: 40)
!723 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !687, line: 36, baseType: !688)
!724 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !725, file: !689, line: 41)
!725 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !687, line: 37, baseType: !38)
!726 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !727, file: !689, line: 42)
!727 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !687, line: 38, baseType: !38)
!728 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !729, file: !689, line: 43)
!729 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !687, line: 39, baseType: !27)
!730 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !731, file: !689, line: 44)
!731 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !687, line: 40, baseType: !699)
!732 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !733, file: !689, line: 45)
!733 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !687, line: 41, baseType: !622)
!734 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !735, file: !689, line: 46)
!735 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !687, line: 42, baseType: !622)
!736 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !737, file: !689, line: 47)
!737 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !687, line: 43, baseType: !23)
!738 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !739, file: !689, line: 49)
!739 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !687, line: 45, baseType: !27)
!740 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !741, file: !689, line: 50)
!741 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !22, line: 195, baseType: !27)
!742 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !743, file: !689, line: 51)
!743 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !687, line: 46, baseType: !23)
!744 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !745, file: !689, line: 52)
!745 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !175, line: 61, baseType: !23)
!746 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !686, file: !689, line: 56)
!747 = !DINamespace(name: "tr1", scope: !5)
!748 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !691, file: !689, line: 57)
!749 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !694, file: !689, line: 58)
!750 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !696, file: !689, line: 59)
!751 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !698, file: !689, line: 60)
!752 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !701, file: !689, line: 61)
!753 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !703, file: !689, line: 62)
!754 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !705, file: !689, line: 63)
!755 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !707, file: !689, line: 65)
!756 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !709, file: !689, line: 66)
!757 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !711, file: !689, line: 67)
!758 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !713, file: !689, line: 68)
!759 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !715, file: !689, line: 69)
!760 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !717, file: !689, line: 70)
!761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !719, file: !689, line: 71)
!762 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !721, file: !689, line: 72)
!763 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !723, file: !689, line: 74)
!764 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !725, file: !689, line: 75)
!765 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !727, file: !689, line: 76)
!766 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !729, file: !689, line: 77)
!767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !731, file: !689, line: 78)
!768 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !733, file: !689, line: 79)
!769 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !735, file: !689, line: 80)
!770 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !737, file: !689, line: 81)
!771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !739, file: !689, line: 83)
!772 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !741, file: !689, line: 84)
!773 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !743, file: !689, line: 85)
!774 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !745, file: !689, line: 86)
!775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !776, file: !795, line: 2339)
!776 = !DIDerivedType(tag: DW_TAG_typedef, name: "false_type", scope: !5, file: !777, line: 42, baseType: !778)
!777 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\xtr1common", directory: "", checksumkind: CSK_MD5, checksum: "30144ce5d9b954ba3b99adea12ced09e")
!778 = !DIDerivedType(tag: DW_TAG_typedef, name: "bool_constant<false>", scope: !5, file: !777, line: 39, baseType: !779)
!779 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "integral_constant<bool,0>", scope: !5, file: !777, line: 22, size: 8, flags: DIFlagTypePassByValue, elements: !780, templateParams: !792, identifier: ".?AU?$integral_constant@_N$0A@@std@@")
!780 = !{!781, !784, !785, !786, !791}
!781 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !779, file: !777, line: 23, baseType: !782, flags: DIFlagStaticMember)
!782 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !783)
!783 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!784 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !779, file: !777, line: 25, baseType: !783)
!785 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !779, file: !777, line: 26, baseType: !779)
!786 = !DISubprogram(name: "operator bool", linkageName: "??B?$integral_constant@_N$0A@@std@@QEBA_NXZ", scope: !779, file: !777, line: 28, type: !787, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!787 = !DISubroutineType(types: !788)
!788 = !{!784, !789}
!789 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !790, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!790 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !779)
!791 = !DISubprogram(name: "operator()", linkageName: "??R?$integral_constant@_N$0A@@std@@QEBA_NXZ", scope: !779, file: !777, line: 32, type: !787, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!792 = !{!793, !794}
!793 = !DITemplateTypeParameter(name: "_Ty", type: !783)
!794 = !DITemplateValueParameter(name: "_Val", type: !783, value: i8 0)
!795 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\type_traits", directory: "", checksumkind: CSK_MD5, checksum: "ecb5b30d3e7f60a1bc5b2141e5fc8ae3")
!796 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !747, entity: !797, file: !795, line: 2381)
!797 = !DIDerivedType(tag: DW_TAG_typedef, name: "true_type", scope: !5, file: !777, line: 41, baseType: !798)
!798 = !DIDerivedType(tag: DW_TAG_typedef, name: "bool_constant<true>", scope: !5, file: !777, line: 39, baseType: !799)
!799 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "integral_constant<bool,1>", scope: !5, file: !777, line: 22, size: 8, flags: DIFlagTypePassByValue, elements: !800, templateParams: !810, identifier: ".?AU?$integral_constant@_N$00@std@@")
!800 = !{!801, !802, !803, !804, !809}
!801 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !799, file: !777, line: 23, baseType: !782, flags: DIFlagStaticMember)
!802 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !799, file: !777, line: 25, baseType: !783)
!803 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !799, file: !777, line: 26, baseType: !799)
!804 = !DISubprogram(name: "operator bool", linkageName: "??B?$integral_constant@_N$00@std@@QEBA_NXZ", scope: !799, file: !777, line: 28, type: !805, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!805 = !DISubroutineType(types: !806)
!806 = !{!802, !807}
!807 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !808, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!808 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !799)
!809 = !DISubprogram(name: "operator()", linkageName: "??R?$integral_constant@_N$00@std@@QEBA_NXZ", scope: !799, file: !777, line: 32, type: !805, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!810 = !{!793, !811}
!811 = !DITemplateValueParameter(name: "_Val", type: !783, value: i8 1)
!812 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !813, file: !815, line: 37)
!813 = !DISubprogram(name: "terminate", scope: !814, file: !814, line: 33, type: !531, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!814 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_terminate.h", directory: "", checksumkind: CSK_MD5, checksum: "2a539d6fe462a6cd4820acb34d25230b")
!815 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\exception", directory: "", checksumkind: CSK_MD5, checksum: "502d5f1c44a13b98a4e0212cf4da2c8e")
!816 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !817, file: !815, line: 40)
!817 = !DISubprogram(name: "set_terminate", scope: !814, file: !814, line: 37, type: !818, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!818 = !DISubroutineType(types: !819)
!819 = !{!820, !820}
!820 = !DIDerivedType(tag: DW_TAG_typedef, name: "terminate_handler", file: !814, line: 22, baseType: !541)
!821 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !820, file: !815, line: 41)
!822 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !823, file: !815, line: 49)
!823 = !DISubprogram(name: "unexpected", scope: !824, file: !824, line: 35, type: !531, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!824 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\eh.h", directory: "", checksumkind: CSK_MD5, checksum: "4a999be6308e84b5845d84cd2463ce9d")
!825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !826, file: !815, line: 52)
!826 = !DISubprogram(name: "set_unexpected", scope: !824, file: !824, line: 39, type: !827, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!827 = !DISubroutineType(types: !828)
!828 = !{!829, !829}
!829 = !DIDerivedType(tag: DW_TAG_typedef, name: "unexpected_handler", file: !824, line: 23, baseType: !541)
!830 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !829, file: !815, line: 53)
!831 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !832, file: !834, line: 38)
!832 = !DISubprogram(name: "isalnum", scope: !833, file: !833, line: 53, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!833 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "637d97803cfc8841aa28027834c41330")
!834 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\cctype", directory: "", checksumkind: CSK_MD5, checksum: "02efabf6237906f874632fa4f9f858e4")
!835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !836, file: !834, line: 39)
!836 = !DISubprogram(name: "isalpha", scope: !833, file: !833, line: 31, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !838, file: !834, line: 40)
!838 = !DISubprogram(name: "iscntrl", scope: !833, file: !833, line: 59, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !840, file: !834, line: 41)
!840 = !DISubprogram(name: "isdigit", scope: !833, file: !833, line: 39, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !842, file: !834, line: 42)
!842 = !DISubprogram(name: "isgraph", scope: !833, file: !833, line: 57, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !844, file: !834, line: 43)
!844 = !DISubprogram(name: "islower", scope: !833, file: !833, line: 35, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !846, file: !834, line: 44)
!846 = !DISubprogram(name: "isprint", scope: !833, file: !833, line: 55, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!847 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !848, file: !834, line: 45)
!848 = !DISubprogram(name: "ispunct", scope: !833, file: !833, line: 49, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !850, file: !834, line: 46)
!850 = !DISubprogram(name: "isspace", scope: !833, file: !833, line: 46, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !852, file: !834, line: 47)
!852 = !DISubprogram(name: "isupper", scope: !833, file: !833, line: 33, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!853 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !854, file: !834, line: 48)
!854 = !DISubprogram(name: "isxdigit", scope: !833, file: !833, line: 42, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !856, file: !834, line: 49)
!856 = !DISubprogram(name: "tolower", scope: !833, file: !833, line: 66, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!857 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !858, file: !834, line: 50)
!858 = !DISubprogram(name: "toupper", scope: !833, file: !833, line: 63, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!859 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !860, file: !834, line: 52)
!860 = !DISubprogram(name: "isblank", scope: !833, file: !833, line: 51, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!861 = !{!"/FAILIFMISMATCH:\22_MSC_VER=1900\22"}
!862 = !{!"/FAILIFMISMATCH:\22_ITERATOR_DEBUG_LEVEL=0\22"}
!863 = !{!"/FAILIFMISMATCH:\22RuntimeLibrary=MT_StaticRelease\22"}
!864 = !{!"/DEFAULTLIB:libcpmt.lib"}
!865 = !{!"/FAILIFMISMATCH:\22_CRT_STDIO_ISO_WIDE_SPECIFIERS=0\22"}
!866 = !{i32 2, !"CodeView", i32 1}
!867 = !{i32 2, !"Debug Info Version", i32 3}
!868 = !{i32 1, !"wchar_size", i32 2}
!869 = !{i32 7, !"PIC Level", i32 2}
!870 = !{!"clang version 12.0.0"}
!871 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !872, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !874)
!872 = !DISubroutineType(types: !873)
!873 = !{!38, !38, !627}
!874 = !{!875, !876, !877, !878, !879, !880, !891, !895, !897, !900, !902, !903, !905}
!875 = !DILocalVariable(name: "argv", arg: 2, scope: !871, file: !1, line: 3, type: !627)
!876 = !DILocalVariable(name: "argc", arg: 1, scope: !871, file: !1, line: 3, type: !38)
!877 = !DILocalVariable(name: "x", scope: !871, file: !1, line: 5, type: !38)
!878 = !DILocalVariable(name: "full", scope: !871, file: !1, line: 6, type: !38)
!879 = !DILocalVariable(name: "element", scope: !871, file: !1, line: 7, type: !38)
!880 = !DILocalVariable(name: "ec", scope: !871, file: !1, line: 9, type: !881)
!881 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "ExampleClass", file: !882, line: 10, size: 64, flags: DIFlagTypePassByValue, elements: !883, identifier: ".?AVExampleClass@@")
!882 = !DIFile(filename: "./func2.hpp", directory: "E:\\Documents\\Work Stuff\\Active Work Files\\Code Examples\\test_cpp01", checksumkind: CSK_MD5, checksum: "96293cd1becb4c962378161debdb3204")
!883 = !{!884, !885, !886, !890}
!884 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !881, file: !882, line: 12, baseType: !38, size: 32, flags: DIFlagPublic)
!885 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !881, file: !882, line: 13, baseType: !38, size: 32, offset: 32, flags: DIFlagPublic)
!886 = !DISubprogram(name: "setA", linkageName: "?setA@ExampleClass@@QEAAXH@Z", scope: !881, file: !882, line: 14, type: !887, scopeLine: 14, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!887 = !DISubroutineType(types: !888)
!888 = !{null, !889, !38}
!889 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !881, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!890 = !DISubprogram(name: "setB", linkageName: "?setB@ExampleClass@@QEAAXH@Z", scope: !881, file: !882, line: 17, type: !887, scopeLine: 17, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!891 = !DILocalVariable(name: "array", scope: !871, file: !1, line: 20, type: !892)
!892 = !DICompositeType(tag: DW_TAG_array_type, baseType: !38, size: 96, elements: !893)
!893 = !{!894}
!894 = !DISubrange(count: 3)
!895 = !DILocalVariable(name: "i", scope: !896, file: !1, line: 22, type: !38)
!896 = distinct !DILexicalBlock(scope: !871, file: !1, line: 22, column: 3)
!897 = !DILocalVariable(name: "__range1", scope: !898, type: !899, flags: DIFlagArtificial)
!898 = distinct !DILexicalBlock(scope: !871, file: !1, line: 26, column: 3)
!899 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !892, size: 64)
!900 = !DILocalVariable(name: "__begin1", scope: !898, type: !901, flags: DIFlagArtificial)
!901 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!902 = !DILocalVariable(name: "__end1", scope: !898, type: !901, flags: DIFlagArtificial)
!903 = !DILocalVariable(name: "i", scope: !904, file: !1, line: 26, type: !38)
!904 = distinct !DILexicalBlock(scope: !898, file: !1, line: 26, column: 3)
!905 = !DILocalVariable(name: "value", scope: !871, file: !1, line: 30, type: !38)
!906 = !{!907, !907, i64 0}
!907 = !{!"any pointer", !908, i64 0}
!908 = !{!"omnipotent char", !909, i64 0}
!909 = !{!"Simple C++ TBAA"}
!910 = !DILocation(line: 3, column: 27, scope: !871)
!911 = !{!912, !912, i64 0}
!912 = !{!"int", !908, i64 0}
!913 = !DILocation(line: 3, column: 14, scope: !871)
!914 = !DILocation(line: 5, column: 3, scope: !871)
!915 = !DILocation(line: 5, column: 7, scope: !871)
!916 = !DILocation(line: 6, column: 3, scope: !871)
!917 = !DILocation(line: 6, column: 7, scope: !871)
!918 = !DILocation(line: 7, column: 3, scope: !871)
!919 = !DILocation(line: 7, column: 7, scope: !871)
!920 = !DILocation(line: 9, column: 3, scope: !871)
!921 = !DILocation(line: 9, column: 16, scope: !871)
!922 = !DILocation(line: 10, column: 6, scope: !871)
!923 = !DILocation(line: 11, column: 6, scope: !871)
!924 = !DILocation(line: 14, column: 3, scope: !871)
!925 = !DILocation(line: 14, column: 9, scope: !871)
!926 = !DILocation(line: 14, column: 14, scope: !871)
!927 = !DILocation(line: 14, column: 11, scope: !871)
!928 = !DILocation(line: 15, column: 5, scope: !929)
!929 = distinct !DILexicalBlock(scope: !871, file: !1, line: 14, column: 20)
!930 = !DILocation(line: 16, column: 12, scope: !929)
!931 = !DILocation(line: 16, column: 10, scope: !929)
!932 = distinct !{!932, !924, !933, !934}
!933 = !DILocation(line: 17, column: 3, scope: !871)
!934 = !{!"llvm.loop.mustprogress"}
!935 = !DILocation(line: 20, column: 3, scope: !871)
!936 = !DILocation(line: 20, column: 7, scope: !871)
!937 = !DILocation(line: 22, column: 7, scope: !896)
!938 = !DILocation(line: 22, column: 11, scope: !896)
!939 = !DILocation(line: 22, column: 18, scope: !940)
!940 = distinct !DILexicalBlock(scope: !896, file: !1, line: 22, column: 3)
!941 = !DILocation(line: 22, column: 20, scope: !940)
!942 = !DILocation(line: 22, column: 3, scope: !896)
!943 = !DILocation(line: 22, column: 3, scope: !940)
!944 = !DILocation(line: 23, column: 20, scope: !945)
!945 = distinct !DILexicalBlock(scope: !940, file: !1, line: 22, column: 31)
!946 = !DILocation(line: 23, column: 14, scope: !945)
!947 = !DILocation(line: 23, column: 12, scope: !945)
!948 = !DILocation(line: 24, column: 3, scope: !945)
!949 = !DILocation(line: 22, column: 27, scope: !940)
!950 = distinct !{!950, !942, !951, !934}
!951 = !DILocation(line: 24, column: 3, scope: !896)
!952 = !DILocation(line: 26, column: 16, scope: !898)
!953 = !DILocation(line: 0, scope: !898)
!954 = !DILocation(line: 26, column: 14, scope: !898)
!955 = !DILocation(line: 26, column: 8, scope: !904)
!956 = !DILocation(line: 26, column: 12, scope: !904)
!957 = !DILocation(line: 26, column: 14, scope: !904)
!958 = !DILocation(line: 27, column: 12, scope: !959)
!959 = distinct !DILexicalBlock(scope: !904, file: !1, line: 26, column: 23)
!960 = !DILocation(line: 27, column: 10, scope: !959)
!961 = !DILocation(line: 28, column: 3, scope: !898)
!962 = !DILocation(line: 26, column: 3, scope: !898)
!963 = distinct !{!963, !962, !961}
!964 = !DILocation(line: 30, column: 3, scope: !871)
!965 = !DILocation(line: 30, column: 7, scope: !871)
!966 = !DILocation(line: 32, column: 7, scope: !967)
!967 = distinct !DILexicalBlock(scope: !871, file: !1, line: 32, column: 7)
!968 = !DILocation(line: 32, column: 13, scope: !967)
!969 = !DILocation(line: 32, column: 7, scope: !871)
!970 = !DILocation(line: 33, column: 10, scope: !971)
!971 = distinct !DILexicalBlock(scope: !967, file: !1, line: 32, column: 19)
!972 = !DILocation(line: 34, column: 3, scope: !971)
!973 = !DILocation(line: 34, column: 14, scope: !974)
!974 = distinct !DILexicalBlock(scope: !967, file: !1, line: 34, column: 14)
!975 = !DILocation(line: 34, column: 20, scope: !974)
!976 = !DILocation(line: 34, column: 14, scope: !967)
!977 = !DILocation(line: 35, column: 10, scope: !978)
!978 = distinct !DILexicalBlock(scope: !974, file: !1, line: 34, column: 26)
!979 = !DILocation(line: 36, column: 3, scope: !978)
!980 = !DILocation(line: 37, column: 10, scope: !981)
!981 = distinct !DILexicalBlock(scope: !974, file: !1, line: 36, column: 10)
!982 = !DILocation(line: 40, column: 10, scope: !871)
!983 = !DILocation(line: 40, column: 3, scope: !871)
!984 = !DILocation(line: 42, column: 11, scope: !985)
!985 = distinct !DILexicalBlock(scope: !871, file: !1, line: 40, column: 17)
!986 = !DILocation(line: 43, column: 3, scope: !985)
!987 = !DILocation(line: 45, column: 11, scope: !985)
!988 = !DILocation(line: 46, column: 3, scope: !985)
!989 = !DILocation(line: 48, column: 11, scope: !985)
!990 = !DILocation(line: 49, column: 3, scope: !985)
!991 = !DILocation(line: 51, column: 14, scope: !871)
!992 = !DILocation(line: 51, column: 20, scope: !871)
!993 = !DILocation(line: 51, column: 13, scope: !871)
!994 = !DILocation(line: 51, column: 11, scope: !871)
!995 = !DILocation(line: 54, column: 1, scope: !871)
!996 = !DILocation(line: 53, column: 3, scope: !871)
!997 = distinct !DISubprogram(name: "setA", linkageName: "?setA@ExampleClass@@QEAAXH@Z", scope: !881, file: !882, line: 14, type: !887, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !886, retainedNodes: !998)
!998 = !{!999, !1000}
!999 = !DILocalVariable(name: "a", arg: 2, scope: !997, file: !882, line: 14, type: !38)
!1000 = !DILocalVariable(name: "this", arg: 1, scope: !997, type: !1001, flags: DIFlagArtificial | DIFlagObjectPointer)
!1001 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !881, size: 64)
!1002 = !DILocation(line: 14, column: 17, scope: !997)
!1003 = !DILocation(line: 0, scope: !997)
!1004 = !DILocation(line: 15, column: 15, scope: !997)
!1005 = !DILocation(line: 15, column: 11, scope: !997)
!1006 = !DILocation(line: 15, column: 13, scope: !997)
!1007 = !{!1008, !912, i64 0}
!1008 = !{!"?AVExampleClass@@", !912, i64 0, !912, i64 4}
!1009 = !DILocation(line: 16, column: 3, scope: !997)
!1010 = distinct !DISubprogram(name: "setB", linkageName: "?setB@ExampleClass@@QEAAXH@Z", scope: !881, file: !882, line: 17, type: !887, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !890, retainedNodes: !1011)
!1011 = !{!1012, !1013}
!1012 = !DILocalVariable(name: "b", arg: 2, scope: !1010, file: !882, line: 17, type: !38)
!1013 = !DILocalVariable(name: "this", arg: 1, scope: !1010, type: !1001, flags: DIFlagArtificial | DIFlagObjectPointer)
!1014 = !DILocation(line: 17, column: 17, scope: !1010)
!1015 = !DILocation(line: 0, scope: !1010)
!1016 = !DILocation(line: 18, column: 15, scope: !1010)
!1017 = !DILocation(line: 18, column: 11, scope: !1010)
!1018 = !DILocation(line: 18, column: 13, scope: !1010)
!1019 = !{!1008, !912, i64 4}
!1020 = !DILocation(line: 19, column: 3, scope: !1010)

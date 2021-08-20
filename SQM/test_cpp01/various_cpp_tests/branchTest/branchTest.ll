; ModuleID = 'branchTest.cpp'
source_filename = "branchTest.cpp"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.29.30038"

; Function Attrs: nounwind uwtable mustprogress
define dso_local i32 @"?scaryBranches@@YAHH@Z"(i32 %0) #0 !dbg !8 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !16
  call void @llvm.dbg.declare(metadata i32* %2, metadata !13, metadata !DIExpression()), !dbg !20
  %5 = bitcast i32* %3 to i8*, !dbg !21
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #4, !dbg !21
  call void @llvm.dbg.declare(metadata i32* %3, metadata !14, metadata !DIExpression()), !dbg !22
  %6 = bitcast i32* %4 to i8*, !dbg !23
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #4, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %4, metadata !15, metadata !DIExpression()), !dbg !24
  %7 = load i32, i32* %2, align 4, !dbg !25, !tbaa !16
  %8 = icmp eq i32 %7, 0, !dbg !27
  br i1 %8, label %9, label %10, !dbg !28

9:                                                ; preds = %1
  store i32 1, i32* %3, align 4, !dbg !29, !tbaa !16
  br label %16, !dbg !30

10:                                               ; preds = %1
  %11 = load i32, i32* %2, align 4, !dbg !31, !tbaa !16
  %12 = icmp eq i32 %11, 1, !dbg !33
  br i1 %12, label %13, label %14, !dbg !34

13:                                               ; preds = %10
  store i32 -1, i32* %3, align 4, !dbg !35, !tbaa !16
  br label %15, !dbg !36

14:                                               ; preds = %10
  store i32 0, i32* %3, align 4, !dbg !37, !tbaa !16
  br label %15

15:                                               ; preds = %14, %13
  br label %16

16:                                               ; preds = %15, %9
  %17 = load i32, i32* %3, align 4, !dbg !38, !tbaa !16
  %18 = icmp eq i32 %17, 0, !dbg !40
  br i1 %18, label %19, label %20, !dbg !41

19:                                               ; preds = %16
  store i32 0, i32* %3, align 4, !dbg !42, !tbaa !16
  br label %20, !dbg !43

20:                                               ; preds = %19, %16
  %21 = load i32, i32* %3, align 4, !dbg !44, !tbaa !16
  %22 = icmp eq i32 %21, 0, !dbg !46
  br i1 %22, label %23, label %24, !dbg !47

23:                                               ; preds = %20
  store i32 0, i32* %3, align 4, !dbg !48, !tbaa !16
  br label %26, !dbg !49

24:                                               ; preds = %20
  %25 = load i32, i32* %3, align 4, !dbg !50, !tbaa !16
  store i32 %25, i32* %4, align 4, !dbg !51, !tbaa !16
  br label %26

26:                                               ; preds = %24, %23
  %27 = load i32, i32* %3, align 4, !dbg !52, !tbaa !16
  %28 = bitcast i32* %4 to i8*, !dbg !53
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %28) #4, !dbg !53
  %29 = bitcast i32* %3 to i8*, !dbg !53
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %29) #4, !dbg !53
  ret i32 %27, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable mustprogress
define dso_local i32 @"?scaryBranchesTwo@@YAHH@Z"(i32 %0) #0 !dbg !55 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !16
  call void @llvm.dbg.declare(metadata i32* %2, metadata !57, metadata !DIExpression()), !dbg !60
  %5 = bitcast i32* %3 to i8*, !dbg !61
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #4, !dbg !61
  call void @llvm.dbg.declare(metadata i32* %3, metadata !58, metadata !DIExpression()), !dbg !62
  %6 = bitcast i32* %4 to i8*, !dbg !63
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #4, !dbg !63
  call void @llvm.dbg.declare(metadata i32* %4, metadata !59, metadata !DIExpression()), !dbg !64
  %7 = load i32, i32* %2, align 4, !dbg !65, !tbaa !16
  %8 = icmp eq i32 %7, 0, !dbg !67
  br i1 %8, label %9, label %10, !dbg !68

9:                                                ; preds = %1
  store i32 1, i32* %3, align 4, !dbg !69, !tbaa !16
  br label %16, !dbg !70

10:                                               ; preds = %1
  %11 = load i32, i32* %2, align 4, !dbg !71, !tbaa !16
  %12 = icmp eq i32 %11, 1, !dbg !73
  br i1 %12, label %13, label %14, !dbg !74

13:                                               ; preds = %10
  store i32 -1, i32* %3, align 4, !dbg !75, !tbaa !16
  br label %15, !dbg !76

14:                                               ; preds = %10
  store i32 0, i32* %3, align 4, !dbg !77, !tbaa !16
  br label %15

15:                                               ; preds = %14, %13
  br label %16

16:                                               ; preds = %15, %9
  %17 = load i32, i32* %3, align 4, !dbg !78, !tbaa !16
  %18 = icmp eq i32 %17, 0, !dbg !80
  br i1 %18, label %19, label %20, !dbg !81

19:                                               ; preds = %16
  store i32 0, i32* %3, align 4, !dbg !82, !tbaa !16
  br label %20, !dbg !83

20:                                               ; preds = %19, %16
  %21 = load i32, i32* %3, align 4, !dbg !84, !tbaa !16
  %22 = icmp eq i32 %21, 0, !dbg !86
  br i1 %22, label %23, label %24, !dbg !87

23:                                               ; preds = %20
  store i32 0, i32* %3, align 4, !dbg !88, !tbaa !16
  br label %26, !dbg !89

24:                                               ; preds = %20
  %25 = load i32, i32* %3, align 4, !dbg !90, !tbaa !16
  store i32 %25, i32* %4, align 4, !dbg !91, !tbaa !16
  br label %26

26:                                               ; preds = %24, %23
  %27 = load i32, i32* %3, align 4, !dbg !92, !tbaa !16
  %28 = icmp ne i32 %27, 0, !dbg !94
  br i1 %28, label %29, label %32, !dbg !95

29:                                               ; preds = %26
  %30 = call i32 @"?scaryBranches@@YAHH@Z"(i32 3), !dbg !96
  %31 = call i32 @"?scaryBranches@@YAHH@Z"(i32 %30), !dbg !97
  br label %32, !dbg !97

32:                                               ; preds = %29, %26
  %33 = load i32, i32* %3, align 4, !dbg !98, !tbaa !16
  %34 = bitcast i32* %4 to i8*, !dbg !99
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %34) #4, !dbg !99
  %35 = bitcast i32* %3 to i8*, !dbg !99
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %35) #4, !dbg !99
  ret i32 %33, !dbg !100
}

; Function Attrs: nounwind uwtable mustprogress
define dso_local i32 @"?scaryBranchesThree@@YAHH@Z"(i32 %0) #0 !dbg !101 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !16
  call void @llvm.dbg.declare(metadata i32* %2, metadata !103, metadata !DIExpression()), !dbg !108
  %5 = bitcast i32* %3 to i8*, !dbg !109
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #4, !dbg !109
  call void @llvm.dbg.declare(metadata i32* %3, metadata !104, metadata !DIExpression()), !dbg !110
  %6 = load i32, i32* %2, align 4, !dbg !111, !tbaa !16
  %7 = icmp sge i32 %6, 0, !dbg !112
  br i1 %7, label %8, label %31, !dbg !113

8:                                                ; preds = %1
  %9 = bitcast i32* %4 to i8*, !dbg !114
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #4, !dbg !114
  call void @llvm.dbg.declare(metadata i32* %4, metadata !105, metadata !DIExpression()), !dbg !115
  %10 = load i32, i32* %2, align 4, !dbg !116, !tbaa !16
  %11 = icmp eq i32 %10, 0, !dbg !118
  br i1 %11, label %12, label %13, !dbg !119

12:                                               ; preds = %8
  store i32 1, i32* %3, align 4, !dbg !120, !tbaa !16
  br label %19, !dbg !122

13:                                               ; preds = %8
  %14 = load i32, i32* %2, align 4, !dbg !123, !tbaa !16
  %15 = icmp eq i32 %14, 1, !dbg !125
  br i1 %15, label %16, label %17, !dbg !126

16:                                               ; preds = %13
  store i32 -1, i32* %3, align 4, !dbg !127, !tbaa !16
  br label %18, !dbg !129

17:                                               ; preds = %13
  store i32 0, i32* %3, align 4, !dbg !130, !tbaa !16
  br label %18

18:                                               ; preds = %17, %16
  br label %19

19:                                               ; preds = %18, %12
  %20 = load i32, i32* %3, align 4, !dbg !132, !tbaa !16
  %21 = icmp eq i32 %20, 0, !dbg !134
  br i1 %21, label %22, label %23, !dbg !135

22:                                               ; preds = %19
  store i32 0, i32* %3, align 4, !dbg !136, !tbaa !16
  br label %23, !dbg !138

23:                                               ; preds = %22, %19
  %24 = load i32, i32* %3, align 4, !dbg !139, !tbaa !16
  %25 = icmp eq i32 %24, 0, !dbg !141
  br i1 %25, label %26, label %27, !dbg !142

26:                                               ; preds = %23
  store i32 0, i32* %3, align 4, !dbg !143, !tbaa !16
  br label %29, !dbg !145

27:                                               ; preds = %23
  %28 = load i32, i32* %3, align 4, !dbg !146, !tbaa !16
  store i32 %28, i32* %4, align 4, !dbg !148, !tbaa !16
  br label %29

29:                                               ; preds = %27, %26
  %30 = bitcast i32* %4 to i8*, !dbg !149
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %30) #4, !dbg !149
  br label %32, !dbg !150

31:                                               ; preds = %1
  store i32 0, i32* %3, align 4, !dbg !151, !tbaa !16
  br label %32

32:                                               ; preds = %31, %29
  %33 = load i32, i32* %3, align 4, !dbg !153, !tbaa !16
  %34 = bitcast i32* %3 to i8*, !dbg !154
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %34) #4, !dbg !154
  ret i32 %33, !dbg !155
}

; Function Attrs: norecurse nounwind uwtable mustprogress
define dso_local i32 @main() #3 !dbg !156 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %8 = bitcast i32* %2 to i8*, !dbg !166
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #4, !dbg !166
  call void @llvm.dbg.declare(metadata i32* %2, metadata !160, metadata !DIExpression()), !dbg !167
  store i32 0, i32* %2, align 4, !dbg !167, !tbaa !16
  %9 = bitcast i32* %3 to i8*, !dbg !168
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #4, !dbg !168
  call void @llvm.dbg.declare(metadata i32* %3, metadata !161, metadata !DIExpression()), !dbg !169
  %10 = bitcast i32* %4 to i8*, !dbg !170
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %10) #4, !dbg !170
  call void @llvm.dbg.declare(metadata i32* %4, metadata !162, metadata !DIExpression()), !dbg !171
  %11 = load i32, i32* %2, align 4, !dbg !172, !tbaa !16
  %12 = icmp eq i32 %11, 0, !dbg !174
  br i1 %12, label %13, label %14, !dbg !175

13:                                               ; preds = %0
  store i32 1, i32* %3, align 4, !dbg !176, !tbaa !16
  br label %20, !dbg !178

14:                                               ; preds = %0
  %15 = load i32, i32* %2, align 4, !dbg !179, !tbaa !16
  %16 = icmp eq i32 %15, 1, !dbg !181
  br i1 %16, label %17, label %18, !dbg !182

17:                                               ; preds = %14
  store i32 -1, i32* %3, align 4, !dbg !183, !tbaa !16
  br label %19, !dbg !185

18:                                               ; preds = %14
  store i32 0, i32* %3, align 4, !dbg !186, !tbaa !16
  br label %19

19:                                               ; preds = %18, %17
  br label %20

20:                                               ; preds = %19, %13
  %21 = load i32, i32* %3, align 4, !dbg !188, !tbaa !16
  %22 = icmp eq i32 %21, 0, !dbg !190
  br i1 %22, label %23, label %24, !dbg !191

23:                                               ; preds = %20
  store i32 0, i32* %3, align 4, !dbg !192, !tbaa !16
  br label %24, !dbg !194

24:                                               ; preds = %23, %20
  %25 = load i32, i32* %3, align 4, !dbg !195, !tbaa !16
  %26 = icmp eq i32 %25, 0, !dbg !197
  br i1 %26, label %27, label %28, !dbg !198

27:                                               ; preds = %24
  store i32 0, i32* %3, align 4, !dbg !199, !tbaa !16
  br label %30, !dbg !201

28:                                               ; preds = %24
  %29 = load i32, i32* %3, align 4, !dbg !202, !tbaa !16
  store i32 %29, i32* %4, align 4, !dbg !204, !tbaa !16
  br label %30

30:                                               ; preds = %28, %27
  %31 = bitcast i32* %5 to i8*, !dbg !205
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %31) #4, !dbg !205
  call void @llvm.dbg.declare(metadata i32* %5, metadata !163, metadata !DIExpression()), !dbg !206
  %32 = call i32 @"?scaryBranches@@YAHH@Z"(i32 0), !dbg !207
  store i32 %32, i32* %5, align 4, !dbg !206, !tbaa !16
  %33 = bitcast i32* %6 to i8*, !dbg !208
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %33) #4, !dbg !208
  call void @llvm.dbg.declare(metadata i32* %6, metadata !164, metadata !DIExpression()), !dbg !209
  %34 = call i32 @"?scaryBranchesTwo@@YAHH@Z"(i32 0), !dbg !210
  store i32 %34, i32* %6, align 4, !dbg !209, !tbaa !16
  %35 = bitcast i32* %7 to i8*, !dbg !211
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %35) #4, !dbg !211
  call void @llvm.dbg.declare(metadata i32* %7, metadata !165, metadata !DIExpression()), !dbg !212
  %36 = call i32 @"?scaryBranchesThree@@YAHH@Z"(i32 0), !dbg !213
  store i32 %36, i32* %7, align 4, !dbg !212, !tbaa !16
  %37 = load i32, i32* %3, align 4, !dbg !214, !tbaa !16
  %38 = load i32, i32* %5, align 4, !dbg !215, !tbaa !16
  %39 = add nsw i32 %37, %38, !dbg !216
  %40 = load i32, i32* %6, align 4, !dbg !217, !tbaa !16
  %41 = add nsw i32 %39, %40, !dbg !218
  %42 = load i32, i32* %7, align 4, !dbg !219, !tbaa !16
  %43 = add nsw i32 %41, %42, !dbg !220
  %44 = bitcast i32* %7 to i8*, !dbg !221
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %44) #4, !dbg !221
  %45 = bitcast i32* %6 to i8*, !dbg !221
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %45) #4, !dbg !221
  %46 = bitcast i32* %5 to i8*, !dbg !221
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %46) #4, !dbg !221
  %47 = bitcast i32* %4 to i8*, !dbg !221
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %47) #4, !dbg !221
  %48 = bitcast i32* %3 to i8*, !dbg !221
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %48) #4, !dbg !221
  %49 = bitcast i32* %2 to i8*, !dbg !221
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %49) #4, !dbg !221
  ret i32 %43, !dbg !222
}

attributes #0 = { nounwind uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nosync nounwind willreturn }
attributes #3 = { norecurse nounwind uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "clang version 12.0.0", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "branchTest.cpp", directory: "E:\\Documents\\Work Stuff\\Active Work Files\\Code Examples\\test_cpp01", checksumkind: CSK_MD5, checksum: "fcd061fe21277c2d81b9c2cf234e3bac")
!2 = !{}
!3 = !{i32 2, !"CodeView", i32 1}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 2}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{!"clang version 12.0.0"}
!8 = distinct !DISubprogram(name: "scaryBranches", linkageName: "?scaryBranches@@YAHH@Z", scope: !1, file: !1, line: 1, type: !9, scopeLine: 1, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !12)
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{!13, !14, !15}
!13 = !DILocalVariable(name: "x", arg: 1, scope: !8, file: !1, line: 1, type: !11)
!14 = !DILocalVariable(name: "y", scope: !8, file: !1, line: 2, type: !11)
!15 = !DILocalVariable(name: "q", scope: !8, file: !1, line: 3, type: !11)
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !DILocation(line: 1, column: 23, scope: !8)
!21 = !DILocation(line: 2, column: 2, scope: !8)
!22 = !DILocation(line: 2, column: 6, scope: !8)
!23 = !DILocation(line: 3, column: 2, scope: !8)
!24 = !DILocation(line: 3, column: 6, scope: !8)
!25 = !DILocation(line: 4, column: 6, scope: !26)
!26 = distinct !DILexicalBlock(scope: !8, file: !1, line: 4, column: 6)
!27 = !DILocation(line: 4, column: 8, scope: !26)
!28 = !DILocation(line: 4, column: 6, scope: !8)
!29 = !DILocation(line: 5, column: 5, scope: !26)
!30 = !DILocation(line: 5, column: 3, scope: !26)
!31 = !DILocation(line: 6, column: 11, scope: !32)
!32 = distinct !DILexicalBlock(scope: !26, file: !1, line: 6, column: 11)
!33 = !DILocation(line: 6, column: 13, scope: !32)
!34 = !DILocation(line: 6, column: 11, scope: !26)
!35 = !DILocation(line: 7, column: 5, scope: !32)
!36 = !DILocation(line: 7, column: 3, scope: !32)
!37 = !DILocation(line: 9, column: 5, scope: !32)
!38 = !DILocation(line: 11, column: 6, scope: !39)
!39 = distinct !DILexicalBlock(scope: !8, file: !1, line: 11, column: 6)
!40 = !DILocation(line: 11, column: 8, scope: !39)
!41 = !DILocation(line: 11, column: 6, scope: !8)
!42 = !DILocation(line: 12, column: 5, scope: !39)
!43 = !DILocation(line: 12, column: 3, scope: !39)
!44 = !DILocation(line: 14, column: 6, scope: !45)
!45 = distinct !DILexicalBlock(scope: !8, file: !1, line: 14, column: 6)
!46 = !DILocation(line: 14, column: 8, scope: !45)
!47 = !DILocation(line: 14, column: 6, scope: !8)
!48 = !DILocation(line: 15, column: 5, scope: !45)
!49 = !DILocation(line: 15, column: 3, scope: !45)
!50 = !DILocation(line: 17, column: 7, scope: !45)
!51 = !DILocation(line: 17, column: 5, scope: !45)
!52 = !DILocation(line: 19, column: 9, scope: !8)
!53 = !DILocation(line: 20, column: 1, scope: !8)
!54 = !DILocation(line: 19, column: 2, scope: !8)
!55 = distinct !DISubprogram(name: "scaryBranchesTwo", linkageName: "?scaryBranchesTwo@@YAHH@Z", scope: !1, file: !1, line: 22, type: !9, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !56)
!56 = !{!57, !58, !59}
!57 = !DILocalVariable(name: "x", arg: 1, scope: !55, file: !1, line: 22, type: !11)
!58 = !DILocalVariable(name: "y", scope: !55, file: !1, line: 24, type: !11)
!59 = !DILocalVariable(name: "q", scope: !55, file: !1, line: 25, type: !11)
!60 = !DILocation(line: 22, column: 26, scope: !55)
!61 = !DILocation(line: 24, column: 3, scope: !55)
!62 = !DILocation(line: 24, column: 7, scope: !55)
!63 = !DILocation(line: 25, column: 3, scope: !55)
!64 = !DILocation(line: 25, column: 7, scope: !55)
!65 = !DILocation(line: 26, column: 7, scope: !66)
!66 = distinct !DILexicalBlock(scope: !55, file: !1, line: 26, column: 7)
!67 = !DILocation(line: 26, column: 9, scope: !66)
!68 = !DILocation(line: 26, column: 7, scope: !55)
!69 = !DILocation(line: 26, column: 17, scope: !66)
!70 = !DILocation(line: 26, column: 15, scope: !66)
!71 = !DILocation(line: 27, column: 12, scope: !72)
!72 = distinct !DILexicalBlock(scope: !66, file: !1, line: 27, column: 12)
!73 = !DILocation(line: 27, column: 14, scope: !72)
!74 = !DILocation(line: 27, column: 12, scope: !66)
!75 = !DILocation(line: 27, column: 22, scope: !72)
!76 = !DILocation(line: 27, column: 20, scope: !72)
!77 = !DILocation(line: 28, column: 10, scope: !72)
!78 = !DILocation(line: 30, column: 7, scope: !79)
!79 = distinct !DILexicalBlock(scope: !55, file: !1, line: 30, column: 7)
!80 = !DILocation(line: 30, column: 9, scope: !79)
!81 = !DILocation(line: 30, column: 7, scope: !55)
!82 = !DILocation(line: 30, column: 17, scope: !79)
!83 = !DILocation(line: 30, column: 15, scope: !79)
!84 = !DILocation(line: 32, column: 7, scope: !85)
!85 = distinct !DILexicalBlock(scope: !55, file: !1, line: 32, column: 7)
!86 = !DILocation(line: 32, column: 9, scope: !85)
!87 = !DILocation(line: 32, column: 7, scope: !55)
!88 = !DILocation(line: 32, column: 17, scope: !85)
!89 = !DILocation(line: 32, column: 15, scope: !85)
!90 = !DILocation(line: 33, column: 12, scope: !85)
!91 = !DILocation(line: 33, column: 10, scope: !85)
!92 = !DILocation(line: 35, column: 7, scope: !93)
!93 = distinct !DILexicalBlock(scope: !55, file: !1, line: 35, column: 7)
!94 = !DILocation(line: 35, column: 9, scope: !93)
!95 = !DILocation(line: 35, column: 7, scope: !55)
!96 = !DILocation(line: 35, column: 29, scope: !93)
!97 = !DILocation(line: 35, column: 15, scope: !93)
!98 = !DILocation(line: 37, column: 10, scope: !55)
!99 = !DILocation(line: 39, column: 1, scope: !55)
!100 = !DILocation(line: 37, column: 3, scope: !55)
!101 = distinct !DISubprogram(name: "scaryBranchesThree", linkageName: "?scaryBranchesThree@@YAHH@Z", scope: !1, file: !1, line: 41, type: !9, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !102)
!102 = !{!103, !104, !105}
!103 = !DILocalVariable(name: "x", arg: 1, scope: !101, file: !1, line: 41, type: !11)
!104 = !DILocalVariable(name: "y", scope: !101, file: !1, line: 42, type: !11)
!105 = !DILocalVariable(name: "q", scope: !106, file: !1, line: 44, type: !11)
!106 = distinct !DILexicalBlock(scope: !107, file: !1, line: 43, column: 13)
!107 = distinct !DILexicalBlock(scope: !101, file: !1, line: 43, column: 6)
!108 = !DILocation(line: 41, column: 28, scope: !101)
!109 = !DILocation(line: 42, column: 2, scope: !101)
!110 = !DILocation(line: 42, column: 6, scope: !101)
!111 = !DILocation(line: 43, column: 6, scope: !107)
!112 = !DILocation(line: 43, column: 8, scope: !107)
!113 = !DILocation(line: 43, column: 6, scope: !101)
!114 = !DILocation(line: 44, column: 3, scope: !106)
!115 = !DILocation(line: 44, column: 7, scope: !106)
!116 = !DILocation(line: 45, column: 7, scope: !117)
!117 = distinct !DILexicalBlock(scope: !106, file: !1, line: 45, column: 7)
!118 = !DILocation(line: 45, column: 9, scope: !117)
!119 = !DILocation(line: 45, column: 7, scope: !106)
!120 = !DILocation(line: 46, column: 6, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !1, line: 45, column: 14)
!122 = !DILocation(line: 47, column: 3, scope: !121)
!123 = !DILocation(line: 47, column: 14, scope: !124)
!124 = distinct !DILexicalBlock(scope: !117, file: !1, line: 47, column: 14)
!125 = !DILocation(line: 47, column: 16, scope: !124)
!126 = !DILocation(line: 47, column: 14, scope: !117)
!127 = !DILocation(line: 48, column: 6, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !1, line: 47, column: 22)
!129 = !DILocation(line: 49, column: 3, scope: !128)
!130 = !DILocation(line: 50, column: 6, scope: !131)
!131 = distinct !DILexicalBlock(scope: !124, file: !1, line: 49, column: 10)
!132 = !DILocation(line: 53, column: 7, scope: !133)
!133 = distinct !DILexicalBlock(scope: !106, file: !1, line: 53, column: 7)
!134 = !DILocation(line: 53, column: 9, scope: !133)
!135 = !DILocation(line: 53, column: 7, scope: !106)
!136 = !DILocation(line: 54, column: 6, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !1, line: 53, column: 14)
!138 = !DILocation(line: 55, column: 3, scope: !137)
!139 = !DILocation(line: 57, column: 7, scope: !140)
!140 = distinct !DILexicalBlock(scope: !106, file: !1, line: 57, column: 7)
!141 = !DILocation(line: 57, column: 9, scope: !140)
!142 = !DILocation(line: 57, column: 7, scope: !106)
!143 = !DILocation(line: 58, column: 6, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !1, line: 57, column: 14)
!145 = !DILocation(line: 59, column: 3, scope: !144)
!146 = !DILocation(line: 60, column: 8, scope: !147)
!147 = distinct !DILexicalBlock(scope: !140, file: !1, line: 59, column: 10)
!148 = !DILocation(line: 60, column: 6, scope: !147)
!149 = !DILocation(line: 62, column: 2, scope: !107)
!150 = !DILocation(line: 62, column: 2, scope: !106)
!151 = !DILocation(line: 63, column: 5, scope: !152)
!152 = distinct !DILexicalBlock(scope: !107, file: !1, line: 62, column: 7)
!153 = !DILocation(line: 66, column: 9, scope: !101)
!154 = !DILocation(line: 67, column: 1, scope: !101)
!155 = !DILocation(line: 66, column: 2, scope: !101)
!156 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 69, type: !157, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !159)
!157 = !DISubroutineType(types: !158)
!158 = !{!11}
!159 = !{!160, !161, !162, !163, !164, !165}
!160 = !DILocalVariable(name: "x", scope: !156, file: !1, line: 70, type: !11)
!161 = !DILocalVariable(name: "y", scope: !156, file: !1, line: 71, type: !11)
!162 = !DILocalVariable(name: "q", scope: !156, file: !1, line: 72, type: !11)
!163 = !DILocalVariable(name: "z", scope: !156, file: !1, line: 91, type: !11)
!164 = !DILocalVariable(name: "a", scope: !156, file: !1, line: 92, type: !11)
!165 = !DILocalVariable(name: "b", scope: !156, file: !1, line: 93, type: !11)
!166 = !DILocation(line: 70, column: 2, scope: !156)
!167 = !DILocation(line: 70, column: 6, scope: !156)
!168 = !DILocation(line: 71, column: 2, scope: !156)
!169 = !DILocation(line: 71, column: 6, scope: !156)
!170 = !DILocation(line: 72, column: 2, scope: !156)
!171 = !DILocation(line: 72, column: 6, scope: !156)
!172 = !DILocation(line: 73, column: 6, scope: !173)
!173 = distinct !DILexicalBlock(scope: !156, file: !1, line: 73, column: 6)
!174 = !DILocation(line: 73, column: 8, scope: !173)
!175 = !DILocation(line: 73, column: 6, scope: !156)
!176 = !DILocation(line: 74, column: 5, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !1, line: 73, column: 13)
!178 = !DILocation(line: 75, column: 2, scope: !177)
!179 = !DILocation(line: 75, column: 13, scope: !180)
!180 = distinct !DILexicalBlock(scope: !173, file: !1, line: 75, column: 13)
!181 = !DILocation(line: 75, column: 15, scope: !180)
!182 = !DILocation(line: 75, column: 13, scope: !173)
!183 = !DILocation(line: 76, column: 5, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !1, line: 75, column: 21)
!185 = !DILocation(line: 77, column: 2, scope: !184)
!186 = !DILocation(line: 78, column: 5, scope: !187)
!187 = distinct !DILexicalBlock(scope: !180, file: !1, line: 77, column: 9)
!188 = !DILocation(line: 81, column: 6, scope: !189)
!189 = distinct !DILexicalBlock(scope: !156, file: !1, line: 81, column: 6)
!190 = !DILocation(line: 81, column: 8, scope: !189)
!191 = !DILocation(line: 81, column: 6, scope: !156)
!192 = !DILocation(line: 82, column: 5, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !1, line: 81, column: 13)
!194 = !DILocation(line: 83, column: 2, scope: !193)
!195 = !DILocation(line: 85, column: 6, scope: !196)
!196 = distinct !DILexicalBlock(scope: !156, file: !1, line: 85, column: 6)
!197 = !DILocation(line: 85, column: 8, scope: !196)
!198 = !DILocation(line: 85, column: 6, scope: !156)
!199 = !DILocation(line: 86, column: 5, scope: !200)
!200 = distinct !DILexicalBlock(scope: !196, file: !1, line: 85, column: 13)
!201 = !DILocation(line: 87, column: 2, scope: !200)
!202 = !DILocation(line: 88, column: 7, scope: !203)
!203 = distinct !DILexicalBlock(scope: !196, file: !1, line: 87, column: 9)
!204 = !DILocation(line: 88, column: 5, scope: !203)
!205 = !DILocation(line: 91, column: 2, scope: !156)
!206 = !DILocation(line: 91, column: 6, scope: !156)
!207 = !DILocation(line: 91, column: 10, scope: !156)
!208 = !DILocation(line: 92, column: 2, scope: !156)
!209 = !DILocation(line: 92, column: 6, scope: !156)
!210 = !DILocation(line: 92, column: 10, scope: !156)
!211 = !DILocation(line: 93, column: 2, scope: !156)
!212 = !DILocation(line: 93, column: 6, scope: !156)
!213 = !DILocation(line: 93, column: 10, scope: !156)
!214 = !DILocation(line: 94, column: 9, scope: !156)
!215 = !DILocation(line: 94, column: 13, scope: !156)
!216 = !DILocation(line: 94, column: 11, scope: !156)
!217 = !DILocation(line: 94, column: 17, scope: !156)
!218 = !DILocation(line: 94, column: 15, scope: !156)
!219 = !DILocation(line: 94, column: 21, scope: !156)
!220 = !DILocation(line: 94, column: 19, scope: !156)
!221 = !DILocation(line: 95, column: 1, scope: !156)
!222 = !DILocation(line: 94, column: 2, scope: !156)

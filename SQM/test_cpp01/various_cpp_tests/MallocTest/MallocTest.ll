; ModuleID = 'MallocTest.cpp'
source_filename = "MallocTest.cpp"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.29.30038"

%struct._iobuf = type { i8* }
%struct.__crt_locale_pointers = type { %struct.__crt_locale_data*, %struct.__crt_multibyte_data* }
%struct.__crt_locale_data = type opaque
%struct.__crt_multibyte_data = type opaque

$printf = comdat any

$scanf = comdat any

$_vfprintf_l = comdat any

$__local_stdio_printf_options = comdat any

$_vfscanf_l = comdat any

$__local_stdio_scanf_options = comdat any

$"??_C@_0CC@ODODDMBL@How?5long?5do?5you?5want?5the?5string?$DP@" = comdat any

$"??_C@_02DPKJAMEF@?$CFd?$AA@" = comdat any

$"??_C@_0BD@INHJHPBO@Random?5string?3?5?$CFs?6?$AA@" = comdat any

$"?_OptionsStorage@?1??__local_stdio_printf_options@@9@4_KA" = comdat any

$"?_OptionsStorage@?1??__local_stdio_scanf_options@@9@4_KA" = comdat any

@"??_C@_0CC@ODODDMBL@How?5long?5do?5you?5want?5the?5string?$DP@" = linkonce_odr dso_local unnamed_addr constant [34 x i8] c"How long do you want the string? \00", comdat, align 1
@"??_C@_02DPKJAMEF@?$CFd?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"%d\00", comdat, align 1
@"??_C@_0BD@INHJHPBO@Random?5string?3?5?$CFs?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [19 x i8] c"Random string: %s\0A\00", comdat, align 1
@"?_OptionsStorage@?1??__local_stdio_printf_options@@9@4_KA" = linkonce_odr dso_local global i64 0, comdat, align 8, !dbg !0
@"?_OptionsStorage@?1??__local_stdio_scanf_options@@9@4_KA" = linkonce_odr dso_local global i64 0, comdat, align 8, !dbg !15

; Function Attrs: norecurse uwtable mustprogress
define dso_local i32 @main() #0 !dbg !30 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  store i32 0, i32* %1, align 4
  %6 = bitcast i32* %2 to i8*, !dbg !40
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #9, !dbg !40
  call void @llvm.dbg.declare(metadata i32* %2, metadata !35, metadata !DIExpression()), !dbg !41
  %7 = bitcast i32* %3 to i8*, !dbg !40
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #9, !dbg !40
  call void @llvm.dbg.declare(metadata i32* %3, metadata !36, metadata !DIExpression()), !dbg !42
  %8 = bitcast i8** %4 to i8*, !dbg !43
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %8) #9, !dbg !43
  call void @llvm.dbg.declare(metadata i8** %4, metadata !37, metadata !DIExpression()), !dbg !44
  %9 = bitcast i64* %5 to i8*, !dbg !45
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %9) #9, !dbg !45
  call void @llvm.dbg.declare(metadata i64* %5, metadata !38, metadata !DIExpression()), !dbg !46
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @"??_C@_0CC@ODODDMBL@How?5long?5do?5you?5want?5the?5string?$DP@", i64 0, i64 0)), !dbg !47
  %11 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @"??_C@_02DPKJAMEF@?$CFd?$AA@", i64 0, i64 0), i32* %2), !dbg !48
  %12 = load i32, i32* %2, align 4, !dbg !49, !tbaa !50
  %13 = add nsw i32 %12, 1, !dbg !54
  %14 = sext i32 %13 to i64, !dbg !49
  %15 = call noalias i8* @malloc(i64 %14), !dbg !55, !heapallocsite !13
  store i8* %15, i8** %4, align 8, !dbg !56, !tbaa !57
  %16 = load i8*, i8** %4, align 8, !dbg !59, !tbaa !57
  %17 = icmp eq i8* %16, null, !dbg !61
  br i1 %17, label %18, label %19, !dbg !62

18:                                               ; preds = %0
  call void @exit(i32 1) #10, !dbg !63
  unreachable, !dbg !63

19:                                               ; preds = %0
  store i32 0, i32* %3, align 4, !dbg !64, !tbaa !50
  br label %20, !dbg !66

20:                                               ; preds = %33, %19
  %21 = load i32, i32* %3, align 4, !dbg !67, !tbaa !50
  %22 = load i32, i32* %2, align 4, !dbg !69, !tbaa !50
  %23 = icmp slt i32 %21, %22, !dbg !70
  br i1 %23, label %24, label %36, !dbg !71

24:                                               ; preds = %20
  %25 = call i32 @rand(), !dbg !72
  %26 = srem i32 %25, 26, !dbg !73
  %27 = add nsw i32 %26, 97, !dbg !74
  %28 = trunc i32 %27 to i8, !dbg !72
  %29 = load i8*, i8** %4, align 8, !dbg !75, !tbaa !57
  %30 = load i32, i32* %3, align 4, !dbg !76, !tbaa !50
  %31 = sext i32 %30 to i64, !dbg !75
  %32 = getelementptr inbounds i8, i8* %29, i64 %31, !dbg !75
  store i8 %28, i8* %32, align 1, !dbg !77, !tbaa !78
  br label %33, !dbg !75

33:                                               ; preds = %24
  %34 = load i32, i32* %3, align 4, !dbg !79, !tbaa !50
  %35 = add nsw i32 %34, 1, !dbg !79
  store i32 %35, i32* %3, align 4, !dbg !79, !tbaa !50
  br label %20, !dbg !80, !llvm.loop !81

36:                                               ; preds = %20
  %37 = load i8*, i8** %4, align 8, !dbg !84, !tbaa !57
  %38 = load i32, i32* %2, align 4, !dbg !85, !tbaa !50
  %39 = sext i32 %38 to i64, !dbg !84
  %40 = getelementptr inbounds i8, i8* %37, i64 %39, !dbg !84
  store i8 0, i8* %40, align 1, !dbg !86, !tbaa !78
  %41 = load i8*, i8** %4, align 8, !dbg !87, !tbaa !57
  %42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @"??_C@_0BD@INHJHPBO@Random?5string?3?5?$CFs?6?$AA@", i64 0, i64 0), i8* %41), !dbg !88
  %43 = load i8*, i8** %4, align 8, !dbg !89, !tbaa !57
  call void @free(i8* %43), !dbg !90
  %44 = bitcast i64* %5 to i8*, !dbg !91
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %44) #9, !dbg !91
  %45 = bitcast i8** %4 to i8*, !dbg !91
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %45) #9, !dbg !91
  %46 = bitcast i32* %3 to i8*, !dbg !91
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %46) #9, !dbg !91
  %47 = bitcast i32* %2 to i8*, !dbg !91
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %47) #9, !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: inlinehint nobuiltin uwtable mustprogress
define linkonce_odr dso_local i32 @printf(i8* %0, ...) #3 comdat !dbg !93 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8, !tbaa !57
  call void @llvm.dbg.declare(metadata i8** %2, metadata !101, metadata !DIExpression()), !dbg !106
  %5 = bitcast i32* %3 to i8*, !dbg !107
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #9, !dbg !107
  call void @llvm.dbg.declare(metadata i32* %3, metadata !102, metadata !DIExpression()), !dbg !108
  %6 = bitcast i8** %4 to i8*, !dbg !109
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #9, !dbg !109
  call void @llvm.dbg.declare(metadata i8** %4, metadata !103, metadata !DIExpression()), !dbg !110
  %7 = bitcast i8** %4 to i8*, !dbg !111
  call void @llvm.va_start(i8* %7), !dbg !111
  %8 = load i8*, i8** %4, align 8, !dbg !112, !tbaa !57
  %9 = load i8*, i8** %2, align 8, !dbg !113, !tbaa !57
  %10 = call %struct._iobuf* @__acrt_iob_func(i32 1), !dbg !114
  %11 = call i32 @_vfprintf_l(%struct._iobuf* %10, i8* %9, %struct.__crt_locale_pointers* null, i8* %8), !dbg !115
  store i32 %11, i32* %3, align 4, !dbg !116, !tbaa !50
  %12 = bitcast i8** %4 to i8*, !dbg !117
  call void @llvm.va_end(i8* %12), !dbg !117
  %13 = load i32, i32* %3, align 4, !dbg !118, !tbaa !50
  %14 = bitcast i8** %4 to i8*, !dbg !119
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %14) #9, !dbg !119
  %15 = bitcast i32* %3 to i8*, !dbg !119
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #9, !dbg !119
  ret i32 %13, !dbg !120
}

; Function Attrs: inlinehint nobuiltin uwtable mustprogress
define linkonce_odr dso_local i32 @scanf(i8* %0, ...) #3 comdat !dbg !121 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8, !tbaa !57
  call void @llvm.dbg.declare(metadata i8** %2, metadata !123, metadata !DIExpression()), !dbg !126
  %5 = bitcast i32* %3 to i8*, !dbg !127
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #9, !dbg !127
  call void @llvm.dbg.declare(metadata i32* %3, metadata !124, metadata !DIExpression()), !dbg !128
  %6 = bitcast i8** %4 to i8*, !dbg !129
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #9, !dbg !129
  call void @llvm.dbg.declare(metadata i8** %4, metadata !125, metadata !DIExpression()), !dbg !130
  %7 = bitcast i8** %4 to i8*, !dbg !131
  call void @llvm.va_start(i8* %7), !dbg !131
  %8 = load i8*, i8** %4, align 8, !dbg !132, !tbaa !57
  %9 = load i8*, i8** %2, align 8, !dbg !133, !tbaa !57
  %10 = call %struct._iobuf* @__acrt_iob_func(i32 0), !dbg !134
  %11 = call i32 @_vfscanf_l(%struct._iobuf* %10, i8* %9, %struct.__crt_locale_pointers* null, i8* %8), !dbg !135
  store i32 %11, i32* %3, align 4, !dbg !136, !tbaa !50
  %12 = bitcast i8** %4 to i8*, !dbg !137
  call void @llvm.va_end(i8* %12), !dbg !137
  %13 = load i32, i32* %3, align 4, !dbg !138, !tbaa !50
  %14 = bitcast i8** %4 to i8*, !dbg !139
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %14) #9, !dbg !139
  %15 = bitcast i32* %3 to i8*, !dbg !139
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #9, !dbg !139
  ret i32 %13, !dbg !140
}

declare dso_local noalias i8* @malloc(i64) #4

; Function Attrs: noreturn
declare dso_local void @exit(i32) #5

declare dso_local i32 @rand() #4

declare dso_local void @free(i8*) #4

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #6

; Function Attrs: inlinehint uwtable mustprogress
define linkonce_odr dso_local i32 @_vfprintf_l(%struct._iobuf* %0, i8* %1, %struct.__crt_locale_pointers* %2, i8* %3) #7 comdat !dbg !141 {
  %5 = alloca i8*, align 8
  %6 = alloca %struct.__crt_locale_pointers*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca %struct._iobuf*, align 8
  store i8* %3, i8** %5, align 8, !tbaa !57
  call void @llvm.dbg.declare(metadata i8** %5, metadata !156, metadata !DIExpression()), !dbg !160
  store %struct.__crt_locale_pointers* %2, %struct.__crt_locale_pointers** %6, align 8, !tbaa !57
  call void @llvm.dbg.declare(metadata %struct.__crt_locale_pointers** %6, metadata !157, metadata !DIExpression()), !dbg !161
  store i8* %1, i8** %7, align 8, !tbaa !57
  call void @llvm.dbg.declare(metadata i8** %7, metadata !158, metadata !DIExpression()), !dbg !162
  store %struct._iobuf* %0, %struct._iobuf** %8, align 8, !tbaa !57
  call void @llvm.dbg.declare(metadata %struct._iobuf** %8, metadata !159, metadata !DIExpression()), !dbg !163
  %9 = load i8*, i8** %5, align 8, !dbg !164, !tbaa !57
  %10 = load %struct.__crt_locale_pointers*, %struct.__crt_locale_pointers** %6, align 8, !dbg !165, !tbaa !57
  %11 = load i8*, i8** %7, align 8, !dbg !166, !tbaa !57
  %12 = load %struct._iobuf*, %struct._iobuf** %8, align 8, !dbg !167, !tbaa !57
  %13 = call i64* @__local_stdio_printf_options(), !dbg !168
  %14 = load i64, i64* %13, align 8, !dbg !168, !tbaa !169
  %15 = call i32 @__stdio_common_vfprintf(i64 %14, %struct._iobuf* %12, i8* %11, %struct.__crt_locale_pointers* %10, i8* %9), !dbg !171
  ret i32 %15, !dbg !172
}

declare dso_local %struct._iobuf* @__acrt_iob_func(i32) #4

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #6

declare dso_local i32 @__stdio_common_vfprintf(i64, %struct._iobuf*, i8*, %struct.__crt_locale_pointers*, i8*) #4

; Function Attrs: noinline nounwind uwtable mustprogress
define linkonce_odr dso_local i64* @__local_stdio_printf_options() #8 comdat !dbg !2 {
  ret i64* @"?_OptionsStorage@?1??__local_stdio_printf_options@@9@4_KA", !dbg !173
}

; Function Attrs: inlinehint uwtable mustprogress
define linkonce_odr dso_local i32 @_vfscanf_l(%struct._iobuf* %0, i8* %1, %struct.__crt_locale_pointers* %2, i8* %3) #7 comdat !dbg !174 {
  %5 = alloca i8*, align 8
  %6 = alloca %struct.__crt_locale_pointers*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca %struct._iobuf*, align 8
  store i8* %3, i8** %5, align 8, !tbaa !57
  call void @llvm.dbg.declare(metadata i8** %5, metadata !176, metadata !DIExpression()), !dbg !180
  store %struct.__crt_locale_pointers* %2, %struct.__crt_locale_pointers** %6, align 8, !tbaa !57
  call void @llvm.dbg.declare(metadata %struct.__crt_locale_pointers** %6, metadata !177, metadata !DIExpression()), !dbg !181
  store i8* %1, i8** %7, align 8, !tbaa !57
  call void @llvm.dbg.declare(metadata i8** %7, metadata !178, metadata !DIExpression()), !dbg !182
  store %struct._iobuf* %0, %struct._iobuf** %8, align 8, !tbaa !57
  call void @llvm.dbg.declare(metadata %struct._iobuf** %8, metadata !179, metadata !DIExpression()), !dbg !183
  %9 = load i8*, i8** %5, align 8, !dbg !184, !tbaa !57
  %10 = load %struct.__crt_locale_pointers*, %struct.__crt_locale_pointers** %6, align 8, !dbg !185, !tbaa !57
  %11 = load i8*, i8** %7, align 8, !dbg !186, !tbaa !57
  %12 = load %struct._iobuf*, %struct._iobuf** %8, align 8, !dbg !187, !tbaa !57
  %13 = call i64* @__local_stdio_scanf_options(), !dbg !188
  %14 = load i64, i64* %13, align 8, !dbg !188, !tbaa !169
  %15 = call i32 @__stdio_common_vfscanf(i64 %14, %struct._iobuf* %12, i8* %11, %struct.__crt_locale_pointers* %10, i8* %9), !dbg !189
  ret i32 %15, !dbg !190
}

declare dso_local i32 @__stdio_common_vfscanf(i64, %struct._iobuf*, i8*, %struct.__crt_locale_pointers*, i8*) #4

; Function Attrs: noinline nounwind uwtable mustprogress
define linkonce_odr dso_local i64* @__local_stdio_scanf_options() #8 comdat !dbg !17 {
  ret i64* @"?_OptionsStorage@?1??__local_stdio_scanf_options@@9@4_KA", !dbg !191
}

attributes #0 = { norecurse uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { inlinehint nobuiltin uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nofree nosync nounwind willreturn }
attributes #7 = { inlinehint uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noinline nounwind uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind }
attributes #10 = { noreturn }

!llvm.dbg.cu = !{!8}
!llvm.linker.options = !{!24}
!llvm.module.flags = !{!25, !26, !27, !28}
!llvm.ident = !{!29}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_OptionsStorage", scope: !2, file: !3, line: 91, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DISubprogram(name: "__local_stdio_printf_options", scope: !3, file: !3, line: 89, type: !4, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !10)
!3 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_stdio_config.h", directory: "", checksumkind: CSK_MD5, checksum: "dacf907bda504afb0b64f53a242bdae6")
!4 = !DISubroutineType(types: !5)
!5 = !{!6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!8 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !9, producer: "clang version 12.0.0", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !10, retainedTypes: !11, globals: !14, imports: !18, nameTableKind: None)
!9 = !DIFile(filename: "MallocTest.cpp", directory: "E:\\Documents\\Work Stuff\\Active Work Files\\Code Examples\\test_cpp01", checksumkind: CSK_MD5, checksum: "790795777c0bb5966355cce01bd28c09")
!10 = !{}
!11 = !{!12}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !{!0, !15}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "_OptionsStorage", scope: !17, file: !3, line: 101, type: !7, isLocal: false, isDefinition: true)
!17 = distinct !DISubprogram(name: "__local_stdio_scanf_options", scope: !3, file: !3, line: 99, type: !4, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !10)
!18 = !{!19}
!19 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !20, file: !21, line: 94)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "nullptr_t", scope: !22, file: !21, line: 93, baseType: !23)
!21 = !DIFile(filename: "C:\\Program Files\\LLVM\\lib\\clang\\12.0.0\\include\\stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!22 = !DINamespace(name: "std", scope: null)
!23 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "decltype(nullptr)")
!24 = !{!"/FAILIFMISMATCH:\22_CRT_STDIO_ISO_WIDE_SPECIFIERS=0\22"}
!25 = !{i32 2, !"CodeView", i32 1}
!26 = !{i32 2, !"Debug Info Version", i32 3}
!27 = !{i32 1, !"wchar_size", i32 2}
!28 = !{i32 7, !"PIC Level", i32 2}
!29 = !{!"clang version 12.0.0"}
!30 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 5, type: !31, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !34)
!31 = !DISubroutineType(types: !32)
!32 = !{!33}
!33 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!34 = !{!35, !36, !37, !38}
!35 = !DILocalVariable(name: "i", scope: !30, file: !9, line: 7, type: !33)
!36 = !DILocalVariable(name: "n", scope: !30, file: !9, line: 7, type: !33)
!37 = !DILocalVariable(name: "buffer", scope: !30, file: !9, line: 8, type: !12)
!38 = !DILocalVariable(name: "q", scope: !30, file: !9, line: 10, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !21, line: 46, baseType: !7)
!40 = !DILocation(line: 7, column: 3, scope: !30)
!41 = !DILocation(line: 7, column: 7, scope: !30)
!42 = !DILocation(line: 7, column: 9, scope: !30)
!43 = !DILocation(line: 8, column: 3, scope: !30)
!44 = !DILocation(line: 8, column: 10, scope: !30)
!45 = !DILocation(line: 10, column: 3, scope: !30)
!46 = !DILocation(line: 10, column: 10, scope: !30)
!47 = !DILocation(line: 12, column: 3, scope: !30)
!48 = !DILocation(line: 13, column: 3, scope: !30)
!49 = !DILocation(line: 15, column: 28, scope: !30)
!50 = !{!51, !51, i64 0}
!51 = !{!"int", !52, i64 0}
!52 = !{!"omnipotent char", !53, i64 0}
!53 = !{!"Simple C++ TBAA"}
!54 = !DILocation(line: 15, column: 29, scope: !30)
!55 = !DILocation(line: 15, column: 20, scope: !30)
!56 = !DILocation(line: 15, column: 10, scope: !30)
!57 = !{!58, !58, i64 0}
!58 = !{!"any pointer", !52, i64 0}
!59 = !DILocation(line: 16, column: 7, scope: !60)
!60 = distinct !DILexicalBlock(scope: !30, file: !9, line: 16, column: 7)
!61 = !DILocation(line: 16, column: 13, scope: !60)
!62 = !DILocation(line: 16, column: 7, scope: !30)
!63 = !DILocation(line: 16, column: 21, scope: !60)
!64 = !DILocation(line: 18, column: 9, scope: !65)
!65 = distinct !DILexicalBlock(scope: !30, file: !9, line: 18, column: 3)
!66 = !DILocation(line: 18, column: 8, scope: !65)
!67 = !DILocation(line: 18, column: 13, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !9, line: 18, column: 3)
!69 = !DILocation(line: 18, column: 15, scope: !68)
!70 = !DILocation(line: 18, column: 14, scope: !68)
!71 = !DILocation(line: 18, column: 3, scope: !65)
!72 = !DILocation(line: 19, column: 15, scope: !68)
!73 = !DILocation(line: 19, column: 21, scope: !68)
!74 = !DILocation(line: 19, column: 24, scope: !68)
!75 = !DILocation(line: 19, column: 5, scope: !68)
!76 = !DILocation(line: 19, column: 12, scope: !68)
!77 = !DILocation(line: 19, column: 14, scope: !68)
!78 = !{!52, !52, i64 0}
!79 = !DILocation(line: 18, column: 19, scope: !68)
!80 = !DILocation(line: 18, column: 3, scope: !68)
!81 = distinct !{!81, !71, !82, !83}
!82 = !DILocation(line: 19, column: 25, scope: !65)
!83 = !{!"llvm.loop.mustprogress"}
!84 = !DILocation(line: 20, column: 3, scope: !30)
!85 = !DILocation(line: 20, column: 10, scope: !30)
!86 = !DILocation(line: 20, column: 12, scope: !30)
!87 = !DILocation(line: 22, column: 33, scope: !30)
!88 = !DILocation(line: 22, column: 3, scope: !30)
!89 = !DILocation(line: 23, column: 9, scope: !30)
!90 = !DILocation(line: 23, column: 3, scope: !30)
!91 = !DILocation(line: 26, column: 1, scope: !30)
!92 = !DILocation(line: 25, column: 3, scope: !30)
!93 = distinct !DISubprogram(name: "printf", scope: !94, file: !94, line: 950, type: !95, scopeLine: 956, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !100)
!94 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "c1a1fbc43e7d45f0ea4ae539ddcffb19")
!95 = !DISubroutineType(types: !96)
!96 = !{!33, !97, null}
!97 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !98)
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!100 = !{!101, !102, !103}
!101 = !DILocalVariable(name: "_Format", arg: 1, scope: !93, file: !94, line: 951, type: !97)
!102 = !DILocalVariable(name: "_Result", scope: !93, file: !94, line: 957, type: !33)
!103 = !DILocalVariable(name: "_ArgList", scope: !93, file: !94, line: 958, type: !104)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !105, line: 72, baseType: !12)
!105 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\vadefs.h", directory: "", checksumkind: CSK_MD5, checksum: "a4b8f96637d0704c82f39ecb6bde2ab4")
!106 = !DILocation(line: 951, column: 57, scope: !93)
!107 = !DILocation(line: 957, column: 9, scope: !93)
!108 = !DILocation(line: 957, column: 13, scope: !93)
!109 = !DILocation(line: 958, column: 9, scope: !93)
!110 = !DILocation(line: 958, column: 17, scope: !93)
!111 = !DILocation(line: 959, column: 9, scope: !93)
!112 = !DILocation(line: 960, column: 54, scope: !93)
!113 = !DILocation(line: 960, column: 39, scope: !93)
!114 = !DILocation(line: 960, column: 31, scope: !93)
!115 = !DILocation(line: 960, column: 19, scope: !93)
!116 = !DILocation(line: 960, column: 17, scope: !93)
!117 = !DILocation(line: 961, column: 9, scope: !93)
!118 = !DILocation(line: 962, column: 16, scope: !93)
!119 = !DILocation(line: 963, column: 5, scope: !93)
!120 = !DILocation(line: 962, column: 9, scope: !93)
!121 = distinct !DISubprogram(name: "scanf", scope: !94, file: !94, line: 1276, type: !95, scopeLine: 1282, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !122)
!122 = !{!123, !124, !125}
!123 = !DILocalVariable(name: "_Format", arg: 1, scope: !121, file: !94, line: 1277, type: !97)
!124 = !DILocalVariable(name: "_Result", scope: !121, file: !94, line: 1283, type: !33)
!125 = !DILocalVariable(name: "_ArgList", scope: !121, file: !94, line: 1284, type: !104)
!126 = !DILocation(line: 1277, column: 56, scope: !121)
!127 = !DILocation(line: 1283, column: 9, scope: !121)
!128 = !DILocation(line: 1283, column: 13, scope: !121)
!129 = !DILocation(line: 1284, column: 9, scope: !121)
!130 = !DILocation(line: 1284, column: 17, scope: !121)
!131 = !DILocation(line: 1285, column: 9, scope: !121)
!132 = !DILocation(line: 1286, column: 52, scope: !121)
!133 = !DILocation(line: 1286, column: 37, scope: !121)
!134 = !DILocation(line: 1286, column: 30, scope: !121)
!135 = !DILocation(line: 1286, column: 19, scope: !121)
!136 = !DILocation(line: 1286, column: 17, scope: !121)
!137 = !DILocation(line: 1287, column: 9, scope: !121)
!138 = !DILocation(line: 1288, column: 16, scope: !121)
!139 = !DILocation(line: 1289, column: 5, scope: !121)
!140 = !DILocation(line: 1288, column: 9, scope: !121)
!141 = distinct !DISubprogram(name: "_vfprintf_l", scope: !94, file: !94, line: 635, type: !142, scopeLine: 644, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !155)
!142 = !DISubroutineType(types: !143)
!143 = !{!33, !144, !97, !149, !104}
!144 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !145)
!145 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !146, size: 64)
!146 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !147, line: 31, baseType: !148)
!147 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_wstdio.h", directory: "", checksumkind: CSK_MD5, checksum: "bf50373b435d0afd0235dd3e05c4a277")
!148 = !DICompositeType(tag: DW_TAG_structure_type, name: "_iobuf", file: !147, line: 28, size: 64, flags: DIFlagFwdDecl, identifier: ".?AU_iobuf@@")
!149 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !150)
!150 = !DIDerivedType(tag: DW_TAG_typedef, name: "_locale_t", file: !151, line: 609, baseType: !152)
!151 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt.h", directory: "", checksumkind: CSK_MD5, checksum: "db0cd8b4d76ec84d3625032eaca2a3ca")
!152 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !153, size: 64)
!153 = !DIDerivedType(tag: DW_TAG_typedef, name: "__crt_locale_pointers", file: !151, line: 607, baseType: !154)
!154 = !DICompositeType(tag: DW_TAG_structure_type, name: "__crt_locale_pointers", file: !151, line: 603, size: 128, flags: DIFlagFwdDecl, identifier: ".?AU__crt_locale_pointers@@")
!155 = !{!156, !157, !158, !159}
!156 = !DILocalVariable(name: "_ArgList", arg: 4, scope: !141, file: !94, line: 639, type: !104)
!157 = !DILocalVariable(name: "_Locale", arg: 3, scope: !141, file: !94, line: 638, type: !149)
!158 = !DILocalVariable(name: "_Format", arg: 2, scope: !141, file: !94, line: 637, type: !97)
!159 = !DILocalVariable(name: "_Stream", arg: 1, scope: !141, file: !94, line: 636, type: !144)
!160 = !DILocation(line: 639, column: 36, scope: !141)
!161 = !DILocation(line: 638, column: 36, scope: !141)
!162 = !DILocation(line: 637, column: 36, scope: !141)
!163 = !DILocation(line: 636, column: 36, scope: !141)
!164 = !DILocation(line: 645, column: 103, scope: !141)
!165 = !DILocation(line: 645, column: 94, scope: !141)
!166 = !DILocation(line: 645, column: 85, scope: !141)
!167 = !DILocation(line: 645, column: 76, scope: !141)
!168 = !DILocation(line: 645, column: 40, scope: !141)
!169 = !{!170, !170, i64 0}
!170 = !{!"long long", !52, i64 0}
!171 = !DILocation(line: 645, column: 16, scope: !141)
!172 = !DILocation(line: 645, column: 9, scope: !141)
!173 = !DILocation(line: 92, column: 9, scope: !2)
!174 = distinct !DISubprogram(name: "_vfscanf_l", scope: !94, file: !94, line: 1055, type: !142, scopeLine: 1064, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !175)
!175 = !{!176, !177, !178, !179}
!176 = !DILocalVariable(name: "_ArgList", arg: 4, scope: !174, file: !94, line: 1059, type: !104)
!177 = !DILocalVariable(name: "_Locale", arg: 3, scope: !174, file: !94, line: 1058, type: !149)
!178 = !DILocalVariable(name: "_Format", arg: 2, scope: !174, file: !94, line: 1057, type: !97)
!179 = !DILocalVariable(name: "_Stream", arg: 1, scope: !174, file: !94, line: 1056, type: !144)
!180 = !DILocation(line: 1059, column: 57, scope: !174)
!181 = !DILocation(line: 1058, column: 57, scope: !174)
!182 = !DILocation(line: 1057, column: 57, scope: !174)
!183 = !DILocation(line: 1056, column: 57, scope: !174)
!184 = !DILocation(line: 1067, column: 40, scope: !174)
!185 = !DILocation(line: 1067, column: 31, scope: !174)
!186 = !DILocation(line: 1067, column: 22, scope: !174)
!187 = !DILocation(line: 1067, column: 13, scope: !174)
!188 = !DILocation(line: 1066, column: 13, scope: !174)
!189 = !DILocation(line: 1065, column: 16, scope: !174)
!190 = !DILocation(line: 1065, column: 9, scope: !174)
!191 = !DILocation(line: 102, column: 9, scope: !17)

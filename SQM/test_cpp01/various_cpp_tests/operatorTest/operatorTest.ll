; ModuleID = 'operatorTest.cpp'
source_filename = "operatorTest.cpp"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.28.29915"

; Function Attrs: norecurse nounwind uwtable mustprogress
define dso_local i32 @main() #0 !dbg !8 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca float, align 4
  %23 = alloca float, align 4
  %24 = alloca float, align 4
  %25 = alloca float, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i8, align 1
  %32 = alloca i8, align 1
  %33 = alloca i8, align 1
  %34 = alloca i8, align 1
  %35 = alloca i8, align 1
  %36 = alloca i8, align 1
  %37 = alloca i8, align 1
  %38 = alloca i8, align 1
  %39 = alloca i8, align 1
  %40 = alloca i8, align 1
  %41 = alloca i8, align 1
  store i32 0, i32* %1, align 4
  %42 = bitcast i32* %2 to i8*, !dbg !55
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %42) #3, !dbg !55
  call void @llvm.dbg.declare(metadata i32* %2, metadata !13, metadata !DIExpression()), !dbg !56
  store i32 0, i32* %2, align 4, !dbg !56, !tbaa !57
  %43 = bitcast i32* %3 to i8*, !dbg !61
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %43) #3, !dbg !61
  call void @llvm.dbg.declare(metadata i32* %3, metadata !14, metadata !DIExpression()), !dbg !62
  %44 = load i32, i32* %2, align 4, !dbg !63, !tbaa !57
  %45 = add nsw i32 %44, 1, !dbg !63
  store i32 %45, i32* %2, align 4, !dbg !63, !tbaa !57
  store i32 %44, i32* %3, align 4, !dbg !62, !tbaa !57
  %46 = bitcast i32* %4 to i8*, !dbg !64
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %46) #3, !dbg !64
  call void @llvm.dbg.declare(metadata i32* %4, metadata !15, metadata !DIExpression()), !dbg !65
  %47 = load i32, i32* %2, align 4, !dbg !66, !tbaa !57
  %48 = add nsw i32 %47, 1, !dbg !66
  store i32 %48, i32* %2, align 4, !dbg !66, !tbaa !57
  store i32 %48, i32* %4, align 4, !dbg !65, !tbaa !57
  %49 = bitcast i32* %5 to i8*, !dbg !67
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %49) #3, !dbg !67
  call void @llvm.dbg.declare(metadata i32* %5, metadata !16, metadata !DIExpression()), !dbg !68
  %50 = load i32, i32* %3, align 4, !dbg !69, !tbaa !57
  %51 = load i32, i32* %4, align 4, !dbg !70, !tbaa !57
  %52 = add nsw i32 %50, %51, !dbg !71
  store i32 %52, i32* %5, align 4, !dbg !68, !tbaa !57
  %53 = bitcast i32* %6 to i8*, !dbg !72
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %53) #3, !dbg !72
  call void @llvm.dbg.declare(metadata i32* %6, metadata !17, metadata !DIExpression()), !dbg !73
  %54 = load i32, i32* %5, align 4, !dbg !74, !tbaa !57
  %55 = add nsw i32 2, %54, !dbg !75
  store i32 %55, i32* %6, align 4, !dbg !73, !tbaa !57
  %56 = bitcast i32* %7 to i8*, !dbg !76
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %56) #3, !dbg !76
  call void @llvm.dbg.declare(metadata i32* %7, metadata !18, metadata !DIExpression()), !dbg !77
  store i32 5, i32* %7, align 4, !dbg !77, !tbaa !57
  %57 = bitcast i32* %8 to i8*, !dbg !78
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %57) #3, !dbg !78
  call void @llvm.dbg.declare(metadata i32* %8, metadata !19, metadata !DIExpression()), !dbg !79
  store i32 -1, i32* %8, align 4, !dbg !79, !tbaa !57
  %58 = bitcast i32* %9 to i8*, !dbg !80
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %58) #3, !dbg !80
  call void @llvm.dbg.declare(metadata i32* %9, metadata !20, metadata !DIExpression()), !dbg !81
  %59 = load i32, i32* %8, align 4, !dbg !82, !tbaa !57
  %60 = add nsw i32 %59, -1, !dbg !82
  store i32 %60, i32* %8, align 4, !dbg !82, !tbaa !57
  store i32 %59, i32* %9, align 4, !dbg !81, !tbaa !57
  %61 = bitcast i32* %10 to i8*, !dbg !83
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %61) #3, !dbg !83
  call void @llvm.dbg.declare(metadata i32* %10, metadata !21, metadata !DIExpression()), !dbg !84
  %62 = load i32, i32* %8, align 4, !dbg !85, !tbaa !57
  %63 = add nsw i32 %62, -1, !dbg !85
  store i32 %63, i32* %8, align 4, !dbg !85, !tbaa !57
  store i32 %63, i32* %10, align 4, !dbg !84, !tbaa !57
  %64 = bitcast i32* %11 to i8*, !dbg !86
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %64) #3, !dbg !86
  call void @llvm.dbg.declare(metadata i32* %11, metadata !22, metadata !DIExpression()), !dbg !87
  %65 = load i32, i32* %9, align 4, !dbg !88, !tbaa !57
  %66 = load i32, i32* %10, align 4, !dbg !89, !tbaa !57
  %67 = sub nsw i32 %65, %66, !dbg !90
  store i32 %67, i32* %11, align 4, !dbg !87, !tbaa !57
  %68 = bitcast i32* %12 to i8*, !dbg !91
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %68) #3, !dbg !91
  call void @llvm.dbg.declare(metadata i32* %12, metadata !23, metadata !DIExpression()), !dbg !92
  %69 = load i32, i32* %11, align 4, !dbg !93, !tbaa !57
  %70 = sub nsw i32 2, %69, !dbg !94
  store i32 %70, i32* %12, align 4, !dbg !92, !tbaa !57
  %71 = bitcast i32* %13 to i8*, !dbg !95
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %71) #3, !dbg !95
  call void @llvm.dbg.declare(metadata i32* %13, metadata !24, metadata !DIExpression()), !dbg !96
  store i32 -1, i32* %13, align 4, !dbg !96, !tbaa !57
  %72 = bitcast i32* %14 to i8*, !dbg !97
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %72) #3, !dbg !97
  call void @llvm.dbg.declare(metadata i32* %14, metadata !25, metadata !DIExpression()), !dbg !98
  store i32 1, i32* %14, align 4, !dbg !98, !tbaa !57
  %73 = bitcast i32* %15 to i8*, !dbg !99
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %73) #3, !dbg !99
  call void @llvm.dbg.declare(metadata i32* %15, metadata !26, metadata !DIExpression()), !dbg !100
  %74 = load i32, i32* %14, align 4, !dbg !101, !tbaa !57
  %75 = mul nsw i32 %74, 2, !dbg !102
  store i32 %75, i32* %15, align 4, !dbg !100, !tbaa !57
  %76 = bitcast i32* %16 to i8*, !dbg !103
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %76) #3, !dbg !103
  call void @llvm.dbg.declare(metadata i32* %16, metadata !27, metadata !DIExpression()), !dbg !104
  %77 = load i32, i32* %14, align 4, !dbg !105, !tbaa !57
  %78 = load i32, i32* %15, align 4, !dbg !106, !tbaa !57
  %79 = mul nsw i32 %77, %78, !dbg !107
  store i32 %79, i32* %16, align 4, !dbg !104, !tbaa !57
  %80 = bitcast i32* %17 to i8*, !dbg !108
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %80) #3, !dbg !108
  call void @llvm.dbg.declare(metadata i32* %17, metadata !28, metadata !DIExpression()), !dbg !109
  store i32 6, i32* %17, align 4, !dbg !109, !tbaa !57
  %81 = bitcast i32* %18 to i8*, !dbg !110
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %81) #3, !dbg !110
  call void @llvm.dbg.declare(metadata i32* %18, metadata !29, metadata !DIExpression()), !dbg !111
  store i32 4, i32* %18, align 4, !dbg !111, !tbaa !57
  %82 = bitcast i32* %19 to i8*, !dbg !112
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %82) #3, !dbg !112
  call void @llvm.dbg.declare(metadata i32* %19, metadata !30, metadata !DIExpression()), !dbg !113
  %83 = load i32, i32* %18, align 4, !dbg !114, !tbaa !57
  %84 = sdiv i32 %83, 2, !dbg !115
  store i32 %84, i32* %19, align 4, !dbg !113, !tbaa !57
  %85 = bitcast i32* %20 to i8*, !dbg !116
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %85) #3, !dbg !116
  call void @llvm.dbg.declare(metadata i32* %20, metadata !31, metadata !DIExpression()), !dbg !117
  %86 = load i32, i32* %18, align 4, !dbg !118, !tbaa !57
  %87 = load i32, i32* %19, align 4, !dbg !119, !tbaa !57
  %88 = sdiv i32 %86, %87, !dbg !120
  store i32 %88, i32* %20, align 4, !dbg !117, !tbaa !57
  %89 = bitcast i32* %21 to i8*, !dbg !121
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %89) #3, !dbg !121
  call void @llvm.dbg.declare(metadata i32* %21, metadata !32, metadata !DIExpression()), !dbg !122
  store i32 2, i32* %21, align 4, !dbg !122, !tbaa !57
  %90 = bitcast float* %22 to i8*, !dbg !123
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %90) #3, !dbg !123
  call void @llvm.dbg.declare(metadata float* %22, metadata !33, metadata !DIExpression()), !dbg !124
  store float 1.000000e+00, float* %22, align 4, !dbg !124, !tbaa !125
  %91 = bitcast float* %23 to i8*, !dbg !127
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %91) #3, !dbg !127
  call void @llvm.dbg.declare(metadata float* %23, metadata !35, metadata !DIExpression()), !dbg !128
  %92 = load float, float* %22, align 4, !dbg !129, !tbaa !125
  %93 = fpext float %92 to double, !dbg !129
  %94 = fdiv double %93, 2.000000e+00, !dbg !130
  %95 = fptrunc double %94 to float, !dbg !129
  store float %95, float* %23, align 4, !dbg !128, !tbaa !125
  %96 = bitcast float* %24 to i8*, !dbg !131
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %96) #3, !dbg !131
  call void @llvm.dbg.declare(metadata float* %24, metadata !36, metadata !DIExpression()), !dbg !132
  %97 = load float, float* %22, align 4, !dbg !133, !tbaa !125
  %98 = load float, float* %23, align 4, !dbg !134, !tbaa !125
  %99 = fdiv float %97, %98, !dbg !135
  store float %99, float* %24, align 4, !dbg !132, !tbaa !125
  %100 = bitcast float* %25 to i8*, !dbg !136
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %100) #3, !dbg !136
  call void @llvm.dbg.declare(metadata float* %25, metadata !37, metadata !DIExpression()), !dbg !137
  store float 5.000000e-01, float* %25, align 4, !dbg !137, !tbaa !125
  %101 = bitcast i32* %26 to i8*, !dbg !138
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %101) #3, !dbg !138
  call void @llvm.dbg.declare(metadata i32* %26, metadata !38, metadata !DIExpression()), !dbg !139
  store i32 5, i32* %26, align 4, !dbg !139, !tbaa !57
  %102 = bitcast i32* %27 to i8*, !dbg !140
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %102) #3, !dbg !140
  call void @llvm.dbg.declare(metadata i32* %27, metadata !39, metadata !DIExpression()), !dbg !141
  %103 = load i32, i32* %26, align 4, !dbg !142, !tbaa !57
  %104 = srem i32 %103, 3, !dbg !143
  store i32 %104, i32* %27, align 4, !dbg !141, !tbaa !57
  %105 = bitcast i32* %28 to i8*, !dbg !144
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %105) #3, !dbg !144
  call void @llvm.dbg.declare(metadata i32* %28, metadata !40, metadata !DIExpression()), !dbg !145
  %106 = load i32, i32* %26, align 4, !dbg !146, !tbaa !57
  %107 = load i32, i32* %27, align 4, !dbg !147, !tbaa !57
  %108 = srem i32 %106, %107, !dbg !148
  store i32 %108, i32* %28, align 4, !dbg !145, !tbaa !57
  %109 = bitcast i32* %29 to i8*, !dbg !149
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %109) #3, !dbg !149
  call void @llvm.dbg.declare(metadata i32* %29, metadata !41, metadata !DIExpression()), !dbg !150
  store i32 40, i32* %29, align 4, !dbg !150, !tbaa !57
  %110 = bitcast i32* %30 to i8*, !dbg !151
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %110) #3, !dbg !151
  call void @llvm.dbg.declare(metadata i32* %30, metadata !42, metadata !DIExpression()), !dbg !152
  %111 = load i32, i32* %2, align 4, !dbg !153, !tbaa !57
  %112 = load i32, i32* %8, align 4, !dbg !154, !tbaa !57
  %113 = add nsw i32 %111, %112, !dbg !155
  %114 = load i32, i32* %15, align 4, !dbg !156, !tbaa !57
  %115 = mul nsw i32 %113, %114, !dbg !157
  %116 = load i32, i32* %26, align 4, !dbg !158, !tbaa !57
  %117 = srem i32 %115, %116, !dbg !159
  store i32 %117, i32* %30, align 4, !dbg !152, !tbaa !57
  %118 = load i32, i32* %14, align 4, !dbg !160, !tbaa !57
  %119 = load i32, i32* %2, align 4, !dbg !161, !tbaa !57
  %120 = add nsw i32 %119, %118, !dbg !161
  store i32 %120, i32* %2, align 4, !dbg !161, !tbaa !57
  %121 = load i32, i32* %2, align 4, !dbg !162, !tbaa !57
  %122 = add nsw i32 %121, 5, !dbg !162
  store i32 %122, i32* %2, align 4, !dbg !162, !tbaa !57
  %123 = load i32, i32* %14, align 4, !dbg !163, !tbaa !57
  %124 = load i32, i32* %2, align 4, !dbg !164, !tbaa !57
  %125 = sub nsw i32 %124, %123, !dbg !164
  store i32 %125, i32* %2, align 4, !dbg !164, !tbaa !57
  %126 = load i32, i32* %2, align 4, !dbg !165, !tbaa !57
  %127 = sub nsw i32 %126, 5, !dbg !165
  store i32 %127, i32* %2, align 4, !dbg !165, !tbaa !57
  %128 = load i32, i32* %15, align 4, !dbg !166, !tbaa !57
  %129 = load i32, i32* %14, align 4, !dbg !167, !tbaa !57
  %130 = mul nsw i32 %129, %128, !dbg !167
  store i32 %130, i32* %14, align 4, !dbg !167, !tbaa !57
  %131 = load i32, i32* %14, align 4, !dbg !168, !tbaa !57
  %132 = mul nsw i32 %131, 2, !dbg !168
  store i32 %132, i32* %14, align 4, !dbg !168, !tbaa !57
  %133 = load i32, i32* %19, align 4, !dbg !169, !tbaa !57
  %134 = load i32, i32* %18, align 4, !dbg !170, !tbaa !57
  %135 = sdiv i32 %134, %133, !dbg !170
  store i32 %135, i32* %18, align 4, !dbg !170, !tbaa !57
  %136 = load i32, i32* %18, align 4, !dbg !171, !tbaa !57
  %137 = sdiv i32 %136, 2, !dbg !171
  store i32 %137, i32* %18, align 4, !dbg !171, !tbaa !57
  %138 = load float, float* %23, align 4, !dbg !172, !tbaa !125
  %139 = load float, float* %22, align 4, !dbg !173, !tbaa !125
  %140 = fdiv float %139, %138, !dbg !173
  store float %140, float* %22, align 4, !dbg !173, !tbaa !125
  %141 = load float, float* %22, align 4, !dbg !174, !tbaa !125
  %142 = fdiv float %141, 2.000000e+00, !dbg !174
  store float %142, float* %22, align 4, !dbg !174, !tbaa !125
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %31) #3, !dbg !175
  call void @llvm.dbg.declare(metadata i8* %31, metadata !43, metadata !DIExpression()), !dbg !176
  store i8 1, i8* %31, align 1, !dbg !176, !tbaa !177
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %32) #3, !dbg !179
  call void @llvm.dbg.declare(metadata i8* %32, metadata !45, metadata !DIExpression()), !dbg !180
  store i8 0, i8* %32, align 1, !dbg !180, !tbaa !177
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %33) #3, !dbg !181
  call void @llvm.dbg.declare(metadata i8* %33, metadata !46, metadata !DIExpression()), !dbg !182
  %143 = load i8, i8* %31, align 1, !dbg !183, !tbaa !177, !range !184
  %144 = trunc i8 %143 to i1, !dbg !183
  %145 = zext i1 %144 to i32, !dbg !183
  %146 = load i8, i8* %32, align 1, !dbg !185, !tbaa !177, !range !184
  %147 = trunc i8 %146 to i1, !dbg !185
  %148 = zext i1 %147 to i32, !dbg !185
  %149 = icmp eq i32 %145, %148, !dbg !186
  %150 = zext i1 %149 to i8, !dbg !182
  store i8 %150, i8* %33, align 1, !dbg !182, !tbaa !177
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %34) #3, !dbg !187
  call void @llvm.dbg.declare(metadata i8* %34, metadata !47, metadata !DIExpression()), !dbg !188
  %151 = load i8, i8* %31, align 1, !dbg !189, !tbaa !177, !range !184
  %152 = trunc i8 %151 to i1, !dbg !189
  %153 = zext i1 %152 to i32, !dbg !189
  %154 = load i8, i8* %32, align 1, !dbg !190, !tbaa !177, !range !184
  %155 = trunc i8 %154 to i1, !dbg !190
  %156 = zext i1 %155 to i32, !dbg !190
  %157 = icmp ne i32 %153, %156, !dbg !191
  %158 = zext i1 %157 to i8, !dbg !188
  store i8 %158, i8* %34, align 1, !dbg !188, !tbaa !177
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %35) #3, !dbg !192
  call void @llvm.dbg.declare(metadata i8* %35, metadata !48, metadata !DIExpression()), !dbg !193
  %159 = load i32, i32* %2, align 4, !dbg !194, !tbaa !57
  %160 = load i32, i32* %3, align 4, !dbg !195, !tbaa !57
  %161 = icmp slt i32 %159, %160, !dbg !196
  %162 = zext i1 %161 to i8, !dbg !193
  store i8 %162, i8* %35, align 1, !dbg !193, !tbaa !177
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %36) #3, !dbg !197
  call void @llvm.dbg.declare(metadata i8* %36, metadata !49, metadata !DIExpression()), !dbg !198
  %163 = load i32, i32* %2, align 4, !dbg !199, !tbaa !57
  %164 = icmp sgt i32 %163, 2, !dbg !200
  %165 = zext i1 %164 to i8, !dbg !198
  store i8 %165, i8* %36, align 1, !dbg !198, !tbaa !177
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %37) #3, !dbg !201
  call void @llvm.dbg.declare(metadata i8* %37, metadata !50, metadata !DIExpression()), !dbg !202
  %166 = load i32, i32* %2, align 4, !dbg !203, !tbaa !57
  %167 = load i32, i32* %3, align 4, !dbg !204, !tbaa !57
  %168 = icmp sle i32 %166, %167, !dbg !205
  %169 = zext i1 %168 to i8, !dbg !202
  store i8 %169, i8* %37, align 1, !dbg !202, !tbaa !177
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %38) #3, !dbg !206
  call void @llvm.dbg.declare(metadata i8* %38, metadata !51, metadata !DIExpression()), !dbg !207
  %170 = load i32, i32* %2, align 4, !dbg !208, !tbaa !57
  %171 = icmp sge i32 %170, 2, !dbg !209
  %172 = zext i1 %171 to i8, !dbg !207
  store i8 %172, i8* %38, align 1, !dbg !207, !tbaa !177
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %39) #3, !dbg !210
  call void @llvm.dbg.declare(metadata i8* %39, metadata !52, metadata !DIExpression()), !dbg !211
  %173 = load i8, i8* %31, align 1, !dbg !212, !tbaa !177, !range !184
  %174 = trunc i8 %173 to i1, !dbg !212
  %175 = xor i1 %174, true, !dbg !213
  %176 = zext i1 %175 to i8, !dbg !211
  store i8 %176, i8* %39, align 1, !dbg !211, !tbaa !177
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %40) #3, !dbg !214
  call void @llvm.dbg.declare(metadata i8* %40, metadata !53, metadata !DIExpression()), !dbg !215
  %177 = load i8, i8* %31, align 1, !dbg !216, !tbaa !177, !range !184
  %178 = trunc i8 %177 to i1, !dbg !216
  br i1 %178, label %179, label %182, !dbg !217

179:                                              ; preds = %0
  %180 = load i8, i8* %32, align 1, !dbg !218, !tbaa !177, !range !184
  %181 = trunc i8 %180 to i1, !dbg !218
  br label %182

182:                                              ; preds = %179, %0
  %183 = phi i1 [ false, %0 ], [ %181, %179 ], !dbg !219
  %184 = zext i1 %183 to i8, !dbg !215
  store i8 %184, i8* %40, align 1, !dbg !215, !tbaa !177
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %41) #3, !dbg !220
  call void @llvm.dbg.declare(metadata i8* %41, metadata !54, metadata !DIExpression()), !dbg !221
  %185 = load i8, i8* %31, align 1, !dbg !222, !tbaa !177, !range !184
  %186 = trunc i8 %185 to i1, !dbg !222
  br i1 %186, label %190, label %187, !dbg !223

187:                                              ; preds = %182
  %188 = load i8, i8* %32, align 1, !dbg !224, !tbaa !177, !range !184
  %189 = trunc i8 %188 to i1, !dbg !224
  br label %190, !dbg !223

190:                                              ; preds = %187, %182
  %191 = phi i1 [ true, %182 ], [ %189, %187 ]
  %192 = zext i1 %191 to i8, !dbg !221
  store i8 %192, i8* %41, align 1, !dbg !221, !tbaa !177
  store i32 0, i32* %1, align 4, !dbg !225
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %41) #3, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %40) #3, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %39) #3, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %38) #3, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %37) #3, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %36) #3, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %35) #3, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %34) #3, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %33) #3, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %32) #3, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %31) #3, !dbg !226
  %193 = bitcast i32* %30 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %193) #3, !dbg !226
  %194 = bitcast i32* %29 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %194) #3, !dbg !226
  %195 = bitcast i32* %28 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %195) #3, !dbg !226
  %196 = bitcast i32* %27 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %196) #3, !dbg !226
  %197 = bitcast i32* %26 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %197) #3, !dbg !226
  %198 = bitcast float* %25 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %198) #3, !dbg !226
  %199 = bitcast float* %24 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %199) #3, !dbg !226
  %200 = bitcast float* %23 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %200) #3, !dbg !226
  %201 = bitcast float* %22 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %201) #3, !dbg !226
  %202 = bitcast i32* %21 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %202) #3, !dbg !226
  %203 = bitcast i32* %20 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %203) #3, !dbg !226
  %204 = bitcast i32* %19 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %204) #3, !dbg !226
  %205 = bitcast i32* %18 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %205) #3, !dbg !226
  %206 = bitcast i32* %17 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %206) #3, !dbg !226
  %207 = bitcast i32* %16 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %207) #3, !dbg !226
  %208 = bitcast i32* %15 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %208) #3, !dbg !226
  %209 = bitcast i32* %14 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %209) #3, !dbg !226
  %210 = bitcast i32* %13 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %210) #3, !dbg !226
  %211 = bitcast i32* %12 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %211) #3, !dbg !226
  %212 = bitcast i32* %11 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %212) #3, !dbg !226
  %213 = bitcast i32* %10 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %213) #3, !dbg !226
  %214 = bitcast i32* %9 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %214) #3, !dbg !226
  %215 = bitcast i32* %8 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %215) #3, !dbg !226
  %216 = bitcast i32* %7 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %216) #3, !dbg !226
  %217 = bitcast i32* %6 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %217) #3, !dbg !226
  %218 = bitcast i32* %5 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %218) #3, !dbg !226
  %219 = bitcast i32* %4 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %219) #3, !dbg !226
  %220 = bitcast i32* %3 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %220) #3, !dbg !226
  %221 = bitcast i32* %2 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %221) #3, !dbg !226
  %222 = load i32, i32* %1, align 4, !dbg !226
  ret i32 %222, !dbg !226
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
!1 = !DIFile(filename: "operatorTest.cpp", directory: "E:\\Documents\\Work Stuff\\Active Work Files\\Code Examples\\test_cpp01", checksumkind: CSK_MD5, checksum: "43b7a088cf2a357ddbc870e65b237188")
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
!12 = !{!13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !35, !36, !37, !38, !39, !40, !41, !42, !43, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54}
!13 = !DILocalVariable(name: "a", scope: !8, file: !1, line: 3, type: !11)
!14 = !DILocalVariable(name: "b", scope: !8, file: !1, line: 4, type: !11)
!15 = !DILocalVariable(name: "c", scope: !8, file: !1, line: 5, type: !11)
!16 = !DILocalVariable(name: "d", scope: !8, file: !1, line: 6, type: !11)
!17 = !DILocalVariable(name: "e", scope: !8, file: !1, line: 7, type: !11)
!18 = !DILocalVariable(name: "f", scope: !8, file: !1, line: 8, type: !11)
!19 = !DILocalVariable(name: "g", scope: !8, file: !1, line: 11, type: !11)
!20 = !DILocalVariable(name: "h", scope: !8, file: !1, line: 12, type: !11)
!21 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 13, type: !11)
!22 = !DILocalVariable(name: "j", scope: !8, file: !1, line: 14, type: !11)
!23 = !DILocalVariable(name: "k", scope: !8, file: !1, line: 15, type: !11)
!24 = !DILocalVariable(name: "l", scope: !8, file: !1, line: 16, type: !11)
!25 = !DILocalVariable(name: "m", scope: !8, file: !1, line: 19, type: !11)
!26 = !DILocalVariable(name: "n", scope: !8, file: !1, line: 20, type: !11)
!27 = !DILocalVariable(name: "o", scope: !8, file: !1, line: 21, type: !11)
!28 = !DILocalVariable(name: "p", scope: !8, file: !1, line: 22, type: !11)
!29 = !DILocalVariable(name: "q", scope: !8, file: !1, line: 25, type: !11)
!30 = !DILocalVariable(name: "r", scope: !8, file: !1, line: 26, type: !11)
!31 = !DILocalVariable(name: "s", scope: !8, file: !1, line: 27, type: !11)
!32 = !DILocalVariable(name: "t", scope: !8, file: !1, line: 28, type: !11)
!33 = !DILocalVariable(name: "u", scope: !8, file: !1, line: 30, type: !34)
!34 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!35 = !DILocalVariable(name: "v", scope: !8, file: !1, line: 31, type: !34)
!36 = !DILocalVariable(name: "w", scope: !8, file: !1, line: 32, type: !34)
!37 = !DILocalVariable(name: "x", scope: !8, file: !1, line: 33, type: !34)
!38 = !DILocalVariable(name: "y", scope: !8, file: !1, line: 36, type: !11)
!39 = !DILocalVariable(name: "z", scope: !8, file: !1, line: 37, type: !11)
!40 = !DILocalVariable(name: "aa", scope: !8, file: !1, line: 38, type: !11)
!41 = !DILocalVariable(name: "ab", scope: !8, file: !1, line: 39, type: !11)
!42 = !DILocalVariable(name: "zz", scope: !8, file: !1, line: 41, type: !11)
!43 = !DILocalVariable(name: "yes", scope: !8, file: !1, line: 56, type: !44)
!44 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!45 = !DILocalVariable(name: "no", scope: !8, file: !1, line: 57, type: !44)
!46 = !DILocalVariable(name: "equality", scope: !8, file: !1, line: 58, type: !44)
!47 = !DILocalVariable(name: "nequality", scope: !8, file: !1, line: 59, type: !44)
!48 = !DILocalVariable(name: "lt", scope: !8, file: !1, line: 60, type: !44)
!49 = !DILocalVariable(name: "gt", scope: !8, file: !1, line: 61, type: !44)
!50 = !DILocalVariable(name: "lte", scope: !8, file: !1, line: 62, type: !44)
!51 = !DILocalVariable(name: "gte", scope: !8, file: !1, line: 63, type: !44)
!52 = !DILocalVariable(name: "negate", scope: !8, file: !1, line: 66, type: !44)
!53 = !DILocalVariable(name: "all", scope: !8, file: !1, line: 67, type: !44)
!54 = !DILocalVariable(name: "any", scope: !8, file: !1, line: 68, type: !44)
!55 = !DILocation(line: 3, column: 2, scope: !8)
!56 = !DILocation(line: 3, column: 6, scope: !8)
!57 = !{!58, !58, i64 0}
!58 = !{!"int", !59, i64 0}
!59 = !{!"omnipotent char", !60, i64 0}
!60 = !{!"Simple C++ TBAA"}
!61 = !DILocation(line: 4, column: 2, scope: !8)
!62 = !DILocation(line: 4, column: 6, scope: !8)
!63 = !DILocation(line: 4, column: 11, scope: !8)
!64 = !DILocation(line: 5, column: 2, scope: !8)
!65 = !DILocation(line: 5, column: 6, scope: !8)
!66 = !DILocation(line: 5, column: 10, scope: !8)
!67 = !DILocation(line: 6, column: 2, scope: !8)
!68 = !DILocation(line: 6, column: 6, scope: !8)
!69 = !DILocation(line: 6, column: 10, scope: !8)
!70 = !DILocation(line: 6, column: 12, scope: !8)
!71 = !DILocation(line: 6, column: 11, scope: !8)
!72 = !DILocation(line: 7, column: 2, scope: !8)
!73 = !DILocation(line: 7, column: 6, scope: !8)
!74 = !DILocation(line: 7, column: 12, scope: !8)
!75 = !DILocation(line: 7, column: 11, scope: !8)
!76 = !DILocation(line: 8, column: 2, scope: !8)
!77 = !DILocation(line: 8, column: 6, scope: !8)
!78 = !DILocation(line: 11, column: 2, scope: !8)
!79 = !DILocation(line: 11, column: 6, scope: !8)
!80 = !DILocation(line: 12, column: 2, scope: !8)
!81 = !DILocation(line: 12, column: 6, scope: !8)
!82 = !DILocation(line: 12, column: 11, scope: !8)
!83 = !DILocation(line: 13, column: 2, scope: !8)
!84 = !DILocation(line: 13, column: 6, scope: !8)
!85 = !DILocation(line: 13, column: 10, scope: !8)
!86 = !DILocation(line: 14, column: 2, scope: !8)
!87 = !DILocation(line: 14, column: 6, scope: !8)
!88 = !DILocation(line: 14, column: 10, scope: !8)
!89 = !DILocation(line: 14, column: 12, scope: !8)
!90 = !DILocation(line: 14, column: 11, scope: !8)
!91 = !DILocation(line: 15, column: 2, scope: !8)
!92 = !DILocation(line: 15, column: 6, scope: !8)
!93 = !DILocation(line: 15, column: 12, scope: !8)
!94 = !DILocation(line: 15, column: 11, scope: !8)
!95 = !DILocation(line: 16, column: 2, scope: !8)
!96 = !DILocation(line: 16, column: 6, scope: !8)
!97 = !DILocation(line: 19, column: 2, scope: !8)
!98 = !DILocation(line: 19, column: 6, scope: !8)
!99 = !DILocation(line: 20, column: 2, scope: !8)
!100 = !DILocation(line: 20, column: 6, scope: !8)
!101 = !DILocation(line: 20, column: 10, scope: !8)
!102 = !DILocation(line: 20, column: 11, scope: !8)
!103 = !DILocation(line: 21, column: 2, scope: !8)
!104 = !DILocation(line: 21, column: 6, scope: !8)
!105 = !DILocation(line: 21, column: 10, scope: !8)
!106 = !DILocation(line: 21, column: 12, scope: !8)
!107 = !DILocation(line: 21, column: 11, scope: !8)
!108 = !DILocation(line: 22, column: 2, scope: !8)
!109 = !DILocation(line: 22, column: 6, scope: !8)
!110 = !DILocation(line: 25, column: 2, scope: !8)
!111 = !DILocation(line: 25, column: 6, scope: !8)
!112 = !DILocation(line: 26, column: 2, scope: !8)
!113 = !DILocation(line: 26, column: 6, scope: !8)
!114 = !DILocation(line: 26, column: 10, scope: !8)
!115 = !DILocation(line: 26, column: 11, scope: !8)
!116 = !DILocation(line: 27, column: 2, scope: !8)
!117 = !DILocation(line: 27, column: 6, scope: !8)
!118 = !DILocation(line: 27, column: 10, scope: !8)
!119 = !DILocation(line: 27, column: 12, scope: !8)
!120 = !DILocation(line: 27, column: 11, scope: !8)
!121 = !DILocation(line: 28, column: 2, scope: !8)
!122 = !DILocation(line: 28, column: 6, scope: !8)
!123 = !DILocation(line: 30, column: 2, scope: !8)
!124 = !DILocation(line: 30, column: 8, scope: !8)
!125 = !{!126, !126, i64 0}
!126 = !{!"float", !59, i64 0}
!127 = !DILocation(line: 31, column: 2, scope: !8)
!128 = !DILocation(line: 31, column: 8, scope: !8)
!129 = !DILocation(line: 31, column: 12, scope: !8)
!130 = !DILocation(line: 31, column: 13, scope: !8)
!131 = !DILocation(line: 32, column: 2, scope: !8)
!132 = !DILocation(line: 32, column: 8, scope: !8)
!133 = !DILocation(line: 32, column: 12, scope: !8)
!134 = !DILocation(line: 32, column: 14, scope: !8)
!135 = !DILocation(line: 32, column: 13, scope: !8)
!136 = !DILocation(line: 33, column: 2, scope: !8)
!137 = !DILocation(line: 33, column: 8, scope: !8)
!138 = !DILocation(line: 36, column: 2, scope: !8)
!139 = !DILocation(line: 36, column: 6, scope: !8)
!140 = !DILocation(line: 37, column: 2, scope: !8)
!141 = !DILocation(line: 37, column: 6, scope: !8)
!142 = !DILocation(line: 37, column: 10, scope: !8)
!143 = !DILocation(line: 37, column: 11, scope: !8)
!144 = !DILocation(line: 38, column: 2, scope: !8)
!145 = !DILocation(line: 38, column: 6, scope: !8)
!146 = !DILocation(line: 38, column: 11, scope: !8)
!147 = !DILocation(line: 38, column: 13, scope: !8)
!148 = !DILocation(line: 38, column: 12, scope: !8)
!149 = !DILocation(line: 39, column: 2, scope: !8)
!150 = !DILocation(line: 39, column: 6, scope: !8)
!151 = !DILocation(line: 41, column: 2, scope: !8)
!152 = !DILocation(line: 41, column: 6, scope: !8)
!153 = !DILocation(line: 41, column: 13, scope: !8)
!154 = !DILocation(line: 41, column: 15, scope: !8)
!155 = !DILocation(line: 41, column: 14, scope: !8)
!156 = !DILocation(line: 41, column: 18, scope: !8)
!157 = !DILocation(line: 41, column: 17, scope: !8)
!158 = !DILocation(line: 41, column: 21, scope: !8)
!159 = !DILocation(line: 41, column: 20, scope: !8)
!160 = !DILocation(line: 44, column: 7, scope: !8)
!161 = !DILocation(line: 44, column: 4, scope: !8)
!162 = !DILocation(line: 45, column: 4, scope: !8)
!163 = !DILocation(line: 46, column: 7, scope: !8)
!164 = !DILocation(line: 46, column: 4, scope: !8)
!165 = !DILocation(line: 47, column: 4, scope: !8)
!166 = !DILocation(line: 48, column: 7, scope: !8)
!167 = !DILocation(line: 48, column: 4, scope: !8)
!168 = !DILocation(line: 49, column: 4, scope: !8)
!169 = !DILocation(line: 50, column: 7, scope: !8)
!170 = !DILocation(line: 50, column: 4, scope: !8)
!171 = !DILocation(line: 51, column: 4, scope: !8)
!172 = !DILocation(line: 52, column: 7, scope: !8)
!173 = !DILocation(line: 52, column: 4, scope: !8)
!174 = !DILocation(line: 53, column: 4, scope: !8)
!175 = !DILocation(line: 56, column: 2, scope: !8)
!176 = !DILocation(line: 56, column: 7, scope: !8)
!177 = !{!178, !178, i64 0}
!178 = !{!"bool", !59, i64 0}
!179 = !DILocation(line: 57, column: 2, scope: !8)
!180 = !DILocation(line: 57, column: 7, scope: !8)
!181 = !DILocation(line: 58, column: 2, scope: !8)
!182 = !DILocation(line: 58, column: 7, scope: !8)
!183 = !DILocation(line: 58, column: 18, scope: !8)
!184 = !{i8 0, i8 2}
!185 = !DILocation(line: 58, column: 25, scope: !8)
!186 = !DILocation(line: 58, column: 22, scope: !8)
!187 = !DILocation(line: 59, column: 2, scope: !8)
!188 = !DILocation(line: 59, column: 7, scope: !8)
!189 = !DILocation(line: 59, column: 19, scope: !8)
!190 = !DILocation(line: 59, column: 26, scope: !8)
!191 = !DILocation(line: 59, column: 23, scope: !8)
!192 = !DILocation(line: 60, column: 2, scope: !8)
!193 = !DILocation(line: 60, column: 7, scope: !8)
!194 = !DILocation(line: 60, column: 12, scope: !8)
!195 = !DILocation(line: 60, column: 16, scope: !8)
!196 = !DILocation(line: 60, column: 14, scope: !8)
!197 = !DILocation(line: 61, column: 2, scope: !8)
!198 = !DILocation(line: 61, column: 7, scope: !8)
!199 = !DILocation(line: 61, column: 12, scope: !8)
!200 = !DILocation(line: 61, column: 14, scope: !8)
!201 = !DILocation(line: 62, column: 2, scope: !8)
!202 = !DILocation(line: 62, column: 7, scope: !8)
!203 = !DILocation(line: 62, column: 13, scope: !8)
!204 = !DILocation(line: 62, column: 18, scope: !8)
!205 = !DILocation(line: 62, column: 15, scope: !8)
!206 = !DILocation(line: 63, column: 2, scope: !8)
!207 = !DILocation(line: 63, column: 7, scope: !8)
!208 = !DILocation(line: 63, column: 13, scope: !8)
!209 = !DILocation(line: 63, column: 15, scope: !8)
!210 = !DILocation(line: 66, column: 2, scope: !8)
!211 = !DILocation(line: 66, column: 7, scope: !8)
!212 = !DILocation(line: 66, column: 17, scope: !8)
!213 = !DILocation(line: 66, column: 16, scope: !8)
!214 = !DILocation(line: 67, column: 2, scope: !8)
!215 = !DILocation(line: 67, column: 7, scope: !8)
!216 = !DILocation(line: 67, column: 13, scope: !8)
!217 = !DILocation(line: 67, column: 17, scope: !8)
!218 = !DILocation(line: 67, column: 20, scope: !8)
!219 = !DILocation(line: 0, scope: !8)
!220 = !DILocation(line: 68, column: 2, scope: !8)
!221 = !DILocation(line: 68, column: 7, scope: !8)
!222 = !DILocation(line: 68, column: 13, scope: !8)
!223 = !DILocation(line: 68, column: 17, scope: !8)
!224 = !DILocation(line: 68, column: 20, scope: !8)
!225 = !DILocation(line: 70, column: 2, scope: !8)
!226 = !DILocation(line: 71, column: 1, scope: !8)

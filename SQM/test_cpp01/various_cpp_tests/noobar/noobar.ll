; ModuleID = 'noobar.cpp'
source_filename = "noobar.cpp"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.29.30038"

%"class.std::basic_string" = type { %"class.std::_Compressed_pair" }
%"class.std::_Compressed_pair" = type { %"class.std::_String_val" }
%"class.std::_String_val" = type { %"union.std::_String_val<std::_Simple_types<char>>::_Bxty", i64, i64 }
%"union.std::_String_val<std::_Simple_types<char>>::_Bxty" = type { i8*, [8 x i8] }
%"struct.std::_Fake_allocator" = type { i8 }
%rtti.TypeDescriptor30 = type { i8**, i8*, [31 x i8] }
%eh.CatchableType = type { i32, i32, i32, i32, i32, i32, i32 }
%rtti.TypeDescriptor19 = type { i8**, i8*, [20 x i8] }
%eh.CatchableTypeArray.3 = type { i32, [3 x i32] }
%eh.ThrowInfo = type { i32, i32, i32, i32 }
%rtti.CompleteObjectLocator = type { i32, i32, i32, i32, i32, i32 }
%rtti.ClassHierarchyDescriptor = type { i32, i32, i32, i32 }
%rtti.BaseClassDescriptor = type { i32, i32, i32, i32, i32, i32, i32 }
%"struct.std::_Zero_then_variadic_args_t" = type { i8 }
%"struct.std::_Fake_proxy_ptr_impl" = type { i8 }
%"struct.std::_Container_base0" = type { i8 }
%"class.std::allocator" = type { i8 }
%"struct.std::_One_then_variadic_args_t" = type { i8 }
%class.anon = type { i8 }
%"class.std::bad_array_new_length" = type { %"class.std::bad_alloc" }
%"class.std::bad_alloc" = type { %"class.std::exception" }
%"class.std::exception" = type { i32 (...)**, %struct.__std_exception_data }
%struct.__std_exception_data = type { i8*, i8 }

$"??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@QEBD@Z" = comdat any

$"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ" = comdat any

$"??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@AEBV01@@Z" = comdat any

$"?_Tidy_deallocate@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ" = comdat any

$"??1?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@XZ" = comdat any

$"?_Orphan_all@_Container_base0@std@@QEAAXXZ" = comdat any

$"?_Large_string_engaged@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_NXZ" = comdat any

$"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV?$allocator@D@2@XZ" = comdat any

$"??$_Destroy_in_place@PEAD@std@@YAXAEAPEAD@Z" = comdat any

$"?deallocate@?$allocator@D@std@@QEAAXQEAD_K@Z" = comdat any

$"?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z" = comdat any

$"?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAAAEAV?$allocator@D@2@XZ" = comdat any

$"??$_Deallocate@$0BA@$0A@@std@@YAXPEAX_K@Z" = comdat any

$"?_Adjust_manually_vector_aligned@std@@YAXAEAPEAXAEA_K@Z" = comdat any

$"??1?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ" = comdat any

$"??1_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ" = comdat any

$"??$?0$$V@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@U_Zero_then_variadic_args_t@1@@Z" = comdat any

$"??0_Fake_proxy_ptr_impl@std@@QEAA@AEBU_Fake_allocator@1@AEBU_Container_base0@1@@Z" = comdat any

$"?_Tidy_init@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ" = comdat any

$"?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD@Z" = comdat any

$"?_Release@_Fake_proxy_ptr_impl@std@@QEAAXXZ" = comdat any

$"??0?$allocator@D@std@@QEAA@XZ" = comdat any

$"??0?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ" = comdat any

$"??0_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ" = comdat any

$"?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD_K@Z" = comdat any

$"??$_Convert_size@_K@std@@YA_K_K@Z" = comdat any

$"?length@?$_Narrow_char_traits@DH@std@@SA_KQEBD@Z" = comdat any

$"?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAAPEADXZ" = comdat any

$"?move@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z" = comdat any

$"??$_Reallocate_for@V<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??assign@01@QEAAAEAV01@QEBD0@Z@PEBD@Z" = comdat any

$"??$_Unfancy@D@std@@YAPEADPEAD@Z" = comdat any

$"?max_size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ" = comdat any

$"?_Xlen_string@std@@YAXXZ" = comdat any

$"?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBA_K_K@Z" = comdat any

$"?allocate@?$allocator@D@std@@QEAAPEAD_K@Z" = comdat any

$"??R<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV23@QEBD_K@Z@QEBA?A?<auto>@@QEAD10@Z" = comdat any

$"??$_Construct_in_place@PEADAEBQEAD@std@@YAXAEAPEADAEBQEAD@Z" = comdat any

$"?max_size@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA_KAEBV?$allocator@D@2@@Z" = comdat any

$"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBAAEBV?$allocator@D@2@XZ" = comdat any

$"??$max@_K@std@@YAAEB_KAEB_K0@Z" = comdat any

$"??$min@_K@std@@YAAEB_KAEB_K0@Z" = comdat any

$"?max@?$numeric_limits@_J@std@@SA_JXZ" = comdat any

$"?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEBAAEBV?$allocator@D@2@XZ" = comdat any

$"?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@CA_K_K00@Z" = comdat any

$"??$_Allocate@$0BA@U_Default_allocate_traits@std@@$0A@@std@@YAPEAX_K@Z" = comdat any

$"??$_Get_size_of_n@$00@std@@YA_K_K@Z" = comdat any

$"??$_Allocate_manually_vector_aligned@U_Default_allocate_traits@std@@@std@@YAPEAX_K@Z" = comdat any

$"?_Allocate@_Default_allocate_traits@std@@SAPEAX_K@Z" = comdat any

$"?_Throw_bad_array_new_length@std@@YAXXZ" = comdat any

$"??0bad_array_new_length@std@@QEAA@XZ" = comdat any

$"??0bad_array_new_length@std@@QEAA@AEBV01@@Z" = comdat any

$"??0bad_alloc@std@@QEAA@AEBV01@@Z" = comdat any

$"??0exception@std@@QEAA@AEBV01@@Z" = comdat any

$"??1exception@std@@UEAA@XZ" = comdat any

$"??0bad_alloc@std@@AEAA@QEBD@Z" = comdat any

$"??_Gbad_array_new_length@std@@UEAAPEAXI@Z" = comdat any

$"?what@exception@std@@UEBAPEBDXZ" = comdat any

$"??0exception@std@@QEAA@QEBDH@Z" = comdat any

$"??_Gbad_alloc@std@@UEAAPEAXI@Z" = comdat any

$"??_Gexception@std@@UEAAPEAXI@Z" = comdat any

$"?copy@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z" = comdat any

$"??$_Voidify_iter@PEAPEAD@std@@YAPEAXPEAPEAD@Z" = comdat any

$"??$addressof@PEAD@std@@YAPEAPEADAEAPEAD@Z" = comdat any

$"??$forward@AEBQEAD@std@@YAAEBQEADAEBQEAD@Z" = comdat any

$"?select_on_container_copy_construction@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA?AV?$allocator@D@2@AEBV32@@Z" = comdat any

$"??$?0V?$allocator@D@std@@$$V@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@U_One_then_variadic_args_t@1@$$QEAV?$allocator@D@1@@Z" = comdat any

$"?_Construct_lv_contents@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@@Z" = comdat any

$"??$forward@V?$allocator@D@std@@@std@@YA$$QEAV?$allocator@D@0@AEAV10@@Z" = comdat any

$"?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBAPEBDXZ" = comdat any

$"??_C@_0N@GGOCCEB@Howdy?5world?$CB?$AA@" = comdat any

$"??_C@_0BA@JFNIOLAK@string?5too?5long?$AA@" = comdat any

$"??_R0?AVbad_array_new_length@std@@@8" = comdat any

$"_CT??_R0?AVbad_array_new_length@std@@@8??0bad_array_new_length@std@@QEAA@AEBV01@@Z24" = comdat any

$"??_R0?AVbad_alloc@std@@@8" = comdat any

$"_CT??_R0?AVbad_alloc@std@@@8??0bad_alloc@std@@QEAA@AEBV01@@Z24" = comdat any

$"??_R0?AVexception@std@@@8" = comdat any

$"_CT??_R0?AVexception@std@@@8??0exception@std@@QEAA@AEBV01@@Z24" = comdat any

$"_CTA3?AVbad_array_new_length@std@@" = comdat any

$"_TI3?AVbad_array_new_length@std@@" = comdat any

$"??_C@_0BF@KINCDENJ@bad?5array?5new?5length?$AA@" = comdat any

$"??_7bad_array_new_length@std@@6B@" = comdat largest

$"??_R4bad_array_new_length@std@@6B@" = comdat any

$"??_R3bad_array_new_length@std@@8" = comdat any

$"??_R2bad_array_new_length@std@@8" = comdat any

$"??_R1A@?0A@EA@bad_array_new_length@std@@8" = comdat any

$"??_R1A@?0A@EA@bad_alloc@std@@8" = comdat any

$"??_R3bad_alloc@std@@8" = comdat any

$"??_R2bad_alloc@std@@8" = comdat any

$"??_R1A@?0A@EA@exception@std@@8" = comdat any

$"??_R3exception@std@@8" = comdat any

$"??_R2exception@std@@8" = comdat any

$"??_7bad_alloc@std@@6B@" = comdat largest

$"??_R4bad_alloc@std@@6B@" = comdat any

$"??_7exception@std@@6B@" = comdat largest

$"??_R4exception@std@@6B@" = comdat any

$"??_C@_0BC@EOODALEL@Unknown?5exception?$AA@" = comdat any

@"?globalInt@@3HA" = dso_local global i32 10, align 4, !dbg !0
@"?globalChar@@3DA" = dso_local global i8 65, align 1, !dbg !822
@"?globalFloat@@3MA" = dso_local global float 5.000000e-01, align 4, !dbg !824
@"?gloBool@@3_NA" = dso_local global i8 1, align 1, !dbg !827
@"?globalString@@3V?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@A" = dso_local global %"class.std::basic_string" zeroinitializer, align 8, !dbg !829
@"??_C@_0N@GGOCCEB@Howdy?5world?$CB?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"Howdy world!\00", comdat, align 1
@"?globalZero@@3HA" = dso_local global i32 0, align 4, !dbg !832
@"?globalDeclare@@3HA" = dso_local global i32 0, align 4, !dbg !834
@"?globalIntPointer@@3PEAHEA" = dso_local global i32* @"?globalInt@@3HA", align 8, !dbg !836
@"?m@?1??main@@9@4HA" = internal global i32 0, align 4, !dbg !839
@staticGlobal = internal global i32 0, align 4, !dbg !856
@"?_Fake_alloc@std@@3U_Fake_allocator@1@B" = internal constant %"struct.std::_Fake_allocator" undef, align 1, !dbg !862
@"??_C@_0BA@JFNIOLAK@string?5too?5long?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"string too long\00", comdat, align 1
@"??_7type_info@@6B@" = external constant i8*
@"??_R0?AVbad_array_new_length@std@@@8" = linkonce_odr global %rtti.TypeDescriptor30 { i8** @"??_7type_info@@6B@", i8* null, [31 x i8] c".?AVbad_array_new_length@std@@\00" }, comdat
@__ImageBase = external dso_local constant i8
@"_CT??_R0?AVbad_array_new_length@std@@@8??0bad_array_new_length@std@@QEAA@AEBV01@@Z24" = linkonce_odr unnamed_addr constant %eh.CatchableType { i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.TypeDescriptor30* @"??_R0?AVbad_array_new_length@std@@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 0, i32 -1, i32 0, i32 24, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%"class.std::bad_array_new_length"* (%"class.std::bad_array_new_length"*, %"class.std::bad_array_new_length"*)* @"??0bad_array_new_length@std@@QEAA@AEBV01@@Z" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32) }, section ".xdata", comdat
@"??_R0?AVbad_alloc@std@@@8" = linkonce_odr global %rtti.TypeDescriptor19 { i8** @"??_7type_info@@6B@", i8* null, [20 x i8] c".?AVbad_alloc@std@@\00" }, comdat
@"_CT??_R0?AVbad_alloc@std@@@8??0bad_alloc@std@@QEAA@AEBV01@@Z24" = linkonce_odr unnamed_addr constant %eh.CatchableType { i32 16, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.TypeDescriptor19* @"??_R0?AVbad_alloc@std@@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 0, i32 -1, i32 0, i32 24, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%"class.std::bad_alloc"* (%"class.std::bad_alloc"*, %"class.std::bad_alloc"*)* @"??0bad_alloc@std@@QEAA@AEBV01@@Z" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32) }, section ".xdata", comdat
@"??_R0?AVexception@std@@@8" = linkonce_odr global %rtti.TypeDescriptor19 { i8** @"??_7type_info@@6B@", i8* null, [20 x i8] c".?AVexception@std@@\00" }, comdat
@"_CT??_R0?AVexception@std@@@8??0exception@std@@QEAA@AEBV01@@Z24" = linkonce_odr unnamed_addr constant %eh.CatchableType { i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.TypeDescriptor19* @"??_R0?AVexception@std@@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 0, i32 -1, i32 0, i32 24, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%"class.std::exception"* (%"class.std::exception"*, %"class.std::exception"*)* @"??0exception@std@@QEAA@AEBV01@@Z" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32) }, section ".xdata", comdat
@"_CTA3?AVbad_array_new_length@std@@" = linkonce_odr unnamed_addr constant %eh.CatchableTypeArray.3 { i32 3, [3 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%eh.CatchableType* @"_CT??_R0?AVbad_array_new_length@std@@@8??0bad_array_new_length@std@@QEAA@AEBV01@@Z24" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%eh.CatchableType* @"_CT??_R0?AVbad_alloc@std@@@8??0bad_alloc@std@@QEAA@AEBV01@@Z24" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%eh.CatchableType* @"_CT??_R0?AVexception@std@@@8??0exception@std@@QEAA@AEBV01@@Z24" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32)] }, section ".xdata", comdat
@"_TI3?AVbad_array_new_length@std@@" = linkonce_odr unnamed_addr constant %eh.ThrowInfo { i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (void (%"class.std::exception"*)* @"??1exception@std@@UEAA@XZ" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%eh.CatchableTypeArray.3* @"_CTA3?AVbad_array_new_length@std@@" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32) }, section ".xdata", comdat
@"??_C@_0BF@KINCDENJ@bad?5array?5new?5length?$AA@" = linkonce_odr dso_local unnamed_addr constant [21 x i8] c"bad array new length\00", comdat, align 1
@0 = private unnamed_addr constant { [3 x i8*] } { [3 x i8*] [i8* bitcast (%rtti.CompleteObjectLocator* @"??_R4bad_array_new_length@std@@6B@" to i8*), i8* bitcast (i8* (%"class.std::bad_array_new_length"*, i32)* @"??_Gbad_array_new_length@std@@UEAAPEAXI@Z" to i8*), i8* bitcast (i8* (%"class.std::exception"*)* @"?what@exception@std@@UEBAPEBDXZ" to i8*)] }, comdat($"??_7bad_array_new_length@std@@6B@")
@"??_R4bad_array_new_length@std@@6B@" = linkonce_odr constant %rtti.CompleteObjectLocator { i32 1, i32 0, i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.TypeDescriptor30* @"??_R0?AVbad_array_new_length@std@@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.ClassHierarchyDescriptor* @"??_R3bad_array_new_length@std@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.CompleteObjectLocator* @"??_R4bad_array_new_length@std@@6B@" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32) }, comdat
@"??_R3bad_array_new_length@std@@8" = linkonce_odr constant %rtti.ClassHierarchyDescriptor { i32 0, i32 0, i32 3, i32 trunc (i64 sub nuw nsw (i64 ptrtoint ([4 x i32]* @"??_R2bad_array_new_length@std@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32) }, comdat
@"??_R2bad_array_new_length@std@@8" = linkonce_odr constant [4 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.BaseClassDescriptor* @"??_R1A@?0A@EA@bad_array_new_length@std@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.BaseClassDescriptor* @"??_R1A@?0A@EA@bad_alloc@std@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.BaseClassDescriptor* @"??_R1A@?0A@EA@exception@std@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 0], comdat
@"??_R1A@?0A@EA@bad_array_new_length@std@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.TypeDescriptor30* @"??_R0?AVbad_array_new_length@std@@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 2, i32 0, i32 -1, i32 0, i32 64, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.ClassHierarchyDescriptor* @"??_R3bad_array_new_length@std@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32) }, comdat
@"??_R1A@?0A@EA@bad_alloc@std@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.TypeDescriptor19* @"??_R0?AVbad_alloc@std@@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 1, i32 0, i32 -1, i32 0, i32 64, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.ClassHierarchyDescriptor* @"??_R3bad_alloc@std@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32) }, comdat
@"??_R3bad_alloc@std@@8" = linkonce_odr constant %rtti.ClassHierarchyDescriptor { i32 0, i32 0, i32 2, i32 trunc (i64 sub nuw nsw (i64 ptrtoint ([3 x i32]* @"??_R2bad_alloc@std@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32) }, comdat
@"??_R2bad_alloc@std@@8" = linkonce_odr constant [3 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.BaseClassDescriptor* @"??_R1A@?0A@EA@bad_alloc@std@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.BaseClassDescriptor* @"??_R1A@?0A@EA@exception@std@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 0], comdat
@"??_R1A@?0A@EA@exception@std@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.TypeDescriptor19* @"??_R0?AVexception@std@@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 0, i32 0, i32 -1, i32 0, i32 64, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.ClassHierarchyDescriptor* @"??_R3exception@std@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32) }, comdat
@"??_R3exception@std@@8" = linkonce_odr constant %rtti.ClassHierarchyDescriptor { i32 0, i32 0, i32 1, i32 trunc (i64 sub nuw nsw (i64 ptrtoint ([2 x i32]* @"??_R2exception@std@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32) }, comdat
@"??_R2exception@std@@8" = linkonce_odr constant [2 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.BaseClassDescriptor* @"??_R1A@?0A@EA@exception@std@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 0], comdat
@1 = private unnamed_addr constant { [3 x i8*] } { [3 x i8*] [i8* bitcast (%rtti.CompleteObjectLocator* @"??_R4bad_alloc@std@@6B@" to i8*), i8* bitcast (i8* (%"class.std::bad_alloc"*, i32)* @"??_Gbad_alloc@std@@UEAAPEAXI@Z" to i8*), i8* bitcast (i8* (%"class.std::exception"*)* @"?what@exception@std@@UEBAPEBDXZ" to i8*)] }, comdat($"??_7bad_alloc@std@@6B@")
@"??_R4bad_alloc@std@@6B@" = linkonce_odr constant %rtti.CompleteObjectLocator { i32 1, i32 0, i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.TypeDescriptor19* @"??_R0?AVbad_alloc@std@@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.ClassHierarchyDescriptor* @"??_R3bad_alloc@std@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.CompleteObjectLocator* @"??_R4bad_alloc@std@@6B@" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32) }, comdat
@2 = private unnamed_addr constant { [3 x i8*] } { [3 x i8*] [i8* bitcast (%rtti.CompleteObjectLocator* @"??_R4exception@std@@6B@" to i8*), i8* bitcast (i8* (%"class.std::exception"*, i32)* @"??_Gexception@std@@UEAAPEAXI@Z" to i8*), i8* bitcast (i8* (%"class.std::exception"*)* @"?what@exception@std@@UEBAPEBDXZ" to i8*)] }, comdat($"??_7exception@std@@6B@")
@"??_R4exception@std@@6B@" = linkonce_odr constant %rtti.CompleteObjectLocator { i32 1, i32 0, i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.TypeDescriptor19* @"??_R0?AVexception@std@@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.ClassHierarchyDescriptor* @"??_R3exception@std@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.CompleteObjectLocator* @"??_R4exception@std@@6B@" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32) }, comdat
@"??_C@_0BC@EOODALEL@Unknown?5exception?$AA@" = linkonce_odr dso_local unnamed_addr constant [18 x i8] c"Unknown exception\00", comdat, align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_noobar.cpp, i8* null }]

@"??_7bad_array_new_length@std@@6B@" = unnamed_addr alias i8*, getelementptr inbounds ({ [3 x i8*] }, { [3 x i8*] }* @0, i32 0, i32 0, i32 1)
@"??_7bad_alloc@std@@6B@" = unnamed_addr alias i8*, getelementptr inbounds ({ [3 x i8*] }, { [3 x i8*] }* @1, i32 0, i32 0, i32 1)
@"??_7exception@std@@6B@" = unnamed_addr alias i8*, getelementptr inbounds ({ [3 x i8*] }, { [3 x i8*] }* @2, i32 0, i32 0, i32 1)

; Function Attrs: uwtable
define internal void @"??__EglobalString@@YAXXZ"() #0 !dbg !1667 {
  %1 = call %"class.std::basic_string"* @"??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@QEBD@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) @"?globalString@@3V?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@A", i8* getelementptr inbounds ([13 x i8], [13 x i8]* @"??_C@_0N@GGOCCEB@Howdy?5world?$CB?$AA@", i64 0, i64 0)), !dbg !1669
  %2 = call i32 @atexit(void ()* @"??__FglobalString@@YAXXZ") #3, !dbg !1671
  ret void, !dbg !1672
}

; Function Attrs: inlinehint uwtable
define linkonce_odr dso_local %"class.std::basic_string"* @"??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@QEBD@Z"(%"class.std::basic_string"* nonnull returned dereferenceable(32) %0, i8* %1) unnamed_addr #1 comdat align 2 personality i8* bitcast (i32 (...)* @__CxxFrameHandler3 to i8*) !dbg !1673 {
  %3 = alloca i8*, align 8
  %4 = alloca %"class.std::basic_string"*, align 8
  %5 = alloca %"struct.std::_Zero_then_variadic_args_t", align 1
  %6 = alloca %"struct.std::_Fake_allocator"*, align 8
  %7 = alloca %"struct.std::_Fake_proxy_ptr_impl", align 1
  store i8* %1, i8** %3, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %3, metadata !1675, metadata !DIExpression()), !dbg !1719
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %4, metadata !1676, metadata !DIExpression()), !dbg !1720
  %8 = load %"class.std::basic_string"*, %"class.std::basic_string"** %4, align 8
  %9 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %8, i32 0, i32 0, !dbg !1721
  %10 = getelementptr inbounds %"struct.std::_Zero_then_variadic_args_t", %"struct.std::_Zero_then_variadic_args_t"* %5, i32 0, i32 0, !dbg !1721
  %11 = load i8, i8* %10, align 1, !dbg !1721
  %12 = call %"class.std::_Compressed_pair"* @"??$?0$$V@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@U_Zero_then_variadic_args_t@1@@Z"(%"class.std::_Compressed_pair"* nonnull dereferenceable(32) %9, i8 %11) #3, !dbg !1721
  %13 = bitcast %"struct.std::_Fake_allocator"** %6 to i8*, !dbg !1722
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %13) #3, !dbg !1722
  call void @llvm.dbg.declare(metadata %"struct.std::_Fake_allocator"** %6, metadata !1678, metadata !DIExpression()), !dbg !1723
  store %"struct.std::_Fake_allocator"* @"?_Fake_alloc@std@@3U_Fake_allocator@1@B", %"struct.std::_Fake_allocator"** %6, align 8, !dbg !1723, !tbaa !1715
  %14 = bitcast %"struct.std::_Fake_proxy_ptr_impl"* %7 to i8*, !dbg !1724
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %14) #3, !dbg !1724
  call void @llvm.dbg.declare(metadata %"struct.std::_Fake_proxy_ptr_impl"* %7, metadata !1680, metadata !DIExpression()), !dbg !1725
  %15 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %8, i32 0, i32 0, !dbg !1726
  %16 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %15, i32 0, i32 0, !dbg !1727
  %17 = bitcast %"class.std::_String_val"* %16 to %"struct.std::_Container_base0"*, !dbg !1726
  %18 = call %"struct.std::_Fake_proxy_ptr_impl"* @"??0_Fake_proxy_ptr_impl@std@@QEAA@AEBU_Fake_allocator@1@AEBU_Container_base0@1@@Z"(%"struct.std::_Fake_proxy_ptr_impl"* nonnull dereferenceable(1) %7, %"struct.std::_Fake_allocator"* nonnull align 1 dereferenceable(1) @"?_Fake_alloc@std@@3U_Fake_allocator@1@B", %"struct.std::_Container_base0"* nonnull align 1 dereferenceable(1) %17) #3, !dbg !1725
  call void @"?_Tidy_init@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %8) #3, !dbg !1728
  %19 = load i8*, i8** %3, align 8, !dbg !1729, !tbaa !1715
  %20 = invoke nonnull align 8 dereferenceable(32) %"class.std::basic_string"* @"?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %8, i8* %19)
          to label %21 unwind label %24, !dbg !1730

21:                                               ; preds = %2
  call void @"?_Release@_Fake_proxy_ptr_impl@std@@QEAAXXZ"(%"struct.std::_Fake_proxy_ptr_impl"* nonnull dereferenceable(1) %7) #3, !dbg !1731
  %22 = bitcast %"struct.std::_Fake_proxy_ptr_impl"* %7 to i8*, !dbg !1732
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %22) #3, !dbg !1732
  %23 = bitcast %"struct.std::_Fake_allocator"** %6 to i8*, !dbg !1732
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %23) #3, !dbg !1732
  ret %"class.std::basic_string"* %8, !dbg !1732

24:                                               ; preds = %2
  %25 = cleanuppad within none [], !dbg !1732
  %26 = bitcast %"struct.std::_Fake_proxy_ptr_impl"* %7 to i8*, !dbg !1732
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %26) #3, !dbg !1732
  cleanupret from %25 unwind label %27, !dbg !1732

27:                                               ; preds = %24
  %28 = cleanuppad within none [], !dbg !1732
  %29 = bitcast %"struct.std::_Fake_allocator"** %6 to i8*, !dbg !1732
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %29) #3, !dbg !1732
  cleanupret from %28 unwind label %30, !dbg !1732

30:                                               ; preds = %27
  %31 = cleanuppad within none [], !dbg !1733
  call void @"??1?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@XZ"(%"class.std::_Compressed_pair"* nonnull dereferenceable(32) %9) #3 [ "funclet"(token %31) ], !dbg !1733
  cleanupret from %31 unwind to caller, !dbg !1733
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %0) unnamed_addr #2 comdat align 2 !dbg !1734 {
  %2 = alloca %"class.std::basic_string"*, align 8
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %2, metadata !1736, metadata !DIExpression()), !dbg !1737
  %3 = load %"class.std::basic_string"*, %"class.std::basic_string"** %2, align 8
  call void @"?_Tidy_deallocate@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %3) #3, !dbg !1738
  %4 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %3, i32 0, i32 0, !dbg !1740
  call void @"??1?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@XZ"(%"class.std::_Compressed_pair"* nonnull dereferenceable(32) %4) #3, !dbg !1740
  ret void, !dbg !1741
}

; Function Attrs: uwtable
define internal void @"??__FglobalString@@YAXXZ"() #0 !dbg !1742 {
  call void @"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"(%"class.std::basic_string"* @"?globalString@@3V?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@A"), !dbg !1743
  ret void, !dbg !1744
}

; Function Attrs: nounwind
declare dso_local i32 @atexit(void ()*) #3

; Function Attrs: norecurse uwtable mustprogress
define dso_local i32 @main() #4 personality i8* bitcast (i32 (...)* @__CxxFrameHandler3 to i8*) !dbg !841 {
  %1 = alloca i32, align 4
  %2 = alloca %"class.std::basic_string", align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %7 = bitcast %"class.std::basic_string"* %2 to i8*, !dbg !1745
  call void @llvm.lifetime.start.p0i8(i64 32, i8* %7) #3, !dbg !1745
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"* %2, metadata !845, metadata !DIExpression()), !dbg !1746
  %8 = call %"class.std::basic_string"* @"??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@AEBV01@@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %2, %"class.std::basic_string"* nonnull align 8 dereferenceable(32) @"?globalString@@3V?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@A"), !dbg !1747
  %9 = bitcast i32* %3 to i8*, !dbg !1748
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #3, !dbg !1748
  call void @llvm.dbg.declare(metadata i32* %3, metadata !846, metadata !DIExpression()), !dbg !1749
  store i32 0, i32* %3, align 4, !dbg !1749, !tbaa !1750
  br label %10, !dbg !1748

10:                                               ; preds = %52, %0
  %11 = load i32, i32* %3, align 4, !dbg !1752, !tbaa !1750
  %12 = icmp slt i32 %11, 5, !dbg !1753
  br i1 %12, label %15, label %13, !dbg !1754

13:                                               ; preds = %10
  store i32 2, i32* %4, align 4
  %14 = bitcast i32* %3 to i8*, !dbg !1755
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %14) #3, !dbg !1755
  br label %58

15:                                               ; preds = %10
  %16 = bitcast i32* %5 to i8*, !dbg !1756
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %16) #3, !dbg !1756
  call void @llvm.dbg.declare(metadata i32* %5, metadata !848, metadata !DIExpression()), !dbg !1757
  store i32 0, i32* %5, align 4, !dbg !1757, !tbaa !1750
  br label %17, !dbg !1756

17:                                               ; preds = %45, %15
  %18 = load i32, i32* %5, align 4, !dbg !1758, !tbaa !1750
  %19 = icmp slt i32 %18, 5, !dbg !1759
  br i1 %19, label %22, label %20, !dbg !1760

20:                                               ; preds = %17
  store i32 5, i32* %4, align 4
  %21 = bitcast i32* %5 to i8*, !dbg !1761
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %21) #3, !dbg !1761
  br label %51

22:                                               ; preds = %17
  %23 = bitcast i32* %6 to i8*, !dbg !1762
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %23) #3, !dbg !1762
  call void @llvm.dbg.declare(metadata i32* %6, metadata !852, metadata !DIExpression()), !dbg !1763
  store i32 0, i32* %6, align 4, !dbg !1763, !tbaa !1750
  br label %24, !dbg !1762

24:                                               ; preds = %38, %22
  %25 = load i32, i32* %6, align 4, !dbg !1764, !tbaa !1750
  %26 = icmp slt i32 %25, 5, !dbg !1766
  br i1 %26, label %29, label %27, !dbg !1767

27:                                               ; preds = %24
  store i32 8, i32* %4, align 4
  %28 = bitcast i32* %6 to i8*, !dbg !1768
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %28) #3, !dbg !1768
  br label %44

29:                                               ; preds = %24
  %30 = load i32, i32* %6, align 4, !dbg !1769, !tbaa !1750
  %31 = load i32, i32* %5, align 4, !dbg !1771, !tbaa !1750
  %32 = load i32, i32* %3, align 4, !dbg !1772, !tbaa !1750
  %33 = invoke i32 @"?mul_add@@YAHHHH@Z"(i32 %32, i32 %31, i32 %30)
          to label %34 unwind label %41, !dbg !1773

34:                                               ; preds = %29
  store i32 %33, i32* @"?m@?1??main@@9@4HA", align 4, !dbg !1774, !tbaa !1750
  %35 = load i32, i32* @staticGlobal, align 4, !dbg !1775, !tbaa !1750
  %36 = load i32, i32* @"?m@?1??main@@9@4HA", align 4, !dbg !1776, !tbaa !1750
  %37 = add nsw i32 %36, %35, !dbg !1776
  store i32 %37, i32* @"?m@?1??main@@9@4HA", align 4, !dbg !1776, !tbaa !1750
  br label %38, !dbg !1777

38:                                               ; preds = %34
  %39 = load i32, i32* %6, align 4, !dbg !1778, !tbaa !1750
  %40 = add nsw i32 %39, 1, !dbg !1778
  store i32 %40, i32* %6, align 4, !dbg !1778, !tbaa !1750
  br label %24, !dbg !1768, !llvm.loop !1779

41:                                               ; preds = %29
  %42 = cleanuppad within none [], !dbg !1768
  %43 = bitcast i32* %6 to i8*, !dbg !1768
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %43) #3, !dbg !1768
  cleanupret from %42 unwind label %48, !dbg !1768

44:                                               ; preds = %27
  br label %45, !dbg !1782

45:                                               ; preds = %44
  %46 = load i32, i32* %5, align 4, !dbg !1783, !tbaa !1750
  %47 = add nsw i32 %46, 1, !dbg !1783
  store i32 %47, i32* %5, align 4, !dbg !1783, !tbaa !1750
  br label %17, !dbg !1761, !llvm.loop !1784

48:                                               ; preds = %41
  %49 = cleanuppad within none [], !dbg !1761
  %50 = bitcast i32* %5 to i8*, !dbg !1761
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %50) #3, !dbg !1761
  cleanupret from %49 unwind label %55, !dbg !1761

51:                                               ; preds = %20
  br label %52, !dbg !1786

52:                                               ; preds = %51
  %53 = load i32, i32* %3, align 4, !dbg !1787, !tbaa !1750
  %54 = add nsw i32 %53, 1, !dbg !1787
  store i32 %54, i32* %3, align 4, !dbg !1787, !tbaa !1750
  br label %10, !dbg !1755, !llvm.loop !1788

55:                                               ; preds = %48
  %56 = cleanuppad within none [], !dbg !1755
  %57 = bitcast i32* %3 to i8*, !dbg !1755
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %57) #3, !dbg !1755
  cleanupret from %56 unwind label %78, !dbg !1755

58:                                               ; preds = %13
  %59 = load i32, i32* @"?m@?1??main@@9@4HA", align 4, !dbg !1790, !tbaa !1750
  %60 = icmp eq i32 %59, 0, !dbg !1792
  br i1 %60, label %61, label %63, !dbg !1793

61:                                               ; preds = %58
  %62 = load i32, i32* @"?m@?1??main@@9@4HA", align 4, !dbg !1794, !tbaa !1750
  store i32 %62, i32* %1, align 4, !dbg !1796
  store i32 1, i32* %4, align 4
  br label %75, !dbg !1796

63:                                               ; preds = %58
  %64 = load i32, i32* @"?m@?1??main@@9@4HA", align 4, !dbg !1797, !tbaa !1750
  %65 = icmp slt i32 %64, 10, !dbg !1799
  br i1 %65, label %66, label %72, !dbg !1800

66:                                               ; preds = %63
  %67 = load i32, i32* @"?globalInt@@3HA", align 4, !dbg !1801, !tbaa !1750
  %68 = load i32, i32* @"?m@?1??main@@9@4HA", align 4, !dbg !1803, !tbaa !1750
  %69 = load i32, i32* @"?globalZero@@3HA", align 4, !dbg !1804, !tbaa !1750
  %70 = invoke i32 @"?mul_add@@YAHHHH@Z"(i32 %69, i32 %68, i32 %67)
          to label %71 unwind label %78, !dbg !1805

71:                                               ; preds = %66
  store i32 %70, i32* %1, align 4, !dbg !1806
  store i32 1, i32* %4, align 4
  br label %75, !dbg !1806

72:                                               ; preds = %63
  br label %73

73:                                               ; preds = %72
  %74 = load i32, i32* @"?globalInt@@3HA", align 4, !dbg !1807, !tbaa !1750
  store i32 %74, i32* %1, align 4, !dbg !1808
  store i32 1, i32* %4, align 4
  br label %75, !dbg !1808

75:                                               ; preds = %73, %71, %61
  call void @"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %2) #3, !dbg !1809
  %76 = bitcast %"class.std::basic_string"* %2 to i8*, !dbg !1809
  call void @llvm.lifetime.end.p0i8(i64 32, i8* %76) #3, !dbg !1809
  %77 = load i32, i32* %1, align 4, !dbg !1809
  ret i32 %77, !dbg !1809

78:                                               ; preds = %66, %55
  %79 = cleanuppad within none [], !dbg !1809
  call void @"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %2) #3 [ "funclet"(token %79) ], !dbg !1809
  cleanupret from %79 unwind label %80, !dbg !1809

80:                                               ; preds = %78
  %81 = cleanuppad within none [], !dbg !1809
  %82 = bitcast %"class.std::basic_string"* %2 to i8*, !dbg !1809
  call void @llvm.lifetime.end.p0i8(i64 32, i8* %82) #3, !dbg !1809
  cleanupret from %81 unwind to caller, !dbg !1809
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #5

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #6

; Function Attrs: inlinehint uwtable
define linkonce_odr dso_local %"class.std::basic_string"* @"??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@AEBV01@@Z"(%"class.std::basic_string"* nonnull returned dereferenceable(32) %0, %"class.std::basic_string"* nonnull align 8 dereferenceable(32) %1) unnamed_addr #1 comdat align 2 personality i8* bitcast (i32 (...)* @__CxxFrameHandler3 to i8*) !dbg !1810 {
  %3 = alloca %"class.std::basic_string"*, align 8
  %4 = alloca %"class.std::basic_string"*, align 8
  %5 = alloca %"class.std::allocator", align 1
  %6 = alloca %"struct.std::_One_then_variadic_args_t", align 1
  %7 = alloca %"struct.std::_Fake_allocator"*, align 8
  %8 = alloca %"struct.std::_Fake_proxy_ptr_impl", align 1
  store %"class.std::basic_string"* %1, %"class.std::basic_string"** %3, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %3, metadata !1812, metadata !DIExpression()), !dbg !1817
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %4, metadata !1813, metadata !DIExpression()), !dbg !1818
  %9 = load %"class.std::basic_string"*, %"class.std::basic_string"** %4, align 8
  %10 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %9, i32 0, i32 0, !dbg !1819
  %11 = bitcast %"class.std::allocator"* %5 to i8*, !dbg !1820
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %11) #3, !dbg !1820
  %12 = load %"class.std::basic_string"*, %"class.std::basic_string"** %3, align 8, !dbg !1821, !tbaa !1715
  %13 = call nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBAAEBV?$allocator@D@2@XZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %12) #3, !dbg !1822
  call void @"?select_on_container_copy_construction@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA?AV?$allocator@D@2@AEBV32@@Z"(%"class.std::allocator"* sret(%"class.std::allocator") align 1 %5, %"class.std::allocator"* nonnull align 1 dereferenceable(1) %13), !dbg !1820
  %14 = getelementptr inbounds %"struct.std::_One_then_variadic_args_t", %"struct.std::_One_then_variadic_args_t"* %6, i32 0, i32 0, !dbg !1819
  %15 = load i8, i8* %14, align 1, !dbg !1819
  %16 = call %"class.std::_Compressed_pair"* @"??$?0V?$allocator@D@std@@$$V@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@U_One_then_variadic_args_t@1@$$QEAV?$allocator@D@1@@Z"(%"class.std::_Compressed_pair"* nonnull dereferenceable(32) %10, i8 %15, %"class.std::allocator"* nonnull align 1 dereferenceable(1) %5) #3, !dbg !1819
  %17 = bitcast %"class.std::allocator"* %5 to i8*, !dbg !1819
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %17) #3, !dbg !1819
  %18 = bitcast %"struct.std::_Fake_allocator"** %7 to i8*, !dbg !1823
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %18) #3, !dbg !1823
  call void @llvm.dbg.declare(metadata %"struct.std::_Fake_allocator"** %7, metadata !1814, metadata !DIExpression()), !dbg !1824
  store %"struct.std::_Fake_allocator"* @"?_Fake_alloc@std@@3U_Fake_allocator@1@B", %"struct.std::_Fake_allocator"** %7, align 8, !dbg !1824, !tbaa !1715
  %19 = bitcast %"struct.std::_Fake_proxy_ptr_impl"* %8 to i8*, !dbg !1825
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %19) #3, !dbg !1825
  call void @llvm.dbg.declare(metadata %"struct.std::_Fake_proxy_ptr_impl"* %8, metadata !1816, metadata !DIExpression()), !dbg !1826
  %20 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %9, i32 0, i32 0, !dbg !1827
  %21 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %20, i32 0, i32 0, !dbg !1828
  %22 = bitcast %"class.std::_String_val"* %21 to %"struct.std::_Container_base0"*, !dbg !1827
  %23 = call %"struct.std::_Fake_proxy_ptr_impl"* @"??0_Fake_proxy_ptr_impl@std@@QEAA@AEBU_Fake_allocator@1@AEBU_Container_base0@1@@Z"(%"struct.std::_Fake_proxy_ptr_impl"* nonnull dereferenceable(1) %8, %"struct.std::_Fake_allocator"* nonnull align 1 dereferenceable(1) @"?_Fake_alloc@std@@3U_Fake_allocator@1@B", %"struct.std::_Container_base0"* nonnull align 1 dereferenceable(1) %22) #3, !dbg !1826
  %24 = load %"class.std::basic_string"*, %"class.std::basic_string"** %3, align 8, !dbg !1829, !tbaa !1715
  invoke void @"?_Construct_lv_contents@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %9, %"class.std::basic_string"* nonnull align 8 dereferenceable(32) %24)
          to label %25 unwind label %28, !dbg !1830

25:                                               ; preds = %2
  call void @"?_Release@_Fake_proxy_ptr_impl@std@@QEAAXXZ"(%"struct.std::_Fake_proxy_ptr_impl"* nonnull dereferenceable(1) %8) #3, !dbg !1831
  %26 = bitcast %"struct.std::_Fake_proxy_ptr_impl"* %8 to i8*, !dbg !1832
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %26) #3, !dbg !1832
  %27 = bitcast %"struct.std::_Fake_allocator"** %7 to i8*, !dbg !1832
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %27) #3, !dbg !1832
  ret %"class.std::basic_string"* %9, !dbg !1832

28:                                               ; preds = %2
  %29 = cleanuppad within none [], !dbg !1832
  %30 = bitcast %"struct.std::_Fake_proxy_ptr_impl"* %8 to i8*, !dbg !1832
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %30) #3, !dbg !1832
  cleanupret from %29 unwind label %31, !dbg !1832

31:                                               ; preds = %28
  %32 = cleanuppad within none [], !dbg !1832
  %33 = bitcast %"struct.std::_Fake_allocator"** %7 to i8*, !dbg !1832
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %33) #3, !dbg !1832
  cleanupret from %32 unwind label %34, !dbg !1832

34:                                               ; preds = %31
  %35 = cleanuppad within none [], !dbg !1833
  call void @"??1?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@XZ"(%"class.std::_Compressed_pair"* nonnull dereferenceable(32) %10) #3 [ "funclet"(token %35) ], !dbg !1833
  cleanupret from %35 unwind to caller, !dbg !1833
}

; Function Attrs: nounwind uwtable mustprogress
define internal i32 @"?mul_add@@YAHHHH@Z"(i32 %0, i32 %1, i32 %2) #7 !dbg !1834 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %2, i32* %4, align 4, !tbaa !1750
  call void @llvm.dbg.declare(metadata i32* %4, metadata !1838, metadata !DIExpression()), !dbg !1842
  store i32 %1, i32* %5, align 4, !tbaa !1750
  call void @llvm.dbg.declare(metadata i32* %5, metadata !1839, metadata !DIExpression()), !dbg !1843
  store i32 %0, i32* %6, align 4, !tbaa !1750
  call void @llvm.dbg.declare(metadata i32* %6, metadata !1840, metadata !DIExpression()), !dbg !1844
  %8 = bitcast i32* %7 to i8*, !dbg !1845
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #3, !dbg !1845
  call void @llvm.dbg.declare(metadata i32* %7, metadata !1841, metadata !DIExpression()), !dbg !1846
  %9 = load i32, i32* %4, align 4, !dbg !1847, !tbaa !1750
  store i32 %9, i32* %7, align 4, !dbg !1846, !tbaa !1750
  %10 = load i32, i32* %6, align 4, !dbg !1848, !tbaa !1750
  %11 = load i32, i32* %5, align 4, !dbg !1849, !tbaa !1750
  %12 = mul nsw i32 %10, %11, !dbg !1850
  %13 = load i32, i32* %4, align 4, !dbg !1851, !tbaa !1750
  %14 = add nsw i32 %12, %13, !dbg !1852
  %15 = bitcast i32* %7 to i8*, !dbg !1853
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #3, !dbg !1853
  ret i32 %14, !dbg !1854
}

declare dso_local i32 @__CxxFrameHandler3(...)

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #5

; Function Attrs: nounwind uwtable mustprogress
define dso_local i32 @"?switchKind@@YAHH@Z"(i32 %0) #7 !dbg !1855 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !1750
  call void @llvm.dbg.declare(metadata i32* %2, metadata !1857, metadata !DIExpression()), !dbg !1859
  %4 = bitcast i32* %3 to i8*, !dbg !1860
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #3, !dbg !1860
  call void @llvm.dbg.declare(metadata i32* %3, metadata !1858, metadata !DIExpression()), !dbg !1861
  %5 = load i32, i32* %3, align 4, !dbg !1862, !tbaa !1863
  switch i32 %5, label %6 [
    i32 0, label %7
    i32 1, label %7
    i32 2, label %7
    i32 3, label %7
  ], !dbg !1865

6:                                                ; preds = %1
  br label %7, !dbg !1866

7:                                                ; preds = %6, %1, %1, %1, %1
  %8 = bitcast i32* %3 to i8*, !dbg !1868
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %8) #3, !dbg !1868
  ret i32 0, !dbg !1869
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local void @"?_Tidy_deallocate@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %0) #8 comdat align 2 personality i8* bitcast (i32 (...)* @__CxxFrameHandler3 to i8*) !dbg !1870 {
  %2 = alloca %"class.std::basic_string"*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca %"class.std::allocator"*, align 8
  %5 = alloca i8, align 1
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %2, metadata !1872, metadata !DIExpression()), !dbg !1878
  %6 = load %"class.std::basic_string"*, %"class.std::basic_string"** %2, align 8
  %7 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %6, i32 0, i32 0, !dbg !1879
  %8 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %7, i32 0, i32 0, !dbg !1880
  %9 = bitcast %"class.std::_String_val"* %8 to %"struct.std::_Container_base0"*, !dbg !1879
  call void @"?_Orphan_all@_Container_base0@std@@QEAAXXZ"(%"struct.std::_Container_base0"* nonnull dereferenceable(1) %9) #3, !dbg !1881
  %10 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %6, i32 0, i32 0, !dbg !1882
  %11 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %10, i32 0, i32 0, !dbg !1883
  %12 = call zeroext i1 @"?_Large_string_engaged@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_NXZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %11) #3, !dbg !1884
  br i1 %12, label %13, label %42, !dbg !1885

13:                                               ; preds = %1
  %14 = bitcast i8** %3 to i8*, !dbg !1886
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %14) #3, !dbg !1886
  call void @llvm.dbg.declare(metadata i8** %3, metadata !1873, metadata !DIExpression()), !dbg !1887
  %15 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %6, i32 0, i32 0, !dbg !1888
  %16 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %15, i32 0, i32 0, !dbg !1889
  %17 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %16, i32 0, i32 0, !dbg !1890
  %18 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %17 to i8**, !dbg !1891
  %19 = load i8*, i8** %18, align 8, !dbg !1891, !tbaa !1892
  store i8* %19, i8** %3, align 8, !dbg !1887, !tbaa !1715
  %20 = bitcast %"class.std::allocator"** %4 to i8*, !dbg !1893
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %20) #3, !dbg !1893
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %4, metadata !1877, metadata !DIExpression()), !dbg !1894
  %21 = call nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV?$allocator@D@2@XZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %6) #3, !dbg !1895
  store %"class.std::allocator"* %21, %"class.std::allocator"** %4, align 8, !dbg !1894, !tbaa !1715
  %22 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %6, i32 0, i32 0, !dbg !1896
  %23 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %22, i32 0, i32 0, !dbg !1897
  %24 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %23, i32 0, i32 0, !dbg !1898
  %25 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %24 to i8**, !dbg !1899
  call void @"??$_Destroy_in_place@PEAD@std@@YAXAEAPEAD@Z"(i8** nonnull align 8 dereferenceable(8) %25) #3, !dbg !1900
  %26 = load %"class.std::allocator"*, %"class.std::allocator"** %4, align 8, !dbg !1901, !tbaa !1715
  %27 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %6, i32 0, i32 0, !dbg !1902
  %28 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %27, i32 0, i32 0, !dbg !1903
  %29 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %28, i32 0, i32 2, !dbg !1904
  %30 = load i64, i64* %29, align 8, !dbg !1904, !tbaa !1905
  %31 = add i64 %30, 1, !dbg !1910
  %32 = load i8*, i8** %3, align 8, !dbg !1911, !tbaa !1715
  invoke void @"?deallocate@?$allocator@D@std@@QEAAXQEAD_K@Z"(%"class.std::allocator"* nonnull dereferenceable(1) %26, i8* %32, i64 %31)
          to label %33 unwind label %36, !dbg !1912

33:                                               ; preds = %13
  %34 = bitcast %"class.std::allocator"** %4 to i8*, !dbg !1913
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %34) #3, !dbg !1913
  %35 = bitcast i8** %3 to i8*, !dbg !1913
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %35) #3, !dbg !1913
  br label %42, !dbg !1914

36:                                               ; preds = %13
  %37 = cleanuppad within none [], !dbg !1913
  %38 = bitcast %"class.std::allocator"** %4 to i8*, !dbg !1913
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %38) #3, !dbg !1913
  cleanupret from %37 unwind label %39, !dbg !1913

39:                                               ; preds = %36
  %40 = cleanuppad within none [], !dbg !1913
  %41 = bitcast i8** %3 to i8*, !dbg !1913
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %41) #3, !dbg !1913
  cleanupret from %40 unwind label %54, !dbg !1913

42:                                               ; preds = %33, %1
  %43 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %6, i32 0, i32 0, !dbg !1915
  %44 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %43, i32 0, i32 0, !dbg !1917
  %45 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %44, i32 0, i32 1, !dbg !1918
  store i64 0, i64* %45, align 8, !dbg !1919, !tbaa !1920
  %46 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %6, i32 0, i32 0, !dbg !1921
  %47 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %46, i32 0, i32 0, !dbg !1922
  %48 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %47, i32 0, i32 2, !dbg !1923
  store i64 15, i64* %48, align 8, !dbg !1924, !tbaa !1905
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %5) #3, !dbg !1925
  store i8 0, i8* %5, align 1, !dbg !1925, !tbaa !1892
  %49 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %6, i32 0, i32 0, !dbg !1926
  %50 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %49, i32 0, i32 0, !dbg !1927
  %51 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %50, i32 0, i32 0, !dbg !1928
  %52 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %51 to [16 x i8]*, !dbg !1929
  %53 = getelementptr inbounds [16 x i8], [16 x i8]* %52, i64 0, i64 0, !dbg !1926
  call void @"?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z"(i8* nonnull align 1 dereferenceable(1) %53, i8* nonnull align 1 dereferenceable(1) %5) #3, !dbg !1930
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %5) #3, !dbg !1930
  ret void, !dbg !1931

54:                                               ; preds = %39
  %55 = cleanuppad within none [], !dbg !1913
  call void @__std_terminate() #19 [ "funclet"(token %55) ], !dbg !1913
  unreachable, !dbg !1913
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @"??1?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@XZ"(%"class.std::_Compressed_pair"* nonnull dereferenceable(32) %0) unnamed_addr #2 comdat align 2 !dbg !1932 {
  %2 = alloca %"class.std::_Compressed_pair"*, align 8
  store %"class.std::_Compressed_pair"* %0, %"class.std::_Compressed_pair"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::_Compressed_pair"** %2, metadata !1937, metadata !DIExpression()), !dbg !1939
  %3 = load %"class.std::_Compressed_pair"*, %"class.std::_Compressed_pair"** %2, align 8
  %4 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %3, i32 0, i32 0, !dbg !1940
  call void @"??1?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %4) #3, !dbg !1940
  ret void, !dbg !1942
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local void @"?_Orphan_all@_Container_base0@std@@QEAAXXZ"(%"struct.std::_Container_base0"* nonnull dereferenceable(1) %0) #8 comdat align 2 !dbg !1943 {
  %2 = alloca %"struct.std::_Container_base0"*, align 8
  store %"struct.std::_Container_base0"* %0, %"struct.std::_Container_base0"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"struct.std::_Container_base0"** %2, metadata !1945, metadata !DIExpression()), !dbg !1946
  %3 = load %"struct.std::_Container_base0"*, %"struct.std::_Container_base0"** %2, align 8
  ret void, !dbg !1947
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local zeroext i1 @"?_Large_string_engaged@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_NXZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %0) #8 comdat align 2 !dbg !1948 {
  %2 = alloca %"class.std::_String_val"*, align 8
  store %"class.std::_String_val"* %0, %"class.std::_String_val"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::_String_val"** %2, metadata !1950, metadata !DIExpression()), !dbg !1952
  %3 = load %"class.std::_String_val"*, %"class.std::_String_val"** %2, align 8
  %4 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %3, i32 0, i32 2, !dbg !1953
  %5 = load i64, i64* %4, align 8, !dbg !1953, !tbaa !1954
  %6 = icmp ule i64 16, %5, !dbg !1955
  ret i1 %6, !dbg !1956
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV?$allocator@D@2@XZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %0) #8 comdat align 2 !dbg !1957 {
  %2 = alloca %"class.std::basic_string"*, align 8
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %2, metadata !1959, metadata !DIExpression()), !dbg !1960
  %3 = load %"class.std::basic_string"*, %"class.std::basic_string"** %2, align 8
  %4 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %3, i32 0, i32 0, !dbg !1961
  %5 = call nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAAAEAV?$allocator@D@2@XZ"(%"class.std::_Compressed_pair"* nonnull dereferenceable(32) %4) #3, !dbg !1962
  ret %"class.std::allocator"* %5, !dbg !1963
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local void @"??$_Destroy_in_place@PEAD@std@@YAXAEAPEAD@Z"(i8** nonnull align 8 dereferenceable(8) %0) #8 comdat !dbg !1964 {
  %2 = alloca i8**, align 8
  store i8** %0, i8*** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8*** %2, metadata !1969, metadata !DIExpression()), !dbg !1972
  %3 = load i8**, i8*** %2, align 8, !dbg !1973, !tbaa !1715
  ret void, !dbg !1976
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local void @"?deallocate@?$allocator@D@std@@QEAAXQEAD_K@Z"(%"class.std::allocator"* nonnull dereferenceable(1) %0, i8* %1, i64 %2) #8 comdat align 2 !dbg !1977 {
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %"class.std::allocator"*, align 8
  store i64 %2, i64* %4, align 8, !tbaa !1983
  call void @llvm.dbg.declare(metadata i64* %4, metadata !1979, metadata !DIExpression()), !dbg !1984
  store i8* %1, i8** %5, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %5, metadata !1980, metadata !DIExpression()), !dbg !1985
  store %"class.std::allocator"* %0, %"class.std::allocator"** %6, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %6, metadata !1981, metadata !DIExpression()), !dbg !1986
  %7 = load %"class.std::allocator"*, %"class.std::allocator"** %6, align 8
  %8 = load i64, i64* %4, align 8, !dbg !1987, !tbaa !1983
  %9 = mul i64 1, %8, !dbg !1988
  %10 = load i8*, i8** %5, align 8, !dbg !1989, !tbaa !1715
  call void @"??$_Deallocate@$0BA@$0A@@std@@YAXPEAX_K@Z"(i8* %10, i64 %9) #3, !dbg !1990
  ret void, !dbg !1991
}

declare dso_local void @__std_terminate()

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local void @"?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z"(i8* nonnull align 1 dereferenceable(1) %0, i8* nonnull align 1 dereferenceable(1) %1) #8 comdat align 2 !dbg !1992 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %1, i8** %3, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %3, metadata !1994, metadata !DIExpression()), !dbg !1996
  store i8* %0, i8** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %4, metadata !1995, metadata !DIExpression()), !dbg !1997
  %5 = load i8*, i8** %3, align 8, !dbg !1998, !tbaa !1715
  %6 = load i8, i8* %5, align 1, !dbg !1998, !tbaa !1892
  %7 = load i8*, i8** %4, align 8, !dbg !1999, !tbaa !1715
  store i8 %6, i8* %7, align 1, !dbg !2000, !tbaa !1892
  ret void, !dbg !2001
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAAAEAV?$allocator@D@2@XZ"(%"class.std::_Compressed_pair"* nonnull dereferenceable(32) %0) #7 comdat align 2 !dbg !2002 {
  %2 = alloca %"class.std::_Compressed_pair"*, align 8
  store %"class.std::_Compressed_pair"* %0, %"class.std::_Compressed_pair"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::_Compressed_pair"** %2, metadata !2004, metadata !DIExpression()), !dbg !2005
  %3 = load %"class.std::_Compressed_pair"*, %"class.std::_Compressed_pair"** %2, align 8
  %4 = bitcast %"class.std::_Compressed_pair"* %3 to %"class.std::allocator"*, !dbg !2006
  ret %"class.std::allocator"* %4, !dbg !2007
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local void @"??$_Deallocate@$0BA@$0A@@std@@YAXPEAX_K@Z"(i8* %0, i64 %1) #8 comdat personality i8* bitcast (i32 (...)* @__CxxFrameHandler3 to i8*) !dbg !2008 {
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  store i64 %1, i64* %3, align 8, !tbaa !1983
  call void @llvm.dbg.declare(metadata i64* %3, metadata !2012, metadata !DIExpression()), !dbg !2017
  store i8* %0, i8** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %4, metadata !2013, metadata !DIExpression()), !dbg !2018
  %5 = load i64, i64* %3, align 8, !dbg !2019, !tbaa !1983
  %6 = icmp uge i64 %5, 4096, !dbg !2022
  br i1 %6, label %7, label %9, !dbg !2023

7:                                                ; preds = %2
  invoke void @"?_Adjust_manually_vector_aligned@std@@YAXAEAPEAXAEA_K@Z"(i8** nonnull align 8 dereferenceable(8) %4, i64* nonnull align 8 dereferenceable(8) %3)
          to label %8 unwind label %12, !dbg !2024

8:                                                ; preds = %7
  br label %9, !dbg !2026

9:                                                ; preds = %8, %2
  %10 = load i64, i64* %3, align 8, !dbg !2027, !tbaa !1983
  %11 = load i8*, i8** %4, align 8, !dbg !2028, !tbaa !1715
  call void @"??3@YAXPEAX_K@Z"(i8* %11, i64 %10) #3, !dbg !2029
  ret void, !dbg !2030

12:                                               ; preds = %7
  %13 = cleanuppad within none [], !dbg !2024
  call void @__std_terminate() #19 [ "funclet"(token %13) ], !dbg !2024
  unreachable, !dbg !2024
}

; Function Attrs: inlinehint uwtable mustprogress
define linkonce_odr dso_local void @"?_Adjust_manually_vector_aligned@std@@YAXAEAPEAXAEA_K@Z"(i8** nonnull align 8 dereferenceable(8) %0, i64* nonnull align 8 dereferenceable(8) %1) #9 comdat !dbg !2031 {
  %3 = alloca i64*, align 8
  %4 = alloca i8**, align 8
  %5 = alloca i64*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  store i64* %1, i64** %3, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i64** %3, metadata !2037, metadata !DIExpression()), !dbg !2046
  store i8** %0, i8*** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8*** %4, metadata !2038, metadata !DIExpression()), !dbg !2047
  %9 = load i64*, i64** %3, align 8, !dbg !2048, !tbaa !1715
  %10 = load i64, i64* %9, align 8, !dbg !2049, !tbaa !1983
  %11 = add i64 %10, 39, !dbg !2049
  store i64 %11, i64* %9, align 8, !dbg !2049, !tbaa !1983
  %12 = bitcast i64** %5 to i8*, !dbg !2050
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %12) #3, !dbg !2050
  call void @llvm.dbg.declare(metadata i64** %5, metadata !2039, metadata !DIExpression()), !dbg !2051
  %13 = load i8**, i8*** %4, align 8, !dbg !2052, !tbaa !1715
  %14 = load i8*, i8** %13, align 8, !dbg !2052, !tbaa !1715
  %15 = bitcast i8* %14 to i64*, !dbg !2053
  store i64* %15, i64** %5, align 8, !dbg !2051, !tbaa !1715
  %16 = bitcast i64* %6 to i8*, !dbg !2054
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %16) #3, !dbg !2054
  call void @llvm.dbg.declare(metadata i64* %6, metadata !2043, metadata !DIExpression()), !dbg !2055
  %17 = load i64*, i64** %5, align 8, !dbg !2056, !tbaa !1715
  %18 = getelementptr inbounds i64, i64* %17, i64 -1, !dbg !2056
  %19 = load i64, i64* %18, align 8, !dbg !2056, !tbaa !1983
  store i64 %19, i64* %6, align 8, !dbg !2055, !tbaa !1983
  %20 = bitcast i64* %7 to i8*, !dbg !2057
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %20) #3, !dbg !2057
  call void @llvm.dbg.declare(metadata i64* %7, metadata !2044, metadata !DIExpression()), !dbg !2058
  store i64 8, i64* %7, align 8, !dbg !2058, !tbaa !1983
  %21 = bitcast i64* %8 to i8*, !dbg !2059
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %21) #3, !dbg !2059
  call void @llvm.dbg.declare(metadata i64* %8, metadata !2045, metadata !DIExpression()), !dbg !2060
  %22 = load i8**, i8*** %4, align 8, !dbg !2061, !tbaa !1715
  %23 = load i8*, i8** %22, align 8, !dbg !2061, !tbaa !1715
  %24 = ptrtoint i8* %23 to i64, !dbg !2062
  %25 = load i64, i64* %6, align 8, !dbg !2063, !tbaa !1983
  %26 = sub i64 %24, %25, !dbg !2064
  store i64 %26, i64* %8, align 8, !dbg !2060, !tbaa !1983
  br label %27, !dbg !2065

27:                                               ; preds = %2
  %28 = load i64, i64* %8, align 8, !dbg !2066, !tbaa !1983
  %29 = icmp uge i64 %28, 8, !dbg !2066
  br i1 %29, label %30, label %34, !dbg !2066

30:                                               ; preds = %27
  %31 = load i64, i64* %8, align 8, !dbg !2066, !tbaa !1983
  %32 = icmp ule i64 %31, 39, !dbg !2066
  br i1 %32, label %33, label %34, !dbg !2069

33:                                               ; preds = %30
  br label %38, !dbg !2070

34:                                               ; preds = %30, %27
  br label %35, !dbg !2072

35:                                               ; preds = %34
  call void @_invalid_parameter_noinfo_noreturn() #20, !dbg !2074
  unreachable, !dbg !2074

36:                                               ; No predecessors!
  br label %37, !dbg !2074

37:                                               ; preds = %36
  br label %38

38:                                               ; preds = %37, %33
  br label %39, !dbg !2069

39:                                               ; preds = %38
  br label %40, !dbg !2069

40:                                               ; preds = %39
  %41 = load i64, i64* %6, align 8, !dbg !2076, !tbaa !1983
  %42 = inttoptr i64 %41 to i8*, !dbg !2077
  %43 = load i8**, i8*** %4, align 8, !dbg !2078, !tbaa !1715
  store i8* %42, i8** %43, align 8, !dbg !2079, !tbaa !1715
  %44 = bitcast i64* %8 to i8*, !dbg !2080
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %44) #3, !dbg !2080
  %45 = bitcast i64* %7 to i8*, !dbg !2080
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %45) #3, !dbg !2080
  %46 = bitcast i64* %6 to i8*, !dbg !2080
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %46) #3, !dbg !2080
  %47 = bitcast i64** %5 to i8*, !dbg !2080
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %47) #3, !dbg !2080
  ret void, !dbg !2080
}

; Function Attrs: nounwind
declare dso_local void @"??3@YAXPEAX_K@Z"(i8*, i64) #10

; Function Attrs: noreturn
declare dso_local void @_invalid_parameter_noinfo_noreturn() #11

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @"??1?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %0) unnamed_addr #2 comdat align 2 !dbg !2081 {
  %2 = alloca %"class.std::_String_val"*, align 8
  store %"class.std::_String_val"* %0, %"class.std::_String_val"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::_String_val"** %2, metadata !2084, metadata !DIExpression()), !dbg !2086
  %3 = load %"class.std::_String_val"*, %"class.std::_String_val"** %2, align 8
  %4 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %3, i32 0, i32 0, !dbg !2087
  call void @"??1_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(%"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* nonnull dereferenceable(16) %4) #3, !dbg !2087
  ret void, !dbg !2089
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @"??1_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(%"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* nonnull dereferenceable(16) %0) unnamed_addr #2 comdat align 2 !dbg !2090 {
  %2 = alloca %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"*, align 8
  store %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %0, %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"** %2, metadata !2092, metadata !DIExpression()), !dbg !2094
  %3 = load %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"*, %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"** %2, align 8
  ret void, !dbg !2095
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local %"class.std::_Compressed_pair"* @"??$?0$$V@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@U_Zero_then_variadic_args_t@1@@Z"(%"class.std::_Compressed_pair"* nonnull returned dereferenceable(32) %0, i8 %1) unnamed_addr #12 comdat align 2 !dbg !2096 {
  %3 = alloca %"struct.std::_Zero_then_variadic_args_t", align 1
  %4 = alloca %"class.std::_Compressed_pair"*, align 8
  %5 = getelementptr inbounds %"struct.std::_Zero_then_variadic_args_t", %"struct.std::_Zero_then_variadic_args_t"* %3, i32 0, i32 0
  store i8 %1, i8* %5, align 1
  call void @llvm.dbg.declare(metadata %"struct.std::_Zero_then_variadic_args_t"* %3, metadata !2109, metadata !DIExpression()), !dbg !2111
  store %"class.std::_Compressed_pair"* %0, %"class.std::_Compressed_pair"** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::_Compressed_pair"** %4, metadata !2110, metadata !DIExpression()), !dbg !2112
  %6 = load %"class.std::_Compressed_pair"*, %"class.std::_Compressed_pair"** %4, align 8
  %7 = bitcast %"class.std::_Compressed_pair"* %6 to %"class.std::allocator"*, !dbg !2113
  %8 = call %"class.std::allocator"* @"??0?$allocator@D@std@@QEAA@XZ"(%"class.std::allocator"* nonnull dereferenceable(1) %7) #3, !dbg !2114
  %9 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %6, i32 0, i32 0, !dbg !2115
  %10 = call %"class.std::_String_val"* @"??0?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %9) #3, !dbg !2115
  ret %"class.std::_Compressed_pair"* %6, !dbg !2116
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local %"struct.std::_Fake_proxy_ptr_impl"* @"??0_Fake_proxy_ptr_impl@std@@QEAA@AEBU_Fake_allocator@1@AEBU_Container_base0@1@@Z"(%"struct.std::_Fake_proxy_ptr_impl"* nonnull returned dereferenceable(1) %0, %"struct.std::_Fake_allocator"* nonnull align 1 dereferenceable(1) %1, %"struct.std::_Container_base0"* nonnull align 1 dereferenceable(1) %2) unnamed_addr #2 comdat align 2 !dbg !2117 {
  %4 = alloca %"struct.std::_Container_base0"*, align 8
  %5 = alloca %"struct.std::_Fake_allocator"*, align 8
  %6 = alloca %"struct.std::_Fake_proxy_ptr_impl"*, align 8
  store %"struct.std::_Container_base0"* %2, %"struct.std::_Container_base0"** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"struct.std::_Container_base0"** %4, metadata !2119, metadata !DIExpression()), !dbg !2123
  store %"struct.std::_Fake_allocator"* %1, %"struct.std::_Fake_allocator"** %5, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"struct.std::_Fake_allocator"** %5, metadata !2120, metadata !DIExpression()), !dbg !2124
  store %"struct.std::_Fake_proxy_ptr_impl"* %0, %"struct.std::_Fake_proxy_ptr_impl"** %6, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"struct.std::_Fake_proxy_ptr_impl"** %6, metadata !2121, metadata !DIExpression()), !dbg !2125
  %7 = load %"struct.std::_Fake_proxy_ptr_impl"*, %"struct.std::_Fake_proxy_ptr_impl"** %6, align 8
  ret %"struct.std::_Fake_proxy_ptr_impl"* %7, !dbg !2126
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local void @"?_Tidy_init@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %0) #8 comdat align 2 !dbg !2127 {
  %2 = alloca %"class.std::basic_string"*, align 8
  %3 = alloca %"class.std::_String_val"*, align 8
  %4 = alloca i8, align 1
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %2, metadata !2129, metadata !DIExpression()), !dbg !2132
  %5 = load %"class.std::basic_string"*, %"class.std::basic_string"** %2, align 8
  %6 = bitcast %"class.std::_String_val"** %3 to i8*, !dbg !2133
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #3, !dbg !2133
  call void @llvm.dbg.declare(metadata %"class.std::_String_val"** %3, metadata !2130, metadata !DIExpression()), !dbg !2134
  %7 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %5, i32 0, i32 0, !dbg !2135
  %8 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %7, i32 0, i32 0, !dbg !2136
  store %"class.std::_String_val"* %8, %"class.std::_String_val"** %3, align 8, !dbg !2134, !tbaa !1715
  %9 = load %"class.std::_String_val"*, %"class.std::_String_val"** %3, align 8, !dbg !2137, !tbaa !1715
  %10 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %9, i32 0, i32 1, !dbg !2138
  store i64 0, i64* %10, align 8, !dbg !2139, !tbaa !2140
  %11 = load %"class.std::_String_val"*, %"class.std::_String_val"** %3, align 8, !dbg !2141, !tbaa !1715
  %12 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %11, i32 0, i32 2, !dbg !2143
  store i64 15, i64* %12, align 8, !dbg !2144, !tbaa !1954
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %4) #3, !dbg !2145
  store i8 0, i8* %4, align 1, !dbg !2145, !tbaa !1892
  %13 = load %"class.std::_String_val"*, %"class.std::_String_val"** %3, align 8, !dbg !2146, !tbaa !1715
  %14 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %13, i32 0, i32 0, !dbg !2147
  %15 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %14 to [16 x i8]*, !dbg !2148
  %16 = getelementptr inbounds [16 x i8], [16 x i8]* %15, i64 0, i64 0, !dbg !2146
  call void @"?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z"(i8* nonnull align 1 dereferenceable(1) %16, i8* nonnull align 1 dereferenceable(1) %4) #3, !dbg !2149
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %4) #3, !dbg !2149
  %17 = bitcast %"class.std::_String_val"** %3 to i8*, !dbg !2150
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %17) #3, !dbg !2150
  ret void, !dbg !2150
}

; Function Attrs: inlinehint uwtable mustprogress
define linkonce_odr dso_local nonnull align 8 dereferenceable(32) %"class.std::basic_string"* @"?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %0, i8* %1) #9 comdat align 2 !dbg !2151 {
  %3 = alloca i8*, align 8
  %4 = alloca %"class.std::basic_string"*, align 8
  store i8* %1, i8** %3, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %3, metadata !2153, metadata !DIExpression()), !dbg !2155
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %4, metadata !2154, metadata !DIExpression()), !dbg !2156
  %5 = load %"class.std::basic_string"*, %"class.std::basic_string"** %4, align 8
  %6 = load i8*, i8** %3, align 8, !dbg !2157, !tbaa !1715
  %7 = call i64 @"?length@?$_Narrow_char_traits@DH@std@@SA_KQEBD@Z"(i8* %6) #3, !dbg !2158
  %8 = call i64 @"??$_Convert_size@_K@std@@YA_K_K@Z"(i64 %7) #3, !dbg !2159
  %9 = load i8*, i8** %3, align 8, !dbg !2160, !tbaa !1715
  %10 = call nonnull align 8 dereferenceable(32) %"class.std::basic_string"* @"?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD_K@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %5, i8* %9, i64 %8), !dbg !2161
  ret %"class.std::basic_string"* %10, !dbg !2162
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local void @"?_Release@_Fake_proxy_ptr_impl@std@@QEAAXXZ"(%"struct.std::_Fake_proxy_ptr_impl"* nonnull dereferenceable(1) %0) #8 comdat align 2 !dbg !2163 {
  %2 = alloca %"struct.std::_Fake_proxy_ptr_impl"*, align 8
  store %"struct.std::_Fake_proxy_ptr_impl"* %0, %"struct.std::_Fake_proxy_ptr_impl"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"struct.std::_Fake_proxy_ptr_impl"** %2, metadata !2165, metadata !DIExpression()), !dbg !2166
  %3 = load %"struct.std::_Fake_proxy_ptr_impl"*, %"struct.std::_Fake_proxy_ptr_impl"** %2, align 8
  ret void, !dbg !2167
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local %"class.std::allocator"* @"??0?$allocator@D@std@@QEAA@XZ"(%"class.std::allocator"* nonnull returned dereferenceable(1) %0) unnamed_addr #12 comdat align 2 !dbg !2168 {
  %2 = alloca %"class.std::allocator"*, align 8
  store %"class.std::allocator"* %0, %"class.std::allocator"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %2, metadata !2170, metadata !DIExpression()), !dbg !2171
  %3 = load %"class.std::allocator"*, %"class.std::allocator"** %2, align 8
  ret %"class.std::allocator"* %3, !dbg !2172
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local %"class.std::_String_val"* @"??0?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(%"class.std::_String_val"* nonnull returned dereferenceable(32) %0) unnamed_addr #2 comdat align 2 !dbg !2173 {
  %2 = alloca %"class.std::_String_val"*, align 8
  store %"class.std::_String_val"* %0, %"class.std::_String_val"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::_String_val"** %2, metadata !2175, metadata !DIExpression()), !dbg !2176
  %3 = load %"class.std::_String_val"*, %"class.std::_String_val"** %2, align 8
  %4 = bitcast %"class.std::_String_val"* %3 to %"struct.std::_Container_base0"*, !dbg !2177
  %5 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %3, i32 0, i32 0, !dbg !2178
  %6 = call %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* @"??0_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(%"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* nonnull dereferenceable(16) %5) #3, !dbg !2178
  %7 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %3, i32 0, i32 1, !dbg !2179
  store i64 0, i64* %7, align 8, !dbg !2179, !tbaa !2140
  %8 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %3, i32 0, i32 2, !dbg !2180
  store i64 0, i64* %8, align 8, !dbg !2180, !tbaa !1954
  ret %"class.std::_String_val"* %3, !dbg !2181
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* @"??0_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(%"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* nonnull returned dereferenceable(16) %0) unnamed_addr #2 comdat align 2 !dbg !2182 {
  %2 = alloca %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"*, align 8
  store %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %0, %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"** %2, metadata !2184, metadata !DIExpression()), !dbg !2185
  %3 = load %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"*, %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"** %2, align 8
  %4 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %3 to i8**, !dbg !2186
  store i8* null, i8** %4, align 8, !dbg !2186, !tbaa !1892
  ret %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %3, !dbg !2187
}

; Function Attrs: inlinehint uwtable mustprogress
define linkonce_odr dso_local nonnull align 8 dereferenceable(32) %"class.std::basic_string"* @"?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD_K@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %0, i8* %1, i64 %2) #9 comdat align 2 !dbg !2188 {
  %4 = alloca %"class.std::basic_string"*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca %"class.std::basic_string"*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8, align 1
  %10 = alloca %class.anon, align 1
  store i64 %2, i64* %5, align 8, !tbaa !1983
  call void @llvm.dbg.declare(metadata i64* %5, metadata !2190, metadata !DIExpression()), !dbg !2196
  store i8* %1, i8** %6, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %6, metadata !2191, metadata !DIExpression()), !dbg !2197
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %7, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %7, metadata !2192, metadata !DIExpression()), !dbg !2198
  %11 = load %"class.std::basic_string"*, %"class.std::basic_string"** %7, align 8
  %12 = load i64, i64* %5, align 8, !dbg !2199, !tbaa !1983
  %13 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %11, i32 0, i32 0, !dbg !2200
  %14 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %13, i32 0, i32 0, !dbg !2201
  %15 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %14, i32 0, i32 2, !dbg !2202
  %16 = load i64, i64* %15, align 8, !dbg !2202, !tbaa !1905
  %17 = icmp ule i64 %12, %16, !dbg !2203
  br i1 %17, label %18, label %35, !dbg !2204

18:                                               ; preds = %3
  %19 = bitcast i8** %8 to i8*, !dbg !2205
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %19) #3, !dbg !2205
  call void @llvm.dbg.declare(metadata i8** %8, metadata !2193, metadata !DIExpression()), !dbg !2206
  %20 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %11, i32 0, i32 0, !dbg !2207
  %21 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %20, i32 0, i32 0, !dbg !2208
  %22 = call i8* @"?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAAPEADXZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %21) #3, !dbg !2209
  store i8* %22, i8** %8, align 8, !dbg !2206, !tbaa !1715
  %23 = load i64, i64* %5, align 8, !dbg !2210, !tbaa !1983
  %24 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %11, i32 0, i32 0, !dbg !2211
  %25 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %24, i32 0, i32 0, !dbg !2212
  %26 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %25, i32 0, i32 1, !dbg !2213
  store i64 %23, i64* %26, align 8, !dbg !2214, !tbaa !1920
  %27 = load i64, i64* %5, align 8, !dbg !2215, !tbaa !1983
  %28 = load i8*, i8** %6, align 8, !dbg !2216, !tbaa !1715
  %29 = load i8*, i8** %8, align 8, !dbg !2217, !tbaa !1715
  %30 = call i8* @"?move@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z"(i8* %29, i8* %28, i64 %27) #3, !dbg !2218
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %9) #3, !dbg !2219
  store i8 0, i8* %9, align 1, !dbg !2219, !tbaa !1892
  %31 = load i8*, i8** %8, align 8, !dbg !2220, !tbaa !1715
  %32 = load i64, i64* %5, align 8, !dbg !2221, !tbaa !1983
  %33 = getelementptr inbounds i8, i8* %31, i64 %32, !dbg !2220
  call void @"?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z"(i8* nonnull align 1 dereferenceable(1) %33, i8* nonnull align 1 dereferenceable(1) %9) #3, !dbg !2222
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %9) #3, !dbg !2222
  store %"class.std::basic_string"* %11, %"class.std::basic_string"** %4, align 8, !dbg !2223
  %34 = bitcast i8** %8 to i8*, !dbg !2224
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %34) #3, !dbg !2224
  br label %41

35:                                               ; preds = %3
  %36 = load i8*, i8** %6, align 8, !dbg !2225, !tbaa !1715
  %37 = load i64, i64* %5, align 8, !dbg !2226, !tbaa !1983
  %38 = getelementptr inbounds %class.anon, %class.anon* %10, i32 0, i32 0, !dbg !2227
  %39 = load i8, i8* %38, align 1, !dbg !2227
  %40 = call nonnull align 8 dereferenceable(32) %"class.std::basic_string"* @"??$_Reallocate_for@V<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??assign@01@QEAAAEAV01@QEBD0@Z@PEBD@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %11, i64 %37, i8 %39, i8* %36), !dbg !2227
  store %"class.std::basic_string"* %40, %"class.std::basic_string"** %4, align 8, !dbg !2228
  br label %41, !dbg !2228

41:                                               ; preds = %35, %18
  %42 = load %"class.std::basic_string"*, %"class.std::basic_string"** %4, align 8, !dbg !2229
  ret %"class.std::basic_string"* %42, !dbg !2229
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i64 @"??$_Convert_size@_K@std@@YA_K_K@Z"(i64 %0) #7 comdat !dbg !2230 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8, !tbaa !1983
  call void @llvm.dbg.declare(metadata i64* %2, metadata !2234, metadata !DIExpression()), !dbg !2237
  %3 = load i64, i64* %2, align 8, !dbg !2238, !tbaa !1983
  ret i64 %3, !dbg !2239
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local i64 @"?length@?$_Narrow_char_traits@DH@std@@SA_KQEBD@Z"(i8* %0) #8 comdat align 2 personality i8* bitcast (i32 (...)* @__CxxFrameHandler3 to i8*) !dbg !2240 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %2, metadata !2242, metadata !DIExpression()), !dbg !2243
  %3 = load i8*, i8** %2, align 8, !dbg !2244, !tbaa !1715
  %4 = invoke i64 @strlen(i8* %3)
          to label %5 unwind label %6, !dbg !2245

5:                                                ; preds = %1
  ret i64 %4, !dbg !2246

6:                                                ; preds = %1
  %7 = cleanuppad within none [], !dbg !2245
  call void @__std_terminate() #19 [ "funclet"(token %7) ], !dbg !2245
  unreachable, !dbg !2245
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local i8* @"?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAAPEADXZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %0) #8 comdat align 2 !dbg !2247 {
  %2 = alloca %"class.std::_String_val"*, align 8
  %3 = alloca i8*, align 8
  store %"class.std::_String_val"* %0, %"class.std::_String_val"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::_String_val"** %2, metadata !2249, metadata !DIExpression()), !dbg !2251
  %4 = load %"class.std::_String_val"*, %"class.std::_String_val"** %2, align 8
  %5 = bitcast i8** %3 to i8*, !dbg !2252
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #3, !dbg !2252
  call void @llvm.dbg.declare(metadata i8** %3, metadata !2250, metadata !DIExpression()), !dbg !2253
  %6 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %4, i32 0, i32 0, !dbg !2254
  %7 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %6 to [16 x i8]*, !dbg !2255
  %8 = getelementptr inbounds [16 x i8], [16 x i8]* %7, i64 0, i64 0, !dbg !2254
  store i8* %8, i8** %3, align 8, !dbg !2253, !tbaa !1715
  %9 = call zeroext i1 @"?_Large_string_engaged@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_NXZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %4) #3, !dbg !2256
  br i1 %9, label %10, label %15, !dbg !2258

10:                                               ; preds = %1
  %11 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %4, i32 0, i32 0, !dbg !2259
  %12 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %11 to i8**, !dbg !2261
  %13 = load i8*, i8** %12, align 8, !dbg !2261, !tbaa !1892
  %14 = call i8* @"??$_Unfancy@D@std@@YAPEADPEAD@Z"(i8* %13) #3, !dbg !2262
  store i8* %14, i8** %3, align 8, !dbg !2263, !tbaa !1715
  br label %15, !dbg !2264

15:                                               ; preds = %10, %1
  %16 = load i8*, i8** %3, align 8, !dbg !2265, !tbaa !1715
  %17 = bitcast i8** %3 to i8*, !dbg !2266
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %17) #3, !dbg !2266
  ret i8* %16, !dbg !2267
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local i8* @"?move@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z"(i8* %0, i8* %1, i64 %2) #8 comdat align 2 !dbg !2268 {
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  store i64 %2, i64* %4, align 8, !tbaa !1983
  call void @llvm.dbg.declare(metadata i64* %4, metadata !2270, metadata !DIExpression()), !dbg !2273
  store i8* %1, i8** %5, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %5, metadata !2271, metadata !DIExpression()), !dbg !2274
  store i8* %0, i8** %6, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %6, metadata !2272, metadata !DIExpression()), !dbg !2275
  %7 = load i8*, i8** %6, align 8, !dbg !2276, !tbaa !1715
  %8 = load i8*, i8** %5, align 8, !dbg !2277, !tbaa !1715
  %9 = load i64, i64* %4, align 8, !dbg !2278, !tbaa !1983
  %10 = mul i64 %9, 1, !dbg !2279
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 %8, i64 %10, i1 false), !dbg !2280
  %11 = load i8*, i8** %6, align 8, !dbg !2281, !tbaa !1715
  ret i8* %11, !dbg !2282
}

; Function Attrs: inlinehint uwtable mustprogress
define linkonce_odr dso_local nonnull align 8 dereferenceable(32) %"class.std::basic_string"* @"??$_Reallocate_for@V<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??assign@01@QEAAAEAV01@QEBD0@Z@PEBD@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %0, i64 %1, i8 %2, i8* %3) #9 comdat align 2 !dbg !2283 {
  %5 = alloca %class.anon, align 1
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  %8 = alloca %"class.std::basic_string"*, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca %"class.std::allocator"*, align 8
  %12 = alloca i8*, align 8
  %13 = getelementptr inbounds %class.anon, %class.anon* %5, i32 0, i32 0
  store i8 %2, i8* %13, align 1
  store i8* %3, i8** %6, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %6, metadata !2294, metadata !DIExpression()), !dbg !2302
  call void @llvm.dbg.declare(metadata %class.anon* %5, metadata !2295, metadata !DIExpression()), !dbg !2303
  store i64 %1, i64* %7, align 8, !tbaa !1983
  call void @llvm.dbg.declare(metadata i64* %7, metadata !2296, metadata !DIExpression()), !dbg !2304
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %8, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %8, metadata !2297, metadata !DIExpression()), !dbg !2305
  %14 = load %"class.std::basic_string"*, %"class.std::basic_string"** %8, align 8
  %15 = load i64, i64* %7, align 8, !dbg !2306, !tbaa !1983
  %16 = call i64 @"?max_size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %14) #3, !dbg !2308
  %17 = icmp ugt i64 %15, %16, !dbg !2309
  br i1 %17, label %18, label %19, !dbg !2310

18:                                               ; preds = %4
  call void @"?_Xlen_string@std@@YAXXZ"() #20, !dbg !2311
  unreachable, !dbg !2311

19:                                               ; preds = %4
  %20 = bitcast i64* %9 to i8*, !dbg !2313
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %20) #3, !dbg !2313
  call void @llvm.dbg.declare(metadata i64* %9, metadata !2298, metadata !DIExpression()), !dbg !2314
  %21 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %14, i32 0, i32 0, !dbg !2315
  %22 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %21, i32 0, i32 0, !dbg !2316
  %23 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %22, i32 0, i32 2, !dbg !2317
  %24 = load i64, i64* %23, align 8, !dbg !2317, !tbaa !1905
  store i64 %24, i64* %9, align 8, !dbg !2314, !tbaa !1983
  %25 = bitcast i64* %10 to i8*, !dbg !2318
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %25) #3, !dbg !2318
  call void @llvm.dbg.declare(metadata i64* %10, metadata !2299, metadata !DIExpression()), !dbg !2319
  %26 = load i64, i64* %7, align 8, !dbg !2320, !tbaa !1983
  %27 = call i64 @"?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBA_K_K@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %14, i64 %26) #3, !dbg !2321
  store i64 %27, i64* %10, align 8, !dbg !2319, !tbaa !1983
  %28 = bitcast %"class.std::allocator"** %11 to i8*, !dbg !2322
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %28) #3, !dbg !2322
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %11, metadata !2300, metadata !DIExpression()), !dbg !2323
  %29 = call nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV?$allocator@D@2@XZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %14) #3, !dbg !2324
  store %"class.std::allocator"* %29, %"class.std::allocator"** %11, align 8, !dbg !2323, !tbaa !1715
  %30 = bitcast i8** %12 to i8*, !dbg !2325
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %30) #3, !dbg !2325
  call void @llvm.dbg.declare(metadata i8** %12, metadata !2301, metadata !DIExpression()), !dbg !2326
  %31 = load %"class.std::allocator"*, %"class.std::allocator"** %11, align 8, !dbg !2327, !tbaa !1715
  %32 = load i64, i64* %10, align 8, !dbg !2328, !tbaa !1983
  %33 = add i64 %32, 1, !dbg !2329
  %34 = call i8* @"?allocate@?$allocator@D@std@@QEAAPEAD_K@Z"(%"class.std::allocator"* nonnull dereferenceable(1) %31, i64 %33), !dbg !2330, !heapallocsite !35
  store i8* %34, i8** %12, align 8, !dbg !2326, !tbaa !1715
  %35 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %14, i32 0, i32 0, !dbg !2331
  %36 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %35, i32 0, i32 0, !dbg !2332
  %37 = bitcast %"class.std::_String_val"* %36 to %"struct.std::_Container_base0"*, !dbg !2331
  call void @"?_Orphan_all@_Container_base0@std@@QEAAXXZ"(%"struct.std::_Container_base0"* nonnull dereferenceable(1) %37) #3, !dbg !2333
  %38 = load i64, i64* %7, align 8, !dbg !2334, !tbaa !1983
  %39 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %14, i32 0, i32 0, !dbg !2335
  %40 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %39, i32 0, i32 0, !dbg !2336
  %41 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %40, i32 0, i32 1, !dbg !2337
  store i64 %38, i64* %41, align 8, !dbg !2338, !tbaa !1920
  %42 = load i64, i64* %10, align 8, !dbg !2339, !tbaa !1983
  %43 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %14, i32 0, i32 0, !dbg !2340
  %44 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %43, i32 0, i32 0, !dbg !2341
  %45 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %44, i32 0, i32 2, !dbg !2342
  store i64 %42, i64* %45, align 8, !dbg !2343, !tbaa !1905
  %46 = load i8*, i8** %6, align 8, !dbg !2344, !tbaa !1715
  %47 = load i64, i64* %7, align 8, !dbg !2345, !tbaa !1983
  %48 = load i8*, i8** %12, align 8, !dbg !2346, !tbaa !1715
  %49 = call i8* @"??$_Unfancy@D@std@@YAPEADPEAD@Z"(i8* %48) #3, !dbg !2347
  call void @"??R<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV23@QEBD_K@Z@QEBA?A?<auto>@@QEAD10@Z"(%class.anon* nonnull dereferenceable(1) %5, i8* %49, i64 %47, i8* %46), !dbg !2348
  %50 = load i64, i64* %9, align 8, !dbg !2349, !tbaa !1983
  %51 = icmp ule i64 16, %50, !dbg !2351
  br i1 %51, label %52, label %66, !dbg !2352

52:                                               ; preds = %19
  %53 = load %"class.std::allocator"*, %"class.std::allocator"** %11, align 8, !dbg !2353, !tbaa !1715
  %54 = load i64, i64* %9, align 8, !dbg !2355, !tbaa !1983
  %55 = add i64 %54, 1, !dbg !2356
  %56 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %14, i32 0, i32 0, !dbg !2357
  %57 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %56, i32 0, i32 0, !dbg !2358
  %58 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %57, i32 0, i32 0, !dbg !2359
  %59 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %58 to i8**, !dbg !2360
  %60 = load i8*, i8** %59, align 8, !dbg !2360, !tbaa !1892
  call void @"?deallocate@?$allocator@D@std@@QEAAXQEAD_K@Z"(%"class.std::allocator"* nonnull dereferenceable(1) %53, i8* %60, i64 %55), !dbg !2361
  %61 = load i8*, i8** %12, align 8, !dbg !2362, !tbaa !1715
  %62 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %14, i32 0, i32 0, !dbg !2363
  %63 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %62, i32 0, i32 0, !dbg !2364
  %64 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %63, i32 0, i32 0, !dbg !2365
  %65 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %64 to i8**, !dbg !2366
  store i8* %61, i8** %65, align 8, !dbg !2367, !tbaa !1892
  br label %71, !dbg !2368

66:                                               ; preds = %19
  %67 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %14, i32 0, i32 0, !dbg !2369
  %68 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %67, i32 0, i32 0, !dbg !2371
  %69 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %68, i32 0, i32 0, !dbg !2372
  %70 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %69 to i8**, !dbg !2373
  call void @"??$_Construct_in_place@PEADAEBQEAD@std@@YAXAEAPEADAEBQEAD@Z"(i8** nonnull align 8 dereferenceable(8) %70, i8** nonnull align 8 dereferenceable(8) %12) #3, !dbg !2374
  br label %71

71:                                               ; preds = %66, %52
  %72 = bitcast i8** %12 to i8*, !dbg !2375
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %72) #3, !dbg !2375
  %73 = bitcast %"class.std::allocator"** %11 to i8*, !dbg !2375
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %73) #3, !dbg !2375
  %74 = bitcast i64* %10 to i8*, !dbg !2375
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %74) #3, !dbg !2375
  %75 = bitcast i64* %9 to i8*, !dbg !2375
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %75) #3, !dbg !2375
  ret %"class.std::basic_string"* %14, !dbg !2376
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i8* @"??$_Unfancy@D@std@@YAPEADPEAD@Z"(i8* %0) #7 comdat !dbg !2377 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %2, metadata !2380, metadata !DIExpression()), !dbg !2381
  %3 = load i8*, i8** %2, align 8, !dbg !2382, !tbaa !1715
  ret i8* %3, !dbg !2383
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local i64 @"?max_size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %0) #8 comdat align 2 !dbg !2384 {
  %2 = alloca %"class.std::basic_string"*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %2, metadata !2386, metadata !DIExpression()), !dbg !2390
  %8 = load %"class.std::basic_string"*, %"class.std::basic_string"** %2, align 8
  %9 = bitcast i64* %3 to i8*, !dbg !2391
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %9) #3, !dbg !2391
  call void @llvm.dbg.declare(metadata i64* %3, metadata !2388, metadata !DIExpression()), !dbg !2392
  %10 = call nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBAAEBV?$allocator@D@2@XZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %8) #3, !dbg !2393
  %11 = call i64 @"?max_size@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA_KAEBV?$allocator@D@2@@Z"(%"class.std::allocator"* nonnull align 1 dereferenceable(1) %10) #3, !dbg !2394
  store i64 %11, i64* %3, align 8, !dbg !2392, !tbaa !1983
  %12 = bitcast i64* %4 to i8*, !dbg !2395
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %12) #3, !dbg !2395
  call void @llvm.dbg.declare(metadata i64* %4, metadata !2389, metadata !DIExpression()), !dbg !2396
  %13 = bitcast i64* %5 to i8*, !dbg !2397
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %13) #3, !dbg !2397
  store i64 16, i64* %5, align 8, !dbg !2397, !tbaa !1983
  %14 = call nonnull align 8 dereferenceable(8) i64* @"??$max@_K@std@@YAAEB_KAEB_K0@Z"(i64* nonnull align 8 dereferenceable(8) %3, i64* nonnull align 8 dereferenceable(8) %5) #3, !dbg !2398
  %15 = load i64, i64* %14, align 8, !dbg !2398, !tbaa !1983
  %16 = bitcast i64* %5 to i8*, !dbg !2398
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %16) #3, !dbg !2398
  store i64 %15, i64* %4, align 8, !dbg !2396, !tbaa !1983
  %17 = bitcast i64* %6 to i8*, !dbg !2399
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %17) #3, !dbg !2399
  %18 = load i64, i64* %4, align 8, !dbg !2399, !tbaa !1983
  %19 = sub i64 %18, 1, !dbg !2400
  store i64 %19, i64* %6, align 8, !dbg !2399, !tbaa !1983
  %20 = bitcast i64* %7 to i8*, !dbg !2401
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %20) #3, !dbg !2401
  %21 = call i64 @"?max@?$numeric_limits@_J@std@@SA_JXZ"() #3, !dbg !2402
  store i64 %21, i64* %7, align 8, !dbg !2401, !tbaa !1983
  %22 = call nonnull align 8 dereferenceable(8) i64* @"??$min@_K@std@@YAAEB_KAEB_K0@Z"(i64* nonnull align 8 dereferenceable(8) %7, i64* nonnull align 8 dereferenceable(8) %6) #3, !dbg !2403
  %23 = load i64, i64* %22, align 8, !dbg !2403, !tbaa !1983
  %24 = bitcast i64* %7 to i8*, !dbg !2404
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %24) #3, !dbg !2404
  %25 = bitcast i64* %6 to i8*, !dbg !2404
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %25) #3, !dbg !2404
  %26 = bitcast i64* %4 to i8*, !dbg !2405
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %26) #3, !dbg !2405
  %27 = bitcast i64* %3 to i8*, !dbg !2405
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %27) #3, !dbg !2405
  ret i64 %23, !dbg !2404
}

; Function Attrs: inlinehint noreturn uwtable mustprogress
define linkonce_odr dso_local void @"?_Xlen_string@std@@YAXXZ"() #13 comdat !dbg !2406 {
  call void @"?_Xlength_error@std@@YAXPEBD@Z"(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @"??_C@_0BA@JFNIOLAK@string?5too?5long?$AA@", i64 0, i64 0)) #20, !dbg !2407
  unreachable, !dbg !2407
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local i64 @"?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBA_K_K@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %0, i64 %1) #8 comdat align 2 !dbg !2408 {
  %3 = alloca i64, align 8
  %4 = alloca %"class.std::basic_string"*, align 8
  store i64 %1, i64* %3, align 8, !tbaa !1983
  call void @llvm.dbg.declare(metadata i64* %3, metadata !2410, metadata !DIExpression()), !dbg !2412
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %4, metadata !2411, metadata !DIExpression()), !dbg !2413
  %5 = load %"class.std::basic_string"*, %"class.std::basic_string"** %4, align 8
  %6 = call i64 @"?max_size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %5) #3, !dbg !2414
  %7 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %5, i32 0, i32 0, !dbg !2415
  %8 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %7, i32 0, i32 0, !dbg !2416
  %9 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %8, i32 0, i32 2, !dbg !2417
  %10 = load i64, i64* %9, align 8, !dbg !2417, !tbaa !1905
  %11 = load i64, i64* %3, align 8, !dbg !2418, !tbaa !1983
  %12 = call i64 @"?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@CA_K_K00@Z"(i64 %11, i64 %10, i64 %6) #3, !dbg !2419
  ret i64 %12, !dbg !2420
}

; Function Attrs: inlinehint uwtable mustprogress
define linkonce_odr dso_local i8* @"?allocate@?$allocator@D@std@@QEAAPEAD_K@Z"(%"class.std::allocator"* nonnull dereferenceable(1) %0, i64 %1) #9 comdat align 2 !dbg !2421 {
  %3 = alloca i64, align 8
  %4 = alloca %"class.std::allocator"*, align 8
  store i64 %1, i64* %3, align 8, !tbaa !1983
  call void @llvm.dbg.declare(metadata i64* %3, metadata !2423, metadata !DIExpression()), !dbg !2425
  store %"class.std::allocator"* %0, %"class.std::allocator"** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %4, metadata !2424, metadata !DIExpression()), !dbg !2426
  %5 = load %"class.std::allocator"*, %"class.std::allocator"** %4, align 8
  %6 = load i64, i64* %3, align 8, !dbg !2427, !tbaa !1983
  %7 = call i64 @"??$_Get_size_of_n@$00@std@@YA_K_K@Z"(i64 %6), !dbg !2428
  %8 = call i8* @"??$_Allocate@$0BA@U_Default_allocate_traits@std@@$0A@@std@@YAPEAX_K@Z"(i64 %7), !dbg !2429, !heapallocsite !35
  ret i8* %8, !dbg !2430
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local void @"??R<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV23@QEBD_K@Z@QEBA?A?<auto>@@QEAD10@Z"(%class.anon* nonnull dereferenceable(1) %0, i8* %1, i64 %2, i8* %3) #8 comdat align 2 !dbg !2431 {
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca %class.anon*, align 8
  %9 = alloca i8, align 1
  store i8* %3, i8** %5, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %5, metadata !2441, metadata !DIExpression()), !dbg !2446
  store i64 %2, i64* %6, align 8, !tbaa !1983
  call void @llvm.dbg.declare(metadata i64* %6, metadata !2442, metadata !DIExpression()), !dbg !2447
  store i8* %1, i8** %7, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %7, metadata !2443, metadata !DIExpression()), !dbg !2448
  store %class.anon* %0, %class.anon** %8, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %class.anon** %8, metadata !2444, metadata !DIExpression()), !dbg !2449
  %10 = load %class.anon*, %class.anon** %8, align 8
  %11 = load i64, i64* %6, align 8, !dbg !2450, !tbaa !1983
  %12 = load i8*, i8** %5, align 8, !dbg !2451, !tbaa !1715
  %13 = load i8*, i8** %7, align 8, !dbg !2452, !tbaa !1715
  %14 = call i8* @"?copy@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z"(i8* %13, i8* %12, i64 %11) #3, !dbg !2453
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %9) #3, !dbg !2454
  store i8 0, i8* %9, align 1, !dbg !2454, !tbaa !1892
  %15 = load i8*, i8** %7, align 8, !dbg !2455, !tbaa !1715
  %16 = load i64, i64* %6, align 8, !dbg !2456, !tbaa !1983
  %17 = getelementptr inbounds i8, i8* %15, i64 %16, !dbg !2455
  call void @"?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z"(i8* nonnull align 1 dereferenceable(1) %17, i8* nonnull align 1 dereferenceable(1) %9) #3, !dbg !2457
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %9) #3, !dbg !2457
  ret void, !dbg !2458
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local void @"??$_Construct_in_place@PEADAEBQEAD@std@@YAXAEAPEADAEBQEAD@Z"(i8** nonnull align 8 dereferenceable(8) %0, i8** nonnull align 8 dereferenceable(8) %1) #8 comdat !dbg !2459 {
  %3 = alloca i8**, align 8
  %4 = alloca i8**, align 8
  store i8** %1, i8*** %3, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8*** %3, metadata !2464, metadata !DIExpression()), !dbg !2470
  store i8** %0, i8*** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8*** %4, metadata !2465, metadata !DIExpression()), !dbg !2471
  %5 = load i8**, i8*** %4, align 8, !dbg !2472, !tbaa !1715
  %6 = call i8** @"??$addressof@PEAD@std@@YAPEAPEADAEAPEAD@Z"(i8** nonnull align 8 dereferenceable(8) %5) #3, !dbg !2474
  %7 = call i8* @"??$_Voidify_iter@PEAPEAD@std@@YAPEAXPEAPEAD@Z"(i8** %6) #3, !dbg !2475
  %8 = bitcast i8* %7 to i8**, !dbg !2476
  %9 = load i8**, i8*** %3, align 8, !dbg !2477, !tbaa !1715
  %10 = call nonnull align 8 dereferenceable(8) i8** @"??$forward@AEBQEAD@std@@YAAEBQEADAEBQEAD@Z"(i8** nonnull align 8 dereferenceable(8) %9) #3, !dbg !2478
  %11 = load i8*, i8** %10, align 8, !dbg !2478, !tbaa !1715
  store i8* %11, i8** %8, align 8, !dbg !2476, !tbaa !1715
  ret void, !dbg !2479
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local i64 @"?max_size@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA_KAEBV?$allocator@D@2@@Z"(%"class.std::allocator"* nonnull align 1 dereferenceable(1) %0) #8 comdat align 2 !dbg !2480 {
  %2 = alloca %"class.std::allocator"*, align 8
  store %"class.std::allocator"* %0, %"class.std::allocator"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %2, metadata !2482, metadata !DIExpression()), !dbg !2483
  ret i64 -1, !dbg !2484
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBAAEBV?$allocator@D@2@XZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %0) #8 comdat align 2 !dbg !2485 {
  %2 = alloca %"class.std::basic_string"*, align 8
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %2, metadata !2487, metadata !DIExpression()), !dbg !2488
  %3 = load %"class.std::basic_string"*, %"class.std::basic_string"** %2, align 8
  %4 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %3, i32 0, i32 0, !dbg !2489
  %5 = call nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEBAAEBV?$allocator@D@2@XZ"(%"class.std::_Compressed_pair"* nonnull dereferenceable(32) %4) #3, !dbg !2490
  ret %"class.std::allocator"* %5, !dbg !2491
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local nonnull align 8 dereferenceable(8) i64* @"??$max@_K@std@@YAAEB_KAEB_K0@Z"(i64* nonnull align 8 dereferenceable(8) %0, i64* nonnull align 8 dereferenceable(8) %1) #7 comdat !dbg !2492 {
  %3 = alloca i64*, align 8
  %4 = alloca i64*, align 8
  store i64* %1, i64** %3, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i64** %3, metadata !2498, metadata !DIExpression()), !dbg !2502
  store i64* %0, i64** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i64** %4, metadata !2499, metadata !DIExpression()), !dbg !2503
  %5 = load i64*, i64** %4, align 8, !dbg !2504, !tbaa !1715
  %6 = load i64, i64* %5, align 8, !dbg !2504, !tbaa !1983
  %7 = load i64*, i64** %3, align 8, !dbg !2505, !tbaa !1715
  %8 = load i64, i64* %7, align 8, !dbg !2505, !tbaa !1983
  %9 = icmp ult i64 %6, %8, !dbg !2506
  br i1 %9, label %10, label %12, !dbg !2504

10:                                               ; preds = %2
  %11 = load i64*, i64** %3, align 8, !dbg !2507, !tbaa !1715
  br label %14, !dbg !2504

12:                                               ; preds = %2
  %13 = load i64*, i64** %4, align 8, !dbg !2508, !tbaa !1715
  br label %14, !dbg !2504

14:                                               ; preds = %12, %10
  %15 = phi i64* [ %11, %10 ], [ %13, %12 ], !dbg !2504
  ret i64* %15, !dbg !2509
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local nonnull align 8 dereferenceable(8) i64* @"??$min@_K@std@@YAAEB_KAEB_K0@Z"(i64* nonnull align 8 dereferenceable(8) %0, i64* nonnull align 8 dereferenceable(8) %1) #7 comdat !dbg !2510 {
  %3 = alloca i64*, align 8
  %4 = alloca i64*, align 8
  store i64* %1, i64** %3, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i64** %3, metadata !2512, metadata !DIExpression()), !dbg !2514
  store i64* %0, i64** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i64** %4, metadata !2513, metadata !DIExpression()), !dbg !2515
  %5 = load i64*, i64** %3, align 8, !dbg !2516, !tbaa !1715
  %6 = load i64, i64* %5, align 8, !dbg !2516, !tbaa !1983
  %7 = load i64*, i64** %4, align 8, !dbg !2517, !tbaa !1715
  %8 = load i64, i64* %7, align 8, !dbg !2517, !tbaa !1983
  %9 = icmp ult i64 %6, %8, !dbg !2518
  br i1 %9, label %10, label %12, !dbg !2516

10:                                               ; preds = %2
  %11 = load i64*, i64** %3, align 8, !dbg !2519, !tbaa !1715
  br label %14, !dbg !2516

12:                                               ; preds = %2
  %13 = load i64*, i64** %4, align 8, !dbg !2520, !tbaa !1715
  br label %14, !dbg !2516

14:                                               ; preds = %12, %10
  %15 = phi i64* [ %11, %10 ], [ %13, %12 ], !dbg !2516
  ret i64* %15, !dbg !2521
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i64 @"?max@?$numeric_limits@_J@std@@SA_JXZ"() #7 comdat align 2 !dbg !2522 {
  ret i64 9223372036854775807, !dbg !2577
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEBAAEBV?$allocator@D@2@XZ"(%"class.std::_Compressed_pair"* nonnull dereferenceable(32) %0) #7 comdat align 2 !dbg !2578 {
  %2 = alloca %"class.std::_Compressed_pair"*, align 8
  store %"class.std::_Compressed_pair"* %0, %"class.std::_Compressed_pair"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::_Compressed_pair"** %2, metadata !2580, metadata !DIExpression()), !dbg !2582
  %3 = load %"class.std::_Compressed_pair"*, %"class.std::_Compressed_pair"** %2, align 8
  %4 = bitcast %"class.std::_Compressed_pair"* %3 to %"class.std::allocator"*, !dbg !2583
  ret %"class.std::allocator"* %4, !dbg !2584
}

; Function Attrs: noreturn
declare dso_local void @"?_Xlength_error@std@@YAXPEBD@Z"(i8*) #11

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local i64 @"?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@CA_K_K00@Z"(i64 %0, i64 %1, i64 %2) #8 comdat align 2 !dbg !2585 {
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca i64, align 8
  store i64 %2, i64* %5, align 8, !tbaa !1983
  call void @llvm.dbg.declare(metadata i64* %5, metadata !2587, metadata !DIExpression()), !dbg !2591
  store i64 %1, i64* %6, align 8, !tbaa !1983
  call void @llvm.dbg.declare(metadata i64* %6, metadata !2588, metadata !DIExpression()), !dbg !2592
  store i64 %0, i64* %7, align 8, !tbaa !1983
  call void @llvm.dbg.declare(metadata i64* %7, metadata !2589, metadata !DIExpression()), !dbg !2593
  %11 = bitcast i64* %8 to i8*, !dbg !2594
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %11) #3, !dbg !2594
  call void @llvm.dbg.declare(metadata i64* %8, metadata !2590, metadata !DIExpression()), !dbg !2595
  %12 = load i64, i64* %7, align 8, !dbg !2596, !tbaa !1983
  %13 = or i64 %12, 15, !dbg !2597
  store i64 %13, i64* %8, align 8, !dbg !2595, !tbaa !1983
  %14 = load i64, i64* %8, align 8, !dbg !2598, !tbaa !1983
  %15 = load i64, i64* %5, align 8, !dbg !2600, !tbaa !1983
  %16 = icmp ugt i64 %14, %15, !dbg !2601
  br i1 %16, label %17, label %19, !dbg !2602

17:                                               ; preds = %3
  %18 = load i64, i64* %5, align 8, !dbg !2603, !tbaa !1983
  store i64 %18, i64* %4, align 8, !dbg !2605
  store i32 1, i32* %9, align 4
  br label %37, !dbg !2605

19:                                               ; preds = %3
  %20 = load i64, i64* %6, align 8, !dbg !2606, !tbaa !1983
  %21 = load i64, i64* %5, align 8, !dbg !2608, !tbaa !1983
  %22 = load i64, i64* %6, align 8, !dbg !2609, !tbaa !1983
  %23 = udiv i64 %22, 2, !dbg !2610
  %24 = sub i64 %21, %23, !dbg !2611
  %25 = icmp ugt i64 %20, %24, !dbg !2612
  br i1 %25, label %26, label %28, !dbg !2613

26:                                               ; preds = %19
  %27 = load i64, i64* %5, align 8, !dbg !2614, !tbaa !1983
  store i64 %27, i64* %4, align 8, !dbg !2616
  store i32 1, i32* %9, align 4
  br label %37, !dbg !2616

28:                                               ; preds = %19
  %29 = bitcast i64* %10 to i8*, !dbg !2617
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %29) #3, !dbg !2617
  %30 = load i64, i64* %6, align 8, !dbg !2617, !tbaa !1983
  %31 = load i64, i64* %6, align 8, !dbg !2618, !tbaa !1983
  %32 = udiv i64 %31, 2, !dbg !2619
  %33 = add i64 %30, %32, !dbg !2620
  store i64 %33, i64* %10, align 8, !dbg !2617, !tbaa !1983
  %34 = call nonnull align 8 dereferenceable(8) i64* @"??$max@_K@std@@YAAEB_KAEB_K0@Z"(i64* nonnull align 8 dereferenceable(8) %8, i64* nonnull align 8 dereferenceable(8) %10) #3, !dbg !2621
  %35 = load i64, i64* %34, align 8, !dbg !2621, !tbaa !1983
  store i64 %35, i64* %4, align 8, !dbg !2622
  %36 = bitcast i64* %10 to i8*, !dbg !2622
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %36) #3, !dbg !2622
  store i32 1, i32* %9, align 4
  br label %37, !dbg !2622

37:                                               ; preds = %28, %26, %17
  %38 = bitcast i64* %8 to i8*, !dbg !2623
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %38) #3, !dbg !2623
  %39 = load i64, i64* %4, align 8, !dbg !2623
  ret i64 %39, !dbg !2623
}

; Function Attrs: inlinehint uwtable mustprogress
define linkonce_odr dso_local i8* @"??$_Allocate@$0BA@U_Default_allocate_traits@std@@$0A@@std@@YAPEAX_K@Z"(i64 %0) #9 comdat !dbg !2624 {
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  store i64 %0, i64* %3, align 8, !tbaa !1983
  call void @llvm.dbg.declare(metadata i64* %3, metadata !2628, metadata !DIExpression()), !dbg !2634
  %4 = load i64, i64* %3, align 8, !dbg !2635, !tbaa !1983
  %5 = icmp uge i64 %4, 4096, !dbg !2638
  br i1 %5, label %6, label %9, !dbg !2639

6:                                                ; preds = %1
  %7 = load i64, i64* %3, align 8, !dbg !2640, !tbaa !1983
  %8 = call i8* @"??$_Allocate_manually_vector_aligned@U_Default_allocate_traits@std@@@std@@YAPEAX_K@Z"(i64 %7), !dbg !2642, !heapallocsite !209
  store i8* %8, i8** %2, align 8, !dbg !2643
  br label %16, !dbg !2643

9:                                                ; preds = %1
  %10 = load i64, i64* %3, align 8, !dbg !2644, !tbaa !1983
  %11 = icmp ne i64 %10, 0, !dbg !2646
  br i1 %11, label %12, label %15, !dbg !2647

12:                                               ; preds = %9
  %13 = load i64, i64* %3, align 8, !dbg !2648, !tbaa !1983
  %14 = call i8* @"?_Allocate@_Default_allocate_traits@std@@SAPEAX_K@Z"(i64 %13), !dbg !2650, !heapallocsite !209
  store i8* %14, i8** %2, align 8, !dbg !2651
  br label %16, !dbg !2651

15:                                               ; preds = %9
  store i8* null, i8** %2, align 8, !dbg !2652
  br label %16, !dbg !2652

16:                                               ; preds = %15, %12, %6
  %17 = load i8*, i8** %2, align 8, !dbg !2653
  ret i8* %17, !dbg !2653
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i64 @"??$_Get_size_of_n@$00@std@@YA_K_K@Z"(i64 %0) #7 comdat !dbg !2654 {
  %2 = alloca i64, align 8
  %3 = alloca i8, align 1
  store i64 %0, i64* %2, align 8, !tbaa !1983
  call void @llvm.dbg.declare(metadata i64* %2, metadata !2656, metadata !DIExpression()), !dbg !2660
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %3) #3, !dbg !2661
  call void @llvm.dbg.declare(metadata i8* %3, metadata !2657, metadata !DIExpression()), !dbg !2662
  store i8 0, i8* %3, align 1, !dbg !2662, !tbaa !2663
  %4 = load i64, i64* %2, align 8, !dbg !2665, !tbaa !1983
  %5 = mul i64 %4, 1, !dbg !2666
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %3) #3, !dbg !2667
  ret i64 %5, !dbg !2668
}

; Function Attrs: uwtable mustprogress
define linkonce_odr dso_local i8* @"??$_Allocate_manually_vector_aligned@U_Default_allocate_traits@std@@@std@@YAPEAX_K@Z"(i64 %0) #14 comdat !dbg !2669 {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  store i64 %0, i64* %2, align 8, !tbaa !1983
  call void @llvm.dbg.declare(metadata i64* %2, metadata !2671, metadata !DIExpression()), !dbg !2678
  %6 = bitcast i64* %3 to i8*, !dbg !2679
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #3, !dbg !2679
  call void @llvm.dbg.declare(metadata i64* %3, metadata !2672, metadata !DIExpression()), !dbg !2680
  %7 = load i64, i64* %2, align 8, !dbg !2681, !tbaa !1983
  %8 = add i64 39, %7, !dbg !2682
  store i64 %8, i64* %3, align 8, !dbg !2680, !tbaa !1983
  %9 = load i64, i64* %3, align 8, !dbg !2683, !tbaa !1983
  %10 = load i64, i64* %2, align 8, !dbg !2685, !tbaa !1983
  %11 = icmp ule i64 %9, %10, !dbg !2686
  br i1 %11, label %12, label %13, !dbg !2687

12:                                               ; preds = %1
  call void @"?_Throw_bad_array_new_length@std@@YAXXZ"() #20, !dbg !2688
  unreachable, !dbg !2688

13:                                               ; preds = %1
  %14 = bitcast i64* %4 to i8*, !dbg !2690
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %14) #3, !dbg !2690
  call void @llvm.dbg.declare(metadata i64* %4, metadata !2673, metadata !DIExpression()), !dbg !2691
  %15 = load i64, i64* %3, align 8, !dbg !2692, !tbaa !1983
  %16 = call i8* @"?_Allocate@_Default_allocate_traits@std@@SAPEAX_K@Z"(i64 %15), !dbg !2693, !heapallocsite !209
  %17 = ptrtoint i8* %16 to i64, !dbg !2694
  store i64 %17, i64* %4, align 8, !dbg !2691, !tbaa !1983
  br label %18, !dbg !2695

18:                                               ; preds = %13
  %19 = load i64, i64* %4, align 8, !dbg !2696, !tbaa !1983
  %20 = icmp ne i64 %19, 0, !dbg !2696
  br i1 %20, label %21, label %22, !dbg !2699

21:                                               ; preds = %18
  br label %26, !dbg !2700

22:                                               ; preds = %18
  br label %23, !dbg !2702

23:                                               ; preds = %22
  call void @_invalid_parameter_noinfo_noreturn() #20, !dbg !2704
  unreachable, !dbg !2704

24:                                               ; No predecessors!
  br label %25, !dbg !2704

25:                                               ; preds = %24
  br label %26

26:                                               ; preds = %25, %21
  br label %27, !dbg !2699

27:                                               ; preds = %26
  br label %28, !dbg !2699

28:                                               ; preds = %27
  %29 = bitcast i8** %5 to i8*, !dbg !2706
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %29) #3, !dbg !2706
  call void @llvm.dbg.declare(metadata i8** %5, metadata !2674, metadata !DIExpression()), !dbg !2707
  %30 = load i64, i64* %4, align 8, !dbg !2708, !tbaa !1983
  %31 = add i64 %30, 39, !dbg !2709
  %32 = and i64 %31, -32, !dbg !2710
  %33 = inttoptr i64 %32 to i8*, !dbg !2711
  store i8* %33, i8** %5, align 8, !dbg !2707, !tbaa !1715
  %34 = load i64, i64* %4, align 8, !dbg !2712, !tbaa !1983
  %35 = load i8*, i8** %5, align 8, !dbg !2713, !tbaa !1715
  %36 = bitcast i8* %35 to i64*, !dbg !2714
  %37 = getelementptr inbounds i64, i64* %36, i64 -1, !dbg !2714
  store i64 %34, i64* %37, align 8, !dbg !2715, !tbaa !1983
  %38 = load i8*, i8** %5, align 8, !dbg !2716, !tbaa !1715
  %39 = bitcast i8** %5 to i8*, !dbg !2717
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %39) #3, !dbg !2717
  %40 = bitcast i64* %4 to i8*, !dbg !2717
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %40) #3, !dbg !2717
  %41 = bitcast i64* %3 to i8*, !dbg !2717
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %41) #3, !dbg !2717
  ret i8* %38, !dbg !2718
}

; Function Attrs: inlinehint uwtable mustprogress
define linkonce_odr dso_local i8* @"?_Allocate@_Default_allocate_traits@std@@SAPEAX_K@Z"(i64 %0) #9 comdat align 2 !dbg !2719 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8, !tbaa !1983
  call void @llvm.dbg.declare(metadata i64* %2, metadata !2721, metadata !DIExpression()), !dbg !2722
  %3 = load i64, i64* %2, align 8, !dbg !2723, !tbaa !1983
  %4 = call noalias nonnull i8* @"??2@YAPEAX_K@Z"(i64 %3) #21, !dbg !2724, !heapallocsite !209
  ret i8* %4, !dbg !2725
}

; Function Attrs: inlinehint noreturn uwtable mustprogress
define linkonce_odr dso_local void @"?_Throw_bad_array_new_length@std@@YAXXZ"() #13 comdat !dbg !2726 {
  %1 = alloca %"class.std::bad_array_new_length", align 8
  %2 = call %"class.std::bad_array_new_length"* @"??0bad_array_new_length@std@@QEAA@XZ"(%"class.std::bad_array_new_length"* nonnull dereferenceable(24) %1) #3, !dbg !2727
  %3 = bitcast %"class.std::bad_array_new_length"* %1 to i8*, !dbg !2727
  call void @_CxxThrowException(i8* %3, %eh.ThrowInfo* @"_TI3?AVbad_array_new_length@std@@") #20, !dbg !2727
  unreachable, !dbg !2727
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local %"class.std::bad_array_new_length"* @"??0bad_array_new_length@std@@QEAA@XZ"(%"class.std::bad_array_new_length"* nonnull returned dereferenceable(24) %0) unnamed_addr #12 comdat align 2 !dbg !2728 {
  %2 = alloca %"class.std::bad_array_new_length"*, align 8
  store %"class.std::bad_array_new_length"* %0, %"class.std::bad_array_new_length"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::bad_array_new_length"** %2, metadata !2782, metadata !DIExpression()), !dbg !2784
  %3 = load %"class.std::bad_array_new_length"*, %"class.std::bad_array_new_length"** %2, align 8
  %4 = bitcast %"class.std::bad_array_new_length"* %3 to %"class.std::bad_alloc"*, !dbg !2785
  %5 = call %"class.std::bad_alloc"* @"??0bad_alloc@std@@AEAA@QEBD@Z"(%"class.std::bad_alloc"* nonnull dereferenceable(24) %4, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @"??_C@_0BF@KINCDENJ@bad?5array?5new?5length?$AA@", i64 0, i64 0)) #3, !dbg !2786
  %6 = bitcast %"class.std::bad_array_new_length"* %3 to i32 (...)***, !dbg !2785
  store i32 (...)** bitcast (i8** @"??_7bad_array_new_length@std@@6B@" to i32 (...)**), i32 (...)*** %6, align 8, !dbg !2785, !tbaa !2787
  ret %"class.std::bad_array_new_length"* %3, !dbg !2789
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local %"class.std::bad_array_new_length"* @"??0bad_array_new_length@std@@QEAA@AEBV01@@Z"(%"class.std::bad_array_new_length"* nonnull returned dereferenceable(24) %0, %"class.std::bad_array_new_length"* nonnull align 8 dereferenceable(24) %1) unnamed_addr #2 comdat align 2 !dbg !2790 {
  %3 = alloca %"class.std::bad_array_new_length"*, align 8
  %4 = alloca %"class.std::bad_array_new_length"*, align 8
  store %"class.std::bad_array_new_length"* %1, %"class.std::bad_array_new_length"** %3, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::bad_array_new_length"** %3, metadata !2797, metadata !DIExpression()), !dbg !2799
  store %"class.std::bad_array_new_length"* %0, %"class.std::bad_array_new_length"** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::bad_array_new_length"** %4, metadata !2798, metadata !DIExpression()), !dbg !2799
  %5 = load %"class.std::bad_array_new_length"*, %"class.std::bad_array_new_length"** %4, align 8
  %6 = bitcast %"class.std::bad_array_new_length"* %5 to %"class.std::bad_alloc"*, !dbg !2800
  %7 = load %"class.std::bad_array_new_length"*, %"class.std::bad_array_new_length"** %3, align 8, !dbg !2800, !tbaa !1715
  %8 = bitcast %"class.std::bad_array_new_length"* %7 to %"class.std::bad_alloc"*, !dbg !2800
  %9 = call %"class.std::bad_alloc"* @"??0bad_alloc@std@@QEAA@AEBV01@@Z"(%"class.std::bad_alloc"* nonnull dereferenceable(24) %6, %"class.std::bad_alloc"* nonnull align 8 dereferenceable(24) %8) #3, !dbg !2800
  %10 = bitcast %"class.std::bad_array_new_length"* %5 to i32 (...)***, !dbg !2800
  store i32 (...)** bitcast (i8** @"??_7bad_array_new_length@std@@6B@" to i32 (...)**), i32 (...)*** %10, align 8, !dbg !2800, !tbaa !2787
  ret %"class.std::bad_array_new_length"* %5, !dbg !2800
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local %"class.std::bad_alloc"* @"??0bad_alloc@std@@QEAA@AEBV01@@Z"(%"class.std::bad_alloc"* nonnull returned dereferenceable(24) %0, %"class.std::bad_alloc"* nonnull align 8 dereferenceable(24) %1) unnamed_addr #2 comdat align 2 !dbg !2801 {
  %3 = alloca %"class.std::bad_alloc"*, align 8
  %4 = alloca %"class.std::bad_alloc"*, align 8
  store %"class.std::bad_alloc"* %1, %"class.std::bad_alloc"** %3, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::bad_alloc"** %3, metadata !2808, metadata !DIExpression()), !dbg !2811
  store %"class.std::bad_alloc"* %0, %"class.std::bad_alloc"** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::bad_alloc"** %4, metadata !2809, metadata !DIExpression()), !dbg !2811
  %5 = load %"class.std::bad_alloc"*, %"class.std::bad_alloc"** %4, align 8
  %6 = bitcast %"class.std::bad_alloc"* %5 to %"class.std::exception"*, !dbg !2812
  %7 = load %"class.std::bad_alloc"*, %"class.std::bad_alloc"** %3, align 8, !dbg !2812, !tbaa !1715
  %8 = bitcast %"class.std::bad_alloc"* %7 to %"class.std::exception"*, !dbg !2812
  %9 = call %"class.std::exception"* @"??0exception@std@@QEAA@AEBV01@@Z"(%"class.std::exception"* nonnull dereferenceable(24) %6, %"class.std::exception"* nonnull align 8 dereferenceable(24) %8) #3, !dbg !2812
  %10 = bitcast %"class.std::bad_alloc"* %5 to i32 (...)***, !dbg !2812
  store i32 (...)** bitcast (i8** @"??_7bad_alloc@std@@6B@" to i32 (...)**), i32 (...)*** %10, align 8, !dbg !2812, !tbaa !2787
  ret %"class.std::bad_alloc"* %5, !dbg !2812
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local %"class.std::exception"* @"??0exception@std@@QEAA@AEBV01@@Z"(%"class.std::exception"* nonnull returned dereferenceable(24) %0, %"class.std::exception"* nonnull align 8 dereferenceable(24) %1) unnamed_addr #12 comdat align 2 personality i8* bitcast (i32 (...)* @__CxxFrameHandler3 to i8*) !dbg !2813 {
  %3 = alloca %"class.std::exception"*, align 8
  %4 = alloca %"class.std::exception"*, align 8
  store %"class.std::exception"* %1, %"class.std::exception"** %3, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::exception"** %3, metadata !2815, metadata !DIExpression()), !dbg !2818
  store %"class.std::exception"* %0, %"class.std::exception"** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::exception"** %4, metadata !2816, metadata !DIExpression()), !dbg !2819
  %5 = load %"class.std::exception"*, %"class.std::exception"** %4, align 8
  %6 = bitcast %"class.std::exception"* %5 to i32 (...)***, !dbg !2820
  store i32 (...)** bitcast (i8** @"??_7exception@std@@6B@" to i32 (...)**), i32 (...)*** %6, align 8, !dbg !2820, !tbaa !2787
  %7 = getelementptr inbounds %"class.std::exception", %"class.std::exception"* %5, i32 0, i32 1, !dbg !2821
  %8 = bitcast %struct.__std_exception_data* %7 to i8*, !dbg !2821
  call void @llvm.memset.p0i8.i64(i8* align 8 %8, i8 0, i64 16, i1 false), !dbg !2821
  %9 = getelementptr inbounds %"class.std::exception", %"class.std::exception"* %5, i32 0, i32 1, !dbg !2822
  %10 = load %"class.std::exception"*, %"class.std::exception"** %3, align 8, !dbg !2824, !tbaa !1715
  %11 = getelementptr inbounds %"class.std::exception", %"class.std::exception"* %10, i32 0, i32 1, !dbg !2825
  invoke void @__std_exception_copy(%struct.__std_exception_data* %11, %struct.__std_exception_data* %9)
          to label %12 unwind label %13, !dbg !2826

12:                                               ; preds = %2
  ret %"class.std::exception"* %5, !dbg !2827

13:                                               ; preds = %2
  %14 = cleanuppad within none [], !dbg !2826
  call void @__std_terminate() #19 [ "funclet"(token %14) ], !dbg !2826
  unreachable, !dbg !2826
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @"??1exception@std@@UEAA@XZ"(%"class.std::exception"* nonnull dereferenceable(24) %0) unnamed_addr #12 comdat align 2 personality i8* bitcast (i32 (...)* @__CxxFrameHandler3 to i8*) !dbg !2828 {
  %2 = alloca %"class.std::exception"*, align 8
  store %"class.std::exception"* %0, %"class.std::exception"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::exception"** %2, metadata !2830, metadata !DIExpression()), !dbg !2831
  %3 = load %"class.std::exception"*, %"class.std::exception"** %2, align 8
  %4 = bitcast %"class.std::exception"* %3 to i32 (...)***, !dbg !2832
  store i32 (...)** bitcast (i8** @"??_7exception@std@@6B@" to i32 (...)**), i32 (...)*** %4, align 8, !dbg !2832, !tbaa !2787
  %5 = getelementptr inbounds %"class.std::exception", %"class.std::exception"* %3, i32 0, i32 1, !dbg !2833
  invoke void @__std_exception_destroy(%struct.__std_exception_data* %5)
          to label %6 unwind label %7, !dbg !2835

6:                                                ; preds = %1
  ret void, !dbg !2836

7:                                                ; preds = %1
  %8 = cleanuppad within none [], !dbg !2835
  call void @__std_terminate() #19 [ "funclet"(token %8) ], !dbg !2835
  unreachable, !dbg !2835
}

declare dso_local void @_CxxThrowException(i8*, %eh.ThrowInfo*)

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local %"class.std::bad_alloc"* @"??0bad_alloc@std@@AEAA@QEBD@Z"(%"class.std::bad_alloc"* nonnull returned dereferenceable(24) %0, i8* %1) unnamed_addr #12 comdat align 2 !dbg !2837 {
  %3 = alloca i8*, align 8
  %4 = alloca %"class.std::bad_alloc"*, align 8
  store i8* %1, i8** %3, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %3, metadata !2839, metadata !DIExpression()), !dbg !2841
  store %"class.std::bad_alloc"* %0, %"class.std::bad_alloc"** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::bad_alloc"** %4, metadata !2840, metadata !DIExpression()), !dbg !2842
  %5 = load %"class.std::bad_alloc"*, %"class.std::bad_alloc"** %4, align 8
  %6 = bitcast %"class.std::bad_alloc"* %5 to %"class.std::exception"*, !dbg !2843
  %7 = load i8*, i8** %3, align 8, !dbg !2844, !tbaa !1715
  %8 = call %"class.std::exception"* @"??0exception@std@@QEAA@QEBDH@Z"(%"class.std::exception"* nonnull dereferenceable(24) %6, i8* %7, i32 1) #3, !dbg !2845
  %9 = bitcast %"class.std::bad_alloc"* %5 to i32 (...)***, !dbg !2843
  store i32 (...)** bitcast (i8** @"??_7bad_alloc@std@@6B@" to i32 (...)**), i32 (...)*** %9, align 8, !dbg !2843, !tbaa !2787
  ret %"class.std::bad_alloc"* %5, !dbg !2846
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local i8* @"??_Gbad_array_new_length@std@@UEAAPEAXI@Z"(%"class.std::bad_array_new_length"* nonnull dereferenceable(24) %0, i32 %1) unnamed_addr #2 comdat align 2 !dbg !2847 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %"class.std::bad_array_new_length"*, align 8
  store i32 %1, i32* %4, align 4, !tbaa !1750
  call void @llvm.dbg.declare(metadata i32* %4, metadata !2850, metadata !DIExpression()), !dbg !2852
  store %"class.std::bad_array_new_length"* %0, %"class.std::bad_array_new_length"** %5, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::bad_array_new_length"** %5, metadata !2851, metadata !DIExpression()), !dbg !2852
  %6 = load %"class.std::bad_array_new_length"*, %"class.std::bad_array_new_length"** %5, align 8
  %7 = bitcast %"class.std::bad_array_new_length"* %6 to i8*
  store i8* %7, i8** %3, align 8
  %8 = load i32, i32* %4, align 4
  call void bitcast (void (%"class.std::exception"*)* @"??1exception@std@@UEAA@XZ" to void (%"class.std::bad_array_new_length"*)*)(%"class.std::bad_array_new_length"* nonnull dereferenceable(24) %6) #3, !dbg !2853
  %9 = icmp eq i32 %8, 0, !dbg !2853
  br i1 %9, label %12, label %10, !dbg !2853

10:                                               ; preds = %2
  %11 = bitcast %"class.std::bad_array_new_length"* %6 to i8*, !dbg !2853
  call void @"??3@YAXPEAX@Z"(i8* %11) #22, !dbg !2853
  br label %12, !dbg !2853

12:                                               ; preds = %10, %2
  %13 = load i8*, i8** %3, align 8, !dbg !2853
  ret i8* %13, !dbg !2853
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i8* @"?what@exception@std@@UEBAPEBDXZ"(%"class.std::exception"* nonnull dereferenceable(24) %0) unnamed_addr #7 comdat align 2 !dbg !2854 {
  %2 = alloca %"class.std::exception"*, align 8
  store %"class.std::exception"* %0, %"class.std::exception"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::exception"** %2, metadata !2856, metadata !DIExpression()), !dbg !2858
  %3 = load %"class.std::exception"*, %"class.std::exception"** %2, align 8
  %4 = getelementptr inbounds %"class.std::exception", %"class.std::exception"* %3, i32 0, i32 1, !dbg !2859
  %5 = getelementptr inbounds %struct.__std_exception_data, %struct.__std_exception_data* %4, i32 0, i32 0, !dbg !2860
  %6 = load i8*, i8** %5, align 8, !dbg !2860, !tbaa !2861
  %7 = icmp ne i8* %6, null, !dbg !2859
  br i1 %7, label %8, label %12, !dbg !2859

8:                                                ; preds = %1
  %9 = getelementptr inbounds %"class.std::exception", %"class.std::exception"* %3, i32 0, i32 1, !dbg !2864
  %10 = getelementptr inbounds %struct.__std_exception_data, %struct.__std_exception_data* %9, i32 0, i32 0, !dbg !2865
  %11 = load i8*, i8** %10, align 8, !dbg !2865, !tbaa !2861
  br label %13, !dbg !2859

12:                                               ; preds = %1
  br label %13, !dbg !2859

13:                                               ; preds = %12, %8
  %14 = phi i8* [ %11, %8 ], [ getelementptr inbounds ([18 x i8], [18 x i8]* @"??_C@_0BC@EOODALEL@Unknown?5exception?$AA@", i64 0, i64 0), %12 ], !dbg !2859
  ret i8* %14, !dbg !2866
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local %"class.std::exception"* @"??0exception@std@@QEAA@QEBDH@Z"(%"class.std::exception"* nonnull returned dereferenceable(24) %0, i8* %1, i32 %2) unnamed_addr #12 comdat align 2 !dbg !2867 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca %"class.std::exception"*, align 8
  store i32 %2, i32* %4, align 4, !tbaa !1750
  call void @llvm.dbg.declare(metadata i32* %4, metadata !2869, metadata !DIExpression()), !dbg !2872
  store i8* %1, i8** %5, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %5, metadata !2870, metadata !DIExpression()), !dbg !2873
  store %"class.std::exception"* %0, %"class.std::exception"** %6, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::exception"** %6, metadata !2871, metadata !DIExpression()), !dbg !2874
  %7 = load %"class.std::exception"*, %"class.std::exception"** %6, align 8
  %8 = bitcast %"class.std::exception"* %7 to i32 (...)***, !dbg !2875
  store i32 (...)** bitcast (i8** @"??_7exception@std@@6B@" to i32 (...)**), i32 (...)*** %8, align 8, !dbg !2875, !tbaa !2787
  %9 = getelementptr inbounds %"class.std::exception", %"class.std::exception"* %7, i32 0, i32 1, !dbg !2876
  %10 = bitcast %struct.__std_exception_data* %9 to i8*, !dbg !2876
  call void @llvm.memset.p0i8.i64(i8* align 8 %10, i8 0, i64 16, i1 false), !dbg !2876
  %11 = load i8*, i8** %5, align 8, !dbg !2877, !tbaa !1715
  %12 = getelementptr inbounds %"class.std::exception", %"class.std::exception"* %7, i32 0, i32 1, !dbg !2879
  %13 = getelementptr inbounds %struct.__std_exception_data, %struct.__std_exception_data* %12, i32 0, i32 0, !dbg !2880
  store i8* %11, i8** %13, align 8, !dbg !2881, !tbaa !2861
  ret %"class.std::exception"* %7, !dbg !2882
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local i8* @"??_Gbad_alloc@std@@UEAAPEAXI@Z"(%"class.std::bad_alloc"* nonnull dereferenceable(24) %0, i32 %1) unnamed_addr #2 comdat align 2 !dbg !2883 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %"class.std::bad_alloc"*, align 8
  store i32 %1, i32* %4, align 4, !tbaa !1750
  call void @llvm.dbg.declare(metadata i32* %4, metadata !2886, metadata !DIExpression()), !dbg !2888
  store %"class.std::bad_alloc"* %0, %"class.std::bad_alloc"** %5, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::bad_alloc"** %5, metadata !2887, metadata !DIExpression()), !dbg !2888
  %6 = load %"class.std::bad_alloc"*, %"class.std::bad_alloc"** %5, align 8
  %7 = bitcast %"class.std::bad_alloc"* %6 to i8*
  store i8* %7, i8** %3, align 8
  %8 = load i32, i32* %4, align 4
  call void bitcast (void (%"class.std::exception"*)* @"??1exception@std@@UEAA@XZ" to void (%"class.std::bad_alloc"*)*)(%"class.std::bad_alloc"* nonnull dereferenceable(24) %6) #3, !dbg !2889
  %9 = icmp eq i32 %8, 0, !dbg !2889
  br i1 %9, label %12, label %10, !dbg !2889

10:                                               ; preds = %2
  %11 = bitcast %"class.std::bad_alloc"* %6 to i8*, !dbg !2889
  call void @"??3@YAXPEAX@Z"(i8* %11) #22, !dbg !2889
  br label %12, !dbg !2889

12:                                               ; preds = %10, %2
  %13 = load i8*, i8** %3, align 8, !dbg !2889
  ret i8* %13, !dbg !2889
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #15

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local i8* @"??_Gexception@std@@UEAAPEAXI@Z"(%"class.std::exception"* nonnull dereferenceable(24) %0, i32 %1) unnamed_addr #12 comdat align 2 !dbg !2890 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %"class.std::exception"*, align 8
  store i32 %1, i32* %4, align 4, !tbaa !1750
  call void @llvm.dbg.declare(metadata i32* %4, metadata !2892, metadata !DIExpression()), !dbg !2894
  store %"class.std::exception"* %0, %"class.std::exception"** %5, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::exception"** %5, metadata !2893, metadata !DIExpression()), !dbg !2894
  %6 = load %"class.std::exception"*, %"class.std::exception"** %5, align 8
  %7 = bitcast %"class.std::exception"* %6 to i8*
  store i8* %7, i8** %3, align 8
  %8 = load i32, i32* %4, align 4
  call void @"??1exception@std@@UEAA@XZ"(%"class.std::exception"* nonnull dereferenceable(24) %6) #3, !dbg !2895
  %9 = icmp eq i32 %8, 0, !dbg !2895
  br i1 %9, label %12, label %10, !dbg !2895

10:                                               ; preds = %2
  %11 = bitcast %"class.std::exception"* %6 to i8*, !dbg !2895
  call void @"??3@YAXPEAX@Z"(i8* %11) #22, !dbg !2895
  br label %12, !dbg !2895

12:                                               ; preds = %10, %2
  %13 = load i8*, i8** %3, align 8, !dbg !2896
  ret i8* %13, !dbg !2896
}

; Function Attrs: nobuiltin nounwind
declare dso_local void @"??3@YAXPEAX@Z"(i8*) #16

declare dso_local void @__std_exception_destroy(%struct.__std_exception_data*) #17

declare dso_local void @__std_exception_copy(%struct.__std_exception_data*, %struct.__std_exception_data*) #17

; Function Attrs: nobuiltin allocsize(0)
declare dso_local nonnull i8* @"??2@YAPEAX_K@Z"(i64) #18

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local i8* @"?copy@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z"(i8* %0, i8* %1, i64 %2) #8 comdat align 2 !dbg !2897 {
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  store i64 %2, i64* %4, align 8, !tbaa !1983
  call void @llvm.dbg.declare(metadata i64* %4, metadata !2899, metadata !DIExpression()), !dbg !2902
  store i8* %1, i8** %5, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %5, metadata !2900, metadata !DIExpression()), !dbg !2903
  store i8* %0, i8** %6, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %6, metadata !2901, metadata !DIExpression()), !dbg !2904
  %7 = load i8*, i8** %6, align 8, !dbg !2905, !tbaa !1715
  %8 = load i8*, i8** %5, align 8, !dbg !2906, !tbaa !1715
  %9 = load i64, i64* %4, align 8, !dbg !2907, !tbaa !1983
  %10 = mul i64 %9, 1, !dbg !2908
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 %8, i64 %10, i1 false), !dbg !2909
  %11 = load i8*, i8** %6, align 8, !dbg !2910, !tbaa !1715
  ret i8* %11, !dbg !2911
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i8* @"??$_Voidify_iter@PEAPEAD@std@@YAPEAXPEAPEAD@Z"(i8** %0) #7 comdat !dbg !2912 {
  %2 = alloca i8**, align 8
  store i8** %0, i8*** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8*** %2, metadata !2916, metadata !DIExpression()), !dbg !2919
  %3 = load i8**, i8*** %2, align 8, !dbg !2920, !tbaa !1715
  %4 = bitcast i8** %3 to i8*, !dbg !2920
  ret i8* %4, !dbg !2923
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i8** @"??$addressof@PEAD@std@@YAPEAPEADAEAPEAD@Z"(i8** nonnull align 8 dereferenceable(8) %0) #7 comdat !dbg !2924 {
  %2 = alloca i8**, align 8
  store i8** %0, i8*** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8*** %2, metadata !2928, metadata !DIExpression()), !dbg !2929
  %3 = load i8**, i8*** %2, align 8, !dbg !2930, !tbaa !1715
  ret i8** %3, !dbg !2931
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local nonnull align 8 dereferenceable(8) i8** @"??$forward@AEBQEAD@std@@YAAEBQEADAEBQEAD@Z"(i8** nonnull align 8 dereferenceable(8) %0) #7 comdat !dbg !2932 {
  %2 = alloca i8**, align 8
  store i8** %0, i8*** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8*** %2, metadata !2944, metadata !DIExpression()), !dbg !2945
  %3 = load i8**, i8*** %2, align 8, !dbg !2946, !tbaa !1715
  ret i8** %3, !dbg !2947
}

declare dso_local i64 @strlen(i8*) #17

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local void @"?select_on_container_copy_construction@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA?AV?$allocator@D@2@AEBV32@@Z"(%"class.std::allocator"* noalias sret(%"class.std::allocator") align 1 %0, %"class.std::allocator"* nonnull align 1 dereferenceable(1) %1) #8 comdat align 2 !dbg !2948 {
  %3 = alloca i8*, align 8
  %4 = alloca %"class.std::allocator"*, align 8
  %5 = bitcast %"class.std::allocator"* %0 to i8*
  store i8* %5, i8** %3, align 8
  store %"class.std::allocator"* %1, %"class.std::allocator"** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %4, metadata !2950, metadata !DIExpression()), !dbg !2951
  %6 = load %"class.std::allocator"*, %"class.std::allocator"** %4, align 8, !dbg !2952, !tbaa !1715
  ret void, !dbg !2953
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local %"class.std::_Compressed_pair"* @"??$?0V?$allocator@D@std@@$$V@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@U_One_then_variadic_args_t@1@$$QEAV?$allocator@D@1@@Z"(%"class.std::_Compressed_pair"* nonnull returned dereferenceable(32) %0, i8 %1, %"class.std::allocator"* nonnull align 1 dereferenceable(1) %2) unnamed_addr #12 comdat align 2 !dbg !2954 {
  %4 = alloca %"struct.std::_One_then_variadic_args_t", align 1
  %5 = alloca %"class.std::allocator"*, align 8
  %6 = alloca %"class.std::_Compressed_pair"*, align 8
  %7 = getelementptr inbounds %"struct.std::_One_then_variadic_args_t", %"struct.std::_One_then_variadic_args_t"* %4, i32 0, i32 0
  store i8 %1, i8* %7, align 1
  store %"class.std::allocator"* %2, %"class.std::allocator"** %5, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %5, metadata !2968, metadata !DIExpression()), !dbg !2971
  call void @llvm.dbg.declare(metadata %"struct.std::_One_then_variadic_args_t"* %4, metadata !2969, metadata !DIExpression()), !dbg !2972
  store %"class.std::_Compressed_pair"* %0, %"class.std::_Compressed_pair"** %6, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::_Compressed_pair"** %6, metadata !2970, metadata !DIExpression()), !dbg !2973
  %8 = load %"class.std::_Compressed_pair"*, %"class.std::_Compressed_pair"** %6, align 8
  %9 = bitcast %"class.std::_Compressed_pair"* %8 to %"class.std::allocator"*, !dbg !2974
  %10 = load %"class.std::allocator"*, %"class.std::allocator"** %5, align 8, !dbg !2975, !tbaa !1715
  %11 = call nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"??$forward@V?$allocator@D@std@@@std@@YA$$QEAV?$allocator@D@0@AEAV10@@Z"(%"class.std::allocator"* nonnull align 1 dereferenceable(1) %10) #3, !dbg !2976
  %12 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %8, i32 0, i32 0, !dbg !2977
  %13 = call %"class.std::_String_val"* @"??0?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %12) #3, !dbg !2977
  ret %"class.std::_Compressed_pair"* %8, !dbg !2978
}

; Function Attrs: inlinehint uwtable mustprogress
define linkonce_odr dso_local void @"?_Construct_lv_contents@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %0, %"class.std::basic_string"* nonnull align 8 dereferenceable(32) %1) #9 comdat align 2 !dbg !2979 {
  %3 = alloca %"class.std::basic_string"*, align 8
  %4 = alloca %"class.std::basic_string"*, align 8
  %5 = alloca %"class.std::_String_val"*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca %"class.std::_String_val"*, align 8
  %9 = alloca i8, align 1
  %10 = alloca i32, align 4
  %11 = alloca %"class.std::allocator"*, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i8*, align 8
  store %"class.std::basic_string"* %1, %"class.std::basic_string"** %3, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %3, metadata !2981, metadata !DIExpression()), !dbg !2992
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %4, metadata !2982, metadata !DIExpression()), !dbg !2993
  %16 = load %"class.std::basic_string"*, %"class.std::basic_string"** %4, align 8
  %17 = bitcast %"class.std::_String_val"** %5 to i8*, !dbg !2994
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %17) #3, !dbg !2994
  call void @llvm.dbg.declare(metadata %"class.std::_String_val"** %5, metadata !2983, metadata !DIExpression()), !dbg !2995
  %18 = load %"class.std::basic_string"*, %"class.std::basic_string"** %3, align 8, !dbg !2996, !tbaa !1715
  %19 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %18, i32 0, i32 0, !dbg !2997
  %20 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %19, i32 0, i32 0, !dbg !2998
  store %"class.std::_String_val"* %20, %"class.std::_String_val"** %5, align 8, !dbg !2995, !tbaa !1715
  %21 = bitcast i64* %6 to i8*, !dbg !2999
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %21) #3, !dbg !2999
  call void @llvm.dbg.declare(metadata i64* %6, metadata !2985, metadata !DIExpression()), !dbg !3000
  %22 = load %"class.std::_String_val"*, %"class.std::_String_val"** %5, align 8, !dbg !3001, !tbaa !1715
  %23 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %22, i32 0, i32 1, !dbg !3002
  %24 = load i64, i64* %23, align 8, !dbg !3002, !tbaa !2140
  store i64 %24, i64* %6, align 8, !dbg !3000, !tbaa !1983
  %25 = bitcast i8** %7 to i8*, !dbg !3003
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %25) #3, !dbg !3003
  call void @llvm.dbg.declare(metadata i8** %7, metadata !2986, metadata !DIExpression()), !dbg !3004
  %26 = load %"class.std::_String_val"*, %"class.std::_String_val"** %5, align 8, !dbg !3005, !tbaa !1715
  %27 = call i8* @"?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBAPEBDXZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %26) #3, !dbg !3006
  store i8* %27, i8** %7, align 8, !dbg !3004, !tbaa !1715
  %28 = bitcast %"class.std::_String_val"** %8 to i8*, !dbg !3007
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %28) #3, !dbg !3007
  call void @llvm.dbg.declare(metadata %"class.std::_String_val"** %8, metadata !2987, metadata !DIExpression()), !dbg !3008
  %29 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %16, i32 0, i32 0, !dbg !3009
  %30 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %29, i32 0, i32 0, !dbg !3010
  store %"class.std::_String_val"* %30, %"class.std::_String_val"** %8, align 8, !dbg !3008, !tbaa !1715
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %9) #3, !dbg !3011
  call void @llvm.dbg.declare(metadata i8* %9, metadata !2988, metadata !DIExpression()), !dbg !3012
  %31 = load i64, i64* %6, align 8, !dbg !3013, !tbaa !1983
  %32 = icmp ult i64 %31, 16, !dbg !3014
  %33 = zext i1 %32 to i8, !dbg !3012
  store i8 %33, i8* %9, align 1, !dbg !3012, !tbaa !2663
  %34 = load i8, i8* %9, align 1, !dbg !3015, !tbaa !2663, !range !3017
  %35 = trunc i8 %34 to i1, !dbg !3015
  br i1 %35, label %36, label %48, !dbg !3018

36:                                               ; preds = %2
  %37 = load i8*, i8** %7, align 8, !dbg !3019, !tbaa !1715
  %38 = load %"class.std::_String_val"*, %"class.std::_String_val"** %8, align 8, !dbg !3021, !tbaa !1715
  %39 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %38, i32 0, i32 0, !dbg !3022
  %40 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %39 to [16 x i8]*, !dbg !3023
  %41 = getelementptr inbounds [16 x i8], [16 x i8]* %40, i64 0, i64 0, !dbg !3021
  %42 = call i8* @"?copy@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z"(i8* %41, i8* %37, i64 16) #3, !dbg !3024
  %43 = load i64, i64* %6, align 8, !dbg !3025, !tbaa !1983
  %44 = load %"class.std::_String_val"*, %"class.std::_String_val"** %8, align 8, !dbg !3026, !tbaa !1715
  %45 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %44, i32 0, i32 1, !dbg !3027
  store i64 %43, i64* %45, align 8, !dbg !3028, !tbaa !2140
  %46 = load %"class.std::_String_val"*, %"class.std::_String_val"** %8, align 8, !dbg !3029, !tbaa !1715
  %47 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %46, i32 0, i32 2, !dbg !3030
  store i64 15, i64* %47, align 8, !dbg !3031, !tbaa !1954
  store i32 1, i32* %10, align 4
  br label %84, !dbg !3032

48:                                               ; preds = %2
  %49 = bitcast %"class.std::allocator"** %11 to i8*, !dbg !3033
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %49) #3, !dbg !3033
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %11, metadata !2989, metadata !DIExpression()), !dbg !3034
  %50 = call nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV?$allocator@D@2@XZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %16) #3, !dbg !3035
  store %"class.std::allocator"* %50, %"class.std::allocator"** %11, align 8, !dbg !3034, !tbaa !1715
  %51 = bitcast i64* %12 to i8*, !dbg !3036
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %51) #3, !dbg !3036
  call void @llvm.dbg.declare(metadata i64* %12, metadata !2990, metadata !DIExpression()), !dbg !3037
  %52 = bitcast i64* %13 to i8*, !dbg !3038
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %52) #3, !dbg !3038
  %53 = call i64 @"?max_size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %16) #3, !dbg !3038
  store i64 %53, i64* %13, align 8, !dbg !3038, !tbaa !1983
  %54 = bitcast i64* %14 to i8*, !dbg !3039
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %54) #3, !dbg !3039
  %55 = load i64, i64* %6, align 8, !dbg !3039, !tbaa !1983
  %56 = or i64 %55, 15, !dbg !3040
  store i64 %56, i64* %14, align 8, !dbg !3039, !tbaa !1983
  %57 = call nonnull align 8 dereferenceable(8) i64* @"??$min@_K@std@@YAAEB_KAEB_K0@Z"(i64* nonnull align 8 dereferenceable(8) %14, i64* nonnull align 8 dereferenceable(8) %13) #3, !dbg !3041
  %58 = load i64, i64* %57, align 8, !dbg !3041, !tbaa !1983
  %59 = bitcast i64* %14 to i8*, !dbg !3041
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %59) #3, !dbg !3041
  %60 = bitcast i64* %13 to i8*, !dbg !3041
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %60) #3, !dbg !3041
  store i64 %58, i64* %12, align 8, !dbg !3037, !tbaa !1983
  %61 = bitcast i8** %15 to i8*, !dbg !3042
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %61) #3, !dbg !3042
  call void @llvm.dbg.declare(metadata i8** %15, metadata !2991, metadata !DIExpression()), !dbg !3043
  %62 = load %"class.std::allocator"*, %"class.std::allocator"** %11, align 8, !dbg !3044, !tbaa !1715
  %63 = load i64, i64* %12, align 8, !dbg !3045, !tbaa !1983
  %64 = add i64 %63, 1, !dbg !3046
  %65 = call i8* @"?allocate@?$allocator@D@std@@QEAAPEAD_K@Z"(%"class.std::allocator"* nonnull dereferenceable(1) %62, i64 %64), !dbg !3047, !heapallocsite !35
  store i8* %65, i8** %15, align 8, !dbg !3043, !tbaa !1715
  %66 = load %"class.std::_String_val"*, %"class.std::_String_val"** %8, align 8, !dbg !3048, !tbaa !1715
  %67 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %66, i32 0, i32 0, !dbg !3049
  %68 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %67 to i8**, !dbg !3050
  call void @"??$_Construct_in_place@PEADAEBQEAD@std@@YAXAEAPEADAEBQEAD@Z"(i8** nonnull align 8 dereferenceable(8) %68, i8** nonnull align 8 dereferenceable(8) %15) #3, !dbg !3051
  %69 = load i64, i64* %6, align 8, !dbg !3052, !tbaa !1983
  %70 = add i64 %69, 1, !dbg !3053
  %71 = load i8*, i8** %7, align 8, !dbg !3054, !tbaa !1715
  %72 = load i8*, i8** %15, align 8, !dbg !3055, !tbaa !1715
  %73 = call i8* @"??$_Unfancy@D@std@@YAPEADPEAD@Z"(i8* %72) #3, !dbg !3056
  %74 = call i8* @"?copy@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z"(i8* %73, i8* %71, i64 %70) #3, !dbg !3057
  %75 = load i64, i64* %6, align 8, !dbg !3058, !tbaa !1983
  %76 = load %"class.std::_String_val"*, %"class.std::_String_val"** %8, align 8, !dbg !3059, !tbaa !1715
  %77 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %76, i32 0, i32 1, !dbg !3060
  store i64 %75, i64* %77, align 8, !dbg !3061, !tbaa !2140
  %78 = load i64, i64* %12, align 8, !dbg !3062, !tbaa !1983
  %79 = load %"class.std::_String_val"*, %"class.std::_String_val"** %8, align 8, !dbg !3063, !tbaa !1715
  %80 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %79, i32 0, i32 2, !dbg !3064
  store i64 %78, i64* %80, align 8, !dbg !3065, !tbaa !1954
  %81 = bitcast i8** %15 to i8*, !dbg !3066
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %81) #3, !dbg !3066
  %82 = bitcast i64* %12 to i8*, !dbg !3066
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %82) #3, !dbg !3066
  %83 = bitcast %"class.std::allocator"** %11 to i8*, !dbg !3066
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %83) #3, !dbg !3066
  store i32 0, i32* %10, align 4, !dbg !3066
  br label %84, !dbg !3066

84:                                               ; preds = %48, %36
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %9) #3, !dbg !3066
  %85 = bitcast %"class.std::_String_val"** %8 to i8*, !dbg !3066
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %85) #3, !dbg !3066
  %86 = bitcast i8** %7 to i8*, !dbg !3066
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %86) #3, !dbg !3066
  %87 = bitcast i64* %6 to i8*, !dbg !3066
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %87) #3, !dbg !3066
  %88 = bitcast %"class.std::_String_val"** %5 to i8*, !dbg !3066
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %88) #3, !dbg !3066
  %89 = load i32, i32* %10, align 4
  switch i32 %89, label %91 [
    i32 0, label %90
    i32 1, label %90
  ]

90:                                               ; preds = %84, %84
  ret void, !dbg !3066

91:                                               ; preds = %84
  unreachable
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"??$forward@V?$allocator@D@std@@@std@@YA$$QEAV?$allocator@D@0@AEAV10@@Z"(%"class.std::allocator"* nonnull align 1 dereferenceable(1) %0) #7 comdat !dbg !3067 {
  %2 = alloca %"class.std::allocator"*, align 8
  store %"class.std::allocator"* %0, %"class.std::allocator"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %2, metadata !3079, metadata !DIExpression()), !dbg !3080
  %3 = load %"class.std::allocator"*, %"class.std::allocator"** %2, align 8, !dbg !3081, !tbaa !1715
  ret %"class.std::allocator"* %3, !dbg !3082
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local i8* @"?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBAPEBDXZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %0) #8 comdat align 2 !dbg !3083 {
  %2 = alloca %"class.std::_String_val"*, align 8
  %3 = alloca i8*, align 8
  store %"class.std::_String_val"* %0, %"class.std::_String_val"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::_String_val"** %2, metadata !3085, metadata !DIExpression()), !dbg !3087
  %4 = load %"class.std::_String_val"*, %"class.std::_String_val"** %2, align 8
  %5 = bitcast i8** %3 to i8*, !dbg !3088
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #3, !dbg !3088
  call void @llvm.dbg.declare(metadata i8** %3, metadata !3086, metadata !DIExpression()), !dbg !3089
  %6 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %4, i32 0, i32 0, !dbg !3090
  %7 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %6 to [16 x i8]*, !dbg !3091
  %8 = getelementptr inbounds [16 x i8], [16 x i8]* %7, i64 0, i64 0, !dbg !3090
  store i8* %8, i8** %3, align 8, !dbg !3089, !tbaa !1715
  %9 = call zeroext i1 @"?_Large_string_engaged@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_NXZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %4) #3, !dbg !3092
  br i1 %9, label %10, label %15, !dbg !3094

10:                                               ; preds = %1
  %11 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %4, i32 0, i32 0, !dbg !3095
  %12 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %11 to i8**, !dbg !3097
  %13 = load i8*, i8** %12, align 8, !dbg !3097, !tbaa !1892
  %14 = call i8* @"??$_Unfancy@D@std@@YAPEADPEAD@Z"(i8* %13) #3, !dbg !3098
  store i8* %14, i8** %3, align 8, !dbg !3099, !tbaa !1715
  br label %15, !dbg !3100

15:                                               ; preds = %10, %1
  %16 = load i8*, i8** %3, align 8, !dbg !3101, !tbaa !1715
  %17 = bitcast i8** %3 to i8*, !dbg !3102
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %17) #3, !dbg !3102
  ret i8* %16, !dbg !3103
}

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_noobar.cpp() #0 !dbg !3104 {
  call void @"??__EglobalString@@YAXXZ"(), !dbg !3106
  ret void
}

attributes #0 = { uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { inlinehint nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { norecurse uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nofree nosync nounwind willreturn }
attributes #6 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #7 = { nounwind uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { inlinehint nounwind uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { inlinehint uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { noreturn "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { inlinehint noreturn uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #16 = { nobuiltin nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #17 = { "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #18 = { nobuiltin allocsize(0) "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #19 = { noreturn nounwind }
attributes #20 = { noreturn }
attributes #21 = { allocsize(0) }
attributes #22 = { builtin nounwind }

!llvm.dbg.cu = !{!2}
!llvm.linker.options = !{!1657, !1658, !1659, !1660, !1661}
!llvm.module.flags = !{!1662, !1663, !1664, !1665}
!llvm.ident = !{!1666}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "globalInt", linkageName: "?globalInt@@3HA", scope: !2, file: !3, line: 3, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !3, producer: "clang version 12.0.0", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !26, globals: !821, imports: !866, nameTableKind: None)
!3 = !DIFile(filename: "noobar.cpp", directory: "E:\\Documents\\Work Stuff\\Active Work Files\\Code Examples\\test_cpp01", checksumkind: CSK_MD5, checksum: "41e835fda4592d4c727d962d191609d9")
!4 = !{!5, !12, !19}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "elements", file: !3, line: 14, baseType: !6, size: 32, elements: !7, identifier: ".?AW4elements@@")
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{!8, !9, !10, !11}
!8 = !DIEnumerator(name: "plastic", value: 0)
!9 = !DIEnumerator(name: "meat", value: 1)
!10 = !DIEnumerator(name: "metal", value: 2)
!11 = !DIEnumerator(name: "smoke", value: 3)
!12 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "float_denorm_style", scope: !14, file: !13, line: 27, baseType: !6, size: 32, elements: !15, identifier: ".?AW4float_denorm_style@std@@")
!13 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\limits", directory: "", checksumkind: CSK_MD5, checksum: "e77969fbddca4fa5c641ba7a15e2a47b")
!14 = !DINamespace(name: "std", scope: null)
!15 = !{!16, !17, !18}
!16 = !DIEnumerator(name: "denorm_indeterminate", value: -1)
!17 = !DIEnumerator(name: "denorm_absent", value: 0)
!18 = !DIEnumerator(name: "denorm_present", value: 1)
!19 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "float_round_style", scope: !14, file: !13, line: 34, baseType: !6, size: 32, elements: !20, identifier: ".?AW4float_round_style@std@@")
!20 = !{!21, !22, !23, !24, !25}
!21 = !DIEnumerator(name: "round_indeterminate", value: -1)
!22 = !DIEnumerator(name: "round_toward_zero", value: 0)
!23 = !DIEnumerator(name: "round_to_nearest", value: 1)
!24 = !DIEnumerator(name: "round_toward_infinity", value: 2)
!25 = !DIEnumerator(name: "round_toward_neg_infinity", value: 3)
!26 = !{!27, !28, !31, !32, !34, !36, !39, !41, !189}
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !29, line: 61, baseType: !30)
!29 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\vadefs.h", directory: "", checksumkind: CSK_MD5, checksum: "a4b8f96637d0704c82f39ecb6bde2ab4")
!30 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !33, line: 46, baseType: !30)
!33 = !DIFile(filename: "C:\\Program Files\\LLVM\\lib\\clang\\12.0.0\\include\\stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!37 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !38)
!38 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: null)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !35)
!41 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "basic_string<char,std::char_traits<char>,std::allocator<char> >", scope: !14, file: !42, line: 2378, size: 256, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !43, templateParams: !819, identifier: ".?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@")
!42 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\xstring", directory: "", checksumkind: CSK_MD5, checksum: "ced2d8e240a38a43f200b64e568f1d06")
!43 = !{!44, !175, !188, !284, !396, !397, !398, !399, !400, !401, !402, !404, !407, !409, !411, !414, !416, !418, !419, !420, !421, !422, !423, !442, !448, !451, !454, !457, !461, !464, !467, !470, !473, !476, !479, !482, !495, !498, !502, !505, !509, !513, !517, !521, !525, !528, !529, !530, !533, !534, !539, !542, !543, !544, !545, !550, !553, !554, !555, !558, !561, !564, !567, !570, !571, !572, !575, !576, !579, !582, !583, !586, !587, !588, !589, !590, !591, !594, !597, !600, !603, !606, !609, !612, !615, !618, !621, !624, !627, !628, !631, !634, !637, !640, !643, !646, !649, !652, !655, !658, !662, !663, !664, !667, !670, !671, !672, !675, !678, !679, !680, !681, !682, !683, !684, !685, !688, !691, !692, !693, !696, !697, !700, !703, !704, !705, !706, !707, !710, !711, !712, !713, !714, !717, !720, !723, !726, !730, !731, !732, !735, !738, !741, !744, !745, !746, !747, !748, !749, !750, !751, !752, !755, !756, !757, !758, !759, !760, !763, !764, !765, !766, !767, !768, !771, !774, !777, !780, !783, !786, !789, !792, !795, !798, !801, !804, !805, !806, !807, !808, !809, !810, !814}
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Alty", scope: !41, file: !42, line: 2383, baseType: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Rebind_alloc_t<std::allocator<char>,char>", scope: !14, file: !46, line: 756, baseType: !47)
!46 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\xmemory", directory: "", checksumkind: CSK_MD5, checksum: "975865db9edf6f230ee4f2aabe3a8b80")
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "rebind_alloc<char>", scope: !48, file: !46, line: 660, baseType: !51)
!48 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Default_allocator_traits<std::allocator<char> >", scope: !14, file: !46, line: 642, size: 8, flags: DIFlagTypePassByValue, elements: !49, templateParams: !173, identifier: ".?AU?$_Default_allocator_traits@V?$allocator@D@std@@@std@@")
!49 = !{!50, !125, !126, !128, !131, !132, !133, !134, !135, !151, !152, !153, !154, !159, !163, !167, !170}
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !48, file: !46, line: 643, baseType: !51)
!51 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "allocator<char>", scope: !14, file: !46, line: 786, size: 8, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !52, templateParams: !123, identifier: ".?AV?$allocator@D@std@@")
!52 = !{!53, !54, !55, !56, !57, !59, !61, !62, !65, !85, !86, !91, !94, !98, !102, !103, !107, !112, !115, !120}
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "_From_primary", scope: !51, file: !46, line: 791, baseType: !51)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !51, file: !46, line: 793, baseType: !35)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !51, file: !46, line: 796, baseType: !34)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !51, file: !46, line: 797, baseType: !39)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !51, file: !46, line: 799, baseType: !58)
!58 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !35, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !51, file: !46, line: 800, baseType: !60)
!60 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !40, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !51, file: !46, line: 803, baseType: !32)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !51, file: !46, line: 804, baseType: !63)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", file: !33, line: 35, baseType: !64)
!64 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "propagate_on_container_move_assignment", scope: !51, file: !46, line: 806, baseType: !66)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "true_type", scope: !14, file: !67, line: 41, baseType: !68)
!67 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\xtr1common", directory: "", checksumkind: CSK_MD5, checksum: "30144ce5d9b954ba3b99adea12ced09e")
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "bool_constant<true>", scope: !14, file: !67, line: 39, baseType: !69)
!69 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "integral_constant<bool,1>", scope: !14, file: !67, line: 22, size: 8, flags: DIFlagTypePassByValue, elements: !70, templateParams: !82, identifier: ".?AU?$integral_constant@_N$00@std@@")
!70 = !{!71, !74, !75, !76, !81}
!71 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !69, file: !67, line: 23, baseType: !72, flags: DIFlagStaticMember)
!72 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !73)
!73 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !69, file: !67, line: 25, baseType: !73)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !69, file: !67, line: 26, baseType: !69)
!76 = !DISubprogram(name: "operator bool", linkageName: "??B?$integral_constant@_N$00@std@@QEBA_NXZ", scope: !69, file: !67, line: 28, type: !77, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!77 = !DISubroutineType(types: !78)
!78 = !{!74, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!80 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !69)
!81 = !DISubprogram(name: "operator()", linkageName: "??R?$integral_constant@_N$00@std@@QEBA_NXZ", scope: !69, file: !67, line: 32, type: !77, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!82 = !{!83, !84}
!83 = !DITemplateTypeParameter(name: "_Ty", type: !73)
!84 = !DITemplateValueParameter(name: "_Val", type: !73, value: i8 1)
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "is_always_equal", scope: !51, file: !46, line: 809, baseType: !66)
!86 = !DISubprogram(name: "address", linkageName: "?address@?$allocator@D@std@@QEBAPEADAEAD@Z", scope: !51, file: !46, line: 816, type: !87, scopeLine: 816, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!87 = !DISubroutineType(types: !88)
!88 = !{!34, !89, !58}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!90 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !51)
!91 = !DISubprogram(name: "address", linkageName: "?address@?$allocator@D@std@@QEBAPEBDAEBD@Z", scope: !51, file: !46, line: 820, type: !92, scopeLine: 820, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!92 = !DISubroutineType(types: !93)
!93 = !{!39, !89, !60}
!94 = !DISubprogram(name: "allocator", scope: !51, file: !46, line: 825, type: !95, scopeLine: 825, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!95 = !DISubroutineType(types: !96)
!96 = !{null, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!98 = !DISubprogram(name: "allocator", scope: !51, file: !46, line: 827, type: !99, scopeLine: 827, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!99 = !DISubroutineType(types: !100)
!100 = !{null, !97, !101}
!101 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !90, size: 64)
!102 = !DISubprogram(name: "~allocator", scope: !51, file: !46, line: 830, type: !95, scopeLine: 830, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!103 = !DISubprogram(name: "operator=", linkageName: "??4?$allocator@D@std@@QEAAAEAV01@AEBV01@@Z", scope: !51, file: !46, line: 831, type: !104, scopeLine: 831, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!104 = !DISubroutineType(types: !105)
!105 = !{!106, !97, !101}
!106 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !51, size: 64)
!107 = !DISubprogram(name: "deallocate", linkageName: "?deallocate@?$allocator@D@std@@QEAAXQEAD_K@Z", scope: !51, file: !46, line: 833, type: !108, scopeLine: 833, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!108 = !DISubroutineType(types: !109)
!109 = !{null, !97, !110, !111}
!110 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !34)
!111 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !32)
!112 = !DISubprogram(name: "allocate", linkageName: "?allocate@?$allocator@D@std@@QEAAPEAD_K@Z", scope: !51, file: !46, line: 838, type: !113, scopeLine: 838, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!113 = !DISubroutineType(types: !114)
!114 = !{!34, !97, !111}
!115 = !DISubprogram(name: "allocate", linkageName: "?allocate@?$allocator@D@std@@QEAAPEAD_KPEBX@Z", scope: !51, file: !46, line: 843, type: !116, scopeLine: 843, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!116 = !DISubroutineType(types: !117)
!117 = !{!34, !97, !111, !118}
!118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !119, size: 64)
!119 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!120 = !DISubprogram(name: "max_size", linkageName: "?max_size@?$allocator@D@std@@QEBA_KXZ", scope: !51, file: !46, line: 858, type: !121, scopeLine: 858, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!121 = !DISubroutineType(types: !122)
!122 = !{!32, !89}
!123 = !{!124}
!124 = !DITemplateTypeParameter(name: "_Ty", type: !35)
!125 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !48, file: !46, line: 644, baseType: !54)
!126 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !48, file: !46, line: 646, baseType: !127)
!127 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !125, size: 64)
!128 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !48, file: !46, line: 647, baseType: !129)
!129 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !130, size: 64)
!130 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !125)
!131 = !DIDerivedType(tag: DW_TAG_typedef, name: "void_pointer", scope: !48, file: !46, line: 648, baseType: !31)
!132 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_void_pointer", scope: !48, file: !46, line: 649, baseType: !118)
!133 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !48, file: !46, line: 651, baseType: !32)
!134 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !48, file: !46, line: 652, baseType: !63)
!135 = !DIDerivedType(tag: DW_TAG_typedef, name: "propagate_on_container_copy_assignment", scope: !48, file: !46, line: 654, baseType: !136)
!136 = !DIDerivedType(tag: DW_TAG_typedef, name: "false_type", scope: !14, file: !67, line: 42, baseType: !137)
!137 = !DIDerivedType(tag: DW_TAG_typedef, name: "bool_constant<false>", scope: !14, file: !67, line: 39, baseType: !138)
!138 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "integral_constant<bool,0>", scope: !14, file: !67, line: 22, size: 8, flags: DIFlagTypePassByValue, elements: !139, templateParams: !149, identifier: ".?AU?$integral_constant@_N$0A@@std@@")
!139 = !{!140, !141, !142, !143, !148}
!140 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !138, file: !67, line: 23, baseType: !72, flags: DIFlagStaticMember)
!141 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !138, file: !67, line: 25, baseType: !73)
!142 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !138, file: !67, line: 26, baseType: !138)
!143 = !DISubprogram(name: "operator bool", linkageName: "??B?$integral_constant@_N$0A@@std@@QEBA_NXZ", scope: !138, file: !67, line: 28, type: !144, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!144 = !DISubroutineType(types: !145)
!145 = !{!141, !146}
!146 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !147, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!147 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !138)
!148 = !DISubprogram(name: "operator()", linkageName: "??R?$integral_constant@_N$0A@@std@@QEBA_NXZ", scope: !138, file: !67, line: 32, type: !144, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!149 = !{!83, !150}
!150 = !DITemplateValueParameter(name: "_Val", type: !73, value: i8 0)
!151 = !DIDerivedType(tag: DW_TAG_typedef, name: "propagate_on_container_move_assignment", scope: !48, file: !46, line: 655, baseType: !66)
!152 = !DIDerivedType(tag: DW_TAG_typedef, name: "propagate_on_container_swap", scope: !48, file: !46, line: 656, baseType: !136)
!153 = !DIDerivedType(tag: DW_TAG_typedef, name: "is_always_equal", scope: !48, file: !46, line: 657, baseType: !66)
!154 = !DISubprogram(name: "allocate", linkageName: "?allocate@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SAPEADAEAV?$allocator@D@2@_K@Z", scope: !48, file: !46, line: 666, type: !155, scopeLine: 666, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!155 = !DISubroutineType(types: !156)
!156 = !{!126, !106, !157}
!157 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !158)
!158 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", file: !46, line: 651, baseType: !32)
!159 = !DISubprogram(name: "allocate", linkageName: "?allocate@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SAPEADAEAV?$allocator@D@2@_KPEBX@Z", scope: !48, file: !46, line: 680, type: !160, scopeLine: 680, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!160 = !DISubroutineType(types: !161)
!161 = !{!126, !106, !157, !162}
!162 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_void_pointer", file: !46, line: 649, baseType: !118)
!163 = !DISubprogram(name: "deallocate", linkageName: "?deallocate@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SAXAEAV?$allocator@D@2@QEAD_K@Z", scope: !48, file: !46, line: 693, type: !164, scopeLine: 693, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!164 = !DISubroutineType(types: !165)
!165 = !{null, !106, !166, !157}
!166 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !126)
!167 = !DISubprogram(name: "max_size", linkageName: "?max_size@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA_KAEBV?$allocator@D@2@@Z", scope: !48, file: !46, line: 727, type: !168, scopeLine: 727, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!168 = !DISubroutineType(types: !169)
!169 = !{!133, !101}
!170 = !DISubprogram(name: "select_on_container_copy_construction", linkageName: "?select_on_container_copy_construction@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA?AV?$allocator@D@2@AEBV32@@Z", scope: !48, file: !46, line: 731, type: !171, scopeLine: 731, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!171 = !DISubroutineType(types: !172)
!172 = !{!51, !101}
!173 = !{!174}
!174 = !DITemplateTypeParameter(name: "_Alloc", type: !51)
!175 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Alty_traits", scope: !41, file: !42, line: 2384, baseType: !176)
!176 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "allocator_traits<std::allocator<char> >", scope: !14, file: !46, line: 737, size: 8, flags: DIFlagTypePassByValue, elements: !177, templateParams: !173, identifier: ".?AU?$allocator_traits@V?$allocator@D@std@@@std@@")
!177 = !{!178}
!178 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !176, baseType: !179, extraData: i32 0)
!179 = !DIDerivedType(tag: DW_TAG_typedef, name: "conditional_t<_Is_default_allocator<allocator<char> >::value,_Default_allocator_traits<std::allocator<char> >,_Normal_allocator_traits<std::allocator<char> > >", scope: !14, file: !67, line: 68, baseType: !180)
!180 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !181, file: !67, line: 59, baseType: !48)
!181 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "conditional<1,std::_Default_allocator_traits<std::allocator<char> >,std::_Normal_allocator_traits<std::allocator<char> > >", scope: !14, file: !67, line: 58, size: 8, flags: DIFlagTypePassByValue, elements: !182, templateParams: !183, identifier: ".?AU?$conditional@$00U?$_Default_allocator_traits@V?$allocator@D@std@@@std@@U?$_Normal_allocator_traits@V?$allocator@D@std@@@2@@std@@")
!182 = !{!180}
!183 = !{!184, !185, !186}
!184 = !DITemplateValueParameter(name: "_Test", type: !73, value: i8 1)
!185 = !DITemplateTypeParameter(name: "_Ty1", type: !48)
!186 = !DITemplateTypeParameter(name: "_Ty2", type: !187)
!187 = !DICompositeType(tag: DW_TAG_structure_type, name: "_Normal_allocator_traits<std::allocator<char> >", scope: !14, file: !46, line: 555, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AU?$_Normal_allocator_traits@V?$allocator@D@std@@@std@@")
!188 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Scary_val", scope: !41, file: !42, line: 2386, baseType: !189)
!189 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "_String_val<std::_Simple_types<char> >", scope: !14, file: !42, line: 2274, size: 256, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !190, templateParams: !282, identifier: ".?AV?$_String_val@U?$_Simple_types@D@std@@@std@@")
!190 = !{!191, !213, !226, !227, !228, !229, !230, !232, !235, !237, !238, !252, !253, !254, !255, !259, !263, !269, !272, !275, !276, !279}
!191 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !189, baseType: !192, flags: DIFlagPublic, extraData: i32 0)
!192 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Container_base", scope: !14, file: !46, line: 1272, baseType: !193)
!193 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Container_base0", scope: !14, file: !46, line: 1036, size: 8, flags: DIFlagTypePassByValue, elements: !194, identifier: ".?AU_Container_base0@std@@")
!194 = !{!195, !199, !203, !210}
!195 = !DISubprogram(name: "_Orphan_all", linkageName: "?_Orphan_all@_Container_base0@std@@QEAAXXZ", scope: !193, file: !46, line: 1037, type: !196, scopeLine: 1037, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!196 = !DISubroutineType(types: !197)
!197 = !{null, !198}
!198 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !193, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!199 = !DISubprogram(name: "_Swap_proxy_and_iterators", linkageName: "?_Swap_proxy_and_iterators@_Container_base0@std@@QEAAXAEAU12@@Z", scope: !193, file: !46, line: 1038, type: !200, scopeLine: 1038, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!200 = !DISubroutineType(types: !201)
!201 = !{null, !198, !202}
!202 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !193, size: 64)
!203 = !DISubprogram(name: "_Alloc_proxy", linkageName: "?_Alloc_proxy@_Container_base0@std@@QEAAXAEBU_Fake_allocator@2@@Z", scope: !193, file: !46, line: 1039, type: !204, scopeLine: 1039, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!204 = !DISubroutineType(types: !205)
!205 = !{null, !198, !206}
!206 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !207, size: 64)
!207 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !208)
!208 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Fake_allocator", scope: !14, file: !46, line: 1034, size: 8, flags: DIFlagTypePassByValue, elements: !209, identifier: ".?AU_Fake_allocator@std@@")
!209 = !{}
!210 = !DISubprogram(name: "_Reload_proxy", linkageName: "?_Reload_proxy@_Container_base0@std@@QEAAXAEBU_Fake_allocator@2@0@Z", scope: !193, file: !46, line: 1040, type: !211, scopeLine: 1040, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!211 = !DISubroutineType(types: !212)
!212 = !{null, !198, !206, !206}
!213 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !189, file: !42, line: 2276, baseType: !214)
!214 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !215, file: !46, line: 777, baseType: !35)
!215 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Simple_types<char>", scope: !14, file: !46, line: 775, size: 8, flags: DIFlagTypePassByValue, elements: !216, templateParams: !224, identifier: ".?AU?$_Simple_types@D@std@@")
!216 = !{!214, !217, !218, !219, !221}
!217 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !215, file: !46, line: 778, baseType: !32)
!218 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !215, file: !46, line: 779, baseType: !63)
!219 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !215, file: !46, line: 780, baseType: !220)
!220 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !214, size: 64)
!221 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !215, file: !46, line: 781, baseType: !222)
!222 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !223, size: 64)
!223 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !214)
!224 = !{!225}
!225 = !DITemplateTypeParameter(name: "_Value_type", type: !35)
!226 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !189, file: !42, line: 2277, baseType: !217)
!227 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !189, file: !42, line: 2278, baseType: !218)
!228 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !189, file: !42, line: 2279, baseType: !219)
!229 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !189, file: !42, line: 2280, baseType: !221)
!230 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !189, file: !42, line: 2281, baseType: !231)
!231 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !213, size: 64)
!232 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !189, file: !42, line: 2282, baseType: !233)
!233 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !234, size: 64)
!234 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !213)
!235 = !DIDerivedType(tag: DW_TAG_member, name: "_BUF_SIZE", scope: !189, file: !42, line: 2287, baseType: !236, flags: DIFlagPublic | DIFlagStaticMember, extraData: i64 16)
!236 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !226)
!237 = !DIDerivedType(tag: DW_TAG_member, name: "_ALLOC_MASK", scope: !189, file: !42, line: 2289, baseType: !236, flags: DIFlagPublic | DIFlagStaticMember, extraData: i64 15)
!238 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "_Bxty", scope: !189, file: !42, line: 2345, size: 128, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !239, identifier: ".?AT_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@")
!239 = !{!240, !244, !245, !247, !251}
!240 = !DIDerivedType(tag: DW_TAG_member, name: "_Buf", scope: !238, file: !42, line: 2350, baseType: !241, size: 128)
!241 = !DICompositeType(tag: DW_TAG_array_type, baseType: !213, size: 128, elements: !242)
!242 = !{!243}
!243 = !DISubrange(count: 16)
!244 = !DIDerivedType(tag: DW_TAG_member, name: "_Ptr", scope: !238, file: !42, line: 2351, baseType: !228, size: 64)
!245 = !DIDerivedType(tag: DW_TAG_member, name: "_Alias", scope: !238, file: !42, line: 2352, baseType: !246, size: 128)
!246 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 128, elements: !242)
!247 = !DISubprogram(name: "_Bxty", scope: !238, file: !42, line: 2346, type: !248, scopeLine: 2346, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!248 = !DISubroutineType(types: !249)
!249 = !{null, !250}
!250 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !238, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!251 = !DISubprogram(name: "~_Bxty", scope: !238, file: !42, line: 2348, type: !248, scopeLine: 2348, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!252 = !DIDerivedType(tag: DW_TAG_member, name: "_Bx", scope: !189, file: !42, line: 2353, baseType: !238, size: 128, flags: DIFlagPublic)
!253 = !DIDerivedType(tag: DW_TAG_member, name: "_Mysize", scope: !189, file: !42, line: 2355, baseType: !226, size: 64, offset: 128, flags: DIFlagPublic)
!254 = !DIDerivedType(tag: DW_TAG_member, name: "_Myres", scope: !189, file: !42, line: 2356, baseType: !226, size: 64, offset: 192, flags: DIFlagPublic)
!255 = !DISubprogram(name: "_String_val", scope: !189, file: !42, line: 2284, type: !256, scopeLine: 2284, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!256 = !DISubroutineType(types: !257)
!257 = !{null, !258}
!258 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !189, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!259 = !DISubprogram(name: "_Myptr", linkageName: "?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAAPEADXZ", scope: !189, file: !42, line: 2295, type: !260, scopeLine: 2295, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!260 = !DISubroutineType(types: !261)
!261 = !{!262, !258}
!262 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !213, size: 64)
!263 = !DISubprogram(name: "_Myptr", linkageName: "?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBAPEBDXZ", scope: !189, file: !42, line: 2304, type: !264, scopeLine: 2304, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!264 = !DISubroutineType(types: !265)
!265 = !{!266, !267}
!266 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !234, size: 64)
!267 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !268, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!268 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !189)
!269 = !DISubprogram(name: "_Large_string_engaged", linkageName: "?_Large_string_engaged@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_NXZ", scope: !189, file: !42, line: 2313, type: !270, scopeLine: 2313, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!270 = !DISubroutineType(types: !271)
!271 = !{!73, !267}
!272 = !DISubprogram(name: "_Check_offset", linkageName: "?_Check_offset@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBAX_K@Z", scope: !189, file: !42, line: 2322, type: !273, scopeLine: 2322, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!273 = !DISubroutineType(types: !274)
!274 = !{null, !267, !236}
!275 = !DISubprogram(name: "_Check_offset_exclusive", linkageName: "?_Check_offset_exclusive@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBAX_K@Z", scope: !189, file: !42, line: 2329, type: !273, scopeLine: 2329, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!276 = !DISubprogram(name: "_Xran", linkageName: "?_Xran@?$_String_val@U?$_Simple_types@D@std@@@std@@SAXXZ", scope: !189, file: !42, line: 2336, type: !277, scopeLine: 2336, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!277 = !DISubroutineType(types: !278)
!278 = !{null}
!279 = !DISubprogram(name: "_Clamp_suffix_size", linkageName: "?_Clamp_suffix_size@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_K_K0@Z", scope: !189, file: !42, line: 2340, type: !280, scopeLine: 2340, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!280 = !DISubroutineType(types: !281)
!281 = !{!226, !267, !236, !236}
!282 = !{!283}
!283 = !DITemplateTypeParameter(name: "_Val_types", type: !215)
!284 = !DIDerivedType(tag: DW_TAG_typedef, name: "traits_type", scope: !41, file: !42, line: 2402, baseType: !285)
!285 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "char_traits<char>", scope: !14, file: !42, line: 487, size: 8, flags: DIFlagTypePassByValue, elements: !286, templateParams: !395, identifier: ".?AU?$char_traits@D@std@@")
!286 = !{!287}
!287 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !285, baseType: !288, extraData: i32 0)
!288 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Narrow_char_traits<char,int>", scope: !14, file: !42, line: 367, size: 8, flags: DIFlagTypePassByValue, elements: !289, templateParams: !355, identifier: ".?AU?$_Narrow_char_traits@DH@std@@")
!289 = !{!290, !358, !359, !360, !361, !362, !363, !365, !368, !371, !374, !375, !376, !377, !378, !383, !386, !389, !392}
!290 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !288, baseType: !291, flags: DIFlagPrivate, extraData: i32 0)
!291 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Char_traits<char,int>", scope: !14, file: !42, line: 36, size: 8, flags: DIFlagTypePassByValue, elements: !292, templateParams: !355, identifier: ".?AU?$_Char_traits@DH@std@@")
!292 = !{!293, !294, !295, !299, !301, !311, !315, !318, !319, !322, !325, !328, !331, !334, !337, !338, !343, !346, !349, !352}
!293 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !291, file: !42, line: 37, baseType: !35)
!294 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_type", scope: !291, file: !42, line: 38, baseType: !6)
!295 = !DIDerivedType(tag: DW_TAG_typedef, name: "pos_type", scope: !291, file: !42, line: 39, baseType: !296)
!296 = !DIDerivedType(tag: DW_TAG_typedef, name: "streampos", scope: !14, file: !297, line: 139, baseType: !298)
!297 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\iosfwd", directory: "", checksumkind: CSK_MD5, checksum: "7f4c15d03d7c70c537a2ffea8d07c995")
!298 = !DICompositeType(tag: DW_TAG_class_type, name: "fpos<_Mbstatet>", scope: !14, file: !297, line: 53, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AV?$fpos@U_Mbstatet@@@std@@")
!299 = !DIDerivedType(tag: DW_TAG_typedef, name: "off_type", scope: !291, file: !42, line: 40, baseType: !300)
!300 = !DIDerivedType(tag: DW_TAG_typedef, name: "streamoff", scope: !14, file: !297, line: 48, baseType: !64)
!301 = !DIDerivedType(tag: DW_TAG_typedef, name: "state_type", scope: !291, file: !42, line: 41, baseType: !302)
!302 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Mbstatet", file: !303, line: 615, baseType: !304)
!303 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt.h", directory: "", checksumkind: CSK_MD5, checksum: "db0cd8b4d76ec84d3625032eaca2a3ca")
!304 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Mbstatet", file: !303, line: 611, size: 64, flags: DIFlagTypePassByValue, elements: !305, identifier: ".?AU_Mbstatet@@")
!305 = !{!306, !308, !310}
!306 = !DIDerivedType(tag: DW_TAG_member, name: "_Wchar", scope: !304, file: !303, line: 613, baseType: !307, size: 32)
!307 = !DIBasicType(name: "long unsigned int", size: 32, encoding: DW_ATE_unsigned)
!308 = !DIDerivedType(tag: DW_TAG_member, name: "_Byte", scope: !304, file: !303, line: 614, baseType: !309, size: 16, offset: 32)
!309 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!310 = !DIDerivedType(tag: DW_TAG_member, name: "_State", scope: !304, file: !303, line: 614, baseType: !309, size: 16, offset: 48)
!311 = !DISubprogram(name: "copy", linkageName: "?copy@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z", scope: !291, file: !42, line: 48, type: !312, scopeLine: 48, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!312 = !DISubroutineType(types: !313)
!313 = !{!34, !110, !314, !111}
!314 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !39)
!315 = !DISubprogram(name: "_Copy_s", linkageName: "?_Copy_s@?$_Char_traits@DH@std@@SAPEADQEAD_KQEBD1@Z", scope: !291, file: !42, line: 71, type: !316, scopeLine: 71, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!316 = !DISubroutineType(types: !317)
!317 = !{!34, !110, !111, !314, !111}
!318 = !DISubprogram(name: "move", linkageName: "?move@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z", scope: !291, file: !42, line: 79, type: !312, scopeLine: 79, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!319 = !DISubprogram(name: "compare", linkageName: "?compare@?$_Char_traits@DH@std@@SAHPEBD0_K@Z", scope: !291, file: !42, line: 131, type: !320, scopeLine: 131, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!320 = !DISubroutineType(types: !321)
!321 = !{!6, !39, !39, !32}
!322 = !DISubprogram(name: "length", linkageName: "?length@?$_Char_traits@DH@std@@SA_KPEBD@Z", scope: !291, file: !42, line: 143, type: !323, scopeLine: 143, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!323 = !DISubroutineType(types: !324)
!324 = !{!32, !39}
!325 = !DISubprogram(name: "find", linkageName: "?find@?$_Char_traits@DH@std@@SAPEBDPEBD_KAEBD@Z", scope: !291, file: !42, line: 154, type: !326, scopeLine: 154, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!326 = !DISubroutineType(types: !327)
!327 = !{!39, !39, !32, !60}
!328 = !DISubprogram(name: "assign", linkageName: "?assign@?$_Char_traits@DH@std@@SAPEADQEAD_KD@Z", scope: !291, file: !42, line: 166, type: !329, scopeLine: 166, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!329 = !DISubroutineType(types: !330)
!330 = !{!34, !110, !32, !40}
!331 = !DISubprogram(name: "assign", linkageName: "?assign@?$_Char_traits@DH@std@@SAXAEADAEBD@Z", scope: !291, file: !42, line: 185, type: !332, scopeLine: 185, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!332 = !DISubroutineType(types: !333)
!333 = !{null, !58, !60}
!334 = !DISubprogram(name: "eq", linkageName: "?eq@?$_Char_traits@DH@std@@SA_NAEBD0@Z", scope: !291, file: !42, line: 196, type: !335, scopeLine: 196, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!335 = !DISubroutineType(types: !336)
!336 = !{!73, !60, !60}
!337 = !DISubprogram(name: "lt", linkageName: "?lt@?$_Char_traits@DH@std@@SA_NAEBD0@Z", scope: !291, file: !42, line: 200, type: !335, scopeLine: 200, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!338 = !DISubprogram(name: "to_char_type", linkageName: "?to_char_type@?$_Char_traits@DH@std@@SADAEBH@Z", scope: !291, file: !42, line: 204, type: !339, scopeLine: 204, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!339 = !DISubroutineType(types: !340)
!340 = !{!35, !341}
!341 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !342, size: 64)
!342 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !294)
!343 = !DISubprogram(name: "to_int_type", linkageName: "?to_int_type@?$_Char_traits@DH@std@@SAHAEBD@Z", scope: !291, file: !42, line: 208, type: !344, scopeLine: 208, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!344 = !DISubroutineType(types: !345)
!345 = !{!294, !60}
!346 = !DISubprogram(name: "eq_int_type", linkageName: "?eq_int_type@?$_Char_traits@DH@std@@SA_NAEBH0@Z", scope: !291, file: !42, line: 212, type: !347, scopeLine: 212, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!347 = !DISubroutineType(types: !348)
!348 = !{!73, !341, !341}
!349 = !DISubprogram(name: "not_eof", linkageName: "?not_eof@?$_Char_traits@DH@std@@SAHAEBH@Z", scope: !291, file: !42, line: 216, type: !350, scopeLine: 216, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!350 = !DISubroutineType(types: !351)
!351 = !{!294, !341}
!352 = !DISubprogram(name: "eof", linkageName: "?eof@?$_Char_traits@DH@std@@SAHXZ", scope: !291, file: !42, line: 220, type: !353, scopeLine: 220, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!353 = !DISubroutineType(types: !354)
!354 = !{!294}
!355 = !{!356, !357}
!356 = !DITemplateTypeParameter(name: "_Elem", type: !35)
!357 = !DITemplateTypeParameter(name: "_Int_type", type: !6)
!358 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Primary_char_traits", scope: !288, file: !42, line: 370, baseType: !291)
!359 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !288, file: !42, line: 373, baseType: !35)
!360 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_type", scope: !288, file: !42, line: 374, baseType: !6)
!361 = !DIDerivedType(tag: DW_TAG_typedef, name: "pos_type", scope: !288, file: !42, line: 375, baseType: !296)
!362 = !DIDerivedType(tag: DW_TAG_typedef, name: "off_type", scope: !288, file: !42, line: 376, baseType: !300)
!363 = !DIDerivedType(tag: DW_TAG_typedef, name: "state_type", scope: !288, file: !42, line: 377, baseType: !364)
!364 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !303, line: 617, baseType: !302)
!365 = !DISubprogram(name: "compare", linkageName: "?compare@?$_Narrow_char_traits@DH@std@@SAHQEBD0_K@Z", scope: !288, file: !42, line: 386, type: !366, scopeLine: 386, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!366 = !DISubroutineType(types: !367)
!367 = !{!6, !314, !314, !111}
!368 = !DISubprogram(name: "length", linkageName: "?length@?$_Narrow_char_traits@DH@std@@SA_KQEBD@Z", scope: !288, file: !42, line: 396, type: !369, scopeLine: 396, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!369 = !DISubroutineType(types: !370)
!370 = !{!32, !314}
!371 = !DISubprogram(name: "find", linkageName: "?find@?$_Narrow_char_traits@DH@std@@SAPEBDQEBD_KAEBD@Z", scope: !288, file: !42, line: 416, type: !372, scopeLine: 416, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!372 = !DISubroutineType(types: !373)
!373 = !{!39, !314, !111, !60}
!374 = !DISubprogram(name: "assign", linkageName: "?assign@?$_Narrow_char_traits@DH@std@@SAPEADQEAD_KD@Z", scope: !288, file: !42, line: 437, type: !329, scopeLine: 437, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!375 = !DISubprogram(name: "assign", linkageName: "?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z", scope: !288, file: !42, line: 449, type: !332, scopeLine: 449, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!376 = !DISubprogram(name: "eq", linkageName: "?eq@?$_Narrow_char_traits@DH@std@@SA_NAEBD0@Z", scope: !288, file: !42, line: 453, type: !335, scopeLine: 453, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!377 = !DISubprogram(name: "lt", linkageName: "?lt@?$_Narrow_char_traits@DH@std@@SA_NAEBD0@Z", scope: !288, file: !42, line: 457, type: !335, scopeLine: 457, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!378 = !DISubprogram(name: "to_char_type", linkageName: "?to_char_type@?$_Narrow_char_traits@DH@std@@SADAEBH@Z", scope: !288, file: !42, line: 461, type: !379, scopeLine: 461, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!379 = !DISubroutineType(types: !380)
!380 = !{!35, !381}
!381 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !382, size: 64)
!382 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !360)
!383 = !DISubprogram(name: "to_int_type", linkageName: "?to_int_type@?$_Narrow_char_traits@DH@std@@SAHAEBD@Z", scope: !288, file: !42, line: 465, type: !384, scopeLine: 465, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!384 = !DISubroutineType(types: !385)
!385 = !{!360, !60}
!386 = !DISubprogram(name: "eq_int_type", linkageName: "?eq_int_type@?$_Narrow_char_traits@DH@std@@SA_NAEBH0@Z", scope: !288, file: !42, line: 469, type: !387, scopeLine: 469, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!387 = !DISubroutineType(types: !388)
!388 = !{!73, !381, !381}
!389 = !DISubprogram(name: "not_eof", linkageName: "?not_eof@?$_Narrow_char_traits@DH@std@@SAHAEBH@Z", scope: !288, file: !42, line: 473, type: !390, scopeLine: 473, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!390 = !DISubroutineType(types: !391)
!391 = !{!360, !381}
!392 = !DISubprogram(name: "eof", linkageName: "?eof@?$_Narrow_char_traits@DH@std@@SAHXZ", scope: !288, file: !42, line: 477, type: !393, scopeLine: 477, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!393 = !DISubroutineType(types: !394)
!394 = !{!360}
!395 = !{!356}
!396 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !41, file: !42, line: 2403, baseType: !51)
!397 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !41, file: !42, line: 2405, baseType: !35)
!398 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !41, file: !42, line: 2406, baseType: !133)
!399 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !41, file: !42, line: 2407, baseType: !134)
!400 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !41, file: !42, line: 2408, baseType: !126)
!401 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !41, file: !42, line: 2409, baseType: !128)
!402 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !41, file: !42, line: 2410, baseType: !403)
!403 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !397, size: 64)
!404 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !41, file: !42, line: 2411, baseType: !405)
!405 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !406, size: 64)
!406 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !397)
!407 = !DIDerivedType(tag: DW_TAG_typedef, name: "iterator", scope: !41, file: !42, line: 2413, baseType: !408)
!408 = !DICompositeType(tag: DW_TAG_class_type, name: "_String_iterator<std::_String_val<std::_Simple_types<char> > >", scope: !14, file: !42, line: 2141, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@")
!409 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_iterator", scope: !41, file: !42, line: 2414, baseType: !410)
!410 = !DICompositeType(tag: DW_TAG_class_type, name: "_String_const_iterator<std::_String_val<std::_Simple_types<char> > >", scope: !14, file: !42, line: 1899, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AV?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@")
!411 = !DIDerivedType(tag: DW_TAG_typedef, name: "reverse_iterator", scope: !41, file: !42, line: 2416, baseType: !412)
!412 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<std::_String_iterator<std::_String_val<std::_Simple_types<char> > > >", scope: !14, file: !413, line: 1636, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AV?$reverse_iterator@V?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@std@@")
!413 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\xutility", directory: "", checksumkind: CSK_MD5, checksum: "a7a009a6fa0cf7dd260ba0ba2140332c")
!414 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reverse_iterator", scope: !41, file: !42, line: 2417, baseType: !415)
!415 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<std::_String_const_iterator<std::_String_val<std::_Simple_types<char> > > >", scope: !14, file: !413, line: 1636, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AV?$reverse_iterator@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@std@@")
!416 = !DIDerivedType(tag: DW_TAG_member, name: "_BUF_SIZE", scope: !41, file: !42, line: 2420, baseType: !417, flags: DIFlagStaticMember, extraData: i64 16)
!417 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !30)
!418 = !DIDerivedType(tag: DW_TAG_member, name: "_ALLOC_MASK", scope: !41, file: !42, line: 2421, baseType: !417, flags: DIFlagStaticMember, extraData: i64 15)
!419 = !DIDerivedType(tag: DW_TAG_member, name: "_Can_memcpy_val", scope: !41, file: !42, line: 2433, baseType: !72, flags: DIFlagStaticMember)
!420 = !DIDerivedType(tag: DW_TAG_member, name: "_Memcpy_val_offset", scope: !41, file: !42, line: 2435, baseType: !111, flags: DIFlagStaticMember)
!421 = !DIDerivedType(tag: DW_TAG_member, name: "_Memcpy_val_size", scope: !41, file: !42, line: 2436, baseType: !111, flags: DIFlagStaticMember)
!422 = !DIDerivedType(tag: DW_TAG_member, name: "npos", scope: !41, file: !42, line: 3012, baseType: !417, flags: DIFlagPublic | DIFlagStaticMember, extraData: i64 -1)
!423 = !DIDerivedType(tag: DW_TAG_member, name: "_Mypair", scope: !41, file: !42, line: 4658, baseType: !424, size: 256)
!424 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "_Compressed_pair<std::allocator<char>,std::_String_val<std::_Simple_types<char> >,1>", scope: !14, file: !46, line: 1361, size: 256, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !425, templateParams: !438, identifier: ".?AV?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@")
!425 = !{!426, !427, !428, !429, !433}
!426 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !424, baseType: !51, extraData: i32 0)
!427 = !DIDerivedType(tag: DW_TAG_member, name: "_Myval2", scope: !424, file: !46, line: 1363, baseType: !189, size: 256, flags: DIFlagPublic)
!428 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Mybase", scope: !424, file: !46, line: 1365, baseType: !51)
!429 = !DISubprogram(name: "_Get_first", linkageName: "?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAAAEAV?$allocator@D@2@XZ", scope: !424, file: !46, line: 1377, type: !430, scopeLine: 1377, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!430 = !DISubroutineType(types: !431)
!431 = !{!106, !432}
!432 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !424, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!433 = !DISubprogram(name: "_Get_first", linkageName: "?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEBAAEBV?$allocator@D@2@XZ", scope: !424, file: !46, line: 1381, type: !434, scopeLine: 1381, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!434 = !DISubroutineType(types: !435)
!435 = !{!101, !436}
!436 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !437, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!437 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !424)
!438 = !{!439, !440, !441}
!439 = !DITemplateTypeParameter(name: "_Ty1", type: !51)
!440 = !DITemplateTypeParameter(name: "_Ty2", type: !189)
!441 = !DITemplateValueParameter(type: !73, value: i8 1)
!442 = !DISubprogram(name: "basic_string", scope: !41, file: !42, line: 2450, type: !443, scopeLine: 2450, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!443 = !DISubroutineType(types: !444)
!444 = !{null, !445, !446}
!445 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!446 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !447, size: 64)
!447 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !41)
!448 = !DISubprogram(name: "basic_string", scope: !41, file: !42, line: 2458, type: !449, scopeLine: 2458, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!449 = !DISubroutineType(types: !450)
!450 = !{null, !445, !446, !101}
!451 = !DISubprogram(name: "basic_string", scope: !41, file: !42, line: 2466, type: !452, scopeLine: 2466, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!452 = !DISubroutineType(types: !453)
!453 = !{null, !445}
!454 = !DISubprogram(name: "basic_string", scope: !41, file: !42, line: 2472, type: !455, scopeLine: 2472, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!455 = !DISubroutineType(types: !456)
!456 = !{null, !445, !101}
!457 = !DISubprogram(name: "basic_string", scope: !41, file: !42, line: 2478, type: !458, scopeLine: 2478, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!458 = !DISubroutineType(types: !459)
!459 = !{null, !445, !446, !460, !101}
!460 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !398)
!461 = !DISubprogram(name: "basic_string", scope: !41, file: !42, line: 2487, type: !462, scopeLine: 2487, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!462 = !DISubroutineType(types: !463)
!463 = !{null, !445, !446, !460, !460, !101}
!464 = !DISubprogram(name: "basic_string", scope: !41, file: !42, line: 2497, type: !465, scopeLine: 2497, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!465 = !DISubroutineType(types: !466)
!466 = !{null, !445, !314, !460}
!467 = !DISubprogram(name: "basic_string", scope: !41, file: !42, line: 2507, type: !468, scopeLine: 2507, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!468 = !DISubroutineType(types: !469)
!469 = !{null, !445, !314, !460, !101}
!470 = !DISubprogram(name: "basic_string", scope: !41, file: !42, line: 2517, type: !471, scopeLine: 2517, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!471 = !DISubroutineType(types: !472)
!472 = !{null, !445, !314}
!473 = !DISubprogram(name: "basic_string", scope: !41, file: !42, line: 2528, type: !474, scopeLine: 2528, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!474 = !DISubroutineType(types: !475)
!475 = !{null, !445, !314, !101}
!476 = !DISubprogram(name: "basic_string", scope: !41, file: !42, line: 2537, type: !477, scopeLine: 2537, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!477 = !DISubroutineType(types: !478)
!478 = !{null, !445, !460, !40}
!479 = !DISubprogram(name: "basic_string", scope: !41, file: !42, line: 2550, type: !480, scopeLine: 2550, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!480 = !DISubroutineType(types: !481)
!481 = !{null, !445, !460, !40, !101}
!482 = !DISubprogram(name: "_Construct", linkageName: "?_Construct@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXQEAD0Urandom_access_iterator_tag@2@@Z", scope: !41, file: !42, line: 2589, type: !483, scopeLine: 2589, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!483 = !DISubroutineType(types: !484)
!484 = !{null, !445, !110, !110, !485}
!485 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "random_access_iterator_tag", scope: !14, file: !413, line: 291, size: 8, flags: DIFlagTypePassByValue, elements: !486, identifier: ".?AUrandom_access_iterator_tag@std@@")
!486 = !{!487}
!487 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !485, baseType: !488, extraData: i32 0)
!488 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bidirectional_iterator_tag", scope: !14, file: !413, line: 289, size: 8, flags: DIFlagTypePassByValue, elements: !489, identifier: ".?AUbidirectional_iterator_tag@std@@")
!489 = !{!490}
!490 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !488, baseType: !491, extraData: i32 0)
!491 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "forward_iterator_tag", scope: !14, file: !413, line: 287, size: 8, flags: DIFlagTypePassByValue, elements: !492, identifier: ".?AUforward_iterator_tag@std@@")
!492 = !{!493}
!493 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !491, baseType: !494, extraData: i32 0)
!494 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "input_iterator_tag", scope: !14, file: !413, line: 283, size: 8, flags: DIFlagTypePassByValue, elements: !209, identifier: ".?AUinput_iterator_tag@std@@")
!495 = !DISubprogram(name: "_Construct", linkageName: "?_Construct@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXQEBD0Urandom_access_iterator_tag@2@@Z", scope: !41, file: !42, line: 2596, type: !496, scopeLine: 2596, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!496 = !DISubroutineType(types: !497)
!497 = !{null, !445, !314, !314, !485}
!498 = !DISubprogram(name: "basic_string", scope: !41, file: !42, line: 2604, type: !499, scopeLine: 2604, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!499 = !DISubroutineType(types: !500)
!500 = !{null, !445, !501}
!501 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !41, size: 64)
!502 = !DISubprogram(name: "basic_string", scope: !41, file: !42, line: 2610, type: !503, scopeLine: 2610, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!503 = !DISubroutineType(types: !504)
!504 = !{null, !445, !501, !101}
!505 = !DISubprogram(name: "basic_string", scope: !41, file: !42, line: 2627, type: !506, scopeLine: 2627, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!506 = !DISubroutineType(types: !507)
!507 = !{null, !445, !508, !446, !314, !460, !314, !460}
!508 = !DICompositeType(tag: DW_TAG_structure_type, name: "_String_constructor_concat_tag", scope: !14, file: !42, line: 2363, size: 8, flags: DIFlagFwdDecl, identifier: ".?AU_String_constructor_concat_tag@std@@")
!509 = !DISubprogram(name: "basic_string", scope: !41, file: !42, line: 2671, type: !510, scopeLine: 2671, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!510 = !DISubroutineType(types: !511)
!511 = !{null, !445, !508, !512, !512}
!512 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !41, size: 64)
!513 = !DISubprogram(name: "_Move_assign", linkageName: "?_Move_assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEAV12@U_Equal_allocators@2@@Z", scope: !41, file: !42, line: 2775, type: !514, scopeLine: 2775, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!514 = !DISubroutineType(types: !515)
!515 = !{null, !445, !512, !516}
!516 = !DICompositeType(tag: DW_TAG_structure_type, name: "_Equal_allocators", scope: !14, file: !46, line: 746, size: 8, flags: DIFlagFwdDecl, identifier: ".?AU_Equal_allocators@std@@")
!517 = !DISubprogram(name: "_Move_assign", linkageName: "?_Move_assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEAV12@U?$integral_constant@_N$00@2@@Z", scope: !41, file: !42, line: 2781, type: !518, scopeLine: 2781, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!518 = !DISubroutineType(types: !519)
!519 = !{null, !445, !512, !520}
!520 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Propagate_allocators", scope: !14, file: !46, line: 747, baseType: !66)
!521 = !DISubprogram(name: "_Move_assign", linkageName: "?_Move_assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEAV12@U?$integral_constant@_N$0A@@2@@Z", scope: !41, file: !42, line: 2794, type: !522, scopeLine: 2794, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!522 = !DISubroutineType(types: !523)
!523 = !{null, !445, !512, !524}
!524 = !DIDerivedType(tag: DW_TAG_typedef, name: "_No_propagate_allocators", scope: !14, file: !46, line: 748, baseType: !136)
!525 = !DISubprogram(name: "operator=", linkageName: "??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@$$QEAV01@@Z", scope: !41, file: !42, line: 2848, type: !526, scopeLine: 2848, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!526 = !DISubroutineType(types: !527)
!527 = !{!512, !445, !501}
!528 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@$$QEAV12@@Z", scope: !41, file: !42, line: 2857, type: !526, scopeLine: 2857, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!529 = !DISubprogram(name: "_Memcpy_val_from", linkageName: "?_Memcpy_val_from@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@@Z", scope: !41, file: !42, line: 2863, type: !443, scopeLine: 2863, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!530 = !DISubprogram(name: "_Take_contents", linkageName: "?_Take_contents@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEAV12@@Z", scope: !41, file: !42, line: 2872, type: !531, scopeLine: 2872, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!531 = !DISubroutineType(types: !532)
!532 = !{null, !445, !512}
!533 = !DISubprogram(name: "_Construct_lv_contents", linkageName: "?_Construct_lv_contents@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@@Z", scope: !41, file: !42, line: 2915, type: !443, scopeLine: 2915, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!534 = !DISubprogram(name: "basic_string", scope: !41, file: !42, line: 2956, type: !535, scopeLine: 2956, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!535 = !DISubroutineType(types: !536)
!536 = !{null, !445, !537, !101}
!537 = !DICompositeType(tag: DW_TAG_class_type, name: "initializer_list<char>", scope: !14, file: !538, line: 23, size: 128, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AV?$initializer_list@D@std@@")
!538 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\initializer_list", directory: "", checksumkind: CSK_MD5, checksum: "614c28410587cda93b19bfa2da486ff6")
!539 = !DISubprogram(name: "operator=", linkageName: "??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@V?$initializer_list@D@1@@Z", scope: !41, file: !42, line: 2965, type: !540, scopeLine: 2965, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!540 = !DISubroutineType(types: !541)
!541 = !{!512, !445, !537}
!542 = !DISubprogram(name: "operator+=", linkageName: "??Y?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@V?$initializer_list@D@1@@Z", scope: !41, file: !42, line: 2969, type: !540, scopeLine: 2969, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!543 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$initializer_list@D@2@@Z", scope: !41, file: !42, line: 2973, type: !540, scopeLine: 2973, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!544 = !DISubprogram(name: "append", linkageName: "?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$initializer_list@D@2@@Z", scope: !41, file: !42, line: 2977, type: !540, scopeLine: 2977, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!545 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$initializer_list@D@2@@Z", scope: !41, file: !42, line: 2981, type: !546, scopeLine: 2981, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!546 = !DISubroutineType(types: !547)
!547 = !{!407, !445, !548, !549}
!548 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !409)
!549 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !537)
!550 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0V?$initializer_list@D@2@@Z", scope: !41, file: !42, line: 2990, type: !551, scopeLine: 2990, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!551 = !DISubroutineType(types: !552)
!552 = !{!512, !445, !548, !548, !549}
!553 = !DISubprogram(name: "~basic_string", scope: !41, file: !42, line: 3002, type: !452, scopeLine: 3002, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!554 = !DISubprogram(name: "_Copy_assign_val_from_small", linkageName: "?_Copy_assign_val_from_small@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@@Z", scope: !41, file: !42, line: 3015, type: !443, scopeLine: 3015, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!555 = !DISubprogram(name: "_Copy_assign", linkageName: "?_Copy_assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@U?$integral_constant@_N$0A@@2@@Z", scope: !41, file: !42, line: 3033, type: !556, scopeLine: 3033, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!556 = !DISubroutineType(types: !557)
!557 = !{null, !445, !446, !136}
!558 = !DISubprogram(name: "_Copy_assign", linkageName: "?_Copy_assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@U?$integral_constant@_N$00@2@@Z", scope: !41, file: !42, line: 3038, type: !559, scopeLine: 3038, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!559 = !DISubroutineType(types: !560)
!560 = !{null, !445, !446, !66}
!561 = !DISubprogram(name: "operator=", linkageName: "??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@AEBV01@@Z", scope: !41, file: !42, line: 3076, type: !562, scopeLine: 3076, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!562 = !DISubroutineType(types: !563)
!563 = !{!512, !445, !446}
!564 = !DISubprogram(name: "operator=", linkageName: "??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@QEBD@Z", scope: !41, file: !42, line: 3091, type: !565, scopeLine: 3091, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!565 = !DISubroutineType(types: !566)
!566 = !{!512, !445, !314}
!567 = !DISubprogram(name: "operator=", linkageName: "??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@D@Z", scope: !41, file: !42, line: 3095, type: !568, scopeLine: 3095, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!568 = !DISubroutineType(types: !569)
!569 = !{!512, !445, !40}
!570 = !DISubprogram(name: "operator+=", linkageName: "??Y?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@AEBV01@@Z", scope: !41, file: !42, line: 3103, type: !562, scopeLine: 3103, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!571 = !DISubprogram(name: "operator+=", linkageName: "??Y?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@QEBD@Z", scope: !41, file: !42, line: 3114, type: !565, scopeLine: 3114, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!572 = !DISubprogram(name: "operator+=", linkageName: "??Y?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@D@Z", scope: !41, file: !42, line: 3118, type: !573, scopeLine: 3118, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!573 = !DISubroutineType(types: !574)
!574 = !{!512, !445, !35}
!575 = !DISubprogram(name: "append", linkageName: "?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@AEBV12@@Z", scope: !41, file: !42, line: 3123, type: !562, scopeLine: 3123, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!576 = !DISubprogram(name: "append", linkageName: "?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@AEBV12@_K_K@Z", scope: !41, file: !42, line: 3127, type: !577, scopeLine: 3127, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!577 = !DISubroutineType(types: !578)
!578 = !{!512, !445, !446, !460, !398}
!579 = !DISubprogram(name: "append", linkageName: "?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD_K@Z", scope: !41, file: !42, line: 3151, type: !580, scopeLine: 3151, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!580 = !DISubroutineType(types: !581)
!581 = !{!512, !445, !314, !460}
!582 = !DISubprogram(name: "append", linkageName: "?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD@Z", scope: !41, file: !42, line: 3174, type: !565, scopeLine: 3174, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!583 = !DISubprogram(name: "append", linkageName: "?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KD@Z", scope: !41, file: !42, line: 3178, type: !584, scopeLine: 3178, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!584 = !DISubroutineType(types: !585)
!585 = !{!512, !445, !460, !40}
!586 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@AEBV12@@Z", scope: !41, file: !42, line: 3214, type: !562, scopeLine: 3214, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!587 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@AEBV12@_K_K@Z", scope: !41, file: !42, line: 3219, type: !577, scopeLine: 3219, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!588 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD_K@Z", scope: !41, file: !42, line: 3243, type: !580, scopeLine: 3243, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!589 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD@Z", scope: !41, file: !42, line: 3263, type: !565, scopeLine: 3263, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!590 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KD@Z", scope: !41, file: !42, line: 3267, type: !584, scopeLine: 3267, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!591 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KAEBV12@@Z", scope: !41, file: !42, line: 3305, type: !592, scopeLine: 3305, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!592 = !DISubroutineType(types: !593)
!593 = !{!512, !445, !460, !446}
!594 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KAEBV12@0_K@Z", scope: !41, file: !42, line: 3310, type: !595, scopeLine: 3310, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!595 = !DISubroutineType(types: !596)
!596 = !{!512, !445, !460, !446, !460, !398}
!597 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KQEBD0@Z", scope: !41, file: !42, line: 3335, type: !598, scopeLine: 3335, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!598 = !DISubroutineType(types: !599)
!599 = !{!512, !445, !460, !314, !460}
!600 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KQEBD@Z", scope: !41, file: !42, line: 3383, type: !601, scopeLine: 3383, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!601 = !DISubroutineType(types: !602)
!602 = !{!512, !445, !460, !314}
!603 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K0D@Z", scope: !41, file: !42, line: 3388, type: !604, scopeLine: 3388, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!604 = !DISubroutineType(types: !605)
!605 = !{!512, !445, !460, !460, !40}
!606 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@D@Z", scope: !41, file: !42, line: 3413, type: !607, scopeLine: 3413, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!607 = !DISubroutineType(types: !608)
!608 = !{!407, !445, !548, !40}
!609 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@_KD@Z", scope: !41, file: !42, line: 3422, type: !610, scopeLine: 3422, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!610 = !DISubroutineType(types: !611)
!611 = !{!407, !445, !548, !460, !40}
!612 = !DISubprogram(name: "erase", linkageName: "?erase@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K@Z", scope: !41, file: !42, line: 3453, type: !613, scopeLine: 3453, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!613 = !DISubroutineType(types: !614)
!614 = !{!512, !445, !460}
!615 = !DISubprogram(name: "_Erase_noexcept", linkageName: "?_Erase_noexcept@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV12@_K_K@Z", scope: !41, file: !42, line: 3460, type: !616, scopeLine: 3460, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!616 = !DISubroutineType(types: !617)
!617 = !{!512, !445, !460, !398}
!618 = !DISubprogram(name: "erase", linkageName: "?erase@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K0@Z", scope: !41, file: !42, line: 3472, type: !619, scopeLine: 3472, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!619 = !DISubroutineType(types: !620)
!620 = !{!512, !445, !460, !460}
!621 = !DISubprogram(name: "erase", linkageName: "?erase@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@@Z", scope: !41, file: !42, line: 3478, type: !622, scopeLine: 3478, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!622 = !DISubroutineType(types: !623)
!623 = !{!407, !445, !548}
!624 = !DISubprogram(name: "erase", linkageName: "?erase@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0@Z", scope: !41, file: !42, line: 3487, type: !625, scopeLine: 3487, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!625 = !DISubroutineType(types: !626)
!626 = !{!407, !445, !548, !548}
!627 = !DISubprogram(name: "clear", linkageName: "?clear@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXXZ", scope: !41, file: !42, line: 3498, type: !452, scopeLine: 3498, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!628 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K0AEBV12@@Z", scope: !41, file: !42, line: 3502, type: !629, scopeLine: 3502, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!629 = !DISubroutineType(types: !630)
!630 = !{!512, !445, !460, !460, !446}
!631 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K_KAEBV12@01@Z", scope: !41, file: !42, line: 3508, type: !632, scopeLine: 3508, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!632 = !DISubroutineType(types: !633)
!633 = !{!512, !445, !460, !398, !446, !460, !398}
!634 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K_KQEBD0@Z", scope: !41, file: !42, line: 3534, type: !635, scopeLine: 3534, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!635 = !DISubroutineType(types: !636)
!636 = !{!512, !445, !460, !398, !314, !460}
!637 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K0QEBD@Z", scope: !41, file: !42, line: 3602, type: !638, scopeLine: 3602, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!638 = !DISubroutineType(types: !639)
!639 = !{!512, !445, !460, !460, !314}
!640 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K_K0D@Z", scope: !41, file: !42, line: 3608, type: !641, scopeLine: 3608, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!641 = !DISubroutineType(types: !642)
!642 = !{!512, !445, !460, !398, !460, !40}
!643 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0AEBV12@@Z", scope: !41, file: !42, line: 3641, type: !644, scopeLine: 3641, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!644 = !DISubroutineType(types: !645)
!645 = !{!512, !445, !548, !548, !446}
!646 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0QEBD_K@Z", scope: !41, file: !42, line: 3666, type: !647, scopeLine: 3666, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!647 = !DISubroutineType(types: !648)
!648 = !{!512, !445, !548, !548, !314, !460}
!649 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0QEBD@Z", scope: !41, file: !42, line: 3677, type: !650, scopeLine: 3677, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!650 = !DISubroutineType(types: !651)
!651 = !{!512, !445, !548, !548, !314}
!652 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0_KD@Z", scope: !41, file: !42, line: 3688, type: !653, scopeLine: 3688, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!653 = !DISubroutineType(types: !654)
!654 = !{!512, !445, !548, !548, !460, !40}
!655 = !DISubprogram(name: "begin", linkageName: "?begin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ", scope: !41, file: !42, line: 3720, type: !656, scopeLine: 3720, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!656 = !DISubroutineType(types: !657)
!657 = !{!407, !445}
!658 = !DISubprogram(name: "begin", linkageName: "?begin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ", scope: !41, file: !42, line: 3724, type: !659, scopeLine: 3724, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!659 = !DISubroutineType(types: !660)
!660 = !{!409, !661}
!661 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !447, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!662 = !DISubprogram(name: "end", linkageName: "?end@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ", scope: !41, file: !42, line: 3728, type: !656, scopeLine: 3728, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!663 = !DISubprogram(name: "end", linkageName: "?end@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ", scope: !41, file: !42, line: 3734, type: !659, scopeLine: 3734, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!664 = !DISubprogram(name: "_Unchecked_begin", linkageName: "?_Unchecked_begin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAPEADXZ", scope: !41, file: !42, line: 3740, type: !665, scopeLine: 3740, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!665 = !DISubroutineType(types: !666)
!666 = !{!34, !445}
!667 = !DISubprogram(name: "_Unchecked_begin", linkageName: "?_Unchecked_begin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAPEBDXZ", scope: !41, file: !42, line: 3744, type: !668, scopeLine: 3744, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!668 = !DISubroutineType(types: !669)
!669 = !{!39, !661}
!670 = !DISubprogram(name: "_Unchecked_end", linkageName: "?_Unchecked_end@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAPEADXZ", scope: !41, file: !42, line: 3748, type: !665, scopeLine: 3748, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!671 = !DISubprogram(name: "_Unchecked_end", linkageName: "?_Unchecked_end@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAPEBDXZ", scope: !41, file: !42, line: 3752, type: !668, scopeLine: 3752, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!672 = !DISubprogram(name: "rbegin", linkageName: "?rbegin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$reverse_iterator@V?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ", scope: !41, file: !42, line: 3756, type: !673, scopeLine: 3756, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!673 = !DISubroutineType(types: !674)
!674 = !{!411, !445}
!675 = !DISubprogram(name: "rbegin", linkageName: "?rbegin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$reverse_iterator@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ", scope: !41, file: !42, line: 3760, type: !676, scopeLine: 3760, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!676 = !DISubroutineType(types: !677)
!677 = !{!414, !661}
!678 = !DISubprogram(name: "rend", linkageName: "?rend@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$reverse_iterator@V?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ", scope: !41, file: !42, line: 3764, type: !673, scopeLine: 3764, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!679 = !DISubprogram(name: "rend", linkageName: "?rend@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$reverse_iterator@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ", scope: !41, file: !42, line: 3768, type: !676, scopeLine: 3768, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!680 = !DISubprogram(name: "cbegin", linkageName: "?cbegin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ", scope: !41, file: !42, line: 3772, type: !659, scopeLine: 3772, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!681 = !DISubprogram(name: "cend", linkageName: "?cend@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ", scope: !41, file: !42, line: 3776, type: !659, scopeLine: 3776, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!682 = !DISubprogram(name: "crbegin", linkageName: "?crbegin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$reverse_iterator@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ", scope: !41, file: !42, line: 3780, type: !676, scopeLine: 3780, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!683 = !DISubprogram(name: "crend", linkageName: "?crend@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$reverse_iterator@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ", scope: !41, file: !42, line: 3784, type: !676, scopeLine: 3784, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!684 = !DISubprogram(name: "shrink_to_fit", linkageName: "?shrink_to_fit@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXXZ", scope: !41, file: !42, line: 3788, type: !452, scopeLine: 3788, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!685 = !DISubprogram(name: "at", linkageName: "?at@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAD_K@Z", scope: !41, file: !42, line: 3829, type: !686, scopeLine: 3829, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!686 = !DISubroutineType(types: !687)
!687 = !{!402, !445, !460}
!688 = !DISubprogram(name: "at", linkageName: "?at@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAAEBD_K@Z", scope: !41, file: !42, line: 3834, type: !689, scopeLine: 3834, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!689 = !DISubroutineType(types: !690)
!690 = !{!404, !661, !460}
!691 = !DISubprogram(name: "operator[]", linkageName: "??A?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAD_K@Z", scope: !41, file: !42, line: 3839, type: !686, scopeLine: 3839, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!692 = !DISubprogram(name: "operator[]", linkageName: "??A?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAAEBD_K@Z", scope: !41, file: !42, line: 3846, type: !689, scopeLine: 3846, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!693 = !DISubprogram(name: "push_back", linkageName: "?push_back@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXD@Z", scope: !41, file: !42, line: 3861, type: !694, scopeLine: 3861, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!694 = !DISubroutineType(types: !695)
!695 = !{null, !445, !40}
!696 = !DISubprogram(name: "pop_back", linkageName: "?pop_back@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXXZ", scope: !41, file: !42, line: 3881, type: !452, scopeLine: 3881, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!697 = !DISubprogram(name: "front", linkageName: "?front@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEADXZ", scope: !41, file: !42, line: 3889, type: !698, scopeLine: 3889, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!698 = !DISubroutineType(types: !699)
!699 = !{!402, !445}
!700 = !DISubprogram(name: "front", linkageName: "?front@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAAEBDXZ", scope: !41, file: !42, line: 3897, type: !701, scopeLine: 3897, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!701 = !DISubroutineType(types: !702)
!702 = !{!404, !661}
!703 = !DISubprogram(name: "back", linkageName: "?back@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEADXZ", scope: !41, file: !42, line: 3905, type: !698, scopeLine: 3905, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!704 = !DISubprogram(name: "back", linkageName: "?back@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAAEBDXZ", scope: !41, file: !42, line: 3913, type: !701, scopeLine: 3913, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!705 = !DISubprogram(name: "c_str", linkageName: "?c_str@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAPEBDXZ", scope: !41, file: !42, line: 3921, type: !668, scopeLine: 3921, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!706 = !DISubprogram(name: "data", linkageName: "?data@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAPEBDXZ", scope: !41, file: !42, line: 3925, type: !668, scopeLine: 3925, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!707 = !DISubprogram(name: "length", linkageName: "?length@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ", scope: !41, file: !42, line: 3935, type: !708, scopeLine: 3935, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!708 = !DISubroutineType(types: !709)
!709 = !{!398, !661}
!710 = !DISubprogram(name: "size", linkageName: "?size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ", scope: !41, file: !42, line: 3939, type: !708, scopeLine: 3939, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!711 = !DISubprogram(name: "max_size", linkageName: "?max_size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ", scope: !41, file: !42, line: 3943, type: !708, scopeLine: 3943, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!712 = !DISubprogram(name: "resize", linkageName: "?resize@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAX_KD@Z", scope: !41, file: !42, line: 3952, type: !477, scopeLine: 3952, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!713 = !DISubprogram(name: "capacity", linkageName: "?capacity@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ", scope: !41, file: !42, line: 3962, type: !708, scopeLine: 3962, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!714 = !DISubprogram(name: "reserve", linkageName: "?reserve@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAX_K@Z", scope: !41, file: !42, line: 3988, type: !715, scopeLine: 3988, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!715 = !DISubroutineType(types: !716)
!716 = !{null, !445, !460}
!717 = !DISubprogram(name: "empty", linkageName: "?empty@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_NXZ", scope: !41, file: !42, line: 4018, type: !718, scopeLine: 4018, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!718 = !DISubroutineType(types: !719)
!719 = !{!73, !661}
!720 = !DISubprogram(name: "copy", linkageName: "?copy@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEAD_K_K@Z", scope: !41, file: !42, line: 4022, type: !721, scopeLine: 4022, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!721 = !DISubroutineType(types: !722)
!722 = !{!398, !661, !110, !398, !460}
!723 = !DISubprogram(name: "_Copy_s", linkageName: "?_Copy_s@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEAD_K_K1@Z", scope: !41, file: !42, line: 4032, type: !724, scopeLine: 4032, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!724 = !DISubroutineType(types: !725)
!725 = !{!398, !661, !110, !460, !398, !460}
!726 = !DISubprogram(name: "_Swap_bx_large_with_small", linkageName: "?_Swap_bx_large_with_small@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXAEAV?$_String_val@U?$_Simple_types@D@std@@@2@0@Z", scope: !41, file: !42, line: 4041, type: !727, scopeLine: 4041, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!727 = !DISubroutineType(types: !728)
!728 = !{null, !445, !729, !729}
!729 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !188, size: 64)
!730 = !DISubprogram(name: "_Swap_data", linkageName: "?_Swap_data@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXAEAV12@@Z", scope: !41, file: !42, line: 4051, type: !531, scopeLine: 4051, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!731 = !DISubprogram(name: "swap", linkageName: "?swap@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXAEAV12@@Z", scope: !41, file: !42, line: 4095, type: !531, scopeLine: 4095, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!732 = !DISubprogram(name: "find", linkageName: "?find@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z", scope: !41, file: !42, line: 4129, type: !733, scopeLine: 4129, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!733 = !DISubroutineType(types: !734)
!734 = !{!398, !661, !446, !460}
!735 = !DISubprogram(name: "find", linkageName: "?find@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z", scope: !41, file: !42, line: 4136, type: !736, scopeLine: 4136, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!736 = !DISubroutineType(types: !737)
!737 = !{!398, !661, !314, !460, !460}
!738 = !DISubprogram(name: "find", linkageName: "?find@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z", scope: !41, file: !42, line: 4143, type: !739, scopeLine: 4143, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!739 = !DISubroutineType(types: !740)
!740 = !{!398, !661, !314, !460}
!741 = !DISubprogram(name: "find", linkageName: "?find@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z", scope: !41, file: !42, line: 4150, type: !742, scopeLine: 4150, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!742 = !DISubroutineType(types: !743)
!743 = !{!398, !661, !40, !460}
!744 = !DISubprogram(name: "rfind", linkageName: "?rfind@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z", scope: !41, file: !42, line: 4167, type: !733, scopeLine: 4167, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!745 = !DISubprogram(name: "rfind", linkageName: "?rfind@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z", scope: !41, file: !42, line: 4174, type: !736, scopeLine: 4174, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!746 = !DISubprogram(name: "rfind", linkageName: "?rfind@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z", scope: !41, file: !42, line: 4181, type: !739, scopeLine: 4181, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!747 = !DISubprogram(name: "rfind", linkageName: "?rfind@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z", scope: !41, file: !42, line: 4188, type: !742, scopeLine: 4188, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!748 = !DISubprogram(name: "find_first_of", linkageName: "?find_first_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z", scope: !41, file: !42, line: 4206, type: !733, scopeLine: 4206, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!749 = !DISubprogram(name: "find_first_of", linkageName: "?find_first_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z", scope: !41, file: !42, line: 4214, type: !736, scopeLine: 4214, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!750 = !DISubprogram(name: "find_first_of", linkageName: "?find_first_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z", scope: !41, file: !42, line: 4221, type: !739, scopeLine: 4221, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!751 = !DISubprogram(name: "find_first_of", linkageName: "?find_first_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z", scope: !41, file: !42, line: 4228, type: !742, scopeLine: 4228, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!752 = !DISubprogram(name: "find_last_of", linkageName: "?find_last_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z", scope: !41, file: !42, line: 4246, type: !753, scopeLine: 4246, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!753 = !DISubroutineType(types: !754)
!754 = !{!398, !661, !446, !398}
!755 = !DISubprogram(name: "find_last_of", linkageName: "?find_last_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z", scope: !41, file: !42, line: 4254, type: !736, scopeLine: 4254, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!756 = !DISubprogram(name: "find_last_of", linkageName: "?find_last_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z", scope: !41, file: !42, line: 4261, type: !739, scopeLine: 4261, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!757 = !DISubprogram(name: "find_last_of", linkageName: "?find_last_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z", scope: !41, file: !42, line: 4268, type: !742, scopeLine: 4268, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!758 = !DISubprogram(name: "find_first_not_of", linkageName: "?find_first_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z", scope: !41, file: !42, line: 4287, type: !733, scopeLine: 4287, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!759 = !DISubprogram(name: "find_first_not_of", linkageName: "?find_first_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z", scope: !41, file: !42, line: 4295, type: !736, scopeLine: 4295, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!760 = !DISubprogram(name: "find_first_not_of", linkageName: "?find_first_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z", scope: !41, file: !42, line: 4302, type: !761, scopeLine: 4302, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!761 = !DISubroutineType(types: !762)
!762 = !{!398, !661, !314, !398}
!763 = !DISubprogram(name: "find_first_not_of", linkageName: "?find_first_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z", scope: !41, file: !42, line: 4309, type: !742, scopeLine: 4309, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!764 = !DISubprogram(name: "find_last_not_of", linkageName: "?find_last_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z", scope: !41, file: !42, line: 4328, type: !733, scopeLine: 4328, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!765 = !DISubprogram(name: "find_last_not_of", linkageName: "?find_last_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z", scope: !41, file: !42, line: 4336, type: !736, scopeLine: 4336, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!766 = !DISubprogram(name: "find_last_not_of", linkageName: "?find_last_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z", scope: !41, file: !42, line: 4343, type: !739, scopeLine: 4343, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!767 = !DISubprogram(name: "find_last_not_of", linkageName: "?find_last_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z", scope: !41, file: !42, line: 4350, type: !742, scopeLine: 4350, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!768 = !DISubprogram(name: "substr", linkageName: "?substr@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV12@_K0@Z", scope: !41, file: !42, line: 4364, type: !769, scopeLine: 4364, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!769 = !DISubroutineType(types: !770)
!770 = !{!41, !661, !460, !460}
!771 = !DISubprogram(name: "_Equal", linkageName: "?_Equal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_NAEBV12@@Z", scope: !41, file: !42, line: 4370, type: !772, scopeLine: 4370, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!772 = !DISubroutineType(types: !773)
!773 = !{!73, !661, !446}
!774 = !DISubprogram(name: "_Equal", linkageName: "?_Equal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_NQEBD@Z", scope: !41, file: !42, line: 4376, type: !775, scopeLine: 4376, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!775 = !DISubroutineType(types: !776)
!776 = !{!73, !661, !314}
!777 = !DISubprogram(name: "compare", linkageName: "?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAHAEBV12@@Z", scope: !41, file: !42, line: 4412, type: !778, scopeLine: 4412, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!778 = !DISubroutineType(types: !779)
!779 = !{!6, !661, !446}
!780 = !DISubprogram(name: "compare", linkageName: "?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAH_K0AEBV12@@Z", scope: !41, file: !42, line: 4418, type: !781, scopeLine: 4418, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!781 = !DISubroutineType(types: !782)
!782 = !{!6, !661, !398, !398, !446}
!783 = !DISubprogram(name: "compare", linkageName: "?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAH_K0AEBV12@00@Z", scope: !41, file: !42, line: 4425, type: !784, scopeLine: 4425, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!784 = !DISubroutineType(types: !785)
!785 = !{!6, !661, !460, !460, !446, !460, !460}
!786 = !DISubprogram(name: "compare", linkageName: "?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAHQEBD@Z", scope: !41, file: !42, line: 4434, type: !787, scopeLine: 4434, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!787 = !DISubroutineType(types: !788)
!788 = !{!6, !661, !314}
!789 = !DISubprogram(name: "compare", linkageName: "?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAH_K0QEBD@Z", scope: !41, file: !42, line: 4439, type: !790, scopeLine: 4439, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!790 = !DISubroutineType(types: !791)
!791 = !{!6, !661, !460, !460, !314}
!792 = !DISubprogram(name: "compare", linkageName: "?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAH_K0QEBD0@Z", scope: !41, file: !42, line: 4447, type: !793, scopeLine: 4447, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!793 = !DISubroutineType(types: !794)
!794 = !{!6, !661, !460, !460, !314, !460}
!795 = !DISubprogram(name: "get_allocator", linkageName: "?get_allocator@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$allocator@D@2@XZ", scope: !41, file: !42, line: 4481, type: !796, scopeLine: 4481, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!796 = !DISubroutineType(types: !797)
!797 = !{!396, !661}
!798 = !DISubprogram(name: "_Calculate_growth", linkageName: "?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@CA_K_K00@Z", scope: !41, file: !42, line: 4486, type: !799, scopeLine: 4486, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!799 = !DISubroutineType(types: !800)
!800 = !{!398, !460, !460, !460}
!801 = !DISubprogram(name: "_Calculate_growth", linkageName: "?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBA_K_K@Z", scope: !41, file: !42, line: 4500, type: !802, scopeLine: 4500, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!802 = !DISubroutineType(types: !803)
!803 = !{!398, !661, !460}
!804 = !DISubprogram(name: "_Become_small", linkageName: "?_Become_small@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ", scope: !41, file: !42, line: 4575, type: !452, scopeLine: 4575, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!805 = !DISubprogram(name: "_Eos", linkageName: "?_Eos@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAX_K@Z", scope: !41, file: !42, line: 4590, type: !715, scopeLine: 4590, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!806 = !DISubprogram(name: "_Tidy_init", linkageName: "?_Tidy_init@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ", scope: !41, file: !42, line: 4594, type: !452, scopeLine: 4594, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!807 = !DISubprogram(name: "_Tidy_deallocate", linkageName: "?_Tidy_deallocate@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ", scope: !41, file: !42, line: 4616, type: !452, scopeLine: 4616, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!808 = !DISubprogram(name: "_Orphan_all", linkageName: "?_Orphan_all@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXXZ", scope: !41, file: !42, line: 4641, type: !452, scopeLine: 4641, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!809 = !DISubprogram(name: "_Swap_proxy_and_iterators", linkageName: "?_Swap_proxy_and_iterators@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEAV12@@Z", scope: !41, file: !42, line: 4646, type: !531, scopeLine: 4646, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!810 = !DISubprogram(name: "_Getal", linkageName: "?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV?$allocator@D@2@XZ", scope: !41, file: !42, line: 4650, type: !811, scopeLine: 4650, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!811 = !DISubroutineType(types: !812)
!812 = !{!813, !445}
!813 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !44, size: 64)
!814 = !DISubprogram(name: "_Getal", linkageName: "?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBAAEBV?$allocator@D@2@XZ", scope: !41, file: !42, line: 4654, type: !815, scopeLine: 4654, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!815 = !DISubroutineType(types: !816)
!816 = !{!817, !661}
!817 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !818, size: 64)
!818 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !44)
!819 = !{!356, !820, !174}
!820 = !DITemplateTypeParameter(name: "_Traits", type: !285)
!821 = !{!0, !822, !824, !827, !829, !832, !834, !836, !839, !856, !858, !860, !862, !864}
!822 = !DIGlobalVariableExpression(var: !823, expr: !DIExpression())
!823 = distinct !DIGlobalVariable(name: "globalChar", linkageName: "?globalChar@@3DA", scope: !2, file: !3, line: 4, type: !35, isLocal: false, isDefinition: true)
!824 = !DIGlobalVariableExpression(var: !825, expr: !DIExpression())
!825 = distinct !DIGlobalVariable(name: "globalFloat", linkageName: "?globalFloat@@3MA", scope: !2, file: !3, line: 5, type: !826, isLocal: false, isDefinition: true)
!826 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!827 = !DIGlobalVariableExpression(var: !828, expr: !DIExpression())
!828 = distinct !DIGlobalVariable(name: "gloBool", linkageName: "?gloBool@@3_NA", scope: !2, file: !3, line: 6, type: !73, isLocal: false, isDefinition: true)
!829 = !DIGlobalVariableExpression(var: !830, expr: !DIExpression())
!830 = distinct !DIGlobalVariable(name: "globalString", linkageName: "?globalString@@3V?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@A", scope: !2, file: !3, line: 7, type: !831, isLocal: false, isDefinition: true)
!831 = !DIDerivedType(tag: DW_TAG_typedef, name: "string", scope: !14, file: !42, line: 4905, baseType: !41)
!832 = !DIGlobalVariableExpression(var: !833, expr: !DIExpression())
!833 = distinct !DIGlobalVariable(name: "globalZero", linkageName: "?globalZero@@3HA", scope: !2, file: !3, line: 8, type: !6, isLocal: false, isDefinition: true)
!834 = !DIGlobalVariableExpression(var: !835, expr: !DIExpression())
!835 = distinct !DIGlobalVariable(name: "globalDeclare", linkageName: "?globalDeclare@@3HA", scope: !2, file: !3, line: 9, type: !6, isLocal: false, isDefinition: true)
!836 = !DIGlobalVariableExpression(var: !837, expr: !DIExpression())
!837 = distinct !DIGlobalVariable(name: "globalIntPointer", linkageName: "?globalIntPointer@@3PEAHEA", scope: !2, file: !3, line: 10, type: !838, isLocal: false, isDefinition: true)
!838 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!839 = !DIGlobalVariableExpression(var: !840, expr: !DIExpression())
!840 = distinct !DIGlobalVariable(name: "m", scope: !841, file: !3, line: 23, type: !6, isLocal: true, isDefinition: true)
!841 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 21, type: !842, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !844)
!842 = !DISubroutineType(types: !843)
!843 = !{!6}
!844 = !{!845, !846, !848, !852}
!845 = !DILocalVariable(name: "newString", scope: !841, file: !3, line: 22, type: !831)
!846 = !DILocalVariable(name: "i", scope: !847, file: !3, line: 24, type: !6)
!847 = distinct !DILexicalBlock(scope: !841, file: !3, line: 24, column: 2)
!848 = !DILocalVariable(name: "j", scope: !849, file: !3, line: 25, type: !6)
!849 = distinct !DILexicalBlock(scope: !850, file: !3, line: 25, column: 3)
!850 = distinct !DILexicalBlock(scope: !851, file: !3, line: 24, column: 25)
!851 = distinct !DILexicalBlock(scope: !847, file: !3, line: 24, column: 2)
!852 = !DILocalVariable(name: "k", scope: !853, file: !3, line: 26, type: !6)
!853 = distinct !DILexicalBlock(scope: !854, file: !3, line: 26, column: 4)
!854 = distinct !DILexicalBlock(scope: !855, file: !3, line: 25, column: 23)
!855 = distinct !DILexicalBlock(scope: !849, file: !3, line: 25, column: 3)
!856 = !DIGlobalVariableExpression(var: !857, expr: !DIExpression())
!857 = distinct !DIGlobalVariable(name: "staticGlobal", scope: !2, file: !3, line: 12, type: !6, isLocal: true, isDefinition: true)
!858 = !DIGlobalVariableExpression(var: !859, expr: !DIExpression(DW_OP_constu, 4096, DW_OP_stack_value))
!859 = distinct !DIGlobalVariable(name: "_Big_allocation_threshold", scope: !14, file: !46, line: 113, type: !111, isLocal: true, isDefinition: true)
!860 = !DIGlobalVariableExpression(var: !861, expr: !DIExpression(DW_OP_constu, 39, DW_OP_stack_value))
!861 = distinct !DIGlobalVariable(name: "_Non_user_size", scope: !14, file: !46, line: 123, type: !111, isLocal: true, isDefinition: true)
!862 = !DIGlobalVariableExpression(var: !863, expr: !DIExpression())
!863 = distinct !DIGlobalVariable(name: "_Fake_alloc", linkageName: "?_Fake_alloc@std@@3U_Fake_allocator@1@B", scope: !14, file: !46, line: 1341, type: !207, isLocal: true, isDefinition: true)
!864 = !DIGlobalVariableExpression(var: !865, expr: !DIExpression(DW_OP_constu, 32, DW_OP_stack_value))
!865 = distinct !DIGlobalVariable(name: "_Big_allocation_alignment", scope: !14, file: !46, line: 114, type: !111, isLocal: true, isDefinition: true)
!866 = !{!867, !872, !873, !876, !879, !880, !885, !889, !891, !893, !895, !897, !902, !906, !910, !915, !919, !923, !927, !931, !933, !938, !944, !948, !952, !954, !956, !960, !962, !966, !970, !974, !976, !980, !982, !984, !988, !992, !996, !1000, !1004, !1008, !1010, !1015, !1019, !1023, !1028, !1032, !1034, !1036, !1040, !1042, !1047, !1052, !1056, !1058, !1060, !1065, !1070, !1072, !1074, !1076, !1080, !1084, !1088, !1092, !1096, !1098, !1102, !1104, !1106, !1108, !1110, !1114, !1116, !1117, !1118, !1121, !1123, !1128, !1132, !1138, !1142, !1148, !1152, !1157, !1159, !1161, !1165, !1170, !1174, !1179, !1185, !1187, !1191, !1196, !1200, !1204, !1208, !1212, !1216, !1220, !1224, !1226, !1231, !1237, !1242, !1246, !1250, !1252, !1254, !1258, !1262, !1266, !1270, !1272, !1274, !1276, !1278, !1283, !1287, !1289, !1291, !1295, !1299, !1303, !1305, !1307, !1309, !1311, !1317, !1319, !1323, !1325, !1329, !1334, !1338, !1342, !1345, !1347, !1348, !1350, !1352, !1356, !1362, !1364, !1368, !1373, !1377, !1379, !1383, !1392, !1397, !1407, !1411, !1415, !1419, !1423, !1427, !1431, !1435, !1439, !1443, !1445, !1449, !1454, !1459, !1463, !1467, !1471, !1475, !1476, !1480, !1482, !1486, !1490, !1494, !1498, !1502, !1506, !1510, !1512, !1514, !1516, !1521, !1524, !1526, !1528, !1531, !1533, !1535, !1537, !1539, !1541, !1543, !1545, !1547, !1549, !1551, !1553, !1555, !1557, !1559, !1561, !1563, !1565, !1567, !1569, !1571, !1573, !1575, !1576, !1578, !1579, !1580, !1581, !1582, !1583, !1584, !1585, !1586, !1587, !1588, !1589, !1590, !1591, !1592, !1593, !1594, !1595, !1596, !1597, !1598, !1599, !1600, !1601, !1602, !1603, !1604, !1605, !1607, !1608, !1612, !1617, !1618, !1621, !1626, !1627, !1631, !1633, !1635, !1637, !1639, !1641, !1643, !1645, !1647, !1649, !1651, !1653, !1655}
!867 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !868, file: !871, line: 37)
!868 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !869, line: 31, baseType: !870)
!869 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_wstdio.h", directory: "", checksumkind: CSK_MD5, checksum: "bf50373b435d0afd0235dd3e05c4a277")
!870 = !DICompositeType(tag: DW_TAG_structure_type, name: "_iobuf", file: !869, line: 28, size: 64, flags: DIFlagFwdDecl, identifier: ".?AU_iobuf@@")
!871 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\cstdio", directory: "", checksumkind: CSK_MD5, checksum: "c450e3bb97b2af18a3a83f1f772c2644")
!872 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !302, file: !871, line: 38)
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !874, file: !871, line: 40)
!874 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !875, line: 193, baseType: !30)
!875 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\vcruntime.h", directory: "", checksumkind: CSK_MD5, checksum: "1147c94afb6f25c377433eef20bc3e8f")
!876 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !877, file: !871, line: 41)
!877 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !878, line: 73, baseType: !64)
!878 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "c1a1fbc43e7d45f0ea4ae539ddcffb19")
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !868, file: !871, line: 42)
!880 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !881, file: !871, line: 43)
!881 = !DISubprogram(name: "clearerr", scope: !878, file: !878, line: 146, type: !882, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!882 = !DISubroutineType(types: !883)
!883 = !{null, !884}
!884 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !868, size: 64)
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !886, file: !871, line: 44)
!886 = !DISubprogram(name: "fclose", scope: !878, file: !878, line: 152, type: !887, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!887 = !DISubroutineType(types: !888)
!888 = !{!6, !884}
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !890, file: !871, line: 45)
!890 = !DISubprogram(name: "feof", scope: !878, file: !878, line: 166, type: !887, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !892, file: !871, line: 46)
!892 = !DISubprogram(name: "ferror", scope: !878, file: !878, line: 171, type: !887, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !894, file: !871, line: 47)
!894 = !DISubprogram(name: "fflush", scope: !878, file: !878, line: 176, type: !887, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !896, file: !871, line: 48)
!896 = !DISubprogram(name: "fgetc", scope: !878, file: !878, line: 182, type: !887, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !898, file: !871, line: 49)
!898 = !DISubprogram(name: "fgetpos", scope: !878, file: !878, line: 191, type: !899, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!899 = !DISubroutineType(types: !900)
!900 = !{!6, !884, !901}
!901 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !877, size: 64)
!902 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !903, file: !871, line: 50)
!903 = !DISubprogram(name: "fgets", scope: !878, file: !878, line: 198, type: !904, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!904 = !DISubroutineType(types: !905)
!905 = !{!34, !34, !6, !884}
!906 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !907, file: !871, line: 51)
!907 = !DISubprogram(name: "fopen", scope: !878, file: !878, line: 213, type: !908, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!908 = !DISubroutineType(types: !909)
!909 = !{!884, !39, !39}
!910 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !911, file: !871, line: 52)
!911 = !DISubprogram(name: "fprintf", scope: !878, file: !878, line: 830, type: !912, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!912 = !DISubroutineType(types: !913)
!913 = !{!6, !914, !314, null}
!914 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !884)
!915 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !916, file: !871, line: 53)
!916 = !DISubprogram(name: "fputc", scope: !878, file: !878, line: 221, type: !917, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!917 = !DISubroutineType(types: !918)
!918 = !{!6, !6, !884}
!919 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !920, file: !871, line: 54)
!920 = !DISubprogram(name: "fputs", scope: !878, file: !878, line: 233, type: !921, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!921 = !DISubroutineType(types: !922)
!922 = !{!6, !39, !884}
!923 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !924, file: !871, line: 55)
!924 = !DISubprogram(name: "fread", scope: !878, file: !878, line: 239, type: !925, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!925 = !DISubroutineType(types: !926)
!926 = !{!874, !31, !874, !874, !884}
!927 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !928, file: !871, line: 56)
!928 = !DISubprogram(name: "freopen", scope: !878, file: !878, line: 248, type: !929, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!929 = !DISubroutineType(types: !930)
!930 = !{!884, !39, !39, !884}
!931 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !932, file: !871, line: 57)
!932 = !DISubprogram(name: "fscanf", scope: !878, file: !878, line: 1199, type: !912, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !934, file: !871, line: 58)
!934 = !DISubprogram(name: "fseek", scope: !878, file: !878, line: 270, type: !935, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!935 = !DISubroutineType(types: !936)
!936 = !{!6, !884, !937, !6}
!937 = !DIBasicType(name: "long int", size: 32, encoding: DW_ATE_signed)
!938 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !939, file: !871, line: 59)
!939 = !DISubprogram(name: "fsetpos", scope: !878, file: !878, line: 263, type: !940, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!940 = !DISubroutineType(types: !941)
!941 = !{!6, !884, !942}
!942 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !943, size: 64)
!943 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !877)
!944 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !945, file: !871, line: 60)
!945 = !DISubprogram(name: "ftell", scope: !878, file: !878, line: 286, type: !946, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!946 = !DISubroutineType(types: !947)
!947 = !{!937, !884}
!948 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !949, file: !871, line: 61)
!949 = !DISubprogram(name: "fwrite", scope: !878, file: !878, line: 297, type: !950, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!950 = !DISubroutineType(types: !951)
!951 = !{!874, !118, !874, !874, !884}
!952 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !953, file: !871, line: 62)
!953 = !DISubprogram(name: "getc", scope: !878, file: !878, line: 306, type: !887, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!954 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !955, file: !871, line: 63)
!955 = !DISubprogram(name: "getchar", scope: !878, file: !878, line: 311, type: !842, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!956 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !957, file: !871, line: 64)
!957 = !DISubprogram(name: "perror", scope: !878, file: !878, line: 325, type: !958, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!958 = !DISubroutineType(types: !959)
!959 = !{null, !39}
!960 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !961, file: !871, line: 65)
!961 = !DISubprogram(name: "putc", scope: !878, file: !878, line: 347, type: !917, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!962 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !963, file: !871, line: 66)
!963 = !DISubprogram(name: "putchar", scope: !878, file: !878, line: 353, type: !964, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!964 = !DISubroutineType(types: !965)
!965 = !{!6, !6}
!966 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !967, file: !871, line: 67)
!967 = !DISubprogram(name: "printf", scope: !878, file: !878, line: 950, type: !968, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!968 = !DISubroutineType(types: !969)
!969 = !{!6, !314, null}
!970 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !971, file: !871, line: 68)
!971 = !DISubprogram(name: "puts", scope: !878, file: !878, line: 358, type: !972, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!972 = !DISubroutineType(types: !973)
!973 = !{!6, !39}
!974 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !975, file: !871, line: 69)
!975 = !DISubprogram(name: "remove", scope: !878, file: !878, line: 369, type: !972, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!976 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !977, file: !871, line: 70)
!977 = !DISubprogram(name: "rename", scope: !878, file: !878, line: 374, type: !978, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!978 = !DISubroutineType(types: !979)
!979 = !{!6, !39, !39}
!980 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !981, file: !871, line: 71)
!981 = !DISubprogram(name: "rewind", scope: !878, file: !878, line: 392, type: !882, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!982 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !983, file: !871, line: 72)
!983 = !DISubprogram(name: "scanf", scope: !878, file: !878, line: 1276, type: !968, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!984 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !985, file: !871, line: 73)
!985 = !DISubprogram(name: "setbuf", scope: !878, file: !878, line: 400, type: !986, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!986 = !DISubroutineType(types: !987)
!987 = !{null, !884, !34}
!988 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !989, file: !871, line: 74)
!989 = !DISubprogram(name: "setvbuf", scope: !878, file: !878, line: 412, type: !990, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!990 = !DISubroutineType(types: !991)
!991 = !{!6, !884, !34, !6, !874}
!992 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !993, file: !871, line: 75)
!993 = !DISubprogram(name: "sprintf", scope: !878, file: !878, line: 1783, type: !994, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!994 = !DISubroutineType(types: !995)
!995 = !{!6, !34, !39, null}
!996 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !997, file: !871, line: 76)
!997 = !DISubprogram(name: "sscanf", scope: !878, file: !878, line: 2240, type: !998, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!998 = !DISubroutineType(types: !999)
!999 = !{!6, !314, !314, null}
!1000 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1001, file: !871, line: 77)
!1001 = !DISubprogram(name: "tmpfile", scope: !878, file: !878, line: 435, type: !1002, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1002 = !DISubroutineType(types: !1003)
!1003 = !{!884}
!1004 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1005, file: !871, line: 78)
!1005 = !DISubprogram(name: "tmpnam", scope: !878, file: !878, line: 443, type: !1006, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1006 = !DISubroutineType(types: !1007)
!1007 = !{!34, !34}
!1008 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1009, file: !871, line: 79)
!1009 = !DISubprogram(name: "ungetc", scope: !878, file: !878, line: 451, type: !917, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1010 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1011, file: !871, line: 80)
!1011 = !DISubprogram(name: "vfprintf", scope: !878, file: !878, line: 650, type: !1012, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1012 = !DISubroutineType(types: !1013)
!1013 = !{!6, !914, !314, !1014}
!1014 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !29, line: 72, baseType: !34)
!1015 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1016, file: !871, line: 81)
!1016 = !DISubprogram(name: "vprintf", scope: !878, file: !878, line: 740, type: !1017, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1017 = !DISubroutineType(types: !1018)
!1018 = !{!6, !314, !1014}
!1019 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1020, file: !871, line: 82)
!1020 = !DISubprogram(name: "vsprintf", scope: !878, file: !878, line: 1783, type: !1021, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1021 = !DISubroutineType(types: !1022)
!1022 = !{!6, !34, !39, !1014}
!1023 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1024, file: !871, line: 84)
!1024 = !DISubprogram(name: "snprintf", scope: !878, file: !878, line: 1919, type: !1025, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1025 = !DISubroutineType(types: !1026)
!1026 = !{!6, !110, !1027, !314, null}
!1027 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !874)
!1028 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1029, file: !871, line: 85)
!1029 = !DISubprogram(name: "vsnprintf", scope: !878, file: !878, line: 1429, type: !1030, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1030 = !DISubroutineType(types: !1031)
!1031 = !{!6, !110, !1027, !314, !1014}
!1032 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1033, file: !871, line: 86)
!1033 = !DISubprogram(name: "vfscanf", scope: !878, file: !878, line: 1072, type: !1012, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1034 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1035, file: !871, line: 87)
!1035 = !DISubprogram(name: "vscanf", scope: !878, file: !878, line: 1136, type: !1017, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1036 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1037, file: !871, line: 88)
!1037 = !DISubprogram(name: "vsscanf", scope: !878, file: !878, line: 2160, type: !1038, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1038 = !DISubroutineType(types: !1039)
!1039 = !{!6, !314, !314, !1014}
!1040 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !874, file: !1041, line: 25)
!1041 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\cstring", directory: "", checksumkind: CSK_MD5, checksum: "8836d22258dd0dcd58ea9d9763256c9c")
!1042 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1043, file: !1041, line: 26)
!1043 = !DISubprogram(name: "memchr", linkageName: "?memchr@@YAPEAXPEAXH_K@Z", scope: !1044, file: !1044, line: 104, type: !1045, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1044 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_memory.h", directory: "", checksumkind: CSK_MD5, checksum: "0b971aeac8757ee8ec347a03047c3b4a")
!1045 = !DISubroutineType(types: !1046)
!1046 = !{!31, !31, !6, !874}
!1047 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1048, file: !1041, line: 27)
!1048 = !DISubprogram(name: "memcmp", scope: !1049, file: !1049, line: 29, type: !1050, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1049 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\vcruntime_string.h", directory: "", checksumkind: CSK_MD5, checksum: "a54b085ffcc86a11803fd825bf8abeaa")
!1050 = !DISubroutineType(types: !1051)
!1051 = !{!6, !118, !118, !874}
!1052 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1053, file: !1041, line: 28)
!1053 = !DISubprogram(name: "memcpy", scope: !1049, file: !1049, line: 43, type: !1054, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1054 = !DISubroutineType(types: !1055)
!1055 = !{!31, !31, !118, !874}
!1056 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1057, file: !1041, line: 29)
!1057 = !DISubprogram(name: "memmove", scope: !1049, file: !1049, line: 50, type: !1054, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1058 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1059, file: !1041, line: 30)
!1059 = !DISubprogram(name: "memset", scope: !1049, file: !1049, line: 63, type: !1045, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1060 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1061, file: !1041, line: 31)
!1061 = !DISubprogram(name: "strcat", scope: !1062, file: !1062, line: 91, type: !1063, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1062 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\string.h", directory: "", checksumkind: CSK_MD5, checksum: "9f780e8d323a4f33b8c61853c3c9471c")
!1063 = !DISubroutineType(types: !1064)
!1064 = !{!34, !34, !39}
!1065 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1066, file: !1041, line: 32)
!1066 = !DISubprogram(name: "strchr", linkageName: "?strchr@@YAPEADQEADH@Z", scope: !1062, file: !1062, line: 500, type: !1067, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1067 = !DISubroutineType(types: !1068)
!1068 = !{!34, !110, !1069}
!1069 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!1070 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1071, file: !1041, line: 33)
!1071 = !DISubprogram(name: "strcmp", scope: !1062, file: !1062, line: 100, type: !978, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1072 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1073, file: !1041, line: 34)
!1073 = !DISubprogram(name: "strcoll", scope: !1062, file: !1062, line: 112, type: !978, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1074 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1075, file: !1041, line: 35)
!1075 = !DISubprogram(name: "strcpy", scope: !1062, file: !1062, line: 130, type: !1063, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1076 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1077, file: !1041, line: 36)
!1077 = !DISubprogram(name: "strcspn", scope: !1062, file: !1062, line: 137, type: !1078, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1078 = !DISubroutineType(types: !1079)
!1079 = !{!874, !39, !39}
!1080 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1081, file: !1041, line: 37)
!1081 = !DISubprogram(name: "strerror", scope: !1062, file: !1062, line: 178, type: !1082, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1082 = !DISubroutineType(types: !1083)
!1083 = !{!34, !6}
!1084 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1085, file: !1041, line: 38)
!1085 = !DISubprogram(name: "strlen", scope: !1062, file: !1062, line: 215, type: !1086, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1086 = !DISubroutineType(types: !1087)
!1087 = !{!874, !39}
!1088 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1089, file: !1041, line: 39)
!1089 = !DISubprogram(name: "strncat", scope: !1062, file: !1062, line: 262, type: !1090, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1090 = !DISubroutineType(types: !1091)
!1091 = !{!34, !34, !39, !874}
!1092 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1093, file: !1041, line: 40)
!1093 = !DISubprogram(name: "strncmp", scope: !1062, file: !1062, line: 271, type: !1094, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1094 = !DISubroutineType(types: !1095)
!1095 = !{!6, !39, !39, !874}
!1096 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1097, file: !1041, line: 41)
!1097 = !DISubprogram(name: "strncpy", scope: !1062, file: !1062, line: 334, type: !1090, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1098 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1099, file: !1041, line: 42)
!1099 = !DISubprogram(name: "strpbrk", linkageName: "?strpbrk@@YAPEADQEADQEBD@Z", scope: !1062, file: !1062, line: 506, type: !1100, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1100 = !DISubroutineType(types: !1101)
!1101 = !{!34, !110, !314}
!1102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1103, file: !1041, line: 43)
!1103 = !DISubprogram(name: "strrchr", linkageName: "?strrchr@@YAPEADQEADH@Z", scope: !1062, file: !1062, line: 512, type: !1067, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1105, file: !1041, line: 44)
!1105 = !DISubprogram(name: "strspn", scope: !1062, file: !1062, line: 430, type: !1078, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1107, file: !1041, line: 45)
!1107 = !DISubprogram(name: "strstr", linkageName: "?strstr@@YAPEADQEADQEBD@Z", scope: !1062, file: !1062, line: 518, type: !1100, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1109, file: !1041, line: 46)
!1109 = !DISubprogram(name: "strtok", scope: !1062, file: !1062, line: 436, type: !1063, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1111, file: !1041, line: 47)
!1111 = !DISubprogram(name: "strxfrm", scope: !1062, file: !1062, line: 479, type: !1112, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1112 = !DISubroutineType(types: !1113)
!1113 = !{!874, !34, !39, !874}
!1114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !302, file: !1115, line: 28)
!1115 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\cwchar", directory: "", checksumkind: CSK_MD5, checksum: "de41ecfa6d57874e2c7d1a30e0e4ad43")
!1116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !364, file: !1115, line: 30)
!1117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !874, file: !1115, line: 31)
!1118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1119, file: !1115, line: 32)
!1119 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !1120, line: 26, size: 288, flags: DIFlagFwdDecl, identifier: ".?AUtm@@")
!1120 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_wtime.h", directory: "", checksumkind: CSK_MD5, checksum: "2492ba0e16e5eeaa8a93d311a7316d6b")
!1121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1122, file: !1115, line: 33)
!1122 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !303, line: 591, baseType: !309)
!1123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1124, file: !1115, line: 35)
!1124 = !DISubprogram(name: "btowc", scope: !1125, file: !1125, line: 62, type: !1126, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1125 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "50992c87c826ae29a05757af3914e0dd")
!1126 = !DISubroutineType(types: !1127)
!1127 = !{!1122, !6}
!1128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1129, file: !1115, line: 36)
!1129 = !DISubprogram(name: "fgetwc", scope: !869, file: !869, line: 51, type: !1130, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1130 = !DISubroutineType(types: !1131)
!1131 = !{!1122, !884}
!1132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1133, file: !1115, line: 37)
!1133 = !DISubprogram(name: "fgetws", scope: !869, file: !869, line: 79, type: !1134, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1134 = !DISubroutineType(types: !1135)
!1135 = !{!1136, !1136, !6, !884}
!1136 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1137, size: 64)
!1137 = !DIBasicType(name: "wchar_t", size: 16, encoding: DW_ATE_unsigned)
!1138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1139, file: !1115, line: 38)
!1139 = !DISubprogram(name: "fputwc", scope: !869, file: !869, line: 59, type: !1140, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1140 = !DISubroutineType(types: !1141)
!1141 = !{!1122, !1137, !884}
!1142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1143, file: !1115, line: 39)
!1143 = !DISubprogram(name: "fputws", scope: !869, file: !869, line: 86, type: !1144, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1144 = !DISubroutineType(types: !1145)
!1145 = !{!6, !1146, !884}
!1146 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1147, size: 64)
!1147 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1137)
!1148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1149, file: !1115, line: 40)
!1149 = !DISubprogram(name: "fwide", scope: !1125, file: !1125, line: 184, type: !1150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1150 = !DISubroutineType(types: !1151)
!1151 = !{!6, !884, !6}
!1152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1153, file: !1115, line: 41)
!1153 = !DISubprogram(name: "fwprintf", scope: !869, file: !869, line: 494, type: !1154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1154 = !DISubroutineType(types: !1155)
!1155 = !{!6, !914, !1156, null}
!1156 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1146)
!1157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1158, file: !1115, line: 42)
!1158 = !DISubprogram(name: "fwscanf", scope: !869, file: !869, line: 856, type: !1154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1160, file: !1115, line: 43)
!1160 = !DISubprogram(name: "getwc", scope: !869, file: !869, line: 69, type: !1130, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1162, file: !1115, line: 44)
!1162 = !DISubprogram(name: "getwchar", scope: !869, file: !869, line: 74, type: !1163, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1163 = !DISubroutineType(types: !1164)
!1164 = !{!1122}
!1165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1166, file: !1115, line: 45)
!1166 = !DISubprogram(name: "mbrlen", scope: !1125, file: !1125, line: 66, type: !1167, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1167 = !DISubroutineType(types: !1168)
!1168 = !{!874, !39, !874, !1169}
!1169 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !364, size: 64)
!1170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1171, file: !1115, line: 46)
!1171 = !DISubprogram(name: "mbrtowc", scope: !1125, file: !1125, line: 72, type: !1172, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1172 = !DISubroutineType(types: !1173)
!1173 = !{!874, !1136, !39, !874, !1169}
!1174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1175, file: !1115, line: 47)
!1175 = !DISubprogram(name: "mbsrtowcs", scope: !1125, file: !1125, line: 99, type: !1176, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1176 = !DISubroutineType(types: !1177)
!1177 = !{!874, !1136, !1178, !874, !1169}
!1178 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!1179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1180, file: !1115, line: 48)
!1180 = !DISubprogram(name: "mbsinit", scope: !1125, file: !1125, line: 193, type: !1181, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1181 = !DISubroutineType(types: !1182)
!1182 = !{!6, !1183}
!1183 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1184, size: 64)
!1184 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !364)
!1185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1186, file: !1115, line: 49)
!1186 = !DISubprogram(name: "putwc", scope: !869, file: !869, line: 105, type: !1140, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1188, file: !1115, line: 50)
!1188 = !DISubprogram(name: "putwchar", scope: !869, file: !869, line: 111, type: !1189, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1189 = !DISubroutineType(types: !1190)
!1190 = !{!1122, !1137}
!1191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1192, file: !1115, line: 51)
!1192 = !DISubprogram(name: "swprintf", linkageName: "?swprintf@@YAHQEA_WQEB_WZZ", scope: !869, file: !869, line: 1803, type: !1193, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1193 = !DISubroutineType(types: !1194)
!1194 = !{!6, !1195, !1156, null}
!1195 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1136)
!1196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1197, file: !1115, line: 52)
!1197 = !DISubprogram(name: "swscanf", scope: !869, file: !869, line: 2018, type: !1198, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1198 = !DISubroutineType(types: !1199)
!1199 = !{!6, !1156, !1156, null}
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1201, file: !1115, line: 53)
!1201 = !DISubprogram(name: "ungetwc", scope: !869, file: !869, line: 121, type: !1202, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1202 = !DISubroutineType(types: !1203)
!1203 = !{!1122, !1122, !884}
!1204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1205, file: !1115, line: 54)
!1205 = !DISubprogram(name: "vfwprintf", scope: !869, file: !869, line: 314, type: !1206, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1206 = !DISubroutineType(types: !1207)
!1207 = !{!6, !914, !1156, !1014}
!1208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1209, file: !1115, line: 55)
!1209 = !DISubprogram(name: "vswprintf", linkageName: "?vswprintf@@YAHQEA_WQEB_WPEAD@Z", scope: !869, file: !869, line: 1817, type: !1210, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1210 = !DISubroutineType(types: !1211)
!1211 = !{!6, !1195, !1156, !1014}
!1212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1213, file: !1115, line: 56)
!1213 = !DISubprogram(name: "vwprintf", scope: !869, file: !869, line: 404, type: !1214, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1214 = !DISubroutineType(types: !1215)
!1215 = !{!6, !1156, !1014}
!1216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1217, file: !1115, line: 57)
!1217 = !DISubprogram(name: "wcrtomb", scope: !1125, file: !1125, line: 125, type: !1218, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1218 = !DISubroutineType(types: !1219)
!1219 = !{!874, !34, !1137, !1169}
!1220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1221, file: !1115, line: 58)
!1221 = !DISubprogram(name: "wprintf", scope: !869, file: !869, line: 608, type: !1222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1222 = !DISubroutineType(types: !1223)
!1223 = !{!6, !1156, null}
!1224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1225, file: !1115, line: 59)
!1225 = !DISubprogram(name: "wscanf", scope: !869, file: !869, line: 933, type: !1222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1227, file: !1115, line: 60)
!1227 = !DISubprogram(name: "wcsrtombs", scope: !1125, file: !1125, line: 152, type: !1228, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1228 = !DISubroutineType(types: !1229)
!1229 = !{!874, !34, !1230, !874, !1169}
!1230 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1146, size: 64)
!1231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1232, file: !1115, line: 61)
!1232 = !DISubprogram(name: "wcstol", scope: !1233, file: !1233, line: 134, type: !1234, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1233 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_wstdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "5b96d4421a65eb4a3e16dd6dc0574ba7")
!1234 = !DISubroutineType(types: !1235)
!1235 = !{!937, !1146, !1236, !6}
!1236 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1136, size: 64)
!1237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1238, file: !1115, line: 62)
!1238 = !DISubprogram(name: "wcscat", scope: !1239, file: !1239, line: 100, type: !1240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1239 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_wstring.h", directory: "", checksumkind: CSK_MD5, checksum: "1e9764c381f45184fd3c47aaada60bf9")
!1240 = !DISubroutineType(types: !1241)
!1241 = !{!1136, !1136, !1146}
!1242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1243, file: !1115, line: 63)
!1243 = !DISubprogram(name: "wcschr", linkageName: "?wcschr@@YAPEA_WPEA_W_W@Z", scope: !1239, file: !1239, line: 529, type: !1244, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1244 = !DISubroutineType(types: !1245)
!1245 = !{!1136, !1136, !1137}
!1246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1247, file: !1115, line: 64)
!1247 = !DISubprogram(name: "wcscmp", scope: !1239, file: !1239, line: 108, type: !1248, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1248 = !DISubroutineType(types: !1249)
!1249 = !{!6, !1146, !1146}
!1250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1251, file: !1115, line: 65)
!1251 = !DISubprogram(name: "wcscoll", scope: !1239, file: !1239, line: 462, type: !1248, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1253, file: !1115, line: 66)
!1253 = !DISubprogram(name: "wcscpy", scope: !1239, file: !1239, line: 119, type: !1240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1255, file: !1115, line: 67)
!1255 = !DISubprogram(name: "wcscspn", scope: !1239, file: !1239, line: 126, type: !1256, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1256 = !DISubroutineType(types: !1257)
!1257 = !{!874, !1146, !1146}
!1258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1259, file: !1115, line: 68)
!1259 = !DISubprogram(name: "wcslen", scope: !1239, file: !1239, line: 132, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1260 = !DISubroutineType(types: !1261)
!1261 = !{!874, !1146}
!1262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1263, file: !1115, line: 69)
!1263 = !DISubprogram(name: "wcsncat", scope: !1239, file: !1239, line: 178, type: !1264, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1264 = !DISubroutineType(types: !1265)
!1265 = !{!1136, !1136, !1146, !874}
!1266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1267, file: !1115, line: 70)
!1267 = !DISubprogram(name: "wcsncmp", scope: !1239, file: !1239, line: 187, type: !1268, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1268 = !DISubroutineType(types: !1269)
!1269 = !{!6, !1146, !1146, !874}
!1270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1271, file: !1115, line: 71)
!1271 = !DISubprogram(name: "wcsncpy", scope: !1239, file: !1239, line: 200, type: !1264, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1273, file: !1115, line: 72)
!1273 = !DISubprogram(name: "wcspbrk", linkageName: "?wcspbrk@@YAPEA_WPEA_WPEB_W@Z", scope: !1239, file: !1239, line: 535, type: !1240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1275, file: !1115, line: 73)
!1275 = !DISubprogram(name: "wcsrchr", linkageName: "?wcsrchr@@YAPEA_WPEA_W_W@Z", scope: !1239, file: !1239, line: 541, type: !1244, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1277, file: !1115, line: 74)
!1277 = !DISubprogram(name: "wcsspn", scope: !1239, file: !1239, line: 215, type: !1256, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1279, file: !1115, line: 75)
!1279 = !DISubprogram(name: "wcstod", scope: !1233, file: !1233, line: 121, type: !1280, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1280 = !DISubroutineType(types: !1281)
!1281 = !{!1282, !1146, !1236}
!1282 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!1283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1284, file: !1115, line: 76)
!1284 = !DISubprogram(name: "wcstoul", scope: !1233, file: !1233, line: 164, type: !1285, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1285 = !DISubroutineType(types: !1286)
!1286 = !{!307, !1146, !1236, !6}
!1287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1288, file: !1115, line: 77)
!1288 = !DISubprogram(name: "wcsstr", linkageName: "?wcsstr@@YAPEA_WPEA_WPEB_W@Z", scope: !1239, file: !1239, line: 548, type: !1240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1290, file: !1115, line: 78)
!1290 = !DISubprogram(name: "wcstok", linkageName: "?wcstok@@YAPEA_WPEA_WPEB_W@Z", scope: !1239, file: !1239, line: 253, type: !1240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1292, file: !1115, line: 79)
!1292 = !DISubprogram(name: "wcsxfrm", scope: !1239, file: !1239, line: 446, type: !1293, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1293 = !DISubroutineType(types: !1294)
!1294 = !{!874, !1136, !1146, !874}
!1295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1296, file: !1115, line: 80)
!1296 = !DISubprogram(name: "wctob", scope: !1125, file: !1125, line: 160, type: !1297, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1297 = !DISubroutineType(types: !1298)
!1298 = !{!6, !1122}
!1299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1300, file: !1115, line: 81)
!1300 = !DISubprogram(name: "wmemchr", linkageName: "?wmemchr@@YAPEA_WPEA_W_W_K@Z", scope: !1125, file: !1125, line: 268, type: !1301, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1301 = !DISubroutineType(types: !1302)
!1302 = !{!1136, !1136, !1137, !874}
!1303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1304, file: !1115, line: 82)
!1304 = !DISubprogram(name: "wmemcmp", scope: !1125, file: !1125, line: 213, type: !1268, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1306, file: !1115, line: 83)
!1306 = !DISubprogram(name: "wmemcpy", scope: !1125, file: !1125, line: 229, type: !1264, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1308, file: !1115, line: 84)
!1308 = !DISubprogram(name: "wmemmove", scope: !1125, file: !1125, line: 240, type: !1264, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1310, file: !1115, line: 85)
!1310 = !DISubprogram(name: "wmemset", scope: !1125, file: !1125, line: 252, type: !1301, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1312, file: !1115, line: 86)
!1312 = !DISubprogram(name: "wcsftime", scope: !1120, file: !1120, line: 69, type: !1313, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1313 = !DISubroutineType(types: !1314)
!1314 = !{!874, !1136, !874, !1146, !1315}
!1315 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1316, size: 64)
!1316 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1119)
!1317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1318, file: !1115, line: 88)
!1318 = !DISubprogram(name: "vfwscanf", scope: !869, file: !869, line: 731, type: !1206, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1320, file: !1115, line: 89)
!1320 = !DISubprogram(name: "vswscanf", scope: !869, file: !869, line: 1900, type: !1321, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1321 = !DISubroutineType(types: !1322)
!1322 = !{!6, !1146, !1146, !1014}
!1323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1324, file: !1115, line: 90)
!1324 = !DISubprogram(name: "vwscanf", scope: !869, file: !869, line: 793, type: !1214, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1326, file: !1115, line: 91)
!1326 = !DISubprogram(name: "wcstof", scope: !1233, file: !1233, line: 207, type: !1327, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1327 = !DISubroutineType(types: !1328)
!1328 = !{!826, !1146, !1236}
!1329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1330, file: !1115, line: 92)
!1330 = !DISubprogram(name: "wcstold", scope: !1233, file: !1233, line: 194, type: !1331, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1331 = !DISubroutineType(types: !1332)
!1332 = !{!1333, !1146, !1236}
!1333 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!1334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1335, file: !1115, line: 93)
!1335 = !DISubprogram(name: "wcstoll", scope: !1233, file: !1233, line: 149, type: !1336, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1336 = !DISubroutineType(types: !1337)
!1337 = !{!64, !1146, !1236, !6}
!1338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1339, file: !1115, line: 94)
!1339 = !DISubprogram(name: "wcstoull", scope: !1233, file: !1233, line: 179, type: !1340, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1340 = !DISubroutineType(types: !1341)
!1341 = !{!30, !1146, !1236, !6}
!1342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1343, file: !33, line: 94)
!1343 = !DIDerivedType(tag: DW_TAG_typedef, name: "nullptr_t", scope: !14, file: !33, line: 93, baseType: !1344)
!1344 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "decltype(nullptr)")
!1345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !63, file: !1346, line: 23)
!1346 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\cstddef", directory: "", checksumkind: CSK_MD5, checksum: "1479f3900768e26e8836fd19109e117d")
!1347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !32, file: !1346, line: 24)
!1348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1349, file: !1346, line: 95)
!1349 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", scope: !14, file: !1346, line: 25, baseType: !1282)
!1350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !32, file: !1351, line: 36)
!1351 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\cstdlib", directory: "", checksumkind: CSK_MD5, checksum: "721d4b06441c95b75ef8fd32d75af028")
!1352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1353, file: !1351, line: 37)
!1353 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !1354, line: 279, baseType: !1355)
!1354 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "f957baaaf7f972e5b8d08c2855b49589")
!1355 = !DICompositeType(tag: DW_TAG_structure_type, name: "_div_t", file: !1354, line: 275, size: 64, flags: DIFlagFwdDecl, identifier: ".?AU_div_t@@")
!1356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1357, file: !1351, line: 38)
!1357 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !1354, line: 285, baseType: !1358)
!1358 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_ldiv_t", file: !1354, line: 281, size: 64, flags: DIFlagTypePassByValue, elements: !1359, identifier: ".?AU_ldiv_t@@")
!1359 = !{!1360, !1361}
!1360 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1358, file: !1354, line: 283, baseType: !937, size: 32)
!1361 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1358, file: !1354, line: 284, baseType: !937, size: 32, offset: 32)
!1362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1363, file: !1351, line: 39)
!1363 = !DISubprogram(name: "abort", scope: !1354, file: !1354, line: 60, type: !277, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1365, file: !1351, line: 40)
!1365 = !DISubprogram(name: "abs", linkageName: "?abs@@YAOO@Z", scope: !1351, file: !1351, line: 31, type: !1366, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1366 = !DISubroutineType(types: !1367)
!1367 = !{!1333, !1333}
!1368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1369, file: !1351, line: 41)
!1369 = !DISubprogram(name: "atexit", scope: !1354, file: !1354, line: 144, type: !1370, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1370 = !DISubroutineType(types: !1371)
!1371 = !{!6, !1372}
!1372 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !277, size: 64)
!1373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1374, file: !1351, line: 42)
!1374 = !DISubprogram(name: "atof", scope: !1354, file: !1354, line: 450, type: !1375, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1375 = !DISubroutineType(types: !1376)
!1376 = !{!1282, !39}
!1377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1378, file: !1351, line: 43)
!1378 = !DISubprogram(name: "atoi", scope: !1354, file: !1354, line: 451, type: !972, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1380, file: !1351, line: 44)
!1380 = !DISubprogram(name: "atol", scope: !1354, file: !1354, line: 452, type: !1381, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1381 = !DISubroutineType(types: !1382)
!1382 = !{!937, !39}
!1383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1384, file: !1351, line: 45)
!1384 = !DISubprogram(name: "bsearch", scope: !1385, file: !1385, line: 52, type: !1386, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1385 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_search.h", directory: "", checksumkind: CSK_MD5, checksum: "2a0a917cdb5d977c5fc7f09a83507d29")
!1386 = !DISubroutineType(types: !1387)
!1387 = !{!31, !118, !118, !32, !32, !1388}
!1388 = !DIDerivedType(tag: DW_TAG_typedef, name: "_CoreCrtNonSecureSearchSortCompareFunction", file: !1385, line: 24, baseType: !1389)
!1389 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1390, size: 64)
!1390 = !DISubroutineType(types: !1391)
!1391 = !{!6, !118, !118}
!1392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1393, file: !1351, line: 46)
!1393 = !DISubprogram(name: "calloc", scope: !1394, file: !1394, line: 66, type: !1395, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1394 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_malloc.h", directory: "", checksumkind: CSK_MD5, checksum: "e7cb4d2b08d978a19e592af472eb7bd0")
!1395 = !DISubroutineType(types: !1396)
!1396 = !{!31, !32, !32}
!1397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1398, file: !1351, line: 47)
!1398 = !DISubprogram(name: "div", linkageName: "?div@@YA?AU_lldiv_t@@_J0@Z", scope: !1354, file: !1354, line: 378, type: !1399, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1399 = !DISubroutineType(types: !1400)
!1400 = !{!1401, !1406, !1406}
!1401 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !1354, line: 291, baseType: !1402)
!1402 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_lldiv_t", file: !1354, line: 287, size: 128, flags: DIFlagTypePassByValue, elements: !1403, identifier: ".?AU_lldiv_t@@")
!1403 = !{!1404, !1405}
!1404 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1402, file: !1354, line: 289, baseType: !64, size: 64)
!1405 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1402, file: !1354, line: 290, baseType: !64, size: 64, offset: 64)
!1406 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !64)
!1407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1408, file: !1351, line: 48)
!1408 = !DISubprogram(name: "exit", scope: !1354, file: !1354, line: 56, type: !1409, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1409 = !DISubroutineType(types: !1410)
!1410 = !{null, !6}
!1411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1412, file: !1351, line: 49)
!1412 = !DISubprogram(name: "free", scope: !1394, file: !1394, line: 89, type: !1413, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1413 = !DISubroutineType(types: !1414)
!1414 = !{null, !31}
!1415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1416, file: !1351, line: 50)
!1416 = !DISubprogram(name: "labs", scope: !1354, file: !1354, line: 294, type: !1417, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1417 = !DISubroutineType(types: !1418)
!1418 = !{!937, !937}
!1419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1420, file: !1351, line: 51)
!1420 = !DISubprogram(name: "ldiv", scope: !1354, file: !1354, line: 303, type: !1421, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1421 = !DISubroutineType(types: !1422)
!1422 = !{!1357, !937, !937}
!1423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1424, file: !1351, line: 52)
!1424 = !DISubprogram(name: "malloc", scope: !1394, file: !1394, line: 101, type: !1425, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1425 = !DISubroutineType(types: !1426)
!1426 = !{!31, !32}
!1427 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1428, file: !1351, line: 53)
!1428 = !DISubprogram(name: "mblen", scope: !1354, file: !1354, line: 852, type: !1429, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1429 = !DISubroutineType(types: !1430)
!1430 = !{!6, !39, !32}
!1431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1432, file: !1351, line: 54)
!1432 = !DISubprogram(name: "mbstowcs", scope: !1354, file: !1354, line: 924, type: !1433, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1433 = !DISubroutineType(types: !1434)
!1434 = !{!32, !1136, !39, !32}
!1435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1436, file: !1351, line: 55)
!1436 = !DISubprogram(name: "mbtowc", scope: !1354, file: !1354, line: 893, type: !1437, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1437 = !DISubroutineType(types: !1438)
!1438 = !{!6, !1136, !39, !32}
!1439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1440, file: !1351, line: 56)
!1440 = !DISubprogram(name: "qsort", scope: !1385, file: !1385, line: 60, type: !1441, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1441 = !DISubroutineType(types: !1442)
!1442 = !{null, !31, !32, !32, !1388}
!1443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1444, file: !1351, line: 57)
!1444 = !DISubprogram(name: "rand", scope: !1354, file: !1354, line: 352, type: !842, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1446, file: !1351, line: 58)
!1446 = !DISubprogram(name: "realloc", scope: !1394, file: !1394, line: 126, type: !1447, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1447 = !DISubroutineType(types: !1448)
!1448 = !{!31, !31, !32}
!1449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1450, file: !1351, line: 59)
!1450 = !DISubprogram(name: "srand", scope: !1354, file: !1354, line: 350, type: !1451, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1451 = !DISubroutineType(types: !1452)
!1452 = !{null, !1453}
!1453 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!1454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1455, file: !1351, line: 60)
!1455 = !DISubprogram(name: "strtod", scope: !1354, file: !1354, line: 502, type: !1456, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1456 = !DISubroutineType(types: !1457)
!1457 = !{!1282, !39, !1458}
!1458 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!1459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1460, file: !1351, line: 61)
!1460 = !DISubprogram(name: "strtol", scope: !1354, file: !1354, line: 528, type: !1461, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1461 = !DISubroutineType(types: !1462)
!1462 = !{!937, !39, !1458, !6}
!1463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1464, file: !1351, line: 62)
!1464 = !DISubprogram(name: "strtoul", scope: !1354, file: !1354, line: 558, type: !1465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1465 = !DISubroutineType(types: !1466)
!1466 = !{!307, !39, !1458, !6}
!1467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1468, file: !1351, line: 63)
!1468 = !DISubprogram(name: "wcstombs", scope: !1354, file: !1354, line: 1012, type: !1469, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1469 = !DISubroutineType(types: !1470)
!1470 = !{!32, !34, !1146, !32}
!1471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1472, file: !1351, line: 64)
!1472 = !DISubprogram(name: "wctomb", scope: !1354, file: !1354, line: 963, type: !1473, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1473 = !DISubroutineType(types: !1474)
!1474 = !{!6, !34, !1137}
!1475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1401, file: !1351, line: 66)
!1476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1477, file: !1351, line: 69)
!1477 = !DISubprogram(name: "getenv", scope: !1354, file: !1354, line: 1184, type: !1478, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1478 = !DISubroutineType(types: !1479)
!1479 = !{!34, !39}
!1480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1481, file: !1351, line: 70)
!1481 = !DISubprogram(name: "system", scope: !1354, file: !1354, line: 1211, type: !972, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1483, file: !1351, line: 73)
!1483 = !DISubprogram(name: "atoll", scope: !1354, file: !1354, line: 453, type: !1484, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1484 = !DISubroutineType(types: !1485)
!1485 = !{!64, !39}
!1486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1487, file: !1351, line: 74)
!1487 = !DISubprogram(name: "llabs", scope: !1354, file: !1354, line: 295, type: !1488, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1488 = !DISubroutineType(types: !1489)
!1489 = !{!64, !64}
!1490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1491, file: !1351, line: 75)
!1491 = !DISubprogram(name: "lldiv", scope: !1354, file: !1354, line: 304, type: !1492, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1492 = !DISubroutineType(types: !1493)
!1493 = !{!1401, !64, !64}
!1494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1495, file: !1351, line: 76)
!1495 = !DISubprogram(name: "strtof", scope: !1354, file: !1354, line: 489, type: !1496, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1496 = !DISubroutineType(types: !1497)
!1497 = !{!826, !39, !1458}
!1498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1499, file: !1351, line: 77)
!1499 = !DISubprogram(name: "strtold", scope: !1354, file: !1354, line: 515, type: !1500, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1500 = !DISubroutineType(types: !1501)
!1501 = !{!1333, !39, !1458}
!1502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1503, file: !1351, line: 78)
!1503 = !DISubprogram(name: "strtoll", scope: !1354, file: !1354, line: 543, type: !1504, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1504 = !DISubroutineType(types: !1505)
!1505 = !{!64, !39, !1458, !6}
!1506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1507, file: !1351, line: 79)
!1507 = !DISubprogram(name: "strtoull", scope: !1354, file: !1354, line: 573, type: !1508, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1508 = !DISubroutineType(types: !1509)
!1509 = !{!30, !39, !1458, !6}
!1510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1511, file: !1351, line: 81)
!1511 = !DISubprogram(name: "_Exit", scope: !1354, file: !1354, line: 58, type: !1409, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1513, file: !1351, line: 82)
!1513 = !DISubprogram(name: "at_quick_exit", scope: !1354, file: !1354, line: 148, type: !1370, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1515, file: !1351, line: 83)
!1515 = !DISubprogram(name: "quick_exit", scope: !1354, file: !1354, line: 59, type: !1409, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1517, file: !1520, line: 22)
!1517 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !1518, line: 18, baseType: !1519)
!1518 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "56e2956fe219a08d408dc2fb7a857cfc")
!1519 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!1520 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\cstdint", directory: "", checksumkind: CSK_MD5, checksum: "a82d27cf0f774e165b06000e45047591")
!1521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1522, file: !1520, line: 23)
!1522 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !1518, line: 19, baseType: !1523)
!1523 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!1524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1525, file: !1520, line: 24)
!1525 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !1518, line: 20, baseType: !6)
!1526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1527, file: !1520, line: 25)
!1527 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !1518, line: 21, baseType: !64)
!1528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1529, file: !1520, line: 26)
!1529 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !1518, line: 22, baseType: !1530)
!1530 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!1531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1532, file: !1520, line: 27)
!1532 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !1518, line: 23, baseType: !309)
!1533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1534, file: !1520, line: 28)
!1534 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !1518, line: 24, baseType: !1453)
!1535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1536, file: !1520, line: 29)
!1536 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !1518, line: 25, baseType: !30)
!1537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1538, file: !1520, line: 31)
!1538 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !1518, line: 27, baseType: !1519)
!1539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1540, file: !1520, line: 32)
!1540 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !1518, line: 28, baseType: !1523)
!1541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1542, file: !1520, line: 33)
!1542 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !1518, line: 29, baseType: !6)
!1543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1544, file: !1520, line: 34)
!1544 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !1518, line: 30, baseType: !64)
!1545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1546, file: !1520, line: 35)
!1546 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !1518, line: 31, baseType: !1530)
!1547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1548, file: !1520, line: 36)
!1548 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !1518, line: 32, baseType: !309)
!1549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1550, file: !1520, line: 37)
!1550 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !1518, line: 33, baseType: !1453)
!1551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1552, file: !1520, line: 38)
!1552 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !1518, line: 34, baseType: !30)
!1553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1554, file: !1520, line: 40)
!1554 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !1518, line: 36, baseType: !1519)
!1555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1556, file: !1520, line: 41)
!1556 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !1518, line: 37, baseType: !6)
!1557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1558, file: !1520, line: 42)
!1558 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !1518, line: 38, baseType: !6)
!1559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1560, file: !1520, line: 43)
!1560 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !1518, line: 39, baseType: !64)
!1561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1562, file: !1520, line: 44)
!1562 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !1518, line: 40, baseType: !1530)
!1563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1564, file: !1520, line: 45)
!1564 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !1518, line: 41, baseType: !1453)
!1565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1566, file: !1520, line: 46)
!1566 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !1518, line: 42, baseType: !1453)
!1567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1568, file: !1520, line: 47)
!1568 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !1518, line: 43, baseType: !30)
!1569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1570, file: !1520, line: 49)
!1570 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !1518, line: 45, baseType: !64)
!1571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1572, file: !1520, line: 50)
!1572 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !875, line: 195, baseType: !64)
!1573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1574, file: !1520, line: 51)
!1574 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !1518, line: 46, baseType: !30)
!1575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !28, file: !1520, line: 52)
!1576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1517, file: !1520, line: 56)
!1577 = !DINamespace(name: "tr1", scope: !14)
!1578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1522, file: !1520, line: 57)
!1579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1525, file: !1520, line: 58)
!1580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1527, file: !1520, line: 59)
!1581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1529, file: !1520, line: 60)
!1582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1532, file: !1520, line: 61)
!1583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1534, file: !1520, line: 62)
!1584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1536, file: !1520, line: 63)
!1585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1538, file: !1520, line: 65)
!1586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1540, file: !1520, line: 66)
!1587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1542, file: !1520, line: 67)
!1588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1544, file: !1520, line: 68)
!1589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1546, file: !1520, line: 69)
!1590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1548, file: !1520, line: 70)
!1591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1550, file: !1520, line: 71)
!1592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1552, file: !1520, line: 72)
!1593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1554, file: !1520, line: 74)
!1594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1556, file: !1520, line: 75)
!1595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1558, file: !1520, line: 76)
!1596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1560, file: !1520, line: 77)
!1597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1562, file: !1520, line: 78)
!1598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1564, file: !1520, line: 79)
!1599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1566, file: !1520, line: 80)
!1600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1568, file: !1520, line: 81)
!1601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1570, file: !1520, line: 83)
!1602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1572, file: !1520, line: 84)
!1603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !1574, file: !1520, line: 85)
!1604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !28, file: !1520, line: 86)
!1605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !136, file: !1606, line: 2366)
!1606 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\type_traits", directory: "", checksumkind: CSK_MD5, checksum: "55860436635b6df159970c2c6dabdaae")
!1607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1577, entity: !66, file: !1606, line: 2408)
!1608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1609, file: !1611, line: 37)
!1609 = !DISubprogram(name: "terminate", scope: !1610, file: !1610, line: 33, type: !277, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1610 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_terminate.h", directory: "", checksumkind: CSK_MD5, checksum: "2a539d6fe462a6cd4820acb34d25230b")
!1611 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\exception", directory: "", checksumkind: CSK_MD5, checksum: "f8e93cba096d8f4141d5f7504f6592c1")
!1612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1613, file: !1611, line: 40)
!1613 = !DISubprogram(name: "set_terminate", scope: !1610, file: !1610, line: 37, type: !1614, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1614 = !DISubroutineType(types: !1615)
!1615 = !{!1616, !1616}
!1616 = !DIDerivedType(tag: DW_TAG_typedef, name: "terminate_handler", file: !1610, line: 22, baseType: !1372)
!1617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1616, file: !1611, line: 41)
!1618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1619, file: !1611, line: 49)
!1619 = !DISubprogram(name: "unexpected", scope: !1620, file: !1620, line: 35, type: !277, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1620 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\eh.h", directory: "", checksumkind: CSK_MD5, checksum: "4a999be6308e84b5845d84cd2463ce9d")
!1621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1622, file: !1611, line: 52)
!1622 = !DISubprogram(name: "set_unexpected", scope: !1620, file: !1620, line: 39, type: !1623, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1623 = !DISubroutineType(types: !1624)
!1624 = !{!1625, !1625}
!1625 = !DIDerivedType(tag: DW_TAG_typedef, name: "unexpected_handler", file: !1620, line: 23, baseType: !1372)
!1626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1625, file: !1611, line: 53)
!1627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1628, file: !1630, line: 38)
!1628 = !DISubprogram(name: "isalnum", scope: !1629, file: !1629, line: 53, type: !964, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1629 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "637d97803cfc8841aa28027834c41330")
!1630 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\cctype", directory: "", checksumkind: CSK_MD5, checksum: "02efabf6237906f874632fa4f9f858e4")
!1631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1632, file: !1630, line: 39)
!1632 = !DISubprogram(name: "isalpha", scope: !1629, file: !1629, line: 31, type: !964, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1633 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1634, file: !1630, line: 40)
!1634 = !DISubprogram(name: "iscntrl", scope: !1629, file: !1629, line: 59, type: !964, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1636, file: !1630, line: 41)
!1636 = !DISubprogram(name: "isdigit", scope: !1629, file: !1629, line: 39, type: !964, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1638, file: !1630, line: 42)
!1638 = !DISubprogram(name: "isgraph", scope: !1629, file: !1629, line: 57, type: !964, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1640, file: !1630, line: 43)
!1640 = !DISubprogram(name: "islower", scope: !1629, file: !1629, line: 35, type: !964, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1642, file: !1630, line: 44)
!1642 = !DISubprogram(name: "isprint", scope: !1629, file: !1629, line: 55, type: !964, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1644, file: !1630, line: 45)
!1644 = !DISubprogram(name: "ispunct", scope: !1629, file: !1629, line: 49, type: !964, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1646, file: !1630, line: 46)
!1646 = !DISubprogram(name: "isspace", scope: !1629, file: !1629, line: 46, type: !964, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1648, file: !1630, line: 47)
!1648 = !DISubprogram(name: "isupper", scope: !1629, file: !1629, line: 33, type: !964, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1650, file: !1630, line: 48)
!1650 = !DISubprogram(name: "isxdigit", scope: !1629, file: !1629, line: 42, type: !964, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1652, file: !1630, line: 49)
!1652 = !DISubprogram(name: "tolower", scope: !1629, file: !1629, line: 66, type: !964, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1654, file: !1630, line: 50)
!1654 = !DISubprogram(name: "toupper", scope: !1629, file: !1629, line: 63, type: !964, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1656, file: !1630, line: 52)
!1656 = !DISubprogram(name: "isblank", scope: !1629, file: !1629, line: 51, type: !964, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1657 = !{!"/FAILIFMISMATCH:\22_MSC_VER=1900\22"}
!1658 = !{!"/FAILIFMISMATCH:\22_ITERATOR_DEBUG_LEVEL=0\22"}
!1659 = !{!"/FAILIFMISMATCH:\22RuntimeLibrary=MT_StaticRelease\22"}
!1660 = !{!"/DEFAULTLIB:libcpmt.lib"}
!1661 = !{!"/FAILIFMISMATCH:\22_CRT_STDIO_ISO_WIDE_SPECIFIERS=0\22"}
!1662 = !{i32 2, !"CodeView", i32 1}
!1663 = !{i32 2, !"Debug Info Version", i32 3}
!1664 = !{i32 1, !"wchar_size", i32 2}
!1665 = !{i32 7, !"PIC Level", i32 2}
!1666 = !{!"clang version 12.0.0"}
!1667 = distinct !DISubprogram(name: "`dynamic initializer for 'globalString'", scope: !1668, file: !1668, type: !277, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !209)
!1668 = !DIFile(filename: "noobar.cpp", directory: "E:\\Documents\\Work Stuff\\Active Work Files\\Code Examples\\test_cpp01")
!1669 = !DILocation(line: 7, column: 28, scope: !1670)
!1670 = !DILexicalBlockFile(scope: !1667, file: !3, discriminator: 0)
!1671 = !DILocation(line: 0, scope: !1667)
!1672 = !DILocation(line: 7, column: 13, scope: !1670)
!1673 = distinct !DISubprogram(name: "basic_string", linkageName: "??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@QEBD@Z", scope: !41, file: !42, line: 2517, type: !471, scopeLine: 2517, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !470, retainedNodes: !1674)
!1674 = !{!1675, !1676, !1678, !1680}
!1675 = !DILocalVariable(name: "_Ptr", arg: 2, scope: !1673, file: !42, line: 2517, type: !314)
!1676 = !DILocalVariable(name: "this", arg: 1, scope: !1673, type: !1677, flags: DIFlagArtificial | DIFlagObjectPointer)
!1677 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!1678 = !DILocalVariable(name: "_Alproxy", scope: !1679, file: !42, line: 2518, type: !206)
!1679 = distinct !DILexicalBlock(scope: !1673, file: !42, line: 2517, column: 113)
!1680 = !DILocalVariable(name: "_Proxy", scope: !1679, file: !42, line: 2519, type: !1681)
!1681 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Container_proxy_ptr<std::basic_string<char>::_Alty>", scope: !14, file: !46, line: 1344, baseType: !1682)
!1682 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Fake_proxy_ptr_impl", scope: !14, file: !46, line: 1284, size: 8, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !1683, identifier: ".?AU_Fake_proxy_ptr_impl@std@@")
!1683 = !{!1684, !1690, !1694, !1703, !1708, !1712}
!1684 = !DISubprogram(name: "_Fake_proxy_ptr_impl", scope: !1682, file: !46, line: 1285, type: !1685, scopeLine: 1285, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized | DISPFlagDeleted)
!1685 = !DISubroutineType(types: !1686)
!1686 = !{null, !1687, !1688}
!1687 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1682, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1688 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1689, size: 64)
!1689 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1682)
!1690 = !DISubprogram(name: "operator=", linkageName: "??4_Fake_proxy_ptr_impl@std@@QEAAAEAU01@AEBU01@@Z", scope: !1682, file: !46, line: 1286, type: !1691, scopeLine: 1286, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized | DISPFlagDeleted)
!1691 = !DISubroutineType(types: !1692)
!1692 = !{!1693, !1687, !1688}
!1693 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1682, size: 64)
!1694 = !DISubprogram(name: "_Fake_proxy_ptr_impl", scope: !1682, file: !46, line: 1287, type: !1695, scopeLine: 1287, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1695 = !DISubroutineType(types: !1696)
!1696 = !{null, !1687, !206, !1697}
!1697 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Leave_proxy_unbound", scope: !14, file: !46, line: 1280, size: 8, flags: DIFlagTypePassByValue, elements: !1698, identifier: ".?AU_Leave_proxy_unbound@std@@")
!1698 = !{!1699}
!1699 = !DISubprogram(name: "_Leave_proxy_unbound", scope: !1697, file: !46, line: 1281, type: !1700, scopeLine: 1281, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1700 = !DISubroutineType(types: !1701)
!1701 = !{null, !1702}
!1702 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1697, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1703 = !DISubprogram(name: "_Fake_proxy_ptr_impl", scope: !1682, file: !46, line: 1288, type: !1704, scopeLine: 1288, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1704 = !DISubroutineType(types: !1705)
!1705 = !{null, !1687, !206, !1706}
!1706 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1707, size: 64)
!1707 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !193)
!1708 = !DISubprogram(name: "_Bind", linkageName: "?_Bind@_Fake_proxy_ptr_impl@std@@QEAAXAEBU_Fake_allocator@2@PEAU_Container_base0@2@@Z", scope: !1682, file: !46, line: 1290, type: !1709, scopeLine: 1290, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1709 = !DISubroutineType(types: !1710)
!1710 = !{null, !1687, !206, !1711}
!1711 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !193, size: 64)
!1712 = !DISubprogram(name: "_Release", linkageName: "?_Release@_Fake_proxy_ptr_impl@std@@QEAAXXZ", scope: !1682, file: !46, line: 1291, type: !1713, scopeLine: 1291, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1713 = !DISubroutineType(types: !1714)
!1714 = !{null, !1687}
!1715 = !{!1716, !1716, i64 0}
!1716 = !{!"any pointer", !1717, i64 0}
!1717 = !{!"omnipotent char", !1718, i64 0}
!1718 = !{!"Simple C++ TBAA"}
!1719 = !DILocation(line: 2517, column: 67, scope: !1673)
!1720 = !DILocation(line: 0, scope: !1673)
!1721 = !DILocation(line: 2517, column: 75, scope: !1673)
!1722 = !DILocation(line: 2518, column: 9, scope: !1679)
!1723 = !DILocation(line: 2518, column: 16, scope: !1679)
!1724 = !DILocation(line: 2519, column: 9, scope: !1679)
!1725 = !DILocation(line: 2519, column: 37, scope: !1679)
!1726 = !DILocation(line: 2519, column: 54, scope: !1679)
!1727 = !DILocation(line: 2519, column: 62, scope: !1679)
!1728 = !DILocation(line: 2520, column: 9, scope: !1679)
!1729 = !DILocation(line: 2521, column: 16, scope: !1679)
!1730 = !DILocation(line: 2521, column: 9, scope: !1679)
!1731 = !DILocation(line: 2522, column: 16, scope: !1679)
!1732 = !DILocation(line: 2523, column: 5, scope: !1673)
!1733 = !DILocation(line: 2523, column: 5, scope: !1679)
!1734 = distinct !DISubprogram(name: "~basic_string", linkageName: "??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ", scope: !41, file: !42, line: 3002, type: !452, scopeLine: 3002, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !553, retainedNodes: !1735)
!1735 = !{!1736}
!1736 = !DILocalVariable(name: "this", arg: 1, scope: !1734, type: !1677, flags: DIFlagArtificial | DIFlagObjectPointer)
!1737 = !DILocation(line: 0, scope: !1734)
!1738 = !DILocation(line: 3003, column: 9, scope: !1739)
!1739 = distinct !DILexicalBlock(scope: !1734, file: !42, line: 3002, column: 53)
!1740 = !DILocation(line: 3010, column: 5, scope: !1739)
!1741 = !DILocation(line: 3010, column: 5, scope: !1734)
!1742 = distinct !DISubprogram(name: "`dynamic atexit destructor for 'globalString'", scope: !3, file: !3, line: 7, type: !277, scopeLine: 7, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !209)
!1743 = !DILocation(line: 0, scope: !1742)
!1744 = !DILocation(line: 7, column: 13, scope: !1742)
!1745 = !DILocation(line: 22, column: 2, scope: !841)
!1746 = !DILocation(line: 22, column: 14, scope: !841)
!1747 = !DILocation(line: 22, column: 26, scope: !841)
!1748 = !DILocation(line: 24, column: 7, scope: !847)
!1749 = !DILocation(line: 24, column: 11, scope: !847)
!1750 = !{!1751, !1751, i64 0}
!1751 = !{!"int", !1717, i64 0}
!1752 = !DILocation(line: 24, column: 16, scope: !851)
!1753 = !DILocation(line: 24, column: 17, scope: !851)
!1754 = !DILocation(line: 24, column: 2, scope: !847)
!1755 = !DILocation(line: 24, column: 2, scope: !851)
!1756 = !DILocation(line: 25, column: 7, scope: !849)
!1757 = !DILocation(line: 25, column: 11, scope: !849)
!1758 = !DILocation(line: 25, column: 15, scope: !855)
!1759 = !DILocation(line: 25, column: 16, scope: !855)
!1760 = !DILocation(line: 25, column: 3, scope: !849)
!1761 = !DILocation(line: 25, column: 3, scope: !855)
!1762 = !DILocation(line: 26, column: 8, scope: !853)
!1763 = !DILocation(line: 26, column: 12, scope: !853)
!1764 = !DILocation(line: 26, column: 16, scope: !1765)
!1765 = distinct !DILexicalBlock(scope: !853, file: !3, line: 26, column: 4)
!1766 = !DILocation(line: 26, column: 17, scope: !1765)
!1767 = !DILocation(line: 26, column: 4, scope: !853)
!1768 = !DILocation(line: 26, column: 4, scope: !1765)
!1769 = !DILocation(line: 27, column: 21, scope: !1770)
!1770 = distinct !DILexicalBlock(scope: !1765, file: !3, line: 26, column: 24)
!1771 = !DILocation(line: 27, column: 19, scope: !1770)
!1772 = !DILocation(line: 27, column: 17, scope: !1770)
!1773 = !DILocation(line: 27, column: 9, scope: !1770)
!1774 = !DILocation(line: 27, column: 7, scope: !1770)
!1775 = !DILocation(line: 28, column: 10, scope: !1770)
!1776 = !DILocation(line: 28, column: 7, scope: !1770)
!1777 = !DILocation(line: 29, column: 4, scope: !1770)
!1778 = !DILocation(line: 26, column: 21, scope: !1765)
!1779 = distinct !{!1779, !1767, !1780, !1781}
!1780 = !DILocation(line: 29, column: 4, scope: !853)
!1781 = !{!"llvm.loop.mustprogress"}
!1782 = !DILocation(line: 30, column: 3, scope: !854)
!1783 = !DILocation(line: 25, column: 20, scope: !855)
!1784 = distinct !{!1784, !1760, !1785, !1781}
!1785 = !DILocation(line: 30, column: 3, scope: !849)
!1786 = !DILocation(line: 31, column: 2, scope: !850)
!1787 = !DILocation(line: 24, column: 22, scope: !851)
!1788 = distinct !{!1788, !1754, !1789, !1781}
!1789 = !DILocation(line: 31, column: 2, scope: !847)
!1790 = !DILocation(line: 32, column: 6, scope: !1791)
!1791 = distinct !DILexicalBlock(scope: !841, file: !3, line: 32, column: 6)
!1792 = !DILocation(line: 32, column: 8, scope: !1791)
!1793 = !DILocation(line: 32, column: 6, scope: !841)
!1794 = !DILocation(line: 33, column: 10, scope: !1795)
!1795 = distinct !DILexicalBlock(scope: !1791, file: !3, line: 32, column: 13)
!1796 = !DILocation(line: 33, column: 3, scope: !1795)
!1797 = !DILocation(line: 34, column: 13, scope: !1798)
!1798 = distinct !DILexicalBlock(scope: !1791, file: !3, line: 34, column: 13)
!1799 = !DILocation(line: 34, column: 15, scope: !1798)
!1800 = !DILocation(line: 34, column: 13, scope: !1791)
!1801 = !DILocation(line: 35, column: 33, scope: !1802)
!1802 = distinct !DILexicalBlock(scope: !1798, file: !3, line: 34, column: 21)
!1803 = !DILocation(line: 35, column: 30, scope: !1802)
!1804 = !DILocation(line: 35, column: 18, scope: !1802)
!1805 = !DILocation(line: 35, column: 10, scope: !1802)
!1806 = !DILocation(line: 35, column: 3, scope: !1802)
!1807 = !DILocation(line: 37, column: 9, scope: !841)
!1808 = !DILocation(line: 37, column: 2, scope: !841)
!1809 = !DILocation(line: 38, column: 1, scope: !841)
!1810 = distinct !DISubprogram(name: "basic_string", linkageName: "??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@AEBV01@@Z", scope: !41, file: !42, line: 2450, type: !443, scopeLine: 2451, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !442, retainedNodes: !1811)
!1811 = !{!1812, !1813, !1814, !1816}
!1812 = !DILocalVariable(name: "_Right", arg: 2, scope: !1810, file: !42, line: 2450, type: !446)
!1813 = !DILocalVariable(name: "this", arg: 1, scope: !1810, type: !1677, flags: DIFlagArtificial | DIFlagObjectPointer)
!1814 = !DILocalVariable(name: "_Alproxy", scope: !1815, file: !42, line: 2452, type: !206)
!1815 = distinct !DILexicalBlock(scope: !1810, file: !42, line: 2451, column: 118)
!1816 = !DILocalVariable(name: "_Proxy", scope: !1815, file: !42, line: 2453, type: !1681)
!1817 = !DILocation(line: 2450, column: 61, scope: !1810)
!1818 = !DILocation(line: 0, scope: !1810)
!1819 = !DILocation(line: 2451, column: 11, scope: !1810)
!1820 = !DILocation(line: 2451, column: 48, scope: !1810)
!1821 = !DILocation(line: 2451, column: 100, scope: !1810)
!1822 = !DILocation(line: 2451, column: 107, scope: !1810)
!1823 = !DILocation(line: 2452, column: 9, scope: !1815)
!1824 = !DILocation(line: 2452, column: 16, scope: !1815)
!1825 = !DILocation(line: 2453, column: 9, scope: !1815)
!1826 = !DILocation(line: 2453, column: 37, scope: !1815)
!1827 = !DILocation(line: 2453, column: 54, scope: !1815)
!1828 = !DILocation(line: 2453, column: 62, scope: !1815)
!1829 = !DILocation(line: 2454, column: 32, scope: !1815)
!1830 = !DILocation(line: 2454, column: 9, scope: !1815)
!1831 = !DILocation(line: 2455, column: 16, scope: !1815)
!1832 = !DILocation(line: 2456, column: 5, scope: !1810)
!1833 = !DILocation(line: 2456, column: 5, scope: !1815)
!1834 = distinct !DISubprogram(name: "mul_add", linkageName: "?mul_add@@YAHHHH@Z", scope: !3, file: !3, line: 16, type: !1835, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1837)
!1835 = !DISubroutineType(types: !1836)
!1836 = !{!6, !6, !6, !6}
!1837 = !{!1838, !1839, !1840, !1841}
!1838 = !DILocalVariable(name: "z", arg: 3, scope: !1834, file: !3, line: 16, type: !6)
!1839 = !DILocalVariable(name: "y", arg: 2, scope: !1834, file: !3, line: 16, type: !6)
!1840 = !DILocalVariable(name: "x", arg: 1, scope: !1834, file: !3, line: 16, type: !6)
!1841 = !DILocalVariable(name: "q", scope: !1834, file: !3, line: 17, type: !6)
!1842 = !DILocation(line: 16, column: 38, scope: !1834)
!1843 = !DILocation(line: 16, column: 31, scope: !1834)
!1844 = !DILocation(line: 16, column: 24, scope: !1834)
!1845 = !DILocation(line: 17, column: 2, scope: !1834)
!1846 = !DILocation(line: 17, column: 6, scope: !1834)
!1847 = !DILocation(line: 17, column: 10, scope: !1834)
!1848 = !DILocation(line: 18, column: 9, scope: !1834)
!1849 = !DILocation(line: 18, column: 13, scope: !1834)
!1850 = !DILocation(line: 18, column: 11, scope: !1834)
!1851 = !DILocation(line: 18, column: 17, scope: !1834)
!1852 = !DILocation(line: 18, column: 15, scope: !1834)
!1853 = !DILocation(line: 19, column: 1, scope: !1834)
!1854 = !DILocation(line: 18, column: 2, scope: !1834)
!1855 = distinct !DISubprogram(name: "switchKind", linkageName: "?switchKind@@YAHH@Z", scope: !3, file: !3, line: 40, type: !964, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1856)
!1856 = !{!1857, !1858}
!1857 = !DILocalVariable(name: "choice", arg: 1, scope: !1855, file: !3, line: 40, type: !6)
!1858 = !DILocalVariable(name: "e", scope: !1855, file: !3, line: 41, type: !5)
!1859 = !DILocation(line: 40, column: 20, scope: !1855)
!1860 = !DILocation(line: 41, column: 2, scope: !1855)
!1861 = !DILocation(line: 41, column: 11, scope: !1855)
!1862 = !DILocation(line: 42, column: 9, scope: !1855)
!1863 = !{!1864, !1864, i64 0}
!1864 = !{!"?AW4elements@@", !1717, i64 0}
!1865 = !DILocation(line: 42, column: 2, scope: !1855)
!1866 = !DILocation(line: 52, column: 3, scope: !1867)
!1867 = distinct !DILexicalBlock(scope: !1855, file: !3, line: 42, column: 11)
!1868 = !DILocation(line: 62, column: 1, scope: !1855)
!1869 = !DILocation(line: 61, column: 2, scope: !1855)
!1870 = distinct !DISubprogram(name: "_Tidy_deallocate", linkageName: "?_Tidy_deallocate@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ", scope: !41, file: !42, line: 4616, type: !452, scopeLine: 4616, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !807, retainedNodes: !1871)
!1871 = !{!1872, !1873, !1877}
!1872 = !DILocalVariable(name: "this", arg: 1, scope: !1870, type: !1677, flags: DIFlagArtificial | DIFlagObjectPointer)
!1873 = !DILocalVariable(name: "_Ptr", scope: !1874, file: !42, line: 4619, type: !1876)
!1874 = distinct !DILexicalBlock(scope: !1875, file: !42, line: 4618, column: 54)
!1875 = distinct !DILexicalBlock(scope: !1870, file: !42, line: 4618, column: 13)
!1876 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !400)
!1877 = !DILocalVariable(name: "_Al", scope: !1874, file: !42, line: 4620, type: !106)
!1878 = !DILocation(line: 0, scope: !1870)
!1879 = !DILocation(line: 4617, column: 9, scope: !1870)
!1880 = !DILocation(line: 4617, column: 17, scope: !1870)
!1881 = !DILocation(line: 4617, column: 25, scope: !1870)
!1882 = !DILocation(line: 4618, column: 13, scope: !1875)
!1883 = !DILocation(line: 4618, column: 21, scope: !1875)
!1884 = !DILocation(line: 4618, column: 29, scope: !1875)
!1885 = !DILocation(line: 4618, column: 13, scope: !1870)
!1886 = !DILocation(line: 4619, column: 13, scope: !1874)
!1887 = !DILocation(line: 4619, column: 27, scope: !1874)
!1888 = !DILocation(line: 4619, column: 34, scope: !1874)
!1889 = !DILocation(line: 4619, column: 42, scope: !1874)
!1890 = !DILocation(line: 4619, column: 50, scope: !1874)
!1891 = !DILocation(line: 4619, column: 54, scope: !1874)
!1892 = !{!1717, !1717, i64 0}
!1893 = !DILocation(line: 4620, column: 13, scope: !1874)
!1894 = !DILocation(line: 4620, column: 19, scope: !1874)
!1895 = !DILocation(line: 4620, column: 34, scope: !1874)
!1896 = !DILocation(line: 4621, column: 31, scope: !1874)
!1897 = !DILocation(line: 4621, column: 39, scope: !1874)
!1898 = !DILocation(line: 4621, column: 47, scope: !1874)
!1899 = !DILocation(line: 4621, column: 51, scope: !1874)
!1900 = !DILocation(line: 4621, column: 13, scope: !1874)
!1901 = !DILocation(line: 4622, column: 13, scope: !1874)
!1902 = !DILocation(line: 4622, column: 34, scope: !1874)
!1903 = !DILocation(line: 4622, column: 42, scope: !1874)
!1904 = !DILocation(line: 4622, column: 50, scope: !1874)
!1905 = !{!1906, !1909, i64 24}
!1906 = !{!"?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@", !1907, i64 0}
!1907 = !{!"?AV?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@", !1908, i64 0}
!1908 = !{!"?AV?$_String_val@U?$_Simple_types@D@std@@@std@@", !1717, i64 0, !1909, i64 16, !1909, i64 24}
!1909 = !{!"long long", !1717, i64 0}
!1910 = !DILocation(line: 4622, column: 57, scope: !1874)
!1911 = !DILocation(line: 4622, column: 28, scope: !1874)
!1912 = !DILocation(line: 4622, column: 17, scope: !1874)
!1913 = !DILocation(line: 4623, column: 9, scope: !1875)
!1914 = !DILocation(line: 4623, column: 9, scope: !1874)
!1915 = !DILocation(line: 4633, column: 13, scope: !1916)
!1916 = distinct !DILexicalBlock(scope: !1870, file: !42, line: 4632, column: 9)
!1917 = !DILocation(line: 4633, column: 21, scope: !1916)
!1918 = !DILocation(line: 4633, column: 29, scope: !1916)
!1919 = !DILocation(line: 4633, column: 37, scope: !1916)
!1920 = !{!1906, !1909, i64 16}
!1921 = !DILocation(line: 4634, column: 13, scope: !1916)
!1922 = !DILocation(line: 4634, column: 21, scope: !1916)
!1923 = !DILocation(line: 4634, column: 29, scope: !1916)
!1924 = !DILocation(line: 4634, column: 37, scope: !1916)
!1925 = !DILocation(line: 4636, column: 58, scope: !1916)
!1926 = !DILocation(line: 4636, column: 29, scope: !1916)
!1927 = !DILocation(line: 4636, column: 37, scope: !1916)
!1928 = !DILocation(line: 4636, column: 45, scope: !1916)
!1929 = !DILocation(line: 4636, column: 49, scope: !1916)
!1930 = !DILocation(line: 4636, column: 13, scope: !1916)
!1931 = !DILocation(line: 4638, column: 5, scope: !1870)
!1932 = distinct !DISubprogram(name: "~_Compressed_pair", linkageName: "??1?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@XZ", scope: !424, file: !46, line: 1361, type: !1933, scopeLine: 1361, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !1935, retainedNodes: !1936)
!1933 = !DISubroutineType(types: !1934)
!1934 = !{null, !432}
!1935 = !DISubprogram(name: "~_Compressed_pair", scope: !424, type: !1933, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1936 = !{!1937}
!1937 = !DILocalVariable(name: "this", arg: 1, scope: !1932, type: !1938, flags: DIFlagArtificial | DIFlagObjectPointer)
!1938 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !424, size: 64)
!1939 = !DILocation(line: 0, scope: !1932)
!1940 = !DILocation(line: 1361, column: 7, scope: !1941)
!1941 = distinct !DILexicalBlock(scope: !1932, file: !46, line: 1361, column: 7)
!1942 = !DILocation(line: 1361, column: 7, scope: !1932)
!1943 = distinct !DISubprogram(name: "_Orphan_all", linkageName: "?_Orphan_all@_Container_base0@std@@QEAAXXZ", scope: !193, file: !46, line: 1037, type: !196, scopeLine: 1037, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !195, retainedNodes: !1944)
!1944 = !{!1945}
!1945 = !DILocalVariable(name: "this", arg: 1, scope: !1943, type: !1711, flags: DIFlagArtificial | DIFlagObjectPointer)
!1946 = !DILocation(line: 0, scope: !1943)
!1947 = !DILocation(line: 1037, column: 57, scope: !1943)
!1948 = distinct !DISubprogram(name: "_Large_string_engaged", linkageName: "?_Large_string_engaged@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_NXZ", scope: !189, file: !42, line: 2313, type: !270, scopeLine: 2313, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !269, retainedNodes: !1949)
!1949 = !{!1950}
!1950 = !DILocalVariable(name: "this", arg: 1, scope: !1948, type: !1951, flags: DIFlagArtificial | DIFlagObjectPointer)
!1951 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !268, size: 64)
!1952 = !DILocation(line: 0, scope: !1948)
!1953 = !DILocation(line: 2319, column: 29, scope: !1948)
!1954 = !{!1908, !1909, i64 24}
!1955 = !DILocation(line: 2319, column: 26, scope: !1948)
!1956 = !DILocation(line: 2319, column: 9, scope: !1948)
!1957 = distinct !DISubprogram(name: "_Getal", linkageName: "?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV?$allocator@D@2@XZ", scope: !41, file: !42, line: 4650, type: !811, scopeLine: 4650, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !810, retainedNodes: !1958)
!1958 = !{!1959}
!1959 = !DILocalVariable(name: "this", arg: 1, scope: !1957, type: !1677, flags: DIFlagArtificial | DIFlagObjectPointer)
!1960 = !DILocation(line: 0, scope: !1957)
!1961 = !DILocation(line: 4651, column: 16, scope: !1957)
!1962 = !DILocation(line: 4651, column: 24, scope: !1957)
!1963 = !DILocation(line: 4651, column: 9, scope: !1957)
!1964 = distinct !DISubprogram(name: "_Destroy_in_place<char *>", linkageName: "??$_Destroy_in_place@PEAD@std@@YAXAEAPEAD@Z", scope: !14, file: !46, line: 307, type: !1965, scopeLine: 307, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, templateParams: !1970, retainedNodes: !1968)
!1965 = !DISubroutineType(types: !1966)
!1966 = !{null, !1967}
!1967 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !34, size: 64)
!1968 = !{!1969}
!1969 = !DILocalVariable(name: "_Obj", arg: 1, scope: !1964, file: !46, line: 307, type: !1967)
!1970 = !{!1971}
!1971 = !DITemplateTypeParameter(name: "_Ty", type: !34)
!1972 = !DILocation(line: 307, column: 51, scope: !1964)
!1973 = !DILocation(line: 311, column: 9, scope: !1974)
!1974 = distinct !DILexicalBlock(scope: !1975, file: !46, line: 310, column: 12)
!1975 = distinct !DILexicalBlock(scope: !1964, file: !46, line: 308, column: 19)
!1976 = !DILocation(line: 313, column: 1, scope: !1964)
!1977 = distinct !DISubprogram(name: "deallocate", linkageName: "?deallocate@?$allocator@D@std@@QEAAXQEAD_K@Z", scope: !51, file: !46, line: 833, type: !108, scopeLine: 833, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !107, retainedNodes: !1978)
!1978 = !{!1979, !1980, !1981}
!1979 = !DILocalVariable(name: "_Count", arg: 3, scope: !1977, file: !46, line: 833, type: !111)
!1980 = !DILocalVariable(name: "_Ptr", arg: 2, scope: !1977, file: !46, line: 833, type: !110)
!1981 = !DILocalVariable(name: "this", arg: 1, scope: !1977, type: !1982, flags: DIFlagArtificial | DIFlagObjectPointer)
!1982 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!1983 = !{!1909, !1909, i64 0}
!1984 = !DILocation(line: 833, column: 73, scope: !1977)
!1985 = !DILocation(line: 833, column: 54, scope: !1977)
!1986 = !DILocation(line: 0, scope: !1977)
!1987 = !DILocation(line: 835, column: 60, scope: !1977)
!1988 = !DILocation(line: 835, column: 58, scope: !1977)
!1989 = !DILocation(line: 835, column: 40, scope: !1977)
!1990 = !DILocation(line: 835, column: 9, scope: !1977)
!1991 = !DILocation(line: 836, column: 5, scope: !1977)
!1992 = distinct !DISubprogram(name: "assign", linkageName: "?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z", scope: !288, file: !42, line: 449, type: !332, scopeLine: 449, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !375, retainedNodes: !1993)
!1993 = !{!1994, !1995}
!1994 = !DILocalVariable(name: "_Right", arg: 2, scope: !1992, file: !42, line: 449, type: !60)
!1995 = !DILocalVariable(name: "_Left", arg: 1, scope: !1992, file: !42, line: 449, type: !58)
!1996 = !DILocation(line: 449, column: 64, scope: !1992)
!1997 = !DILocation(line: 449, column: 44, scope: !1992)
!1998 = !DILocation(line: 450, column: 17, scope: !1992)
!1999 = !DILocation(line: 450, column: 9, scope: !1992)
!2000 = !DILocation(line: 450, column: 15, scope: !1992)
!2001 = !DILocation(line: 451, column: 5, scope: !1992)
!2002 = distinct !DISubprogram(name: "_Get_first", linkageName: "?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAAAEAV?$allocator@D@2@XZ", scope: !424, file: !46, line: 1377, type: !430, scopeLine: 1377, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !429, retainedNodes: !2003)
!2003 = !{!2004}
!2004 = !DILocalVariable(name: "this", arg: 1, scope: !2002, type: !1938, flags: DIFlagArtificial | DIFlagObjectPointer)
!2005 = !DILocation(line: 0, scope: !2002)
!2006 = !DILocation(line: 1378, column: 16, scope: !2002)
!2007 = !DILocation(line: 1378, column: 9, scope: !2002)
!2008 = distinct !DISubprogram(name: "_Deallocate<16,0>", linkageName: "??$_Deallocate@$0BA@$0A@@std@@YAXPEAX_K@Z", scope: !14, file: !46, line: 251, type: !2009, scopeLine: 251, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, templateParams: !2014, retainedNodes: !2011)
!2009 = !DISubroutineType(types: !2010)
!2010 = !{null, !31, !32}
!2011 = !{!2012, !2013}
!2012 = !DILocalVariable(name: "_Bytes", arg: 2, scope: !2008, file: !46, line: 251, type: !32)
!2013 = !DILocalVariable(name: "_Ptr", arg: 1, scope: !2008, file: !46, line: 251, type: !31)
!2014 = !{!2015, !2016}
!2015 = !DITemplateValueParameter(name: "_Align", type: !30, value: i64 16)
!2016 = !DITemplateValueParameter(type: !6, value: i32 0)
!2017 = !DILocation(line: 251, column: 59, scope: !2008)
!2018 = !DILocation(line: 251, column: 46, scope: !2008)
!2019 = !DILocation(line: 260, column: 13, scope: !2020)
!2020 = distinct !DILexicalBlock(scope: !2021, file: !46, line: 260, column: 13)
!2021 = distinct !DILexicalBlock(scope: !2008, file: !46, line: 258, column: 5)
!2022 = !DILocation(line: 260, column: 20, scope: !2020)
!2023 = !DILocation(line: 260, column: 13, scope: !2021)
!2024 = !DILocation(line: 261, column: 13, scope: !2025)
!2025 = distinct !DILexicalBlock(scope: !2020, file: !46, line: 260, column: 50)
!2026 = !DILocation(line: 262, column: 9, scope: !2025)
!2027 = !DILocation(line: 264, column: 33, scope: !2021)
!2028 = !DILocation(line: 264, column: 27, scope: !2021)
!2029 = !DILocation(line: 264, column: 9, scope: !2021)
!2030 = !DILocation(line: 266, column: 1, scope: !2008)
!2031 = distinct !DISubprogram(name: "_Adjust_manually_vector_aligned", linkageName: "?_Adjust_manually_vector_aligned@std@@YAXAEAPEAXAEA_K@Z", scope: !14, file: !46, line: 153, type: !2032, scopeLine: 153, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2036)
!2032 = !DISubroutineType(types: !2033)
!2033 = !{null, !2034, !2035}
!2034 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !31, size: 64)
!2035 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !32, size: 64)
!2036 = !{!2037, !2038, !2039, !2043, !2044, !2045}
!2037 = !DILocalVariable(name: "_Bytes", arg: 2, scope: !2031, file: !46, line: 153, type: !2035)
!2038 = !DILocalVariable(name: "_Ptr", arg: 1, scope: !2031, file: !46, line: 153, type: !2034)
!2039 = !DILocalVariable(name: "_Ptr_user", scope: !2031, file: !46, line: 157, type: !2040)
!2040 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2041)
!2041 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2042, size: 64)
!2042 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !28)
!2043 = !DILocalVariable(name: "_Ptr_container", scope: !2031, file: !46, line: 158, type: !2042)
!2044 = !DILocalVariable(name: "_Min_back_shift", scope: !2031, file: !46, line: 169, type: !2042)
!2045 = !DILocalVariable(name: "_Back_shift", scope: !2031, file: !46, line: 171, type: !2042)
!2046 = !DILocation(line: 153, column: 66, scope: !2031)
!2047 = !DILocation(line: 153, column: 52, scope: !2031)
!2048 = !DILocation(line: 155, column: 5, scope: !2031)
!2049 = !DILocation(line: 155, column: 12, scope: !2031)
!2050 = !DILocation(line: 157, column: 5, scope: !2031)
!2051 = !DILocation(line: 157, column: 28, scope: !2031)
!2052 = !DILocation(line: 157, column: 69, scope: !2031)
!2053 = !DILocation(line: 157, column: 40, scope: !2031)
!2054 = !DILocation(line: 158, column: 5, scope: !2031)
!2055 = !DILocation(line: 158, column: 21, scope: !2031)
!2056 = !DILocation(line: 158, column: 40, scope: !2031)
!2057 = !DILocation(line: 169, column: 5, scope: !2031)
!2058 = !DILocation(line: 169, column: 25, scope: !2031)
!2059 = !DILocation(line: 171, column: 5, scope: !2031)
!2060 = !DILocation(line: 171, column: 21, scope: !2031)
!2061 = !DILocation(line: 171, column: 63, scope: !2031)
!2062 = !DILocation(line: 171, column: 35, scope: !2031)
!2063 = !DILocation(line: 171, column: 71, scope: !2031)
!2064 = !DILocation(line: 171, column: 69, scope: !2031)
!2065 = !DILocation(line: 172, column: 5, scope: !2031)
!2066 = !DILocation(line: 172, column: 5, scope: !2067)
!2067 = distinct !DILexicalBlock(scope: !2068, file: !46, line: 172, column: 5)
!2068 = distinct !DILexicalBlock(scope: !2031, file: !46, line: 172, column: 5)
!2069 = !DILocation(line: 172, column: 5, scope: !2068)
!2070 = !DILocation(line: 172, column: 5, scope: !2071)
!2071 = distinct !DILexicalBlock(scope: !2067, file: !46, line: 172, column: 5)
!2072 = !DILocation(line: 172, column: 5, scope: !2073)
!2073 = distinct !DILexicalBlock(scope: !2067, file: !46, line: 172, column: 5)
!2074 = !DILocation(line: 172, column: 5, scope: !2075)
!2075 = distinct !DILexicalBlock(scope: !2073, file: !46, line: 172, column: 5)
!2076 = !DILocation(line: 173, column: 36, scope: !2031)
!2077 = !DILocation(line: 173, column: 12, scope: !2031)
!2078 = !DILocation(line: 173, column: 5, scope: !2031)
!2079 = !DILocation(line: 173, column: 10, scope: !2031)
!2080 = !DILocation(line: 174, column: 1, scope: !2031)
!2081 = distinct !DISubprogram(name: "~_String_val", linkageName: "??1?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ", scope: !189, file: !42, line: 2274, type: !256, scopeLine: 2274, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !2082, retainedNodes: !2083)
!2082 = !DISubprogram(name: "~_String_val", scope: !189, type: !256, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2083 = !{!2084}
!2084 = !DILocalVariable(name: "this", arg: 1, scope: !2081, type: !2085, flags: DIFlagArtificial | DIFlagObjectPointer)
!2085 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !189, size: 64)
!2086 = !DILocation(line: 0, scope: !2081)
!2087 = !DILocation(line: 2274, column: 7, scope: !2088)
!2088 = distinct !DILexicalBlock(scope: !2081, file: !42, line: 2274, column: 7)
!2089 = !DILocation(line: 2274, column: 7, scope: !2081)
!2090 = distinct !DISubprogram(name: "~_Bxty", linkageName: "??1_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ", scope: !238, file: !42, line: 2348, type: !248, scopeLine: 2348, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !251, retainedNodes: !2091)
!2091 = !{!2092}
!2092 = !DILocalVariable(name: "this", arg: 1, scope: !2090, type: !2093, flags: DIFlagArtificial | DIFlagObjectPointer)
!2093 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !238, size: 64)
!2094 = !DILocation(line: 0, scope: !2090)
!2095 = !DILocation(line: 2348, column: 51, scope: !2090)
!2096 = distinct !DISubprogram(name: "_Compressed_pair<>", linkageName: "??$?0$$V@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@U_Zero_then_variadic_args_t@1@@Z", scope: !424, file: !46, line: 1368, type: !2097, scopeLine: 1370, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, templateParams: !2106, declaration: !2105, retainedNodes: !2108)
!2097 = !DISubroutineType(types: !2098)
!2098 = !{null, !432, !2099}
!2099 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Zero_then_variadic_args_t", scope: !14, file: !46, line: 1352, size: 8, flags: DIFlagTypePassByValue, elements: !2100, identifier: ".?AU_Zero_then_variadic_args_t@std@@")
!2100 = !{!2101}
!2101 = !DISubprogram(name: "_Zero_then_variadic_args_t", scope: !2099, file: !46, line: 1353, type: !2102, scopeLine: 1353, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2102 = !DISubroutineType(types: !2103)
!2103 = !{null, !2104}
!2104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2099, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2105 = !DISubprogram(name: "_Compressed_pair<>", scope: !424, file: !46, line: 1368, type: !2097, scopeLine: 1368, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized, templateParams: !2106)
!2106 = !{!2107}
!2107 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Other2", value: !209)
!2108 = !{!2109, !2110}
!2109 = !DILocalVariable(arg: 2, scope: !2096, file: !46, line: 1368, type: !2099)
!2110 = !DILocalVariable(name: "this", arg: 1, scope: !2096, type: !1938, flags: DIFlagArtificial | DIFlagObjectPointer)
!2111 = !DILocation(line: 1368, column: 67, scope: !2096)
!2112 = !DILocation(line: 0, scope: !2096)
!2113 = !DILocation(line: 1370, column: 60, scope: !2096)
!2114 = !DILocation(line: 1370, column: 11, scope: !2096)
!2115 = !DILocation(line: 1370, column: 19, scope: !2096)
!2116 = !DILocation(line: 1370, column: 61, scope: !2096)
!2117 = distinct !DISubprogram(name: "_Fake_proxy_ptr_impl", linkageName: "??0_Fake_proxy_ptr_impl@std@@QEAA@AEBU_Fake_allocator@1@AEBU_Container_base0@1@@Z", scope: !1682, file: !46, line: 1288, type: !1704, scopeLine: 1288, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !1703, retainedNodes: !2118)
!2118 = !{!2119, !2120, !2121}
!2119 = !DILocalVariable(arg: 3, scope: !2117, file: !46, line: 1288, type: !1706)
!2120 = !DILocalVariable(arg: 2, scope: !2117, file: !46, line: 1288, type: !206)
!2121 = !DILocalVariable(name: "this", arg: 1, scope: !2117, type: !2122, flags: DIFlagArtificial | DIFlagObjectPointer)
!2122 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1682, size: 64)
!2123 = !DILocation(line: 1288, column: 96, scope: !2117)
!2124 = !DILocation(line: 1288, column: 71, scope: !2117)
!2125 = !DILocation(line: 0, scope: !2117)
!2126 = !DILocation(line: 1288, column: 108, scope: !2117)
!2127 = distinct !DISubprogram(name: "_Tidy_init", linkageName: "?_Tidy_init@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ", scope: !41, file: !42, line: 4594, type: !452, scopeLine: 4594, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !806, retainedNodes: !2128)
!2128 = !{!2129, !2130}
!2129 = !DILocalVariable(name: "this", arg: 1, scope: !2127, type: !1677, flags: DIFlagArtificial | DIFlagObjectPointer)
!2130 = !DILocalVariable(name: "_My_data", scope: !2127, file: !42, line: 4595, type: !2131)
!2131 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !189, size: 64)
!2132 = !DILocation(line: 0, scope: !2127)
!2133 = !DILocation(line: 4595, column: 9, scope: !2127)
!2134 = !DILocation(line: 4595, column: 15, scope: !2127)
!2135 = !DILocation(line: 4595, column: 28, scope: !2127)
!2136 = !DILocation(line: 4595, column: 36, scope: !2127)
!2137 = !DILocation(line: 4596, column: 9, scope: !2127)
!2138 = !DILocation(line: 4596, column: 18, scope: !2127)
!2139 = !DILocation(line: 4596, column: 26, scope: !2127)
!2140 = !{!1908, !1909, i64 16}
!2141 = !DILocation(line: 4610, column: 13, scope: !2142)
!2142 = distinct !DILexicalBlock(scope: !2127, file: !42, line: 4609, column: 9)
!2143 = !DILocation(line: 4610, column: 22, scope: !2142)
!2144 = !DILocation(line: 4610, column: 29, scope: !2142)
!2145 = !DILocation(line: 4612, column: 51, scope: !2142)
!2146 = !DILocation(line: 4612, column: 29, scope: !2142)
!2147 = !DILocation(line: 4612, column: 38, scope: !2142)
!2148 = !DILocation(line: 4612, column: 42, scope: !2142)
!2149 = !DILocation(line: 4612, column: 13, scope: !2142)
!2150 = !DILocation(line: 4614, column: 5, scope: !2127)
!2151 = distinct !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD@Z", scope: !41, file: !42, line: 3263, type: !565, scopeLine: 3263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !589, retainedNodes: !2152)
!2152 = !{!2153, !2154}
!2153 = !DILocalVariable(name: "_Ptr", arg: 2, scope: !2151, file: !42, line: 3263, type: !314)
!2154 = !DILocalVariable(name: "this", arg: 1, scope: !2151, type: !1677, flags: DIFlagArtificial | DIFlagObjectPointer)
!2155 = !DILocation(line: 3263, column: 75, scope: !2151)
!2156 = !DILocation(line: 0, scope: !2151)
!2157 = !DILocation(line: 3264, column: 70, scope: !2151)
!2158 = !DILocation(line: 3264, column: 54, scope: !2151)
!2159 = !DILocation(line: 3264, column: 29, scope: !2151)
!2160 = !DILocation(line: 3264, column: 23, scope: !2151)
!2161 = !DILocation(line: 3264, column: 16, scope: !2151)
!2162 = !DILocation(line: 3264, column: 9, scope: !2151)
!2163 = distinct !DISubprogram(name: "_Release", linkageName: "?_Release@_Fake_proxy_ptr_impl@std@@QEAAXXZ", scope: !1682, file: !46, line: 1291, type: !1713, scopeLine: 1291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !1712, retainedNodes: !2164)
!2164 = !{!2165}
!2165 = !DILocalVariable(name: "this", arg: 1, scope: !2163, type: !2122, flags: DIFlagArtificial | DIFlagObjectPointer)
!2166 = !DILocation(line: 0, scope: !2163)
!2167 = !DILocation(line: 1291, column: 54, scope: !2163)
!2168 = distinct !DISubprogram(name: "allocator", linkageName: "??0?$allocator@D@std@@QEAA@XZ", scope: !51, file: !46, line: 825, type: !95, scopeLine: 825, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !94, retainedNodes: !2169)
!2169 = !{!2170}
!2170 = !DILocalVariable(name: "this", arg: 1, scope: !2168, type: !1982, flags: DIFlagArtificial | DIFlagObjectPointer)
!2171 = !DILocation(line: 0, scope: !2168)
!2172 = !DILocation(line: 825, column: 37, scope: !2168)
!2173 = distinct !DISubprogram(name: "_String_val", linkageName: "??0?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ", scope: !189, file: !42, line: 2284, type: !256, scopeLine: 2284, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !255, retainedNodes: !2174)
!2174 = !{!2175}
!2175 = !DILocalVariable(name: "this", arg: 1, scope: !2173, type: !2085, flags: DIFlagArtificial | DIFlagObjectPointer)
!2176 = !DILocation(line: 0, scope: !2173)
!2177 = !DILocation(line: 2284, column: 59, scope: !2173)
!2178 = !DILocation(line: 2284, column: 53, scope: !2173)
!2179 = !DILocation(line: 2355, column: 15, scope: !2173)
!2180 = !DILocation(line: 2356, column: 15, scope: !2173)
!2181 = !DILocation(line: 2284, column: 60, scope: !2173)
!2182 = distinct !DISubprogram(name: "_Bxty", linkageName: "??0_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ", scope: !238, file: !42, line: 2346, type: !248, scopeLine: 2346, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !247, retainedNodes: !2183)
!2183 = !{!2184}
!2184 = !DILocalVariable(name: "this", arg: 1, scope: !2182, type: !2093, flags: DIFlagArtificial | DIFlagObjectPointer)
!2185 = !DILocation(line: 0, scope: !2182)
!2186 = !DILocation(line: 2346, column: 51, scope: !2182)
!2187 = !DILocation(line: 2346, column: 59, scope: !2182)
!2188 = distinct !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD_K@Z", scope: !41, file: !42, line: 3243, type: !580, scopeLine: 3244, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !588, retainedNodes: !2189)
!2189 = !{!2190, !2191, !2192, !2193}
!2190 = !DILocalVariable(name: "_Count", arg: 3, scope: !2188, file: !42, line: 3244, type: !460)
!2191 = !DILocalVariable(name: "_Ptr", arg: 2, scope: !2188, file: !42, line: 3244, type: !314)
!2192 = !DILocalVariable(name: "this", arg: 1, scope: !2188, type: !1677, flags: DIFlagArtificial | DIFlagObjectPointer)
!2193 = !DILocalVariable(name: "_Old_ptr", scope: !2194, file: !42, line: 3247, type: !110)
!2194 = distinct !DILexicalBlock(scope: !2195, file: !42, line: 3246, column: 47)
!2195 = distinct !DILexicalBlock(scope: !2188, file: !42, line: 3246, column: 13)
!2196 = !DILocation(line: 3244, column: 88, scope: !2188)
!2197 = !DILocation(line: 3244, column: 47, scope: !2188)
!2198 = !DILocation(line: 0, scope: !2188)
!2199 = !DILocation(line: 3246, column: 13, scope: !2195)
!2200 = !DILocation(line: 3246, column: 23, scope: !2195)
!2201 = !DILocation(line: 3246, column: 31, scope: !2195)
!2202 = !DILocation(line: 3246, column: 39, scope: !2195)
!2203 = !DILocation(line: 3246, column: 20, scope: !2195)
!2204 = !DILocation(line: 3246, column: 13, scope: !2188)
!2205 = !DILocation(line: 3247, column: 13, scope: !2194)
!2206 = !DILocation(line: 3247, column: 26, scope: !2194)
!2207 = !DILocation(line: 3247, column: 39, scope: !2194)
!2208 = !DILocation(line: 3247, column: 47, scope: !2194)
!2209 = !DILocation(line: 3247, column: 55, scope: !2194)
!2210 = !DILocation(line: 3248, column: 39, scope: !2194)
!2211 = !DILocation(line: 3248, column: 13, scope: !2194)
!2212 = !DILocation(line: 3248, column: 21, scope: !2194)
!2213 = !DILocation(line: 3248, column: 29, scope: !2194)
!2214 = !DILocation(line: 3248, column: 37, scope: !2194)
!2215 = !DILocation(line: 3249, column: 43, scope: !2194)
!2216 = !DILocation(line: 3249, column: 37, scope: !2194)
!2217 = !DILocation(line: 3249, column: 27, scope: !2194)
!2218 = !DILocation(line: 3249, column: 13, scope: !2194)
!2219 = !DILocation(line: 3250, column: 47, scope: !2194)
!2220 = !DILocation(line: 3250, column: 29, scope: !2194)
!2221 = !DILocation(line: 3250, column: 38, scope: !2194)
!2222 = !DILocation(line: 3250, column: 13, scope: !2194)
!2223 = !DILocation(line: 3251, column: 13, scope: !2194)
!2224 = !DILocation(line: 3252, column: 9, scope: !2195)
!2225 = !DILocation(line: 3260, column: 13, scope: !2188)
!2226 = !DILocation(line: 3255, column: 13, scope: !2188)
!2227 = !DILocation(line: 3254, column: 16, scope: !2188)
!2228 = !DILocation(line: 3254, column: 9, scope: !2188)
!2229 = !DILocation(line: 3261, column: 5, scope: !2188)
!2230 = distinct !DISubprogram(name: "_Convert_size<unsigned long long>", linkageName: "??$_Convert_size@_K@std@@YA_K_K@Z", scope: !14, file: !46, line: 978, type: !2231, scopeLine: 978, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, templateParams: !2235, retainedNodes: !2233)
!2231 = !DISubroutineType(types: !2232)
!2232 = !{!32, !111}
!2233 = !{!2234}
!2234 = !DILocalVariable(name: "_Len", arg: 1, scope: !2230, file: !46, line: 978, type: !111)
!2235 = !{!2236}
!2236 = !DITemplateTypeParameter(name: "_Size_type", type: !30)
!2237 = !DILocation(line: 978, column: 64, scope: !2230)
!2238 = !DILocation(line: 980, column: 12, scope: !2230)
!2239 = !DILocation(line: 980, column: 5, scope: !2230)
!2240 = distinct !DISubprogram(name: "length", linkageName: "?length@?$_Narrow_char_traits@DH@std@@SA_KQEBD@Z", scope: !288, file: !42, line: 396, type: !369, scopeLine: 396, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !368, retainedNodes: !2241)
!2241 = !{!2242}
!2242 = !DILocalVariable(name: "_First", arg: 1, scope: !2240, file: !42, line: 396, type: !314)
!2243 = !DILocation(line: 396, column: 76, scope: !2240)
!2244 = !DILocation(line: 412, column: 59, scope: !2240)
!2245 = !DILocation(line: 412, column: 16, scope: !2240)
!2246 = !DILocation(line: 412, column: 9, scope: !2240)
!2247 = distinct !DISubprogram(name: "_Myptr", linkageName: "?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAAPEADXZ", scope: !189, file: !42, line: 2295, type: !260, scopeLine: 2295, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !259, retainedNodes: !2248)
!2248 = !{!2249, !2250}
!2249 = !DILocalVariable(name: "this", arg: 1, scope: !2247, type: !2085, flags: DIFlagArtificial | DIFlagObjectPointer)
!2250 = !DILocalVariable(name: "_Result", scope: !2247, file: !42, line: 2296, type: !262)
!2251 = !DILocation(line: 0, scope: !2247)
!2252 = !DILocation(line: 2296, column: 9, scope: !2247)
!2253 = !DILocation(line: 2296, column: 21, scope: !2247)
!2254 = !DILocation(line: 2296, column: 31, scope: !2247)
!2255 = !DILocation(line: 2296, column: 35, scope: !2247)
!2256 = !DILocation(line: 2297, column: 13, scope: !2257)
!2257 = distinct !DILexicalBlock(scope: !2247, file: !42, line: 2297, column: 13)
!2258 = !DILocation(line: 2297, column: 13, scope: !2247)
!2259 = !DILocation(line: 2298, column: 32, scope: !2260)
!2260 = distinct !DILexicalBlock(scope: !2257, file: !42, line: 2297, column: 38)
!2261 = !DILocation(line: 2298, column: 36, scope: !2260)
!2262 = !DILocation(line: 2298, column: 23, scope: !2260)
!2263 = !DILocation(line: 2298, column: 21, scope: !2260)
!2264 = !DILocation(line: 2299, column: 9, scope: !2260)
!2265 = !DILocation(line: 2301, column: 16, scope: !2247)
!2266 = !DILocation(line: 2302, column: 5, scope: !2247)
!2267 = !DILocation(line: 2301, column: 9, scope: !2247)
!2268 = distinct !DISubprogram(name: "move", linkageName: "?move@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z", scope: !291, file: !42, line: 79, type: !312, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !318, retainedNodes: !2269)
!2269 = !{!2270, !2271, !2272}
!2270 = !DILocalVariable(name: "_Count", arg: 3, scope: !2268, file: !42, line: 80, type: !111)
!2271 = !DILocalVariable(name: "_First2", arg: 2, scope: !2268, file: !42, line: 80, type: !314)
!2272 = !DILocalVariable(name: "_First1", arg: 1, scope: !2268, file: !42, line: 79, type: !110)
!2273 = !DILocation(line: 80, column: 69, scope: !2268)
!2274 = !DILocation(line: 80, column: 47, scope: !2268)
!2275 = !DILocation(line: 79, column: 75, scope: !2268)
!2276 = !DILocation(line: 83, column: 27, scope: !2268)
!2277 = !DILocation(line: 83, column: 36, scope: !2268)
!2278 = !DILocation(line: 83, column: 45, scope: !2268)
!2279 = !DILocation(line: 83, column: 52, scope: !2268)
!2280 = !DILocation(line: 83, column: 9, scope: !2268)
!2281 = !DILocation(line: 125, column: 16, scope: !2268)
!2282 = !DILocation(line: 125, column: 9, scope: !2268)
!2283 = distinct !DISubprogram(name: "_Reallocate_for<`lambda at C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\xstring:3256:13',const char *>", linkageName: "??$_Reallocate_for@V<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??assign@01@QEAAAEAV01@QEBD0@Z@PEBD@Z", scope: !41, file: !42, line: 4505, type: !2284, scopeLine: 4505, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, templateParams: !2288, declaration: !2287, retainedNodes: !2293)
!2284 = !DISubroutineType(types: !2285)
!2285 = !{!512, !445, !460, !2286, !39}
!2286 = distinct !DICompositeType(tag: DW_TAG_class_type, scope: !2188, file: !42, line: 3256, size: 8, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !209, identifier: ".?AV<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV23@QEBD_K@Z@")
!2287 = !DISubprogram(name: "_Reallocate_for<`lambda at C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\xstring:3256:13',const char *>", linkageName: "??$_Reallocate_for@V<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??assign@01@QEAAAEAV01@QEBD0@Z@PEBD@Z", scope: !41, file: !42, line: 4505, type: !2284, scopeLine: 4505, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, templateParams: !2288)
!2288 = !{!2289, !2290}
!2289 = !DITemplateTypeParameter(name: "_Fty", type: !2286)
!2290 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_ArgTys", value: !2291)
!2291 = !{!2292}
!2292 = !DITemplateTypeParameter(type: !39)
!2293 = !{!2294, !2295, !2296, !2297, !2298, !2299, !2300, !2301}
!2294 = !DILocalVariable(name: "_Args", arg: 4, scope: !2283, file: !42, line: 4505, type: !39)
!2295 = !DILocalVariable(name: "_Fn", arg: 3, scope: !2283, file: !42, line: 4505, type: !2286)
!2296 = !DILocalVariable(name: "_New_size", arg: 2, scope: !2283, file: !42, line: 4505, type: !460)
!2297 = !DILocalVariable(name: "this", arg: 1, scope: !2283, type: !1677, flags: DIFlagArtificial | DIFlagObjectPointer)
!2298 = !DILocalVariable(name: "_Old_capacity", scope: !2283, file: !42, line: 4512, type: !460)
!2299 = !DILocalVariable(name: "_New_capacity", scope: !2283, file: !42, line: 4513, type: !460)
!2300 = !DILocalVariable(name: "_Al", scope: !2283, file: !42, line: 4514, type: !106)
!2301 = !DILocalVariable(name: "_New_ptr", scope: !2283, file: !42, line: 4515, type: !1876)
!2302 = !DILocation(line: 4505, column: 106, scope: !2283)
!2303 = !DILocation(line: 4505, column: 90, scope: !2283)
!2304 = !DILocation(line: 4505, column: 74, scope: !2283)
!2305 = !DILocation(line: 0, scope: !2283)
!2306 = !DILocation(line: 4508, column: 13, scope: !2307)
!2307 = distinct !DILexicalBlock(scope: !2283, file: !42, line: 4508, column: 13)
!2308 = !DILocation(line: 4508, column: 25, scope: !2307)
!2309 = !DILocation(line: 4508, column: 23, scope: !2307)
!2310 = !DILocation(line: 4508, column: 13, scope: !2283)
!2311 = !DILocation(line: 4509, column: 13, scope: !2312)
!2312 = distinct !DILexicalBlock(scope: !2307, file: !42, line: 4508, column: 37)
!2313 = !DILocation(line: 4512, column: 9, scope: !2283)
!2314 = !DILocation(line: 4512, column: 25, scope: !2283)
!2315 = !DILocation(line: 4512, column: 41, scope: !2283)
!2316 = !DILocation(line: 4512, column: 49, scope: !2283)
!2317 = !DILocation(line: 4512, column: 57, scope: !2283)
!2318 = !DILocation(line: 4513, column: 9, scope: !2283)
!2319 = !DILocation(line: 4513, column: 25, scope: !2283)
!2320 = !DILocation(line: 4513, column: 59, scope: !2283)
!2321 = !DILocation(line: 4513, column: 41, scope: !2283)
!2322 = !DILocation(line: 4514, column: 9, scope: !2283)
!2323 = !DILocation(line: 4514, column: 15, scope: !2283)
!2324 = !DILocation(line: 4514, column: 41, scope: !2283)
!2325 = !DILocation(line: 4515, column: 9, scope: !2283)
!2326 = !DILocation(line: 4515, column: 23, scope: !2283)
!2327 = !DILocation(line: 4515, column: 41, scope: !2283)
!2328 = !DILocation(line: 4515, column: 54, scope: !2283)
!2329 = !DILocation(line: 4515, column: 68, scope: !2283)
!2330 = !DILocation(line: 4515, column: 45, scope: !2283)
!2331 = !DILocation(line: 4522, column: 9, scope: !2283)
!2332 = !DILocation(line: 4522, column: 17, scope: !2283)
!2333 = !DILocation(line: 4522, column: 25, scope: !2283)
!2334 = !DILocation(line: 4523, column: 35, scope: !2283)
!2335 = !DILocation(line: 4523, column: 9, scope: !2283)
!2336 = !DILocation(line: 4523, column: 17, scope: !2283)
!2337 = !DILocation(line: 4523, column: 25, scope: !2283)
!2338 = !DILocation(line: 4523, column: 33, scope: !2283)
!2339 = !DILocation(line: 4524, column: 35, scope: !2283)
!2340 = !DILocation(line: 4524, column: 9, scope: !2283)
!2341 = !DILocation(line: 4524, column: 17, scope: !2283)
!2342 = !DILocation(line: 4524, column: 25, scope: !2283)
!2343 = !DILocation(line: 4524, column: 33, scope: !2283)
!2344 = !DILocation(line: 4525, column: 44, scope: !2283)
!2345 = !DILocation(line: 4525, column: 33, scope: !2283)
!2346 = !DILocation(line: 4525, column: 22, scope: !2283)
!2347 = !DILocation(line: 4525, column: 13, scope: !2283)
!2348 = !DILocation(line: 4525, column: 9, scope: !2283)
!2349 = !DILocation(line: 4526, column: 26, scope: !2350)
!2350 = distinct !DILexicalBlock(scope: !2283, file: !42, line: 4526, column: 13)
!2351 = !DILocation(line: 4526, column: 23, scope: !2350)
!2352 = !DILocation(line: 4526, column: 13, scope: !2283)
!2353 = !DILocation(line: 4527, column: 13, scope: !2354)
!2354 = distinct !DILexicalBlock(scope: !2350, file: !42, line: 4526, column: 41)
!2355 = !DILocation(line: 4527, column: 54, scope: !2354)
!2356 = !DILocation(line: 4527, column: 68, scope: !2354)
!2357 = !DILocation(line: 4527, column: 28, scope: !2354)
!2358 = !DILocation(line: 4527, column: 36, scope: !2354)
!2359 = !DILocation(line: 4527, column: 44, scope: !2354)
!2360 = !DILocation(line: 4527, column: 48, scope: !2354)
!2361 = !DILocation(line: 4527, column: 17, scope: !2354)
!2362 = !DILocation(line: 4528, column: 40, scope: !2354)
!2363 = !DILocation(line: 4528, column: 13, scope: !2354)
!2364 = !DILocation(line: 4528, column: 21, scope: !2354)
!2365 = !DILocation(line: 4528, column: 29, scope: !2354)
!2366 = !DILocation(line: 4528, column: 33, scope: !2354)
!2367 = !DILocation(line: 4528, column: 38, scope: !2354)
!2368 = !DILocation(line: 4529, column: 9, scope: !2354)
!2369 = !DILocation(line: 4530, column: 33, scope: !2370)
!2370 = distinct !DILexicalBlock(scope: !2350, file: !42, line: 4529, column: 16)
!2371 = !DILocation(line: 4530, column: 41, scope: !2370)
!2372 = !DILocation(line: 4530, column: 49, scope: !2370)
!2373 = !DILocation(line: 4530, column: 53, scope: !2370)
!2374 = !DILocation(line: 4530, column: 13, scope: !2370)
!2375 = !DILocation(line: 4534, column: 5, scope: !2283)
!2376 = !DILocation(line: 4533, column: 9, scope: !2283)
!2377 = distinct !DISubprogram(name: "_Unfancy<char>", linkageName: "??$_Unfancy@D@std@@YAPEADPEAD@Z", scope: !14, file: !2378, line: 288, type: !1006, scopeLine: 288, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, templateParams: !123, retainedNodes: !2379)
!2378 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\xstddef", directory: "", checksumkind: CSK_MD5, checksum: "9f716b3ccbb87fef0387470dd4655d4e")
!2379 = !{!2380}
!2380 = !DILocalVariable(name: "_Ptr", arg: 1, scope: !2377, file: !2378, line: 288, type: !34)
!2381 = !DILocation(line: 288, column: 41, scope: !2377)
!2382 = !DILocation(line: 289, column: 12, scope: !2377)
!2383 = !DILocation(line: 289, column: 5, scope: !2377)
!2384 = distinct !DISubprogram(name: "max_size", linkageName: "?max_size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ", scope: !41, file: !42, line: 3943, type: !708, scopeLine: 3943, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !711, retainedNodes: !2385)
!2385 = !{!2386, !2388, !2389}
!2386 = !DILocalVariable(name: "this", arg: 1, scope: !2384, type: !2387, flags: DIFlagArtificial | DIFlagObjectPointer)
!2387 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !447, size: 64)
!2388 = !DILocalVariable(name: "_Alloc_max", scope: !2384, file: !42, line: 3944, type: !460)
!2389 = !DILocalVariable(name: "_Storage_max", scope: !2384, file: !42, line: 3945, type: !460)
!2390 = !DILocation(line: 0, scope: !2384)
!2391 = !DILocation(line: 3944, column: 9, scope: !2384)
!2392 = !DILocation(line: 3944, column: 25, scope: !2384)
!2393 = !DILocation(line: 3944, column: 63, scope: !2384)
!2394 = !DILocation(line: 3944, column: 40, scope: !2384)
!2395 = !DILocation(line: 3945, column: 9, scope: !2384)
!2396 = !DILocation(line: 3945, column: 25, scope: !2384)
!2397 = !DILocation(line: 3946, column: 36, scope: !2384)
!2398 = !DILocation(line: 3946, column: 13, scope: !2384)
!2399 = !DILocation(line: 3948, column: 13, scope: !2384)
!2400 = !DILocation(line: 3948, column: 26, scope: !2384)
!2401 = !DILocation(line: 3947, column: 27, scope: !2384)
!2402 = !DILocation(line: 3947, column: 50, scope: !2384)
!2403 = !DILocation(line: 3947, column: 16, scope: !2384)
!2404 = !DILocation(line: 3947, column: 9, scope: !2384)
!2405 = !DILocation(line: 3950, column: 5, scope: !2384)
!2406 = distinct !DISubprogram(name: "_Xlen_string", linkageName: "?_Xlen_string@std@@YAXXZ", scope: !14, file: !42, line: 2373, type: !277, scopeLine: 2373, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !209)
!2407 = !DILocation(line: 2374, column: 5, scope: !2406)
!2408 = distinct !DISubprogram(name: "_Calculate_growth", linkageName: "?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBA_K_K@Z", scope: !41, file: !42, line: 4500, type: !802, scopeLine: 4500, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !801, retainedNodes: !2409)
!2409 = !{!2410, !2411}
!2410 = !DILocalVariable(name: "_Requested", arg: 2, scope: !2408, file: !42, line: 4500, type: !460)
!2411 = !DILocalVariable(name: "this", arg: 1, scope: !2408, type: !2387, flags: DIFlagArtificial | DIFlagObjectPointer)
!2412 = !DILocation(line: 4500, column: 83, scope: !2408)
!2413 = !DILocation(line: 0, scope: !2408)
!2414 = !DILocation(line: 4501, column: 70, scope: !2408)
!2415 = !DILocation(line: 4501, column: 46, scope: !2408)
!2416 = !DILocation(line: 4501, column: 54, scope: !2408)
!2417 = !DILocation(line: 4501, column: 62, scope: !2408)
!2418 = !DILocation(line: 4501, column: 34, scope: !2408)
!2419 = !DILocation(line: 4501, column: 16, scope: !2408)
!2420 = !DILocation(line: 4501, column: 9, scope: !2408)
!2421 = distinct !DISubprogram(name: "allocate", linkageName: "?allocate@?$allocator@D@std@@QEAAPEAD_K@Z", scope: !51, file: !46, line: 838, type: !113, scopeLine: 838, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !112, retainedNodes: !2422)
!2422 = !{!2423, !2424}
!2423 = !DILocalVariable(name: "_Count", arg: 2, scope: !2421, file: !46, line: 838, type: !111)
!2424 = !DILocalVariable(name: "this", arg: 1, scope: !2421, type: !1982, flags: DIFlagArtificial | DIFlagObjectPointer)
!2425 = !DILocation(line: 838, column: 106, scope: !2421)
!2426 = !DILocation(line: 0, scope: !2421)
!2427 = !DILocation(line: 839, column: 91, scope: !2421)
!2428 = !DILocation(line: 839, column: 63, scope: !2421)
!2429 = !DILocation(line: 839, column: 34, scope: !2421)
!2430 = !DILocation(line: 839, column: 9, scope: !2421)
!2431 = distinct !DISubprogram(name: "operator()", linkageName: "??R<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV23@QEBD_K@Z@QEBA?A?<auto>@@QEAD10@Z", scope: !2286, file: !42, line: 3256, type: !2432, scopeLine: 3256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !2436, retainedNodes: !2440)
!2432 = !DISubroutineType(types: !2433)
!2433 = !{null, !2434, !110, !460, !314}
!2434 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2435, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2435 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2286)
!2436 = !DISubprogram(name: "operator()", scope: !2286, file: !42, line: 3256, type: !2437, scopeLine: 3256, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2437 = !DISubroutineType(types: !2438)
!2438 = !{!2439, !2434, !110, !460, !314}
!2439 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "auto")
!2440 = !{!2441, !2442, !2443, !2444}
!2441 = !DILocalVariable(name: "_Ptr", arg: 4, scope: !2431, file: !42, line: 3256, type: !314)
!2442 = !DILocalVariable(name: "_Count", arg: 3, scope: !2431, file: !42, line: 3256, type: !460)
!2443 = !DILocalVariable(name: "_New_ptr", arg: 2, scope: !2431, file: !42, line: 3256, type: !110)
!2444 = !DILocalVariable(name: "this", arg: 1, scope: !2431, type: !2445, flags: DIFlagArtificial | DIFlagObjectPointer)
!2445 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2435, size: 64)
!2446 = !DILocation(line: 3256, column: 82, scope: !2431)
!2447 = !DILocation(line: 3256, column: 55, scope: !2431)
!2448 = !DILocation(line: 3256, column: 29, scope: !2431)
!2449 = !DILocation(line: 0, scope: !2431)
!2450 = !DILocation(line: 3257, column: 47, scope: !2431)
!2451 = !DILocation(line: 3257, column: 41, scope: !2431)
!2452 = !DILocation(line: 3257, column: 31, scope: !2431)
!2453 = !DILocation(line: 3257, column: 17, scope: !2431)
!2454 = !DILocation(line: 3258, column: 51, scope: !2431)
!2455 = !DILocation(line: 3258, column: 33, scope: !2431)
!2456 = !DILocation(line: 3258, column: 42, scope: !2431)
!2457 = !DILocation(line: 3258, column: 17, scope: !2431)
!2458 = !DILocation(line: 3259, column: 13, scope: !2431)
!2459 = distinct !DISubprogram(name: "_Construct_in_place<char *,char *const &>", linkageName: "??$_Construct_in_place@PEADAEBQEAD@std@@YAXAEAPEADAEBQEAD@Z", scope: !14, file: !413, line: 150, type: !2460, scopeLine: 151, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, templateParams: !2466, retainedNodes: !2463)
!2460 = !DISubroutineType(types: !2461)
!2461 = !{null, !1967, !2462}
!2462 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !110, size: 64)
!2463 = !{!2464, !2465}
!2464 = !DILocalVariable(name: "_Args", arg: 2, scope: !2459, file: !413, line: 150, type: !2462)
!2465 = !DILocalVariable(name: "_Obj", arg: 1, scope: !2459, file: !413, line: 150, type: !1967)
!2466 = !{!1971, !2467}
!2467 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Types", value: !2468)
!2468 = !{!2469}
!2469 = !DITemplateTypeParameter(type: !2462)
!2470 = !DILocation(line: 150, column: 71, scope: !2459)
!2471 = !DILocation(line: 150, column: 53, scope: !2459)
!2472 = !DILocation(line: 158, column: 45, scope: !2473)
!2473 = distinct !DILexicalBlock(scope: !2459, file: !413, line: 157, column: 5)
!2474 = !DILocation(line: 158, column: 30, scope: !2473)
!2475 = !DILocation(line: 158, column: 16, scope: !2473)
!2476 = !DILocation(line: 158, column: 9, scope: !2473)
!2477 = !DILocation(line: 158, column: 78, scope: !2473)
!2478 = !DILocation(line: 158, column: 57, scope: !2473)
!2479 = !DILocation(line: 160, column: 1, scope: !2459)
!2480 = distinct !DISubprogram(name: "max_size", linkageName: "?max_size@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA_KAEBV?$allocator@D@2@@Z", scope: !48, file: !46, line: 727, type: !168, scopeLine: 727, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !167, retainedNodes: !2481)
!2481 = !{!2482}
!2482 = !DILocalVariable(arg: 1, scope: !2480, file: !46, line: 727, type: !101)
!2483 = !DILocation(line: 727, column: 77, scope: !2480)
!2484 = !DILocation(line: 728, column: 9, scope: !2480)
!2485 = distinct !DISubprogram(name: "_Getal", linkageName: "?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBAAEBV?$allocator@D@2@XZ", scope: !41, file: !42, line: 4654, type: !815, scopeLine: 4654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !814, retainedNodes: !2486)
!2486 = !{!2487}
!2487 = !DILocalVariable(name: "this", arg: 1, scope: !2485, type: !2387, flags: DIFlagArtificial | DIFlagObjectPointer)
!2488 = !DILocation(line: 0, scope: !2485)
!2489 = !DILocation(line: 4655, column: 16, scope: !2485)
!2490 = !DILocation(line: 4655, column: 24, scope: !2485)
!2491 = !DILocation(line: 4655, column: 9, scope: !2485)
!2492 = distinct !DISubprogram(name: "max<unsigned long long>", linkageName: "??$max@_K@std@@YAAEB_KAEB_K0@Z", scope: !14, file: !2493, line: 41, type: !2494, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, templateParams: !2500, retainedNodes: !2497)
!2493 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\utility", directory: "", checksumkind: CSK_MD5, checksum: "40c744850a52f0c2a0471aab6b30cfeb")
!2494 = !DISubroutineType(types: !2495)
!2495 = !{!2496, !2496, !2496}
!2496 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !417, size: 64)
!2497 = !{!2498, !2499}
!2498 = !DILocalVariable(name: "_Right", arg: 2, scope: !2492, file: !2493, line: 42, type: !2496)
!2499 = !DILocalVariable(name: "_Left", arg: 1, scope: !2492, file: !2493, line: 42, type: !2496)
!2500 = !{!2501}
!2501 = !DITemplateTypeParameter(name: "_Ty", type: !30)
!2502 = !DILocation(line: 42, column: 34, scope: !2492)
!2503 = !DILocation(line: 42, column: 16, scope: !2492)
!2504 = !DILocation(line: 44, column: 12, scope: !2492)
!2505 = !DILocation(line: 44, column: 20, scope: !2492)
!2506 = !DILocation(line: 44, column: 18, scope: !2492)
!2507 = !DILocation(line: 44, column: 29, scope: !2492)
!2508 = !DILocation(line: 44, column: 38, scope: !2492)
!2509 = !DILocation(line: 44, column: 5, scope: !2492)
!2510 = distinct !DISubprogram(name: "min<unsigned long long>", linkageName: "??$min@_K@std@@YAAEB_KAEB_K0@Z", scope: !14, file: !2493, line: 65, type: !2494, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, templateParams: !2500, retainedNodes: !2511)
!2511 = !{!2512, !2513}
!2512 = !DILocalVariable(name: "_Right", arg: 2, scope: !2510, file: !2493, line: 66, type: !2496)
!2513 = !DILocalVariable(name: "_Left", arg: 1, scope: !2510, file: !2493, line: 66, type: !2496)
!2514 = !DILocation(line: 66, column: 34, scope: !2510)
!2515 = !DILocation(line: 66, column: 16, scope: !2510)
!2516 = !DILocation(line: 68, column: 12, scope: !2510)
!2517 = !DILocation(line: 68, column: 21, scope: !2510)
!2518 = !DILocation(line: 68, column: 19, scope: !2510)
!2519 = !DILocation(line: 68, column: 29, scope: !2510)
!2520 = !DILocation(line: 68, column: 38, scope: !2510)
!2521 = !DILocation(line: 68, column: 5, scope: !2510)
!2522 = distinct !DISubprogram(name: "max", linkageName: "?max@?$numeric_limits@_J@std@@SA_JXZ", scope: !2523, file: !13, line: 647, type: !2565, scopeLine: 647, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !2567, retainedNodes: !209)
!2523 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "numeric_limits<long long>", scope: !14, file: !13, line: 641, size: 8, flags: DIFlagTypePassByValue, elements: !2524, templateParams: !2575, identifier: ".?AV?$numeric_limits@_J@std@@")
!2524 = !{!2525, !2561, !2562, !2563, !2564, !2567, !2568, !2569, !2570, !2571, !2572, !2573, !2574}
!2525 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2523, baseType: !2526, flags: DIFlagPublic, extraData: i32 0)
!2526 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Num_int_base", scope: !14, file: !13, line: 120, size: 8, flags: DIFlagTypePassByValue, elements: !2527, identifier: ".?AU_Num_int_base@std@@")
!2527 = !{!2528, !2556, !2557, !2558, !2559, !2560}
!2528 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2526, baseType: !2529, extraData: i32 0)
!2529 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Num_base", scope: !14, file: !13, line: 43, size: 8, flags: DIFlagTypePassByValue, elements: !2530, identifier: ".?AU_Num_base@std@@")
!2530 = !{!2531, !2533, !2534, !2535, !2536, !2537, !2538, !2539, !2540, !2541, !2542, !2543, !2544, !2545, !2546, !2548, !2549, !2550, !2551, !2552, !2553, !2554, !2555}
!2531 = !DIDerivedType(tag: DW_TAG_member, name: "has_denorm", scope: !2529, file: !13, line: 44, baseType: !2532, flags: DIFlagStaticMember, extraData: i32 0)
!2532 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!2533 = !DIDerivedType(tag: DW_TAG_member, name: "has_denorm_loss", scope: !2529, file: !13, line: 45, baseType: !72, flags: DIFlagStaticMember, extraData: i1 false)
!2534 = !DIDerivedType(tag: DW_TAG_member, name: "has_infinity", scope: !2529, file: !13, line: 46, baseType: !72, flags: DIFlagStaticMember, extraData: i1 false)
!2535 = !DIDerivedType(tag: DW_TAG_member, name: "has_quiet_NaN", scope: !2529, file: !13, line: 47, baseType: !72, flags: DIFlagStaticMember, extraData: i1 false)
!2536 = !DIDerivedType(tag: DW_TAG_member, name: "has_signaling_NaN", scope: !2529, file: !13, line: 48, baseType: !72, flags: DIFlagStaticMember, extraData: i1 false)
!2537 = !DIDerivedType(tag: DW_TAG_member, name: "is_bounded", scope: !2529, file: !13, line: 49, baseType: !72, flags: DIFlagStaticMember, extraData: i1 false)
!2538 = !DIDerivedType(tag: DW_TAG_member, name: "is_exact", scope: !2529, file: !13, line: 50, baseType: !72, flags: DIFlagStaticMember, extraData: i1 false)
!2539 = !DIDerivedType(tag: DW_TAG_member, name: "is_iec559", scope: !2529, file: !13, line: 51, baseType: !72, flags: DIFlagStaticMember, extraData: i1 false)
!2540 = !DIDerivedType(tag: DW_TAG_member, name: "is_integer", scope: !2529, file: !13, line: 52, baseType: !72, flags: DIFlagStaticMember, extraData: i1 false)
!2541 = !DIDerivedType(tag: DW_TAG_member, name: "is_modulo", scope: !2529, file: !13, line: 53, baseType: !72, flags: DIFlagStaticMember, extraData: i1 false)
!2542 = !DIDerivedType(tag: DW_TAG_member, name: "is_signed", scope: !2529, file: !13, line: 54, baseType: !72, flags: DIFlagStaticMember, extraData: i1 false)
!2543 = !DIDerivedType(tag: DW_TAG_member, name: "is_specialized", scope: !2529, file: !13, line: 55, baseType: !72, flags: DIFlagStaticMember, extraData: i1 false)
!2544 = !DIDerivedType(tag: DW_TAG_member, name: "tinyness_before", scope: !2529, file: !13, line: 56, baseType: !72, flags: DIFlagStaticMember, extraData: i1 false)
!2545 = !DIDerivedType(tag: DW_TAG_member, name: "traps", scope: !2529, file: !13, line: 57, baseType: !72, flags: DIFlagStaticMember, extraData: i1 false)
!2546 = !DIDerivedType(tag: DW_TAG_member, name: "round_style", scope: !2529, file: !13, line: 58, baseType: !2547, flags: DIFlagStaticMember, extraData: i32 0)
!2547 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !19)
!2548 = !DIDerivedType(tag: DW_TAG_member, name: "digits", scope: !2529, file: !13, line: 59, baseType: !1069, flags: DIFlagStaticMember, extraData: i32 0)
!2549 = !DIDerivedType(tag: DW_TAG_member, name: "digits10", scope: !2529, file: !13, line: 60, baseType: !1069, flags: DIFlagStaticMember, extraData: i32 0)
!2550 = !DIDerivedType(tag: DW_TAG_member, name: "max_digits10", scope: !2529, file: !13, line: 61, baseType: !1069, flags: DIFlagStaticMember, extraData: i32 0)
!2551 = !DIDerivedType(tag: DW_TAG_member, name: "max_exponent", scope: !2529, file: !13, line: 62, baseType: !1069, flags: DIFlagStaticMember, extraData: i32 0)
!2552 = !DIDerivedType(tag: DW_TAG_member, name: "max_exponent10", scope: !2529, file: !13, line: 63, baseType: !1069, flags: DIFlagStaticMember, extraData: i32 0)
!2553 = !DIDerivedType(tag: DW_TAG_member, name: "min_exponent", scope: !2529, file: !13, line: 64, baseType: !1069, flags: DIFlagStaticMember, extraData: i32 0)
!2554 = !DIDerivedType(tag: DW_TAG_member, name: "min_exponent10", scope: !2529, file: !13, line: 65, baseType: !1069, flags: DIFlagStaticMember, extraData: i32 0)
!2555 = !DIDerivedType(tag: DW_TAG_member, name: "radix", scope: !2529, file: !13, line: 66, baseType: !1069, flags: DIFlagStaticMember, extraData: i32 0)
!2556 = !DIDerivedType(tag: DW_TAG_member, name: "is_bounded", scope: !2526, file: !13, line: 121, baseType: !72, flags: DIFlagStaticMember, extraData: i1 true)
!2557 = !DIDerivedType(tag: DW_TAG_member, name: "is_exact", scope: !2526, file: !13, line: 122, baseType: !72, flags: DIFlagStaticMember, extraData: i1 true)
!2558 = !DIDerivedType(tag: DW_TAG_member, name: "is_integer", scope: !2526, file: !13, line: 123, baseType: !72, flags: DIFlagStaticMember, extraData: i1 true)
!2559 = !DIDerivedType(tag: DW_TAG_member, name: "is_specialized", scope: !2526, file: !13, line: 124, baseType: !72, flags: DIFlagStaticMember, extraData: i1 true)
!2560 = !DIDerivedType(tag: DW_TAG_member, name: "radix", scope: !2526, file: !13, line: 125, baseType: !1069, flags: DIFlagStaticMember, extraData: i32 2)
!2561 = !DIDerivedType(tag: DW_TAG_member, name: "is_signed", scope: !2523, file: !13, line: 679, baseType: !72, flags: DIFlagPublic | DIFlagStaticMember, extraData: i1 true)
!2562 = !DIDerivedType(tag: DW_TAG_member, name: "digits", scope: !2523, file: !13, line: 680, baseType: !1069, flags: DIFlagPublic | DIFlagStaticMember, extraData: i32 63)
!2563 = !DIDerivedType(tag: DW_TAG_member, name: "digits10", scope: !2523, file: !13, line: 681, baseType: !1069, flags: DIFlagPublic | DIFlagStaticMember, extraData: i32 18)
!2564 = !DISubprogram(name: "min", linkageName: "?min@?$numeric_limits@_J@std@@SA_JXZ", scope: !2523, file: !13, line: 643, type: !2565, scopeLine: 643, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2565 = !DISubroutineType(types: !2566)
!2566 = !{!64}
!2567 = !DISubprogram(name: "max", linkageName: "?max@?$numeric_limits@_J@std@@SA_JXZ", scope: !2523, file: !13, line: 647, type: !2565, scopeLine: 647, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2568 = !DISubprogram(name: "lowest", linkageName: "?lowest@?$numeric_limits@_J@std@@SA_JXZ", scope: !2523, file: !13, line: 651, type: !2565, scopeLine: 651, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2569 = !DISubprogram(name: "epsilon", linkageName: "?epsilon@?$numeric_limits@_J@std@@SA_JXZ", scope: !2523, file: !13, line: 655, type: !2565, scopeLine: 655, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2570 = !DISubprogram(name: "round_error", linkageName: "?round_error@?$numeric_limits@_J@std@@SA_JXZ", scope: !2523, file: !13, line: 659, type: !2565, scopeLine: 659, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2571 = !DISubprogram(name: "denorm_min", linkageName: "?denorm_min@?$numeric_limits@_J@std@@SA_JXZ", scope: !2523, file: !13, line: 663, type: !2565, scopeLine: 663, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2572 = !DISubprogram(name: "infinity", linkageName: "?infinity@?$numeric_limits@_J@std@@SA_JXZ", scope: !2523, file: !13, line: 667, type: !2565, scopeLine: 667, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2573 = !DISubprogram(name: "quiet_NaN", linkageName: "?quiet_NaN@?$numeric_limits@_J@std@@SA_JXZ", scope: !2523, file: !13, line: 671, type: !2565, scopeLine: 671, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2574 = !DISubprogram(name: "signaling_NaN", linkageName: "?signaling_NaN@?$numeric_limits@_J@std@@SA_JXZ", scope: !2523, file: !13, line: 675, type: !2565, scopeLine: 675, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2575 = !{!2576}
!2576 = !DITemplateTypeParameter(name: "_Ty", type: !64)
!2577 = !DILocation(line: 648, column: 9, scope: !2522)
!2578 = distinct !DISubprogram(name: "_Get_first", linkageName: "?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEBAAEBV?$allocator@D@2@XZ", scope: !424, file: !46, line: 1381, type: !434, scopeLine: 1381, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !433, retainedNodes: !2579)
!2579 = !{!2580}
!2580 = !DILocalVariable(name: "this", arg: 1, scope: !2578, type: !2581, flags: DIFlagArtificial | DIFlagObjectPointer)
!2581 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !437, size: 64)
!2582 = !DILocation(line: 0, scope: !2578)
!2583 = !DILocation(line: 1382, column: 16, scope: !2578)
!2584 = !DILocation(line: 1382, column: 9, scope: !2578)
!2585 = distinct !DISubprogram(name: "_Calculate_growth", linkageName: "?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@CA_K_K00@Z", scope: !41, file: !42, line: 4486, type: !799, scopeLine: 4487, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !798, retainedNodes: !2586)
!2586 = !{!2587, !2588, !2589, !2590}
!2587 = !DILocalVariable(name: "_Max", arg: 3, scope: !2585, file: !42, line: 4487, type: !460)
!2588 = !DILocalVariable(name: "_Old", arg: 2, scope: !2585, file: !42, line: 4487, type: !460)
!2589 = !DILocalVariable(name: "_Requested", arg: 1, scope: !2585, file: !42, line: 4487, type: !460)
!2590 = !DILocalVariable(name: "_Masked", scope: !2585, file: !42, line: 4488, type: !460)
!2591 = !DILocation(line: 4487, column: 75, scope: !2585)
!2592 = !DILocation(line: 4487, column: 53, scope: !2585)
!2593 = !DILocation(line: 4487, column: 25, scope: !2585)
!2594 = !DILocation(line: 4488, column: 9, scope: !2585)
!2595 = !DILocation(line: 4488, column: 25, scope: !2585)
!2596 = !DILocation(line: 4488, column: 35, scope: !2585)
!2597 = !DILocation(line: 4488, column: 46, scope: !2585)
!2598 = !DILocation(line: 4489, column: 13, scope: !2599)
!2599 = distinct !DILexicalBlock(scope: !2585, file: !42, line: 4489, column: 13)
!2600 = !DILocation(line: 4489, column: 23, scope: !2599)
!2601 = !DILocation(line: 4489, column: 21, scope: !2599)
!2602 = !DILocation(line: 4489, column: 13, scope: !2585)
!2603 = !DILocation(line: 4490, column: 20, scope: !2604)
!2604 = distinct !DILexicalBlock(scope: !2599, file: !42, line: 4489, column: 29)
!2605 = !DILocation(line: 4490, column: 13, scope: !2604)
!2606 = !DILocation(line: 4493, column: 13, scope: !2607)
!2607 = distinct !DILexicalBlock(scope: !2585, file: !42, line: 4493, column: 13)
!2608 = !DILocation(line: 4493, column: 20, scope: !2607)
!2609 = !DILocation(line: 4493, column: 27, scope: !2607)
!2610 = !DILocation(line: 4493, column: 32, scope: !2607)
!2611 = !DILocation(line: 4493, column: 25, scope: !2607)
!2612 = !DILocation(line: 4493, column: 18, scope: !2607)
!2613 = !DILocation(line: 4493, column: 13, scope: !2585)
!2614 = !DILocation(line: 4494, column: 20, scope: !2615)
!2615 = distinct !DILexicalBlock(scope: !2607, file: !42, line: 4493, column: 37)
!2616 = !DILocation(line: 4494, column: 13, scope: !2615)
!2617 = !DILocation(line: 4497, column: 36, scope: !2585)
!2618 = !DILocation(line: 4497, column: 43, scope: !2585)
!2619 = !DILocation(line: 4497, column: 48, scope: !2585)
!2620 = !DILocation(line: 4497, column: 41, scope: !2585)
!2621 = !DILocation(line: 4497, column: 16, scope: !2585)
!2622 = !DILocation(line: 4497, column: 9, scope: !2585)
!2623 = !DILocation(line: 4498, column: 5, scope: !2585)
!2624 = distinct !DISubprogram(name: "_Allocate<16,std::_Default_allocate_traits,0>", linkageName: "??$_Allocate@$0BA@U_Default_allocate_traits@std@@$0A@@std@@YAPEAX_K@Z", scope: !14, file: !46, line: 230, type: !2625, scopeLine: 230, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, templateParams: !2629, retainedNodes: !2627)
!2625 = !DISubroutineType(types: !2626)
!2626 = !{!31, !111}
!2627 = !{!2628}
!2628 = !DILocalVariable(name: "_Bytes", arg: 1, scope: !2624, file: !46, line: 230, type: !111)
!2629 = !{!2015, !2630, !2016}
!2630 = !DITemplateTypeParameter(name: "_Traits", type: !2631, defaulted: true)
!2631 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Default_allocate_traits", scope: !14, file: !46, line: 79, size: 8, flags: DIFlagTypePassByValue, elements: !2632, identifier: ".?AU_Default_allocate_traits@std@@")
!2632 = !{!2633}
!2633 = !DISubprogram(name: "_Allocate", linkageName: "?_Allocate@_Default_allocate_traits@std@@SAPEAX_K@Z", scope: !2631, file: !46, line: 84, type: !2625, scopeLine: 84, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2634 = !DILocation(line: 230, column: 74, scope: !2624)
!2635 = !DILocation(line: 237, column: 13, scope: !2636)
!2636 = distinct !DILexicalBlock(scope: !2637, file: !46, line: 237, column: 13)
!2637 = distinct !DILexicalBlock(scope: !2624, file: !46, line: 236, column: 5)
!2638 = !DILocation(line: 237, column: 20, scope: !2636)
!2639 = !DILocation(line: 237, column: 13, scope: !2637)
!2640 = !DILocation(line: 238, column: 63, scope: !2641)
!2641 = distinct !DILexicalBlock(scope: !2636, file: !46, line: 237, column: 50)
!2642 = !DILocation(line: 238, column: 20, scope: !2641)
!2643 = !DILocation(line: 238, column: 13, scope: !2641)
!2644 = !DILocation(line: 243, column: 9, scope: !2645)
!2645 = distinct !DILexicalBlock(scope: !2624, file: !46, line: 243, column: 9)
!2646 = !DILocation(line: 243, column: 16, scope: !2645)
!2647 = !DILocation(line: 243, column: 9, scope: !2624)
!2648 = !DILocation(line: 244, column: 35, scope: !2649)
!2649 = distinct !DILexicalBlock(scope: !2645, file: !46, line: 243, column: 22)
!2650 = !DILocation(line: 244, column: 16, scope: !2649)
!2651 = !DILocation(line: 244, column: 9, scope: !2649)
!2652 = !DILocation(line: 247, column: 5, scope: !2624)
!2653 = !DILocation(line: 248, column: 1, scope: !2624)
!2654 = distinct !DISubprogram(name: "_Get_size_of_n<1>", linkageName: "??$_Get_size_of_n@$00@std@@YA_K_K@Z", scope: !14, file: !46, line: 59, type: !2231, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, templateParams: !2658, retainedNodes: !2655)
!2655 = !{!2656, !2657}
!2656 = !DILocalVariable(name: "_Count", arg: 1, scope: !2654, file: !46, line: 59, type: !111)
!2657 = !DILocalVariable(name: "_Overflow_is_possible", scope: !2654, file: !46, line: 60, type: !72)
!2658 = !{!2659}
!2659 = !DITemplateValueParameter(name: "_Ty_size", type: !30, value: i64 1)
!2660 = !DILocation(line: 59, column: 57, scope: !2654)
!2661 = !DILocation(line: 60, column: 5, scope: !2654)
!2662 = !DILocation(line: 60, column: 20, scope: !2654)
!2663 = !{!2664, !2664, i64 0}
!2664 = !{!"bool", !1717, i64 0}
!2665 = !DILocation(line: 69, column: 12, scope: !2654)
!2666 = !DILocation(line: 69, column: 19, scope: !2654)
!2667 = !DILocation(line: 70, column: 1, scope: !2654)
!2668 = !DILocation(line: 69, column: 5, scope: !2654)
!2669 = distinct !DISubprogram(name: "_Allocate_manually_vector_aligned<std::_Default_allocate_traits>", linkageName: "??$_Allocate_manually_vector_aligned@U_Default_allocate_traits@std@@@std@@YAPEAX_K@Z", scope: !14, file: !46, line: 134, type: !2625, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, templateParams: !2676, retainedNodes: !2670)
!2670 = !{!2671, !2672, !2673, !2674}
!2671 = !DILocalVariable(name: "_Bytes", arg: 1, scope: !2669, file: !46, line: 134, type: !111)
!2672 = !DILocalVariable(name: "_Block_size", scope: !2669, file: !46, line: 136, type: !111)
!2673 = !DILocalVariable(name: "_Ptr_container", scope: !2669, file: !46, line: 141, type: !2042)
!2674 = !DILocalVariable(name: "_Ptr", scope: !2669, file: !46, line: 143, type: !2675)
!2675 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !31)
!2676 = !{!2677}
!2677 = !DITemplateTypeParameter(name: "_Traits", type: !2631)
!2678 = !DILocation(line: 134, column: 76, scope: !2669)
!2679 = !DILocation(line: 136, column: 5, scope: !2669)
!2680 = !DILocation(line: 136, column: 18, scope: !2669)
!2681 = !DILocation(line: 136, column: 49, scope: !2669)
!2682 = !DILocation(line: 136, column: 47, scope: !2669)
!2683 = !DILocation(line: 137, column: 9, scope: !2684)
!2684 = distinct !DILexicalBlock(scope: !2669, file: !46, line: 137, column: 9)
!2685 = !DILocation(line: 137, column: 24, scope: !2684)
!2686 = !DILocation(line: 137, column: 21, scope: !2684)
!2687 = !DILocation(line: 137, column: 9, scope: !2669)
!2688 = !DILocation(line: 138, column: 9, scope: !2689)
!2689 = distinct !DILexicalBlock(scope: !2684, file: !46, line: 137, column: 32)
!2690 = !DILocation(line: 141, column: 5, scope: !2669)
!2691 = !DILocation(line: 141, column: 21, scope: !2669)
!2692 = !DILocation(line: 141, column: 85, scope: !2669)
!2693 = !DILocation(line: 141, column: 66, scope: !2669)
!2694 = !DILocation(line: 141, column: 38, scope: !2669)
!2695 = !DILocation(line: 142, column: 5, scope: !2669)
!2696 = !DILocation(line: 142, column: 5, scope: !2697)
!2697 = distinct !DILexicalBlock(scope: !2698, file: !46, line: 142, column: 5)
!2698 = distinct !DILexicalBlock(scope: !2669, file: !46, line: 142, column: 5)
!2699 = !DILocation(line: 142, column: 5, scope: !2698)
!2700 = !DILocation(line: 142, column: 5, scope: !2701)
!2701 = distinct !DILexicalBlock(scope: !2697, file: !46, line: 142, column: 5)
!2702 = !DILocation(line: 142, column: 5, scope: !2703)
!2703 = distinct !DILexicalBlock(scope: !2697, file: !46, line: 142, column: 5)
!2704 = !DILocation(line: 142, column: 5, scope: !2705)
!2705 = distinct !DILexicalBlock(scope: !2703, file: !46, line: 142, column: 5)
!2706 = !DILocation(line: 143, column: 5, scope: !2669)
!2707 = !DILocation(line: 143, column: 17, scope: !2669)
!2708 = !DILocation(line: 143, column: 49, scope: !2669)
!2709 = !DILocation(line: 143, column: 64, scope: !2669)
!2710 = !DILocation(line: 143, column: 82, scope: !2669)
!2711 = !DILocation(line: 143, column: 24, scope: !2669)
!2712 = !DILocation(line: 144, column: 41, scope: !2669)
!2713 = !DILocation(line: 144, column: 29, scope: !2669)
!2714 = !DILocation(line: 144, column: 5, scope: !2669)
!2715 = !DILocation(line: 144, column: 39, scope: !2669)
!2716 = !DILocation(line: 149, column: 12, scope: !2669)
!2717 = !DILocation(line: 150, column: 1, scope: !2669)
!2718 = !DILocation(line: 149, column: 5, scope: !2669)
!2719 = distinct !DISubprogram(name: "_Allocate", linkageName: "?_Allocate@_Default_allocate_traits@std@@SAPEAX_K@Z", scope: !2631, file: !46, line: 84, type: !2625, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !2633, retainedNodes: !2720)
!2720 = !{!2721}
!2721 = !DILocalVariable(name: "_Bytes", arg: 1, scope: !2719, file: !46, line: 84, type: !111)
!2722 = !DILocation(line: 84, column: 38, scope: !2719)
!2723 = !DILocation(line: 85, column: 31, scope: !2719)
!2724 = !DILocation(line: 85, column: 16, scope: !2719)
!2725 = !DILocation(line: 85, column: 9, scope: !2719)
!2726 = distinct !DISubprogram(name: "_Throw_bad_array_new_length", linkageName: "?_Throw_bad_array_new_length@std@@YAXXZ", scope: !14, file: !1611, line: 320, type: !277, scopeLine: 320, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !209)
!2727 = !DILocation(line: 321, column: 5, scope: !2726)
!2728 = distinct !DISubprogram(name: "bad_array_new_length", linkageName: "??0bad_array_new_length@std@@QEAA@XZ", scope: !2730, file: !2729, line: 139, type: !2778, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !2777, retainedNodes: !2781)
!2729 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\vcruntime_exception.h", directory: "", checksumkind: CSK_MD5, checksum: "aa62b99a88eea7594b2d8954526d3841")
!2730 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "bad_array_new_length", scope: !14, file: !2729, line: 134, size: 192, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !2731, vtableHolder: !2736, identifier: ".?AVbad_array_new_length@std@@")
!2731 = !{!2732, !2738, !2777}
!2732 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2730, baseType: !2733, flags: DIFlagPublic, extraData: i32 0)
!2733 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "bad_alloc", scope: !14, file: !2729, line: 114, size: 192, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !2734, vtableHolder: !2736, identifier: ".?AVbad_alloc@std@@")
!2734 = !{!2735, !2738, !2770, !2774}
!2735 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2733, baseType: !2736, flags: DIFlagPublic, extraData: i32 0)
!2736 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "exception", scope: !14, file: !2729, line: 48, size: 192, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !2737, vtableHolder: !2736, identifier: ".?AVexception@std@@")
!2737 = !{!2738, !2739, !2741, !2746, !2750, !2753, !2756, !2761, !2765, !2766}
!2738 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "__vtbl_ptr_type", baseType: null, size: 128)
!2739 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$exception", scope: !2729, file: !2729, baseType: !2740, size: 64, flags: DIFlagArtificial)
!2740 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2738, size: 64)
!2741 = !DIDerivedType(tag: DW_TAG_member, name: "_Data", scope: !2736, file: !2729, line: 100, baseType: !2742, size: 128, offset: 64)
!2742 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__std_exception_data", file: !2729, line: 25, size: 128, flags: DIFlagTypePassByValue, elements: !2743, identifier: ".?AU__std_exception_data@@")
!2743 = !{!2744, !2745}
!2744 = !DIDerivedType(tag: DW_TAG_member, name: "_What", scope: !2742, file: !2729, line: 27, baseType: !39, size: 64)
!2745 = !DIDerivedType(tag: DW_TAG_member, name: "_DoFree", scope: !2742, file: !2729, line: 28, baseType: !73, size: 8, offset: 64)
!2746 = !DISubprogram(name: "exception", scope: !2736, file: !2729, line: 52, type: !2747, scopeLine: 52, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2747 = !DISubroutineType(types: !2748)
!2748 = !{null, !2749}
!2749 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2736, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2750 = !DISubprogram(name: "exception", scope: !2736, file: !2729, line: 57, type: !2751, scopeLine: 57, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2751 = !DISubroutineType(types: !2752)
!2752 = !{null, !2749, !314}
!2753 = !DISubprogram(name: "exception", scope: !2736, file: !2729, line: 64, type: !2754, scopeLine: 64, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2754 = !DISubroutineType(types: !2755)
!2755 = !{null, !2749, !314, !6}
!2756 = !DISubprogram(name: "exception", scope: !2736, file: !2729, line: 70, type: !2757, scopeLine: 70, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2757 = !DISubroutineType(types: !2758)
!2758 = !{null, !2749, !2759}
!2759 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2760, size: 64)
!2760 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2736)
!2761 = !DISubprogram(name: "operator=", linkageName: "??4exception@std@@QEAAAEAV01@AEBV01@@Z", scope: !2736, file: !2729, line: 76, type: !2762, scopeLine: 76, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2762 = !DISubroutineType(types: !2763)
!2763 = !{!2764, !2749, !2759}
!2764 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2736, size: 64)
!2765 = !DISubprogram(name: "~exception", scope: !2736, file: !2729, line: 88, type: !2747, scopeLine: 88, containingType: !2736, virtualIndex: 0, flags: DIFlagPublic | DIFlagPrototyped | DIFlagIntroducedVirtual, spFlags: DISPFlagVirtual | DISPFlagOptimized)
!2766 = !DISubprogram(name: "what", linkageName: "?what@exception@std@@UEBAPEBDXZ", scope: !2736, file: !2729, line: 93, type: !2767, scopeLine: 93, containingType: !2736, virtualIndex: 1, flags: DIFlagPublic | DIFlagPrototyped | DIFlagIntroducedVirtual, spFlags: DISPFlagVirtual | DISPFlagOptimized)
!2767 = !DISubroutineType(types: !2768)
!2768 = !{!39, !2769}
!2769 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2760, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2770 = !DISubprogram(name: "bad_alloc", scope: !2733, file: !2729, line: 119, type: !2771, scopeLine: 119, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2771 = !DISubroutineType(types: !2772)
!2772 = !{null, !2773}
!2773 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2733, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2774 = !DISubprogram(name: "bad_alloc", scope: !2733, file: !2729, line: 128, type: !2775, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2775 = !DISubroutineType(types: !2776)
!2776 = !{null, !2773, !314}
!2777 = !DISubprogram(name: "bad_array_new_length", scope: !2730, file: !2729, line: 139, type: !2778, scopeLine: 139, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2778 = !DISubroutineType(types: !2779)
!2779 = !{null, !2780}
!2780 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2730, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2781 = !{!2782}
!2782 = !DILocalVariable(name: "this", arg: 1, scope: !2728, type: !2783, flags: DIFlagArtificial | DIFlagObjectPointer)
!2783 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2730, size: 64)
!2784 = !DILocation(line: 0, scope: !2728)
!2785 = !DILocation(line: 141, column: 5, scope: !2728)
!2786 = !DILocation(line: 140, column: 11, scope: !2728)
!2787 = !{!2788, !2788, i64 0}
!2788 = !{!"vtable pointer", !1718, i64 0}
!2789 = !DILocation(line: 142, column: 5, scope: !2728)
!2790 = distinct !DISubprogram(name: "bad_array_new_length", linkageName: "??0bad_array_new_length@std@@QEAA@AEBV01@@Z", scope: !2730, file: !2729, line: 134, type: !2791, scopeLine: 134, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !2795, retainedNodes: !2796)
!2791 = !DISubroutineType(types: !2792)
!2792 = !{null, !2780, !2793}
!2793 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2794, size: 64)
!2794 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2730)
!2795 = !DISubprogram(name: "bad_array_new_length", scope: !2730, type: !2791, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2796 = !{!2797, !2798}
!2797 = !DILocalVariable(arg: 2, scope: !2790, type: !2793)
!2798 = !DILocalVariable(name: "this", arg: 1, scope: !2790, type: !2783, flags: DIFlagArtificial | DIFlagObjectPointer)
!2799 = !DILocation(line: 0, scope: !2790)
!2800 = !DILocation(line: 134, column: 7, scope: !2790)
!2801 = distinct !DISubprogram(name: "bad_alloc", linkageName: "??0bad_alloc@std@@QEAA@AEBV01@@Z", scope: !2733, file: !2729, line: 114, type: !2802, scopeLine: 114, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !2806, retainedNodes: !2807)
!2802 = !DISubroutineType(types: !2803)
!2803 = !{null, !2773, !2804}
!2804 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2805, size: 64)
!2805 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2733)
!2806 = !DISubprogram(name: "bad_alloc", scope: !2733, type: !2802, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2807 = !{!2808, !2809}
!2808 = !DILocalVariable(arg: 2, scope: !2801, type: !2804)
!2809 = !DILocalVariable(name: "this", arg: 1, scope: !2801, type: !2810, flags: DIFlagArtificial | DIFlagObjectPointer)
!2810 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2733, size: 64)
!2811 = !DILocation(line: 0, scope: !2801)
!2812 = !DILocation(line: 114, column: 7, scope: !2801)
!2813 = distinct !DISubprogram(name: "exception", linkageName: "??0exception@std@@QEAA@AEBV01@@Z", scope: !2736, file: !2729, line: 70, type: !2757, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !2756, retainedNodes: !2814)
!2814 = !{!2815, !2816}
!2815 = !DILocalVariable(name: "_Other", arg: 2, scope: !2813, file: !2729, line: 70, type: !2759)
!2816 = !DILocalVariable(name: "this", arg: 1, scope: !2813, type: !2817, flags: DIFlagArtificial | DIFlagObjectPointer)
!2817 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2736, size: 64)
!2818 = !DILocation(line: 70, column: 32, scope: !2813)
!2819 = !DILocation(line: 0, scope: !2813)
!2820 = !DILocation(line: 72, column: 5, scope: !2813)
!2821 = !DILocation(line: 71, column: 11, scope: !2813)
!2822 = !DILocation(line: 73, column: 46, scope: !2823)
!2823 = distinct !DILexicalBlock(scope: !2813, file: !2729, line: 72, column: 5)
!2824 = !DILocation(line: 73, column: 31, scope: !2823)
!2825 = !DILocation(line: 73, column: 38, scope: !2823)
!2826 = !DILocation(line: 73, column: 9, scope: !2823)
!2827 = !DILocation(line: 74, column: 5, scope: !2813)
!2828 = distinct !DISubprogram(name: "~exception", linkageName: "??1exception@std@@UEAA@XZ", scope: !2736, file: !2729, line: 88, type: !2747, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !2765, retainedNodes: !2829)
!2829 = !{!2830}
!2830 = !DILocalVariable(name: "this", arg: 1, scope: !2828, type: !2817, flags: DIFlagArtificial | DIFlagObjectPointer)
!2831 = !DILocation(line: 0, scope: !2828)
!2832 = !DILocation(line: 89, column: 5, scope: !2828)
!2833 = !DILocation(line: 90, column: 34, scope: !2834)
!2834 = distinct !DILexicalBlock(scope: !2828, file: !2729, line: 89, column: 5)
!2835 = !DILocation(line: 90, column: 9, scope: !2834)
!2836 = !DILocation(line: 91, column: 5, scope: !2828)
!2837 = distinct !DISubprogram(name: "bad_alloc", linkageName: "??0bad_alloc@std@@AEAA@QEBD@Z", scope: !2733, file: !2729, line: 128, type: !2775, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !2774, retainedNodes: !2838)
!2838 = !{!2839, !2840}
!2839 = !DILocalVariable(name: "_Message", arg: 2, scope: !2837, file: !2729, line: 128, type: !314)
!2840 = !DILocalVariable(name: "this", arg: 1, scope: !2837, type: !2810, flags: DIFlagArtificial | DIFlagObjectPointer)
!2841 = !DILocation(line: 128, column: 33, scope: !2837)
!2842 = !DILocation(line: 0, scope: !2837)
!2843 = !DILocation(line: 130, column: 5, scope: !2837)
!2844 = !DILocation(line: 129, column: 21, scope: !2837)
!2845 = !DILocation(line: 129, column: 11, scope: !2837)
!2846 = !DILocation(line: 131, column: 5, scope: !2837)
!2847 = distinct !DISubprogram(name: "~bad_array_new_length", linkageName: "??_Gbad_array_new_length@std@@UEAAPEAXI@Z", scope: !2730, file: !2729, line: 134, type: !2778, scopeLine: 134, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !2848, retainedNodes: !2849)
!2848 = !DISubprogram(name: "~bad_array_new_length", scope: !2730, type: !2778, containingType: !2730, virtualIndex: 0, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagVirtual | DISPFlagOptimized)
!2849 = !{!2850, !2851}
!2850 = !DILocalVariable(name: "should_call_delete", arg: 2, scope: !2847, type: !6, flags: DIFlagArtificial)
!2851 = !DILocalVariable(name: "this", arg: 1, scope: !2847, type: !2783, flags: DIFlagArtificial | DIFlagObjectPointer)
!2852 = !DILocation(line: 0, scope: !2847)
!2853 = !DILocation(line: 134, column: 7, scope: !2847)
!2854 = distinct !DISubprogram(name: "what", linkageName: "?what@exception@std@@UEBAPEBDXZ", scope: !2736, file: !2729, line: 93, type: !2767, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !2766, retainedNodes: !2855)
!2855 = !{!2856}
!2856 = !DILocalVariable(name: "this", arg: 1, scope: !2854, type: !2857, flags: DIFlagArtificial | DIFlagObjectPointer)
!2857 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2760, size: 64)
!2858 = !DILocation(line: 0, scope: !2854)
!2859 = !DILocation(line: 95, column: 16, scope: !2854)
!2860 = !DILocation(line: 95, column: 22, scope: !2854)
!2861 = !{!2862, !1716, i64 8}
!2862 = !{!"?AVexception@std@@", !2863, i64 8}
!2863 = !{!"?AU__std_exception_data@@", !1716, i64 0, !2664, i64 8}
!2864 = !DILocation(line: 95, column: 30, scope: !2854)
!2865 = !DILocation(line: 95, column: 36, scope: !2854)
!2866 = !DILocation(line: 95, column: 9, scope: !2854)
!2867 = distinct !DISubprogram(name: "exception", linkageName: "??0exception@std@@QEAA@QEBDH@Z", scope: !2736, file: !2729, line: 64, type: !2754, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !2753, retainedNodes: !2868)
!2868 = !{!2869, !2870, !2871}
!2869 = !DILocalVariable(arg: 3, scope: !2867, file: !2729, line: 64, type: !6)
!2870 = !DILocalVariable(name: "_Message", arg: 2, scope: !2867, file: !2729, line: 64, type: !314)
!2871 = !DILocalVariable(name: "this", arg: 1, scope: !2867, type: !2817, flags: DIFlagArtificial | DIFlagObjectPointer)
!2872 = !DILocation(line: 64, column: 46, scope: !2867)
!2873 = !DILocation(line: 64, column: 33, scope: !2867)
!2874 = !DILocation(line: 0, scope: !2867)
!2875 = !DILocation(line: 66, column: 5, scope: !2867)
!2876 = !DILocation(line: 65, column: 11, scope: !2867)
!2877 = !DILocation(line: 67, column: 23, scope: !2878)
!2878 = distinct !DILexicalBlock(scope: !2867, file: !2729, line: 66, column: 5)
!2879 = !DILocation(line: 67, column: 9, scope: !2878)
!2880 = !DILocation(line: 67, column: 15, scope: !2878)
!2881 = !DILocation(line: 67, column: 21, scope: !2878)
!2882 = !DILocation(line: 68, column: 5, scope: !2867)
!2883 = distinct !DISubprogram(name: "~bad_alloc", linkageName: "??_Gbad_alloc@std@@UEAAPEAXI@Z", scope: !2733, file: !2729, line: 114, type: !2771, scopeLine: 114, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !2884, retainedNodes: !2885)
!2884 = !DISubprogram(name: "~bad_alloc", scope: !2733, type: !2771, containingType: !2733, virtualIndex: 0, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagVirtual | DISPFlagOptimized)
!2885 = !{!2886, !2887}
!2886 = !DILocalVariable(name: "should_call_delete", arg: 2, scope: !2883, type: !6, flags: DIFlagArtificial)
!2887 = !DILocalVariable(name: "this", arg: 1, scope: !2883, type: !2810, flags: DIFlagArtificial | DIFlagObjectPointer)
!2888 = !DILocation(line: 0, scope: !2883)
!2889 = !DILocation(line: 114, column: 7, scope: !2883)
!2890 = distinct !DISubprogram(name: "~exception", linkageName: "??_Gexception@std@@UEAAPEAXI@Z", scope: !2736, file: !2729, line: 88, type: !2747, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !2765, retainedNodes: !2891)
!2891 = !{!2892, !2893}
!2892 = !DILocalVariable(name: "should_call_delete", arg: 2, scope: !2890, type: !6, flags: DIFlagArtificial)
!2893 = !DILocalVariable(name: "this", arg: 1, scope: !2890, type: !2817, flags: DIFlagArtificial | DIFlagObjectPointer)
!2894 = !DILocation(line: 0, scope: !2890)
!2895 = !DILocation(line: 89, column: 5, scope: !2890)
!2896 = !DILocation(line: 91, column: 5, scope: !2890)
!2897 = distinct !DISubprogram(name: "copy", linkageName: "?copy@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z", scope: !291, file: !42, line: 48, type: !312, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !311, retainedNodes: !2898)
!2898 = !{!2899, !2900, !2901}
!2899 = !DILocalVariable(name: "_Count", arg: 3, scope: !2897, file: !42, line: 49, type: !111)
!2900 = !DILocalVariable(name: "_First2", arg: 2, scope: !2897, file: !42, line: 49, type: !314)
!2901 = !DILocalVariable(name: "_First1", arg: 1, scope: !2897, file: !42, line: 48, type: !110)
!2902 = !DILocation(line: 49, column: 69, scope: !2897)
!2903 = !DILocation(line: 49, column: 47, scope: !2897)
!2904 = !DILocation(line: 48, column: 75, scope: !2897)
!2905 = !DILocation(line: 52, column: 26, scope: !2897)
!2906 = !DILocation(line: 52, column: 35, scope: !2897)
!2907 = !DILocation(line: 52, column: 44, scope: !2897)
!2908 = !DILocation(line: 52, column: 51, scope: !2897)
!2909 = !DILocation(line: 52, column: 9, scope: !2897)
!2910 = !DILocation(line: 68, column: 16, scope: !2897)
!2911 = !DILocation(line: 68, column: 9, scope: !2897)
!2912 = distinct !DISubprogram(name: "_Voidify_iter<char **>", linkageName: "??$_Voidify_iter@PEAPEAD@std@@YAPEAXPEAPEAD@Z", scope: !14, file: !413, line: 130, type: !2913, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, templateParams: !2917, retainedNodes: !2915)
!2913 = !DISubroutineType(types: !2914)
!2914 = !{!31, !1458}
!2915 = !{!2916}
!2916 = !DILocalVariable(name: "_It", arg: 1, scope: !2912, file: !413, line: 130, type: !1458)
!2917 = !{!2918}
!2918 = !DITemplateTypeParameter(name: "_Iter", type: !1458)
!2919 = !DILocation(line: 130, column: 48, scope: !2912)
!2920 = !DILocation(line: 132, column: 68, scope: !2921)
!2921 = distinct !DILexicalBlock(scope: !2922, file: !413, line: 131, column: 40)
!2922 = distinct !DILexicalBlock(scope: !2912, file: !413, line: 131, column: 19)
!2923 = !DILocation(line: 132, column: 9, scope: !2921)
!2924 = distinct !DISubprogram(name: "addressof<char *>", linkageName: "??$addressof@PEAD@std@@YAPEAPEADAEAPEAD@Z", scope: !14, file: !2378, line: 274, type: !2925, scopeLine: 274, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, templateParams: !1970, retainedNodes: !2927)
!2925 = !DISubroutineType(types: !2926)
!2926 = !{!1458, !1967}
!2927 = !{!2928}
!2928 = !DILocalVariable(name: "_Val", arg: 1, scope: !2924, file: !2378, line: 274, type: !1967)
!2929 = !DILocation(line: 274, column: 42, scope: !2924)
!2930 = !DILocation(line: 275, column: 32, scope: !2924)
!2931 = !DILocation(line: 275, column: 5, scope: !2924)
!2932 = distinct !DISubprogram(name: "forward<char *const &>", linkageName: "??$forward@AEBQEAD@std@@YAAEBQEADAEBQEAD@Z", scope: !14, file: !1606, line: 1442, type: !2933, scopeLine: 1443, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, templateParams: !2941, retainedNodes: !2943)
!2933 = !DISubroutineType(types: !2934)
!2934 = !{!2462, !2935}
!2935 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2936, size: 64)
!2936 = !DIDerivedType(tag: DW_TAG_typedef, name: "remove_reference_t<char *const &>", scope: !14, file: !67, line: 232, baseType: !2937)
!2937 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !2938, file: !67, line: 221, baseType: !110)
!2938 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "remove_reference<char *const &>", scope: !14, file: !67, line: 220, size: 8, flags: DIFlagTypePassByValue, elements: !2939, templateParams: !2941, identifier: ".?AU?$remove_reference@AEBQEAD@std@@")
!2939 = !{!2937, !2940}
!2940 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Const_thru_ref_type", scope: !2938, file: !67, line: 222, baseType: !2462)
!2941 = !{!2942}
!2942 = !DITemplateTypeParameter(name: "_Ty", type: !2462)
!2943 = !{!2944}
!2944 = !DILocalVariable(name: "_Arg", arg: 1, scope: !2932, file: !1606, line: 1443, type: !2935)
!2945 = !DILocation(line: 1443, column: 30, scope: !2932)
!2946 = !DILocation(line: 1444, column: 31, scope: !2932)
!2947 = !DILocation(line: 1444, column: 5, scope: !2932)
!2948 = distinct !DISubprogram(name: "select_on_container_copy_construction", linkageName: "?select_on_container_copy_construction@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA?AV?$allocator@D@2@AEBV32@@Z", scope: !48, file: !46, line: 731, type: !171, scopeLine: 731, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !170, retainedNodes: !2949)
!2949 = !{!2950}
!2950 = !DILocalVariable(name: "_Al", arg: 1, scope: !2948, file: !46, line: 731, type: !101)
!2951 = !DILocation(line: 731, column: 104, scope: !2948)
!2952 = !DILocation(line: 732, column: 16, scope: !2948)
!2953 = !DILocation(line: 732, column: 9, scope: !2948)
!2954 = distinct !DISubprogram(name: "_Compressed_pair<std::allocator<char>>", linkageName: "??$?0V?$allocator@D@std@@$$V@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@U_One_then_variadic_args_t@1@$$QEAV?$allocator@D@1@@Z", scope: !424, file: !46, line: 1373, type: !2955, scopeLine: 1375, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, templateParams: !2965, declaration: !2964, retainedNodes: !2967)
!2955 = !DISubroutineType(types: !2956)
!2956 = !{null, !432, !2957, !2963}
!2957 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_One_then_variadic_args_t", scope: !14, file: !46, line: 1356, size: 8, flags: DIFlagTypePassByValue, elements: !2958, identifier: ".?AU_One_then_variadic_args_t@std@@")
!2958 = !{!2959}
!2959 = !DISubprogram(name: "_One_then_variadic_args_t", scope: !2957, file: !46, line: 1357, type: !2960, scopeLine: 1357, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2960 = !DISubroutineType(types: !2961)
!2961 = !{null, !2962}
!2962 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2957, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2963 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !51, size: 64)
!2964 = !DISubprogram(name: "_Compressed_pair<std::allocator<char>>", scope: !424, file: !46, line: 1373, type: !2955, scopeLine: 1373, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized, templateParams: !2965)
!2965 = !{!2966, !2107}
!2966 = !DITemplateTypeParameter(name: "_Other1", type: !51)
!2967 = !{!2968, !2969, !2970}
!2968 = !DILocalVariable(name: "_Val1", arg: 3, scope: !2954, file: !46, line: 1373, type: !2963)
!2969 = !DILocalVariable(arg: 2, scope: !2954, file: !46, line: 1373, type: !2957)
!2970 = !DILocalVariable(name: "this", arg: 1, scope: !2954, type: !1938, flags: DIFlagArtificial | DIFlagObjectPointer)
!2971 = !DILocation(line: 1373, column: 69, scope: !2954)
!2972 = !DILocation(line: 1373, column: 57, scope: !2954)
!2973 = !DILocation(line: 0, scope: !2954)
!2974 = !DILocation(line: 1375, column: 88, scope: !2954)
!2975 = !DILocation(line: 1375, column: 38, scope: !2954)
!2976 = !DILocation(line: 1375, column: 16, scope: !2954)
!2977 = !DILocation(line: 1375, column: 47, scope: !2954)
!2978 = !DILocation(line: 1375, column: 89, scope: !2954)
!2979 = distinct !DISubprogram(name: "_Construct_lv_contents", linkageName: "?_Construct_lv_contents@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@@Z", scope: !41, file: !42, line: 2915, type: !443, scopeLine: 2915, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !533, retainedNodes: !2980)
!2980 = !{!2981, !2982, !2983, !2985, !2986, !2987, !2988, !2989, !2990, !2991}
!2981 = !DILocalVariable(name: "_Right", arg: 2, scope: !2979, file: !42, line: 2915, type: !446)
!2982 = !DILocalVariable(name: "this", arg: 1, scope: !2979, type: !1677, flags: DIFlagArtificial | DIFlagObjectPointer)
!2983 = !DILocalVariable(name: "_Right_data", scope: !2979, file: !42, line: 2920, type: !2984)
!2984 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !268, size: 64)
!2985 = !DILocalVariable(name: "_Right_size", scope: !2979, file: !42, line: 2921, type: !460)
!2986 = !DILocalVariable(name: "_Right_ptr", scope: !2979, file: !42, line: 2922, type: !314)
!2987 = !DILocalVariable(name: "_My_data", scope: !2979, file: !42, line: 2923, type: !2131)
!2988 = !DILocalVariable(name: "_Stay_small", scope: !2979, file: !42, line: 2928, type: !72)
!2989 = !DILocalVariable(name: "_Al", scope: !2979, file: !42, line: 2940, type: !106)
!2990 = !DILocalVariable(name: "_New_capacity", scope: !2979, file: !42, line: 2941, type: !460)
!2991 = !DILocalVariable(name: "_New_array", scope: !2979, file: !42, line: 2942, type: !1876)
!2992 = !DILocation(line: 2915, column: 76, scope: !2979)
!2993 = !DILocation(line: 0, scope: !2979)
!2994 = !DILocation(line: 2920, column: 9, scope: !2979)
!2995 = !DILocation(line: 2920, column: 15, scope: !2979)
!2996 = !DILocation(line: 2920, column: 41, scope: !2979)
!2997 = !DILocation(line: 2920, column: 48, scope: !2979)
!2998 = !DILocation(line: 2920, column: 56, scope: !2979)
!2999 = !DILocation(line: 2921, column: 9, scope: !2979)
!3000 = !DILocation(line: 2921, column: 25, scope: !2979)
!3001 = !DILocation(line: 2921, column: 41, scope: !2979)
!3002 = !DILocation(line: 2921, column: 53, scope: !2979)
!3003 = !DILocation(line: 2922, column: 9, scope: !2979)
!3004 = !DILocation(line: 2922, column: 28, scope: !2979)
!3005 = !DILocation(line: 2922, column: 41, scope: !2979)
!3006 = !DILocation(line: 2922, column: 53, scope: !2979)
!3007 = !DILocation(line: 2923, column: 9, scope: !2979)
!3008 = !DILocation(line: 2923, column: 15, scope: !2979)
!3009 = !DILocation(line: 2923, column: 41, scope: !2979)
!3010 = !DILocation(line: 2923, column: 49, scope: !2979)
!3011 = !DILocation(line: 2928, column: 9, scope: !2979)
!3012 = !DILocation(line: 2928, column: 20, scope: !2979)
!3013 = !DILocation(line: 2928, column: 34, scope: !2979)
!3014 = !DILocation(line: 2928, column: 46, scope: !2979)
!3015 = !DILocation(line: 2933, column: 13, scope: !3016)
!3016 = distinct !DILexicalBlock(scope: !2979, file: !42, line: 2933, column: 13)
!3017 = !{i8 0, i8 2}
!3018 = !DILocation(line: 2933, column: 13, scope: !2979)
!3019 = !DILocation(line: 2934, column: 46, scope: !3020)
!3020 = distinct !DILexicalBlock(scope: !3016, file: !42, line: 2933, column: 26)
!3021 = !DILocation(line: 2934, column: 27, scope: !3020)
!3022 = !DILocation(line: 2934, column: 36, scope: !3020)
!3023 = !DILocation(line: 2934, column: 40, scope: !3020)
!3024 = !DILocation(line: 2934, column: 13, scope: !3020)
!3025 = !DILocation(line: 2935, column: 32, scope: !3020)
!3026 = !DILocation(line: 2935, column: 13, scope: !3020)
!3027 = !DILocation(line: 2935, column: 22, scope: !3020)
!3028 = !DILocation(line: 2935, column: 30, scope: !3020)
!3029 = !DILocation(line: 2936, column: 13, scope: !3020)
!3030 = !DILocation(line: 2936, column: 22, scope: !3020)
!3031 = !DILocation(line: 2936, column: 30, scope: !3020)
!3032 = !DILocation(line: 2937, column: 13, scope: !3020)
!3033 = !DILocation(line: 2940, column: 9, scope: !2979)
!3034 = !DILocation(line: 2940, column: 15, scope: !2979)
!3035 = !DILocation(line: 2940, column: 41, scope: !2979)
!3036 = !DILocation(line: 2941, column: 9, scope: !2979)
!3037 = !DILocation(line: 2941, column: 25, scope: !2979)
!3038 = !DILocation(line: 2941, column: 79, scope: !2979)
!3039 = !DILocation(line: 2941, column: 52, scope: !2979)
!3040 = !DILocation(line: 2941, column: 64, scope: !2979)
!3041 = !DILocation(line: 2941, column: 41, scope: !2979)
!3042 = !DILocation(line: 2942, column: 9, scope: !2979)
!3043 = !DILocation(line: 2942, column: 23, scope: !2979)
!3044 = !DILocation(line: 2942, column: 41, scope: !2979)
!3045 = !DILocation(line: 2942, column: 54, scope: !2979)
!3046 = !DILocation(line: 2942, column: 68, scope: !2979)
!3047 = !DILocation(line: 2942, column: 45, scope: !2979)
!3048 = !DILocation(line: 2943, column: 29, scope: !2979)
!3049 = !DILocation(line: 2943, column: 38, scope: !2979)
!3050 = !DILocation(line: 2943, column: 42, scope: !2979)
!3051 = !DILocation(line: 2943, column: 9, scope: !2979)
!3052 = !DILocation(line: 2950, column: 57, scope: !2979)
!3053 = !DILocation(line: 2950, column: 69, scope: !2979)
!3054 = !DILocation(line: 2950, column: 45, scope: !2979)
!3055 = !DILocation(line: 2950, column: 32, scope: !2979)
!3056 = !DILocation(line: 2950, column: 23, scope: !2979)
!3057 = !DILocation(line: 2950, column: 9, scope: !2979)
!3058 = !DILocation(line: 2951, column: 28, scope: !2979)
!3059 = !DILocation(line: 2951, column: 9, scope: !2979)
!3060 = !DILocation(line: 2951, column: 18, scope: !2979)
!3061 = !DILocation(line: 2951, column: 26, scope: !2979)
!3062 = !DILocation(line: 2952, column: 28, scope: !2979)
!3063 = !DILocation(line: 2952, column: 9, scope: !2979)
!3064 = !DILocation(line: 2952, column: 18, scope: !2979)
!3065 = !DILocation(line: 2952, column: 26, scope: !2979)
!3066 = !DILocation(line: 2953, column: 5, scope: !2979)
!3067 = distinct !DISubprogram(name: "forward<std::allocator<char> >", linkageName: "??$forward@V?$allocator@D@std@@@std@@YA$$QEAV?$allocator@D@0@AEAV10@@Z", scope: !14, file: !1606, line: 1442, type: !3068, scopeLine: 1443, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, templateParams: !3076, retainedNodes: !3078)
!3068 = !DISubroutineType(types: !3069)
!3069 = !{!2963, !3070}
!3070 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !3071, size: 64)
!3071 = !DIDerivedType(tag: DW_TAG_typedef, name: "remove_reference_t<std::allocator<char> >", scope: !14, file: !67, line: 232, baseType: !3072)
!3072 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !3073, file: !67, line: 215, baseType: !51)
!3073 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "remove_reference<std::allocator<char> >", scope: !14, file: !67, line: 214, size: 8, flags: DIFlagTypePassByValue, elements: !3074, templateParams: !3076, identifier: ".?AU?$remove_reference@V?$allocator@D@std@@@std@@")
!3074 = !{!3072, !3075}
!3075 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Const_thru_ref_type", scope: !3073, file: !67, line: 216, baseType: !90)
!3076 = !{!3077}
!3077 = !DITemplateTypeParameter(name: "_Ty", type: !51)
!3078 = !{!3079}
!3079 = !DILocalVariable(name: "_Arg", arg: 1, scope: !3067, file: !1606, line: 1443, type: !3070)
!3080 = !DILocation(line: 1443, column: 30, scope: !3067)
!3081 = !DILocation(line: 1444, column: 31, scope: !3067)
!3082 = !DILocation(line: 1444, column: 5, scope: !3067)
!3083 = distinct !DISubprogram(name: "_Myptr", linkageName: "?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBAPEBDXZ", scope: !189, file: !42, line: 2304, type: !264, scopeLine: 2304, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !263, retainedNodes: !3084)
!3084 = !{!3085, !3086}
!3085 = !DILocalVariable(name: "this", arg: 1, scope: !3083, type: !1951, flags: DIFlagArtificial | DIFlagObjectPointer)
!3086 = !DILocalVariable(name: "_Result", scope: !3083, file: !42, line: 2305, type: !266)
!3087 = !DILocation(line: 0, scope: !3083)
!3088 = !DILocation(line: 2305, column: 9, scope: !3083)
!3089 = !DILocation(line: 2305, column: 27, scope: !3083)
!3090 = !DILocation(line: 2305, column: 37, scope: !3083)
!3091 = !DILocation(line: 2305, column: 41, scope: !3083)
!3092 = !DILocation(line: 2306, column: 13, scope: !3093)
!3093 = distinct !DILexicalBlock(scope: !3083, file: !42, line: 2306, column: 13)
!3094 = !DILocation(line: 2306, column: 13, scope: !3083)
!3095 = !DILocation(line: 2307, column: 32, scope: !3096)
!3096 = distinct !DILexicalBlock(scope: !3093, file: !42, line: 2306, column: 38)
!3097 = !DILocation(line: 2307, column: 36, scope: !3096)
!3098 = !DILocation(line: 2307, column: 23, scope: !3096)
!3099 = !DILocation(line: 2307, column: 21, scope: !3096)
!3100 = !DILocation(line: 2308, column: 9, scope: !3096)
!3101 = !DILocation(line: 2310, column: 16, scope: !3083)
!3102 = !DILocation(line: 2311, column: 5, scope: !3083)
!3103 = !DILocation(line: 2310, column: 9, scope: !3083)
!3104 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_noobar.cpp", scope: !1668, file: !1668, type: !3105, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !209)
!3105 = !DISubroutineType(types: !209)
!3106 = !DILocation(line: 0, scope: !3104)

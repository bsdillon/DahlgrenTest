; ModuleID = 'assignmentTest.cpp'
source_filename = "assignmentTest.cpp"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.29.30037"

%"struct.std::_Fake_allocator" = type { i8 }
%rtti.TypeDescriptor30 = type { i8**, i8*, [31 x i8] }
%eh.CatchableType = type { i32, i32, i32, i32, i32, i32, i32 }
%rtti.TypeDescriptor19 = type { i8**, i8*, [20 x i8] }
%eh.CatchableTypeArray.3 = type { i32, [3 x i32] }
%eh.ThrowInfo = type { i32, i32, i32, i32 }
%rtti.CompleteObjectLocator = type { i32, i32, i32, i32, i32, i32 }
%rtti.ClassHierarchyDescriptor = type { i32, i32, i32, i32 }
%rtti.BaseClassDescriptor = type { i32, i32, i32, i32, i32, i32, i32 }
%"class.std::basic_string" = type { %"class.std::_Compressed_pair" }
%"class.std::_Compressed_pair" = type { %"class.std::_String_val" }
%"class.std::_String_val" = type { %"union.std::_String_val<std::_Simple_types<char>>::_Bxty", i64, i64 }
%"union.std::_String_val<std::_Simple_types<char>>::_Bxty" = type { i8*, [8 x i8] }
%"struct.std::_Zero_then_variadic_args_t" = type { i8 }
%"struct.std::_Fake_proxy_ptr_impl" = type { i8 }
%"struct.std::_Container_base0" = type { i8 }
%"class.std::allocator" = type { i8 }
%class.anon = type { i8 }
%"class.std::bad_array_new_length" = type { %"class.std::bad_alloc" }
%"class.std::bad_alloc" = type { %"class.std::exception" }
%"class.std::exception" = type { i32 (...)**, %struct.__std_exception_data }
%struct.__std_exception_data = type { i8*, i8 }

$"??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@QEBD@Z" = comdat any

$"??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@QEBD@Z" = comdat any

$"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ" = comdat any

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

$"??_C@_05NPMMKAPN@First?$AA@" = comdat any

$"??_C@_06NGJIOPAD@Second?$AA@" = comdat any

$"??_C@_05GAKKICCF@Third?$AA@" = comdat any

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

@"??_C@_05NPMMKAPN@First?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"First\00", comdat, align 1
@"??_C@_06NGJIOPAD@Second?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"Second\00", comdat, align 1
@"??_C@_05GAKKICCF@Third?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"Third\00", comdat, align 1
@"?_Fake_alloc@std@@3U_Fake_allocator@1@B" = internal constant %"struct.std::_Fake_allocator" undef, align 1, !dbg !0
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

@"??_7bad_array_new_length@std@@6B@" = unnamed_addr alias i8*, getelementptr inbounds ({ [3 x i8*] }, { [3 x i8*] }* @0, i32 0, i32 0, i32 1)
@"??_7bad_alloc@std@@6B@" = unnamed_addr alias i8*, getelementptr inbounds ({ [3 x i8*] }, { [3 x i8*] }* @1, i32 0, i32 0, i32 1)
@"??_7exception@std@@6B@" = unnamed_addr alias i8*, getelementptr inbounds ({ [3 x i8*] }, { [3 x i8*] }* @2, i32 0, i32 0, i32 1)

; Function Attrs: norecurse uwtable mustprogress
define dso_local i32 @main() #0 personality i8* bitcast (i32 (...)* @__CxxFrameHandler3 to i8*) !dbg !1626 {
  %1 = alloca i32, align 4
  %2 = alloca %"class.std::basic_string", align 8
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  %5 = alloca float, align 4
  %6 = alloca double, align 8
  %7 = alloca i8, align 1
  store i32 0, i32* %1, align 4
  %8 = bitcast %"class.std::basic_string"* %2 to i8*, !dbg !1635
  call void @llvm.lifetime.start.p0i8(i64 32, i8* %8) #17, !dbg !1635
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"* %2, metadata !1628, metadata !DIExpression()), !dbg !1636
  %9 = call %"class.std::basic_string"* @"??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@QEBD@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @"??_C@_05NPMMKAPN@First?$AA@", i64 0, i64 0)), !dbg !1637
  %10 = invoke nonnull align 8 dereferenceable(32) %"class.std::basic_string"* @"??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@QEBD@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @"??_C@_06NGJIOPAD@Second?$AA@", i64 0, i64 0))
          to label %11 unwind label %22, !dbg !1638

11:                                               ; preds = %0
  %12 = invoke nonnull align 8 dereferenceable(32) %"class.std::basic_string"* @"??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@QEBD@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @"??_C@_05GAKKICCF@Third?$AA@", i64 0, i64 0))
          to label %13 unwind label %22, !dbg !1639

13:                                               ; preds = %11
  %14 = bitcast i32* %3 to i8*, !dbg !1640
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %14) #17, !dbg !1640
  call void @llvm.dbg.declare(metadata i32* %3, metadata !1630, metadata !DIExpression()), !dbg !1641
  store i32 0, i32* %3, align 4, !dbg !1641, !tbaa !1642
  store i32 1, i32* %3, align 4, !dbg !1646, !tbaa !1642
  store i32 2, i32* %3, align 4, !dbg !1647, !tbaa !1642
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %4) #17, !dbg !1648
  call void @llvm.dbg.declare(metadata i8* %4, metadata !1631, metadata !DIExpression()), !dbg !1649
  store i8 65, i8* %4, align 1, !dbg !1649, !tbaa !1650
  store i8 66, i8* %4, align 1, !dbg !1651, !tbaa !1650
  store i8 67, i8* %4, align 1, !dbg !1652, !tbaa !1650
  %15 = bitcast float* %5 to i8*, !dbg !1653
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %15) #17, !dbg !1653
  call void @llvm.dbg.declare(metadata float* %5, metadata !1632, metadata !DIExpression()), !dbg !1654
  store float 5.000000e-01, float* %5, align 4, !dbg !1654, !tbaa !1655
  store float 0x3FF19999A0000000, float* %5, align 4, !dbg !1657, !tbaa !1655
  store float 0x40091EB860000000, float* %5, align 4, !dbg !1658, !tbaa !1655
  %16 = bitcast double* %6 to i8*, !dbg !1659
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %16) #17, !dbg !1659
  call void @llvm.dbg.declare(metadata double* %6, metadata !1633, metadata !DIExpression()), !dbg !1660
  store double 1.000500e+00, double* %6, align 8, !dbg !1660, !tbaa !1661
  store double 3.333330e+00, double* %6, align 8, !dbg !1663, !tbaa !1661
  store double 1.000000e-09, double* %6, align 8, !dbg !1664, !tbaa !1661
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %7) #17, !dbg !1665
  call void @llvm.dbg.declare(metadata i8* %7, metadata !1634, metadata !DIExpression()), !dbg !1666
  store i8 1, i8* %7, align 1, !dbg !1666, !tbaa !1667
  store i8 0, i8* %7, align 1, !dbg !1669, !tbaa !1667
  store i8 1, i8* %7, align 1, !dbg !1670, !tbaa !1667
  store i32 0, i32* %1, align 4, !dbg !1671
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %7) #17, !dbg !1672
  %17 = bitcast double* %6 to i8*, !dbg !1672
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %17) #17, !dbg !1672
  %18 = bitcast float* %5 to i8*, !dbg !1672
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %18) #17, !dbg !1672
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %4) #17, !dbg !1672
  %19 = bitcast i32* %3 to i8*, !dbg !1672
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %19) #17, !dbg !1672
  call void @"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %2) #17, !dbg !1672
  %20 = bitcast %"class.std::basic_string"* %2 to i8*, !dbg !1672
  call void @llvm.lifetime.end.p0i8(i64 32, i8* %20) #17, !dbg !1672
  %21 = load i32, i32* %1, align 4, !dbg !1672
  ret i32 %21, !dbg !1672

22:                                               ; preds = %11, %0
  %23 = cleanuppad within none [], !dbg !1672
  call void @"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %2) #17 [ "funclet"(token %23) ], !dbg !1672
  cleanupret from %23 unwind label %24, !dbg !1672

24:                                               ; preds = %22
  %25 = cleanuppad within none [], !dbg !1672
  %26 = bitcast %"class.std::basic_string"* %2 to i8*, !dbg !1672
  call void @llvm.lifetime.end.p0i8(i64 32, i8* %26) #17, !dbg !1672
  cleanupret from %25 unwind to caller, !dbg !1672
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: inlinehint uwtable
define linkonce_odr dso_local %"class.std::basic_string"* @"??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@QEBD@Z"(%"class.std::basic_string"* nonnull returned dereferenceable(32) %0, i8* %1) unnamed_addr #3 comdat align 2 personality i8* bitcast (i32 (...)* @__CxxFrameHandler3 to i8*) !dbg !1673 {
  %3 = alloca i8*, align 8
  %4 = alloca %"class.std::basic_string"*, align 8
  %5 = alloca %"struct.std::_Zero_then_variadic_args_t", align 1
  %6 = alloca %"struct.std::_Fake_allocator"*, align 8
  %7 = alloca %"struct.std::_Fake_proxy_ptr_impl", align 1
  store i8* %1, i8** %3, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %3, metadata !1675, metadata !DIExpression()), !dbg !1717
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %4, metadata !1676, metadata !DIExpression()), !dbg !1718
  %8 = load %"class.std::basic_string"*, %"class.std::basic_string"** %4, align 8
  %9 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %8, i32 0, i32 0, !dbg !1719
  %10 = getelementptr inbounds %"struct.std::_Zero_then_variadic_args_t", %"struct.std::_Zero_then_variadic_args_t"* %5, i32 0, i32 0, !dbg !1719
  %11 = load i8, i8* %10, align 1, !dbg !1719
  %12 = call %"class.std::_Compressed_pair"* @"??$?0$$V@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@U_Zero_then_variadic_args_t@1@@Z"(%"class.std::_Compressed_pair"* nonnull dereferenceable(32) %9, i8 %11) #17, !dbg !1719
  %13 = bitcast %"struct.std::_Fake_allocator"** %6 to i8*, !dbg !1720
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %13) #17, !dbg !1720
  call void @llvm.dbg.declare(metadata %"struct.std::_Fake_allocator"** %6, metadata !1678, metadata !DIExpression()), !dbg !1721
  store %"struct.std::_Fake_allocator"* @"?_Fake_alloc@std@@3U_Fake_allocator@1@B", %"struct.std::_Fake_allocator"** %6, align 8, !dbg !1721, !tbaa !1715
  %14 = bitcast %"struct.std::_Fake_proxy_ptr_impl"* %7 to i8*, !dbg !1722
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %14) #17, !dbg !1722
  call void @llvm.dbg.declare(metadata %"struct.std::_Fake_proxy_ptr_impl"* %7, metadata !1680, metadata !DIExpression()), !dbg !1723
  %15 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %8, i32 0, i32 0, !dbg !1724
  %16 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %15, i32 0, i32 0, !dbg !1725
  %17 = bitcast %"class.std::_String_val"* %16 to %"struct.std::_Container_base0"*, !dbg !1724
  %18 = call %"struct.std::_Fake_proxy_ptr_impl"* @"??0_Fake_proxy_ptr_impl@std@@QEAA@AEBU_Fake_allocator@1@AEBU_Container_base0@1@@Z"(%"struct.std::_Fake_proxy_ptr_impl"* nonnull dereferenceable(1) %7, %"struct.std::_Fake_allocator"* nonnull align 1 dereferenceable(1) @"?_Fake_alloc@std@@3U_Fake_allocator@1@B", %"struct.std::_Container_base0"* nonnull align 1 dereferenceable(1) %17) #17, !dbg !1723
  call void @"?_Tidy_init@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %8) #17, !dbg !1726
  %19 = load i8*, i8** %3, align 8, !dbg !1727, !tbaa !1715
  %20 = invoke nonnull align 8 dereferenceable(32) %"class.std::basic_string"* @"?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %8, i8* %19)
          to label %21 unwind label %24, !dbg !1728

21:                                               ; preds = %2
  call void @"?_Release@_Fake_proxy_ptr_impl@std@@QEAAXXZ"(%"struct.std::_Fake_proxy_ptr_impl"* nonnull dereferenceable(1) %7) #17, !dbg !1729
  %22 = bitcast %"struct.std::_Fake_proxy_ptr_impl"* %7 to i8*, !dbg !1730
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %22) #17, !dbg !1730
  %23 = bitcast %"struct.std::_Fake_allocator"** %6 to i8*, !dbg !1730
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %23) #17, !dbg !1730
  ret %"class.std::basic_string"* %8, !dbg !1730

24:                                               ; preds = %2
  %25 = cleanuppad within none [], !dbg !1730
  %26 = bitcast %"struct.std::_Fake_proxy_ptr_impl"* %7 to i8*, !dbg !1730
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %26) #17, !dbg !1730
  cleanupret from %25 unwind label %27, !dbg !1730

27:                                               ; preds = %24
  %28 = cleanuppad within none [], !dbg !1730
  %29 = bitcast %"struct.std::_Fake_allocator"** %6 to i8*, !dbg !1730
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %29) #17, !dbg !1730
  cleanupret from %28 unwind label %30, !dbg !1730

30:                                               ; preds = %27
  %31 = cleanuppad within none [], !dbg !1731
  call void @"??1?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@XZ"(%"class.std::_Compressed_pair"* nonnull dereferenceable(32) %9) #17 [ "funclet"(token %31) ], !dbg !1731
  cleanupret from %31 unwind to caller, !dbg !1731
}

; Function Attrs: inlinehint uwtable mustprogress
define linkonce_odr dso_local nonnull align 8 dereferenceable(32) %"class.std::basic_string"* @"??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@QEBD@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %0, i8* %1) #4 comdat align 2 !dbg !1732 {
  %3 = alloca i8*, align 8
  %4 = alloca %"class.std::basic_string"*, align 8
  store i8* %1, i8** %3, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %3, metadata !1734, metadata !DIExpression()), !dbg !1736
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %4, metadata !1735, metadata !DIExpression()), !dbg !1737
  %5 = load %"class.std::basic_string"*, %"class.std::basic_string"** %4, align 8
  %6 = load i8*, i8** %3, align 8, !dbg !1738, !tbaa !1715
  %7 = call nonnull align 8 dereferenceable(32) %"class.std::basic_string"* @"?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %5, i8* %6), !dbg !1739
  ret %"class.std::basic_string"* %7, !dbg !1740
}

declare dso_local i32 @__CxxFrameHandler3(...)

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %0) unnamed_addr #5 comdat align 2 !dbg !1741 {
  %2 = alloca %"class.std::basic_string"*, align 8
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %2, metadata !1743, metadata !DIExpression()), !dbg !1744
  %3 = load %"class.std::basic_string"*, %"class.std::basic_string"** %2, align 8
  call void @"?_Tidy_deallocate@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %3) #17, !dbg !1745
  %4 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %3, i32 0, i32 0, !dbg !1747
  call void @"??1?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@XZ"(%"class.std::_Compressed_pair"* nonnull dereferenceable(32) %4) #17, !dbg !1747
  ret void, !dbg !1748
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local void @"?_Tidy_deallocate@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %0) #6 comdat align 2 personality i8* bitcast (i32 (...)* @__CxxFrameHandler3 to i8*) !dbg !1749 {
  %2 = alloca %"class.std::basic_string"*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca %"class.std::allocator"*, align 8
  %5 = alloca i8, align 1
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %2, metadata !1751, metadata !DIExpression()), !dbg !1757
  %6 = load %"class.std::basic_string"*, %"class.std::basic_string"** %2, align 8
  %7 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %6, i32 0, i32 0, !dbg !1758
  %8 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %7, i32 0, i32 0, !dbg !1759
  %9 = bitcast %"class.std::_String_val"* %8 to %"struct.std::_Container_base0"*, !dbg !1758
  call void @"?_Orphan_all@_Container_base0@std@@QEAAXXZ"(%"struct.std::_Container_base0"* nonnull dereferenceable(1) %9) #17, !dbg !1760
  %10 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %6, i32 0, i32 0, !dbg !1761
  %11 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %10, i32 0, i32 0, !dbg !1762
  %12 = call zeroext i1 @"?_Large_string_engaged@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_NXZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %11) #17, !dbg !1763
  br i1 %12, label %13, label %42, !dbg !1764

13:                                               ; preds = %1
  %14 = bitcast i8** %3 to i8*, !dbg !1765
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %14) #17, !dbg !1765
  call void @llvm.dbg.declare(metadata i8** %3, metadata !1752, metadata !DIExpression()), !dbg !1766
  %15 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %6, i32 0, i32 0, !dbg !1767
  %16 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %15, i32 0, i32 0, !dbg !1768
  %17 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %16, i32 0, i32 0, !dbg !1769
  %18 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %17 to i8**, !dbg !1770
  %19 = load i8*, i8** %18, align 8, !dbg !1770, !tbaa !1650
  store i8* %19, i8** %3, align 8, !dbg !1766, !tbaa !1715
  %20 = bitcast %"class.std::allocator"** %4 to i8*, !dbg !1771
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %20) #17, !dbg !1771
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %4, metadata !1756, metadata !DIExpression()), !dbg !1772
  %21 = call nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV?$allocator@D@2@XZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %6) #17, !dbg !1773
  store %"class.std::allocator"* %21, %"class.std::allocator"** %4, align 8, !dbg !1772, !tbaa !1715
  %22 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %6, i32 0, i32 0, !dbg !1774
  %23 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %22, i32 0, i32 0, !dbg !1775
  %24 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %23, i32 0, i32 0, !dbg !1776
  %25 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %24 to i8**, !dbg !1777
  call void @"??$_Destroy_in_place@PEAD@std@@YAXAEAPEAD@Z"(i8** nonnull align 8 dereferenceable(8) %25) #17, !dbg !1778
  %26 = load %"class.std::allocator"*, %"class.std::allocator"** %4, align 8, !dbg !1779, !tbaa !1715
  %27 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %6, i32 0, i32 0, !dbg !1780
  %28 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %27, i32 0, i32 0, !dbg !1781
  %29 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %28, i32 0, i32 2, !dbg !1782
  %30 = load i64, i64* %29, align 8, !dbg !1782, !tbaa !1783
  %31 = add i64 %30, 1, !dbg !1788
  %32 = load i8*, i8** %3, align 8, !dbg !1789, !tbaa !1715
  invoke void @"?deallocate@?$allocator@D@std@@QEAAXQEAD_K@Z"(%"class.std::allocator"* nonnull dereferenceable(1) %26, i8* %32, i64 %31)
          to label %33 unwind label %36, !dbg !1790

33:                                               ; preds = %13
  %34 = bitcast %"class.std::allocator"** %4 to i8*, !dbg !1791
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %34) #17, !dbg !1791
  %35 = bitcast i8** %3 to i8*, !dbg !1791
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %35) #17, !dbg !1791
  br label %42, !dbg !1792

36:                                               ; preds = %13
  %37 = cleanuppad within none [], !dbg !1791
  %38 = bitcast %"class.std::allocator"** %4 to i8*, !dbg !1791
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %38) #17, !dbg !1791
  cleanupret from %37 unwind label %39, !dbg !1791

39:                                               ; preds = %36
  %40 = cleanuppad within none [], !dbg !1791
  %41 = bitcast i8** %3 to i8*, !dbg !1791
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %41) #17, !dbg !1791
  cleanupret from %40 unwind label %54, !dbg !1791

42:                                               ; preds = %33, %1
  %43 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %6, i32 0, i32 0, !dbg !1793
  %44 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %43, i32 0, i32 0, !dbg !1795
  %45 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %44, i32 0, i32 1, !dbg !1796
  store i64 0, i64* %45, align 8, !dbg !1797, !tbaa !1798
  %46 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %6, i32 0, i32 0, !dbg !1799
  %47 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %46, i32 0, i32 0, !dbg !1800
  %48 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %47, i32 0, i32 2, !dbg !1801
  store i64 15, i64* %48, align 8, !dbg !1802, !tbaa !1783
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %5) #17, !dbg !1803
  store i8 0, i8* %5, align 1, !dbg !1803, !tbaa !1650
  %49 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %6, i32 0, i32 0, !dbg !1804
  %50 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %49, i32 0, i32 0, !dbg !1805
  %51 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %50, i32 0, i32 0, !dbg !1806
  %52 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %51 to [16 x i8]*, !dbg !1807
  %53 = getelementptr inbounds [16 x i8], [16 x i8]* %52, i64 0, i64 0, !dbg !1804
  call void @"?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z"(i8* nonnull align 1 dereferenceable(1) %53, i8* nonnull align 1 dereferenceable(1) %5) #17, !dbg !1808
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %5) #17, !dbg !1808
  ret void, !dbg !1809

54:                                               ; preds = %39
  %55 = cleanuppad within none [], !dbg !1791
  call void @__std_terminate() #18 [ "funclet"(token %55) ], !dbg !1791
  unreachable, !dbg !1791
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @"??1?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@XZ"(%"class.std::_Compressed_pair"* nonnull dereferenceable(32) %0) unnamed_addr #5 comdat align 2 !dbg !1810 {
  %2 = alloca %"class.std::_Compressed_pair"*, align 8
  store %"class.std::_Compressed_pair"* %0, %"class.std::_Compressed_pair"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::_Compressed_pair"** %2, metadata !1815, metadata !DIExpression()), !dbg !1817
  %3 = load %"class.std::_Compressed_pair"*, %"class.std::_Compressed_pair"** %2, align 8
  %4 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %3, i32 0, i32 0, !dbg !1818
  call void @"??1?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %4) #17, !dbg !1818
  ret void, !dbg !1820
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local void @"?_Orphan_all@_Container_base0@std@@QEAAXXZ"(%"struct.std::_Container_base0"* nonnull dereferenceable(1) %0) #6 comdat align 2 !dbg !1821 {
  %2 = alloca %"struct.std::_Container_base0"*, align 8
  store %"struct.std::_Container_base0"* %0, %"struct.std::_Container_base0"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"struct.std::_Container_base0"** %2, metadata !1823, metadata !DIExpression()), !dbg !1824
  %3 = load %"struct.std::_Container_base0"*, %"struct.std::_Container_base0"** %2, align 8
  ret void, !dbg !1825
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local zeroext i1 @"?_Large_string_engaged@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_NXZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %0) #6 comdat align 2 !dbg !1826 {
  %2 = alloca %"class.std::_String_val"*, align 8
  store %"class.std::_String_val"* %0, %"class.std::_String_val"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::_String_val"** %2, metadata !1828, metadata !DIExpression()), !dbg !1830
  %3 = load %"class.std::_String_val"*, %"class.std::_String_val"** %2, align 8
  %4 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %3, i32 0, i32 2, !dbg !1831
  %5 = load i64, i64* %4, align 8, !dbg !1831, !tbaa !1832
  %6 = icmp ule i64 16, %5, !dbg !1833
  ret i1 %6, !dbg !1834
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV?$allocator@D@2@XZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %0) #6 comdat align 2 !dbg !1835 {
  %2 = alloca %"class.std::basic_string"*, align 8
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %2, metadata !1837, metadata !DIExpression()), !dbg !1838
  %3 = load %"class.std::basic_string"*, %"class.std::basic_string"** %2, align 8
  %4 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %3, i32 0, i32 0, !dbg !1839
  %5 = call nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAAAEAV?$allocator@D@2@XZ"(%"class.std::_Compressed_pair"* nonnull dereferenceable(32) %4) #17, !dbg !1840
  ret %"class.std::allocator"* %5, !dbg !1841
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local void @"??$_Destroy_in_place@PEAD@std@@YAXAEAPEAD@Z"(i8** nonnull align 8 dereferenceable(8) %0) #6 comdat !dbg !1842 {
  %2 = alloca i8**, align 8
  store i8** %0, i8*** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8*** %2, metadata !1847, metadata !DIExpression()), !dbg !1850
  %3 = load i8**, i8*** %2, align 8, !dbg !1851, !tbaa !1715
  ret void, !dbg !1854
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local void @"?deallocate@?$allocator@D@std@@QEAAXQEAD_K@Z"(%"class.std::allocator"* nonnull dereferenceable(1) %0, i8* %1, i64 %2) #6 comdat align 2 !dbg !1855 {
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %"class.std::allocator"*, align 8
  store i64 %2, i64* %4, align 8, !tbaa !1861
  call void @llvm.dbg.declare(metadata i64* %4, metadata !1857, metadata !DIExpression()), !dbg !1862
  store i8* %1, i8** %5, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %5, metadata !1858, metadata !DIExpression()), !dbg !1863
  store %"class.std::allocator"* %0, %"class.std::allocator"** %6, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %6, metadata !1859, metadata !DIExpression()), !dbg !1864
  %7 = load %"class.std::allocator"*, %"class.std::allocator"** %6, align 8
  %8 = load i64, i64* %4, align 8, !dbg !1865, !tbaa !1861
  %9 = mul i64 1, %8, !dbg !1866
  %10 = load i8*, i8** %5, align 8, !dbg !1867, !tbaa !1715
  call void @"??$_Deallocate@$0BA@$0A@@std@@YAXPEAX_K@Z"(i8* %10, i64 %9) #17, !dbg !1868
  ret void, !dbg !1869
}

declare dso_local void @__std_terminate()

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local void @"?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z"(i8* nonnull align 1 dereferenceable(1) %0, i8* nonnull align 1 dereferenceable(1) %1) #6 comdat align 2 !dbg !1870 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %1, i8** %3, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %3, metadata !1872, metadata !DIExpression()), !dbg !1874
  store i8* %0, i8** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %4, metadata !1873, metadata !DIExpression()), !dbg !1875
  %5 = load i8*, i8** %3, align 8, !dbg !1876, !tbaa !1715
  %6 = load i8, i8* %5, align 1, !dbg !1876, !tbaa !1650
  %7 = load i8*, i8** %4, align 8, !dbg !1877, !tbaa !1715
  store i8 %6, i8* %7, align 1, !dbg !1878, !tbaa !1650
  ret void, !dbg !1879
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAAAEAV?$allocator@D@2@XZ"(%"class.std::_Compressed_pair"* nonnull dereferenceable(32) %0) #7 comdat align 2 !dbg !1880 {
  %2 = alloca %"class.std::_Compressed_pair"*, align 8
  store %"class.std::_Compressed_pair"* %0, %"class.std::_Compressed_pair"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::_Compressed_pair"** %2, metadata !1882, metadata !DIExpression()), !dbg !1883
  %3 = load %"class.std::_Compressed_pair"*, %"class.std::_Compressed_pair"** %2, align 8
  %4 = bitcast %"class.std::_Compressed_pair"* %3 to %"class.std::allocator"*, !dbg !1884
  ret %"class.std::allocator"* %4, !dbg !1885
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local void @"??$_Deallocate@$0BA@$0A@@std@@YAXPEAX_K@Z"(i8* %0, i64 %1) #6 comdat personality i8* bitcast (i32 (...)* @__CxxFrameHandler3 to i8*) !dbg !1886 {
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  store i64 %1, i64* %3, align 8, !tbaa !1861
  call void @llvm.dbg.declare(metadata i64* %3, metadata !1890, metadata !DIExpression()), !dbg !1895
  store i8* %0, i8** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %4, metadata !1891, metadata !DIExpression()), !dbg !1896
  %5 = load i64, i64* %3, align 8, !dbg !1897, !tbaa !1861
  %6 = icmp uge i64 %5, 4096, !dbg !1900
  br i1 %6, label %7, label %9, !dbg !1901

7:                                                ; preds = %2
  invoke void @"?_Adjust_manually_vector_aligned@std@@YAXAEAPEAXAEA_K@Z"(i8** nonnull align 8 dereferenceable(8) %4, i64* nonnull align 8 dereferenceable(8) %3)
          to label %8 unwind label %12, !dbg !1902

8:                                                ; preds = %7
  br label %9, !dbg !1904

9:                                                ; preds = %8, %2
  %10 = load i64, i64* %3, align 8, !dbg !1905, !tbaa !1861
  %11 = load i8*, i8** %4, align 8, !dbg !1906, !tbaa !1715
  call void @"??3@YAXPEAX_K@Z"(i8* %11, i64 %10) #17, !dbg !1907
  ret void, !dbg !1908

12:                                               ; preds = %7
  %13 = cleanuppad within none [], !dbg !1902
  call void @__std_terminate() #18 [ "funclet"(token %13) ], !dbg !1902
  unreachable, !dbg !1902
}

; Function Attrs: inlinehint uwtable mustprogress
define linkonce_odr dso_local void @"?_Adjust_manually_vector_aligned@std@@YAXAEAPEAXAEA_K@Z"(i8** nonnull align 8 dereferenceable(8) %0, i64* nonnull align 8 dereferenceable(8) %1) #4 comdat !dbg !1909 {
  %3 = alloca i64*, align 8
  %4 = alloca i8**, align 8
  %5 = alloca i64*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  store i64* %1, i64** %3, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i64** %3, metadata !1915, metadata !DIExpression()), !dbg !1924
  store i8** %0, i8*** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8*** %4, metadata !1916, metadata !DIExpression()), !dbg !1925
  %9 = load i64*, i64** %3, align 8, !dbg !1926, !tbaa !1715
  %10 = load i64, i64* %9, align 8, !dbg !1927, !tbaa !1861
  %11 = add i64 %10, 39, !dbg !1927
  store i64 %11, i64* %9, align 8, !dbg !1927, !tbaa !1861
  %12 = bitcast i64** %5 to i8*, !dbg !1928
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %12) #17, !dbg !1928
  call void @llvm.dbg.declare(metadata i64** %5, metadata !1917, metadata !DIExpression()), !dbg !1929
  %13 = load i8**, i8*** %4, align 8, !dbg !1930, !tbaa !1715
  %14 = load i8*, i8** %13, align 8, !dbg !1930, !tbaa !1715
  %15 = bitcast i8* %14 to i64*, !dbg !1931
  store i64* %15, i64** %5, align 8, !dbg !1929, !tbaa !1715
  %16 = bitcast i64* %6 to i8*, !dbg !1932
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %16) #17, !dbg !1932
  call void @llvm.dbg.declare(metadata i64* %6, metadata !1921, metadata !DIExpression()), !dbg !1933
  %17 = load i64*, i64** %5, align 8, !dbg !1934, !tbaa !1715
  %18 = getelementptr inbounds i64, i64* %17, i64 -1, !dbg !1934
  %19 = load i64, i64* %18, align 8, !dbg !1934, !tbaa !1861
  store i64 %19, i64* %6, align 8, !dbg !1933, !tbaa !1861
  %20 = bitcast i64* %7 to i8*, !dbg !1935
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %20) #17, !dbg !1935
  call void @llvm.dbg.declare(metadata i64* %7, metadata !1922, metadata !DIExpression()), !dbg !1936
  store i64 8, i64* %7, align 8, !dbg !1936, !tbaa !1861
  %21 = bitcast i64* %8 to i8*, !dbg !1937
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %21) #17, !dbg !1937
  call void @llvm.dbg.declare(metadata i64* %8, metadata !1923, metadata !DIExpression()), !dbg !1938
  %22 = load i8**, i8*** %4, align 8, !dbg !1939, !tbaa !1715
  %23 = load i8*, i8** %22, align 8, !dbg !1939, !tbaa !1715
  %24 = ptrtoint i8* %23 to i64, !dbg !1940
  %25 = load i64, i64* %6, align 8, !dbg !1941, !tbaa !1861
  %26 = sub i64 %24, %25, !dbg !1942
  store i64 %26, i64* %8, align 8, !dbg !1938, !tbaa !1861
  br label %27, !dbg !1943

27:                                               ; preds = %2
  %28 = load i64, i64* %8, align 8, !dbg !1944, !tbaa !1861
  %29 = icmp uge i64 %28, 8, !dbg !1944
  br i1 %29, label %30, label %34, !dbg !1944

30:                                               ; preds = %27
  %31 = load i64, i64* %8, align 8, !dbg !1944, !tbaa !1861
  %32 = icmp ule i64 %31, 39, !dbg !1944
  br i1 %32, label %33, label %34, !dbg !1947

33:                                               ; preds = %30
  br label %38, !dbg !1948

34:                                               ; preds = %30, %27
  br label %35, !dbg !1950

35:                                               ; preds = %34
  call void @_invalid_parameter_noinfo_noreturn() #19, !dbg !1952
  unreachable, !dbg !1952

36:                                               ; No predecessors!
  br label %37, !dbg !1952

37:                                               ; preds = %36
  br label %38

38:                                               ; preds = %37, %33
  br label %39, !dbg !1947

39:                                               ; preds = %38
  br label %40, !dbg !1947

40:                                               ; preds = %39
  %41 = load i64, i64* %6, align 8, !dbg !1954, !tbaa !1861
  %42 = inttoptr i64 %41 to i8*, !dbg !1955
  %43 = load i8**, i8*** %4, align 8, !dbg !1956, !tbaa !1715
  store i8* %42, i8** %43, align 8, !dbg !1957, !tbaa !1715
  %44 = bitcast i64* %8 to i8*, !dbg !1958
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %44) #17, !dbg !1958
  %45 = bitcast i64* %7 to i8*, !dbg !1958
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %45) #17, !dbg !1958
  %46 = bitcast i64* %6 to i8*, !dbg !1958
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %46) #17, !dbg !1958
  %47 = bitcast i64** %5 to i8*, !dbg !1958
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %47) #17, !dbg !1958
  ret void, !dbg !1958
}

; Function Attrs: nounwind
declare dso_local void @"??3@YAXPEAX_K@Z"(i8*, i64) #8

; Function Attrs: noreturn
declare dso_local void @_invalid_parameter_noinfo_noreturn() #9

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @"??1?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %0) unnamed_addr #5 comdat align 2 !dbg !1959 {
  %2 = alloca %"class.std::_String_val"*, align 8
  store %"class.std::_String_val"* %0, %"class.std::_String_val"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::_String_val"** %2, metadata !1962, metadata !DIExpression()), !dbg !1964
  %3 = load %"class.std::_String_val"*, %"class.std::_String_val"** %2, align 8
  %4 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %3, i32 0, i32 0, !dbg !1965
  call void @"??1_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(%"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* nonnull dereferenceable(16) %4) #17, !dbg !1965
  ret void, !dbg !1967
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @"??1_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(%"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* nonnull dereferenceable(16) %0) unnamed_addr #5 comdat align 2 !dbg !1968 {
  %2 = alloca %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"*, align 8
  store %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %0, %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"** %2, metadata !1970, metadata !DIExpression()), !dbg !1972
  %3 = load %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"*, %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"** %2, align 8
  ret void, !dbg !1973
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local %"class.std::_Compressed_pair"* @"??$?0$$V@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@U_Zero_then_variadic_args_t@1@@Z"(%"class.std::_Compressed_pair"* nonnull returned dereferenceable(32) %0, i8 %1) unnamed_addr #10 comdat align 2 !dbg !1974 {
  %3 = alloca %"struct.std::_Zero_then_variadic_args_t", align 1
  %4 = alloca %"class.std::_Compressed_pair"*, align 8
  %5 = getelementptr inbounds %"struct.std::_Zero_then_variadic_args_t", %"struct.std::_Zero_then_variadic_args_t"* %3, i32 0, i32 0
  store i8 %1, i8* %5, align 1
  call void @llvm.dbg.declare(metadata %"struct.std::_Zero_then_variadic_args_t"* %3, metadata !1987, metadata !DIExpression()), !dbg !1989
  store %"class.std::_Compressed_pair"* %0, %"class.std::_Compressed_pair"** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::_Compressed_pair"** %4, metadata !1988, metadata !DIExpression()), !dbg !1990
  %6 = load %"class.std::_Compressed_pair"*, %"class.std::_Compressed_pair"** %4, align 8
  %7 = bitcast %"class.std::_Compressed_pair"* %6 to %"class.std::allocator"*, !dbg !1991
  %8 = call %"class.std::allocator"* @"??0?$allocator@D@std@@QEAA@XZ"(%"class.std::allocator"* nonnull dereferenceable(1) %7) #17, !dbg !1992
  %9 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %6, i32 0, i32 0, !dbg !1993
  %10 = call %"class.std::_String_val"* @"??0?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %9) #17, !dbg !1993
  ret %"class.std::_Compressed_pair"* %6, !dbg !1994
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local %"struct.std::_Fake_proxy_ptr_impl"* @"??0_Fake_proxy_ptr_impl@std@@QEAA@AEBU_Fake_allocator@1@AEBU_Container_base0@1@@Z"(%"struct.std::_Fake_proxy_ptr_impl"* nonnull returned dereferenceable(1) %0, %"struct.std::_Fake_allocator"* nonnull align 1 dereferenceable(1) %1, %"struct.std::_Container_base0"* nonnull align 1 dereferenceable(1) %2) unnamed_addr #5 comdat align 2 !dbg !1995 {
  %4 = alloca %"struct.std::_Container_base0"*, align 8
  %5 = alloca %"struct.std::_Fake_allocator"*, align 8
  %6 = alloca %"struct.std::_Fake_proxy_ptr_impl"*, align 8
  store %"struct.std::_Container_base0"* %2, %"struct.std::_Container_base0"** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"struct.std::_Container_base0"** %4, metadata !1997, metadata !DIExpression()), !dbg !2001
  store %"struct.std::_Fake_allocator"* %1, %"struct.std::_Fake_allocator"** %5, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"struct.std::_Fake_allocator"** %5, metadata !1998, metadata !DIExpression()), !dbg !2002
  store %"struct.std::_Fake_proxy_ptr_impl"* %0, %"struct.std::_Fake_proxy_ptr_impl"** %6, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"struct.std::_Fake_proxy_ptr_impl"** %6, metadata !1999, metadata !DIExpression()), !dbg !2003
  %7 = load %"struct.std::_Fake_proxy_ptr_impl"*, %"struct.std::_Fake_proxy_ptr_impl"** %6, align 8
  ret %"struct.std::_Fake_proxy_ptr_impl"* %7, !dbg !2004
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local void @"?_Tidy_init@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %0) #6 comdat align 2 !dbg !2005 {
  %2 = alloca %"class.std::basic_string"*, align 8
  %3 = alloca %"class.std::_String_val"*, align 8
  %4 = alloca i8, align 1
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %2, metadata !2007, metadata !DIExpression()), !dbg !2010
  %5 = load %"class.std::basic_string"*, %"class.std::basic_string"** %2, align 8
  %6 = bitcast %"class.std::_String_val"** %3 to i8*, !dbg !2011
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #17, !dbg !2011
  call void @llvm.dbg.declare(metadata %"class.std::_String_val"** %3, metadata !2008, metadata !DIExpression()), !dbg !2012
  %7 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %5, i32 0, i32 0, !dbg !2013
  %8 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %7, i32 0, i32 0, !dbg !2014
  store %"class.std::_String_val"* %8, %"class.std::_String_val"** %3, align 8, !dbg !2012, !tbaa !1715
  %9 = load %"class.std::_String_val"*, %"class.std::_String_val"** %3, align 8, !dbg !2015, !tbaa !1715
  %10 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %9, i32 0, i32 1, !dbg !2016
  store i64 0, i64* %10, align 8, !dbg !2017, !tbaa !2018
  %11 = load %"class.std::_String_val"*, %"class.std::_String_val"** %3, align 8, !dbg !2019, !tbaa !1715
  %12 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %11, i32 0, i32 2, !dbg !2021
  store i64 15, i64* %12, align 8, !dbg !2022, !tbaa !1832
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %4) #17, !dbg !2023
  store i8 0, i8* %4, align 1, !dbg !2023, !tbaa !1650
  %13 = load %"class.std::_String_val"*, %"class.std::_String_val"** %3, align 8, !dbg !2024, !tbaa !1715
  %14 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %13, i32 0, i32 0, !dbg !2025
  %15 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %14 to [16 x i8]*, !dbg !2026
  %16 = getelementptr inbounds [16 x i8], [16 x i8]* %15, i64 0, i64 0, !dbg !2024
  call void @"?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z"(i8* nonnull align 1 dereferenceable(1) %16, i8* nonnull align 1 dereferenceable(1) %4) #17, !dbg !2027
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %4) #17, !dbg !2027
  %17 = bitcast %"class.std::_String_val"** %3 to i8*, !dbg !2028
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %17) #17, !dbg !2028
  ret void, !dbg !2028
}

; Function Attrs: inlinehint uwtable mustprogress
define linkonce_odr dso_local nonnull align 8 dereferenceable(32) %"class.std::basic_string"* @"?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %0, i8* %1) #4 comdat align 2 !dbg !2029 {
  %3 = alloca i8*, align 8
  %4 = alloca %"class.std::basic_string"*, align 8
  store i8* %1, i8** %3, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %3, metadata !2031, metadata !DIExpression()), !dbg !2033
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %4, metadata !2032, metadata !DIExpression()), !dbg !2034
  %5 = load %"class.std::basic_string"*, %"class.std::basic_string"** %4, align 8
  %6 = load i8*, i8** %3, align 8, !dbg !2035, !tbaa !1715
  %7 = call i64 @"?length@?$_Narrow_char_traits@DH@std@@SA_KQEBD@Z"(i8* %6) #17, !dbg !2036
  %8 = call i64 @"??$_Convert_size@_K@std@@YA_K_K@Z"(i64 %7) #17, !dbg !2037
  %9 = load i8*, i8** %3, align 8, !dbg !2038, !tbaa !1715
  %10 = call nonnull align 8 dereferenceable(32) %"class.std::basic_string"* @"?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD_K@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %5, i8* %9, i64 %8), !dbg !2039
  ret %"class.std::basic_string"* %10, !dbg !2040
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local void @"?_Release@_Fake_proxy_ptr_impl@std@@QEAAXXZ"(%"struct.std::_Fake_proxy_ptr_impl"* nonnull dereferenceable(1) %0) #6 comdat align 2 !dbg !2041 {
  %2 = alloca %"struct.std::_Fake_proxy_ptr_impl"*, align 8
  store %"struct.std::_Fake_proxy_ptr_impl"* %0, %"struct.std::_Fake_proxy_ptr_impl"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"struct.std::_Fake_proxy_ptr_impl"** %2, metadata !2043, metadata !DIExpression()), !dbg !2044
  %3 = load %"struct.std::_Fake_proxy_ptr_impl"*, %"struct.std::_Fake_proxy_ptr_impl"** %2, align 8
  ret void, !dbg !2045
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local %"class.std::allocator"* @"??0?$allocator@D@std@@QEAA@XZ"(%"class.std::allocator"* nonnull returned dereferenceable(1) %0) unnamed_addr #10 comdat align 2 !dbg !2046 {
  %2 = alloca %"class.std::allocator"*, align 8
  store %"class.std::allocator"* %0, %"class.std::allocator"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %2, metadata !2048, metadata !DIExpression()), !dbg !2049
  %3 = load %"class.std::allocator"*, %"class.std::allocator"** %2, align 8
  ret %"class.std::allocator"* %3, !dbg !2050
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local %"class.std::_String_val"* @"??0?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(%"class.std::_String_val"* nonnull returned dereferenceable(32) %0) unnamed_addr #5 comdat align 2 !dbg !2051 {
  %2 = alloca %"class.std::_String_val"*, align 8
  store %"class.std::_String_val"* %0, %"class.std::_String_val"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::_String_val"** %2, metadata !2053, metadata !DIExpression()), !dbg !2054
  %3 = load %"class.std::_String_val"*, %"class.std::_String_val"** %2, align 8
  %4 = bitcast %"class.std::_String_val"* %3 to %"struct.std::_Container_base0"*, !dbg !2055
  %5 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %3, i32 0, i32 0, !dbg !2056
  %6 = call %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* @"??0_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(%"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* nonnull dereferenceable(16) %5) #17, !dbg !2056
  %7 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %3, i32 0, i32 1, !dbg !2057
  store i64 0, i64* %7, align 8, !dbg !2057, !tbaa !2018
  %8 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %3, i32 0, i32 2, !dbg !2058
  store i64 0, i64* %8, align 8, !dbg !2058, !tbaa !1832
  ret %"class.std::_String_val"* %3, !dbg !2059
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* @"??0_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(%"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* nonnull returned dereferenceable(16) %0) unnamed_addr #5 comdat align 2 !dbg !2060 {
  %2 = alloca %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"*, align 8
  store %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %0, %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"** %2, metadata !2062, metadata !DIExpression()), !dbg !2063
  %3 = load %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"*, %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"** %2, align 8
  %4 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %3 to i8**, !dbg !2064
  store i8* null, i8** %4, align 8, !dbg !2064, !tbaa !1650
  ret %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %3, !dbg !2065
}

; Function Attrs: inlinehint uwtable mustprogress
define linkonce_odr dso_local nonnull align 8 dereferenceable(32) %"class.std::basic_string"* @"?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD_K@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %0, i8* %1, i64 %2) #4 comdat align 2 !dbg !2066 {
  %4 = alloca %"class.std::basic_string"*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca %"class.std::basic_string"*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8, align 1
  %10 = alloca %class.anon, align 1
  store i64 %2, i64* %5, align 8, !tbaa !1861
  call void @llvm.dbg.declare(metadata i64* %5, metadata !2068, metadata !DIExpression()), !dbg !2074
  store i8* %1, i8** %6, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %6, metadata !2069, metadata !DIExpression()), !dbg !2075
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %7, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %7, metadata !2070, metadata !DIExpression()), !dbg !2076
  %11 = load %"class.std::basic_string"*, %"class.std::basic_string"** %7, align 8
  %12 = load i64, i64* %5, align 8, !dbg !2077, !tbaa !1861
  %13 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %11, i32 0, i32 0, !dbg !2078
  %14 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %13, i32 0, i32 0, !dbg !2079
  %15 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %14, i32 0, i32 2, !dbg !2080
  %16 = load i64, i64* %15, align 8, !dbg !2080, !tbaa !1783
  %17 = icmp ule i64 %12, %16, !dbg !2081
  br i1 %17, label %18, label %35, !dbg !2082

18:                                               ; preds = %3
  %19 = bitcast i8** %8 to i8*, !dbg !2083
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %19) #17, !dbg !2083
  call void @llvm.dbg.declare(metadata i8** %8, metadata !2071, metadata !DIExpression()), !dbg !2084
  %20 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %11, i32 0, i32 0, !dbg !2085
  %21 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %20, i32 0, i32 0, !dbg !2086
  %22 = call i8* @"?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAAPEADXZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %21) #17, !dbg !2087
  store i8* %22, i8** %8, align 8, !dbg !2084, !tbaa !1715
  %23 = load i64, i64* %5, align 8, !dbg !2088, !tbaa !1861
  %24 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %11, i32 0, i32 0, !dbg !2089
  %25 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %24, i32 0, i32 0, !dbg !2090
  %26 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %25, i32 0, i32 1, !dbg !2091
  store i64 %23, i64* %26, align 8, !dbg !2092, !tbaa !1798
  %27 = load i64, i64* %5, align 8, !dbg !2093, !tbaa !1861
  %28 = load i8*, i8** %6, align 8, !dbg !2094, !tbaa !1715
  %29 = load i8*, i8** %8, align 8, !dbg !2095, !tbaa !1715
  %30 = call i8* @"?move@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z"(i8* %29, i8* %28, i64 %27) #17, !dbg !2096
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %9) #17, !dbg !2097
  store i8 0, i8* %9, align 1, !dbg !2097, !tbaa !1650
  %31 = load i8*, i8** %8, align 8, !dbg !2098, !tbaa !1715
  %32 = load i64, i64* %5, align 8, !dbg !2099, !tbaa !1861
  %33 = getelementptr inbounds i8, i8* %31, i64 %32, !dbg !2098
  call void @"?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z"(i8* nonnull align 1 dereferenceable(1) %33, i8* nonnull align 1 dereferenceable(1) %9) #17, !dbg !2100
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %9) #17, !dbg !2100
  store %"class.std::basic_string"* %11, %"class.std::basic_string"** %4, align 8, !dbg !2101
  %34 = bitcast i8** %8 to i8*, !dbg !2102
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %34) #17, !dbg !2102
  br label %41

35:                                               ; preds = %3
  %36 = load i8*, i8** %6, align 8, !dbg !2103, !tbaa !1715
  %37 = load i64, i64* %5, align 8, !dbg !2104, !tbaa !1861
  %38 = getelementptr inbounds %class.anon, %class.anon* %10, i32 0, i32 0, !dbg !2105
  %39 = load i8, i8* %38, align 1, !dbg !2105
  %40 = call nonnull align 8 dereferenceable(32) %"class.std::basic_string"* @"??$_Reallocate_for@V<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??assign@01@QEAAAEAV01@QEBD0@Z@PEBD@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %11, i64 %37, i8 %39, i8* %36), !dbg !2105
  store %"class.std::basic_string"* %40, %"class.std::basic_string"** %4, align 8, !dbg !2106
  br label %41, !dbg !2106

41:                                               ; preds = %35, %18
  %42 = load %"class.std::basic_string"*, %"class.std::basic_string"** %4, align 8, !dbg !2107
  ret %"class.std::basic_string"* %42, !dbg !2107
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i64 @"??$_Convert_size@_K@std@@YA_K_K@Z"(i64 %0) #7 comdat !dbg !2108 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8, !tbaa !1861
  call void @llvm.dbg.declare(metadata i64* %2, metadata !2112, metadata !DIExpression()), !dbg !2115
  %3 = load i64, i64* %2, align 8, !dbg !2116, !tbaa !1861
  ret i64 %3, !dbg !2117
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local i64 @"?length@?$_Narrow_char_traits@DH@std@@SA_KQEBD@Z"(i8* %0) #6 comdat align 2 personality i8* bitcast (i32 (...)* @__CxxFrameHandler3 to i8*) !dbg !2118 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %2, metadata !2120, metadata !DIExpression()), !dbg !2121
  %3 = load i8*, i8** %2, align 8, !dbg !2122, !tbaa !1715
  %4 = invoke i64 @strlen(i8* %3)
          to label %5 unwind label %6, !dbg !2123

5:                                                ; preds = %1
  ret i64 %4, !dbg !2124

6:                                                ; preds = %1
  %7 = cleanuppad within none [], !dbg !2123
  call void @__std_terminate() #18 [ "funclet"(token %7) ], !dbg !2123
  unreachable, !dbg !2123
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local i8* @"?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAAPEADXZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %0) #6 comdat align 2 !dbg !2125 {
  %2 = alloca %"class.std::_String_val"*, align 8
  %3 = alloca i8*, align 8
  store %"class.std::_String_val"* %0, %"class.std::_String_val"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::_String_val"** %2, metadata !2127, metadata !DIExpression()), !dbg !2129
  %4 = load %"class.std::_String_val"*, %"class.std::_String_val"** %2, align 8
  %5 = bitcast i8** %3 to i8*, !dbg !2130
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #17, !dbg !2130
  call void @llvm.dbg.declare(metadata i8** %3, metadata !2128, metadata !DIExpression()), !dbg !2131
  %6 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %4, i32 0, i32 0, !dbg !2132
  %7 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %6 to [16 x i8]*, !dbg !2133
  %8 = getelementptr inbounds [16 x i8], [16 x i8]* %7, i64 0, i64 0, !dbg !2132
  store i8* %8, i8** %3, align 8, !dbg !2131, !tbaa !1715
  %9 = call zeroext i1 @"?_Large_string_engaged@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_NXZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %4) #17, !dbg !2134
  br i1 %9, label %10, label %15, !dbg !2136

10:                                               ; preds = %1
  %11 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %4, i32 0, i32 0, !dbg !2137
  %12 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %11 to i8**, !dbg !2139
  %13 = load i8*, i8** %12, align 8, !dbg !2139, !tbaa !1650
  %14 = call i8* @"??$_Unfancy@D@std@@YAPEADPEAD@Z"(i8* %13) #17, !dbg !2140
  store i8* %14, i8** %3, align 8, !dbg !2141, !tbaa !1715
  br label %15, !dbg !2142

15:                                               ; preds = %10, %1
  %16 = load i8*, i8** %3, align 8, !dbg !2143, !tbaa !1715
  %17 = bitcast i8** %3 to i8*, !dbg !2144
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %17) #17, !dbg !2144
  ret i8* %16, !dbg !2145
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local i8* @"?move@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z"(i8* %0, i8* %1, i64 %2) #6 comdat align 2 !dbg !2146 {
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  store i64 %2, i64* %4, align 8, !tbaa !1861
  call void @llvm.dbg.declare(metadata i64* %4, metadata !2148, metadata !DIExpression()), !dbg !2151
  store i8* %1, i8** %5, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %5, metadata !2149, metadata !DIExpression()), !dbg !2152
  store i8* %0, i8** %6, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %6, metadata !2150, metadata !DIExpression()), !dbg !2153
  %7 = load i8*, i8** %6, align 8, !dbg !2154, !tbaa !1715
  %8 = load i8*, i8** %5, align 8, !dbg !2155, !tbaa !1715
  %9 = load i64, i64* %4, align 8, !dbg !2156, !tbaa !1861
  %10 = mul i64 %9, 1, !dbg !2157
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 %8, i64 %10, i1 false), !dbg !2158
  %11 = load i8*, i8** %6, align 8, !dbg !2159, !tbaa !1715
  ret i8* %11, !dbg !2160
}

; Function Attrs: inlinehint uwtable mustprogress
define linkonce_odr dso_local nonnull align 8 dereferenceable(32) %"class.std::basic_string"* @"??$_Reallocate_for@V<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??assign@01@QEAAAEAV01@QEBD0@Z@PEBD@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %0, i64 %1, i8 %2, i8* %3) #4 comdat align 2 !dbg !2161 {
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
  call void @llvm.dbg.declare(metadata i8** %6, metadata !2172, metadata !DIExpression()), !dbg !2180
  call void @llvm.dbg.declare(metadata %class.anon* %5, metadata !2173, metadata !DIExpression()), !dbg !2181
  store i64 %1, i64* %7, align 8, !tbaa !1861
  call void @llvm.dbg.declare(metadata i64* %7, metadata !2174, metadata !DIExpression()), !dbg !2182
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %8, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %8, metadata !2175, metadata !DIExpression()), !dbg !2183
  %14 = load %"class.std::basic_string"*, %"class.std::basic_string"** %8, align 8
  %15 = load i64, i64* %7, align 8, !dbg !2184, !tbaa !1861
  %16 = call i64 @"?max_size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %14) #17, !dbg !2186
  %17 = icmp ugt i64 %15, %16, !dbg !2187
  br i1 %17, label %18, label %19, !dbg !2188

18:                                               ; preds = %4
  call void @"?_Xlen_string@std@@YAXXZ"() #19, !dbg !2189
  unreachable, !dbg !2189

19:                                               ; preds = %4
  %20 = bitcast i64* %9 to i8*, !dbg !2191
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %20) #17, !dbg !2191
  call void @llvm.dbg.declare(metadata i64* %9, metadata !2176, metadata !DIExpression()), !dbg !2192
  %21 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %14, i32 0, i32 0, !dbg !2193
  %22 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %21, i32 0, i32 0, !dbg !2194
  %23 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %22, i32 0, i32 2, !dbg !2195
  %24 = load i64, i64* %23, align 8, !dbg !2195, !tbaa !1783
  store i64 %24, i64* %9, align 8, !dbg !2192, !tbaa !1861
  %25 = bitcast i64* %10 to i8*, !dbg !2196
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %25) #17, !dbg !2196
  call void @llvm.dbg.declare(metadata i64* %10, metadata !2177, metadata !DIExpression()), !dbg !2197
  %26 = load i64, i64* %7, align 8, !dbg !2198, !tbaa !1861
  %27 = call i64 @"?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBA_K_K@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %14, i64 %26) #17, !dbg !2199
  store i64 %27, i64* %10, align 8, !dbg !2197, !tbaa !1861
  %28 = bitcast %"class.std::allocator"** %11 to i8*, !dbg !2200
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %28) #17, !dbg !2200
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %11, metadata !2178, metadata !DIExpression()), !dbg !2201
  %29 = call nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV?$allocator@D@2@XZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %14) #17, !dbg !2202
  store %"class.std::allocator"* %29, %"class.std::allocator"** %11, align 8, !dbg !2201, !tbaa !1715
  %30 = bitcast i8** %12 to i8*, !dbg !2203
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %30) #17, !dbg !2203
  call void @llvm.dbg.declare(metadata i8** %12, metadata !2179, metadata !DIExpression()), !dbg !2204
  %31 = load %"class.std::allocator"*, %"class.std::allocator"** %11, align 8, !dbg !2205, !tbaa !1715
  %32 = load i64, i64* %10, align 8, !dbg !2206, !tbaa !1861
  %33 = add i64 %32, 1, !dbg !2207
  %34 = call i8* @"?allocate@?$allocator@D@std@@QEAAPEAD_K@Z"(%"class.std::allocator"* nonnull dereferenceable(1) %31, i64 %33), !dbg !2208, !heapallocsite !33
  store i8* %34, i8** %12, align 8, !dbg !2204, !tbaa !1715
  %35 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %14, i32 0, i32 0, !dbg !2209
  %36 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %35, i32 0, i32 0, !dbg !2210
  %37 = bitcast %"class.std::_String_val"* %36 to %"struct.std::_Container_base0"*, !dbg !2209
  call void @"?_Orphan_all@_Container_base0@std@@QEAAXXZ"(%"struct.std::_Container_base0"* nonnull dereferenceable(1) %37) #17, !dbg !2211
  %38 = load i64, i64* %7, align 8, !dbg !2212, !tbaa !1861
  %39 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %14, i32 0, i32 0, !dbg !2213
  %40 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %39, i32 0, i32 0, !dbg !2214
  %41 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %40, i32 0, i32 1, !dbg !2215
  store i64 %38, i64* %41, align 8, !dbg !2216, !tbaa !1798
  %42 = load i64, i64* %10, align 8, !dbg !2217, !tbaa !1861
  %43 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %14, i32 0, i32 0, !dbg !2218
  %44 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %43, i32 0, i32 0, !dbg !2219
  %45 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %44, i32 0, i32 2, !dbg !2220
  store i64 %42, i64* %45, align 8, !dbg !2221, !tbaa !1783
  %46 = load i8*, i8** %6, align 8, !dbg !2222, !tbaa !1715
  %47 = load i64, i64* %7, align 8, !dbg !2223, !tbaa !1861
  %48 = load i8*, i8** %12, align 8, !dbg !2224, !tbaa !1715
  %49 = call i8* @"??$_Unfancy@D@std@@YAPEADPEAD@Z"(i8* %48) #17, !dbg !2225
  call void @"??R<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV23@QEBD_K@Z@QEBA?A?<auto>@@QEAD10@Z"(%class.anon* nonnull dereferenceable(1) %5, i8* %49, i64 %47, i8* %46), !dbg !2226
  %50 = load i64, i64* %9, align 8, !dbg !2227, !tbaa !1861
  %51 = icmp ule i64 16, %50, !dbg !2229
  br i1 %51, label %52, label %66, !dbg !2230

52:                                               ; preds = %19
  %53 = load %"class.std::allocator"*, %"class.std::allocator"** %11, align 8, !dbg !2231, !tbaa !1715
  %54 = load i64, i64* %9, align 8, !dbg !2233, !tbaa !1861
  %55 = add i64 %54, 1, !dbg !2234
  %56 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %14, i32 0, i32 0, !dbg !2235
  %57 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %56, i32 0, i32 0, !dbg !2236
  %58 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %57, i32 0, i32 0, !dbg !2237
  %59 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %58 to i8**, !dbg !2238
  %60 = load i8*, i8** %59, align 8, !dbg !2238, !tbaa !1650
  call void @"?deallocate@?$allocator@D@std@@QEAAXQEAD_K@Z"(%"class.std::allocator"* nonnull dereferenceable(1) %53, i8* %60, i64 %55), !dbg !2239
  %61 = load i8*, i8** %12, align 8, !dbg !2240, !tbaa !1715
  %62 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %14, i32 0, i32 0, !dbg !2241
  %63 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %62, i32 0, i32 0, !dbg !2242
  %64 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %63, i32 0, i32 0, !dbg !2243
  %65 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %64 to i8**, !dbg !2244
  store i8* %61, i8** %65, align 8, !dbg !2245, !tbaa !1650
  br label %71, !dbg !2246

66:                                               ; preds = %19
  %67 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %14, i32 0, i32 0, !dbg !2247
  %68 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %67, i32 0, i32 0, !dbg !2249
  %69 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %68, i32 0, i32 0, !dbg !2250
  %70 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %69 to i8**, !dbg !2251
  call void @"??$_Construct_in_place@PEADAEBQEAD@std@@YAXAEAPEADAEBQEAD@Z"(i8** nonnull align 8 dereferenceable(8) %70, i8** nonnull align 8 dereferenceable(8) %12) #17, !dbg !2252
  br label %71

71:                                               ; preds = %66, %52
  %72 = bitcast i8** %12 to i8*, !dbg !2253
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %72) #17, !dbg !2253
  %73 = bitcast %"class.std::allocator"** %11 to i8*, !dbg !2253
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %73) #17, !dbg !2253
  %74 = bitcast i64* %10 to i8*, !dbg !2253
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %74) #17, !dbg !2253
  %75 = bitcast i64* %9 to i8*, !dbg !2253
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %75) #17, !dbg !2253
  ret %"class.std::basic_string"* %14, !dbg !2254
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i8* @"??$_Unfancy@D@std@@YAPEADPEAD@Z"(i8* %0) #7 comdat !dbg !2255 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %2, metadata !2258, metadata !DIExpression()), !dbg !2259
  %3 = load i8*, i8** %2, align 8, !dbg !2260, !tbaa !1715
  ret i8* %3, !dbg !2261
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #1

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local i64 @"?max_size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %0) #6 comdat align 2 !dbg !2262 {
  %2 = alloca %"class.std::basic_string"*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %2, metadata !2264, metadata !DIExpression()), !dbg !2268
  %8 = load %"class.std::basic_string"*, %"class.std::basic_string"** %2, align 8
  %9 = bitcast i64* %3 to i8*, !dbg !2269
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %9) #17, !dbg !2269
  call void @llvm.dbg.declare(metadata i64* %3, metadata !2266, metadata !DIExpression()), !dbg !2270
  %10 = call nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBAAEBV?$allocator@D@2@XZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %8) #17, !dbg !2271
  %11 = call i64 @"?max_size@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA_KAEBV?$allocator@D@2@@Z"(%"class.std::allocator"* nonnull align 1 dereferenceable(1) %10) #17, !dbg !2272
  store i64 %11, i64* %3, align 8, !dbg !2270, !tbaa !1861
  %12 = bitcast i64* %4 to i8*, !dbg !2273
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %12) #17, !dbg !2273
  call void @llvm.dbg.declare(metadata i64* %4, metadata !2267, metadata !DIExpression()), !dbg !2274
  %13 = bitcast i64* %5 to i8*, !dbg !2275
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %13) #17, !dbg !2275
  store i64 16, i64* %5, align 8, !dbg !2275, !tbaa !1861
  %14 = call nonnull align 8 dereferenceable(8) i64* @"??$max@_K@std@@YAAEB_KAEB_K0@Z"(i64* nonnull align 8 dereferenceable(8) %3, i64* nonnull align 8 dereferenceable(8) %5) #17, !dbg !2276
  %15 = load i64, i64* %14, align 8, !dbg !2276, !tbaa !1861
  %16 = bitcast i64* %5 to i8*, !dbg !2276
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %16) #17, !dbg !2276
  store i64 %15, i64* %4, align 8, !dbg !2274, !tbaa !1861
  %17 = bitcast i64* %6 to i8*, !dbg !2277
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %17) #17, !dbg !2277
  %18 = load i64, i64* %4, align 8, !dbg !2277, !tbaa !1861
  %19 = sub i64 %18, 1, !dbg !2278
  store i64 %19, i64* %6, align 8, !dbg !2277, !tbaa !1861
  %20 = bitcast i64* %7 to i8*, !dbg !2279
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %20) #17, !dbg !2279
  %21 = call i64 @"?max@?$numeric_limits@_J@std@@SA_JXZ"() #17, !dbg !2280
  store i64 %21, i64* %7, align 8, !dbg !2279, !tbaa !1861
  %22 = call nonnull align 8 dereferenceable(8) i64* @"??$min@_K@std@@YAAEB_KAEB_K0@Z"(i64* nonnull align 8 dereferenceable(8) %7, i64* nonnull align 8 dereferenceable(8) %6) #17, !dbg !2281
  %23 = load i64, i64* %22, align 8, !dbg !2281, !tbaa !1861
  %24 = bitcast i64* %7 to i8*, !dbg !2282
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %24) #17, !dbg !2282
  %25 = bitcast i64* %6 to i8*, !dbg !2282
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %25) #17, !dbg !2282
  %26 = bitcast i64* %4 to i8*, !dbg !2283
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %26) #17, !dbg !2283
  %27 = bitcast i64* %3 to i8*, !dbg !2283
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %27) #17, !dbg !2283
  ret i64 %23, !dbg !2282
}

; Function Attrs: inlinehint noreturn uwtable mustprogress
define linkonce_odr dso_local void @"?_Xlen_string@std@@YAXXZ"() #11 comdat !dbg !2284 {
  call void @"?_Xlength_error@std@@YAXPEBD@Z"(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @"??_C@_0BA@JFNIOLAK@string?5too?5long?$AA@", i64 0, i64 0)) #19, !dbg !2285
  unreachable, !dbg !2285
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local i64 @"?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBA_K_K@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %0, i64 %1) #6 comdat align 2 !dbg !2286 {
  %3 = alloca i64, align 8
  %4 = alloca %"class.std::basic_string"*, align 8
  store i64 %1, i64* %3, align 8, !tbaa !1861
  call void @llvm.dbg.declare(metadata i64* %3, metadata !2288, metadata !DIExpression()), !dbg !2290
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %4, metadata !2289, metadata !DIExpression()), !dbg !2291
  %5 = load %"class.std::basic_string"*, %"class.std::basic_string"** %4, align 8
  %6 = call i64 @"?max_size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %5) #17, !dbg !2292
  %7 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %5, i32 0, i32 0, !dbg !2293
  %8 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %7, i32 0, i32 0, !dbg !2294
  %9 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %8, i32 0, i32 2, !dbg !2295
  %10 = load i64, i64* %9, align 8, !dbg !2295, !tbaa !1783
  %11 = load i64, i64* %3, align 8, !dbg !2296, !tbaa !1861
  %12 = call i64 @"?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@CA_K_K00@Z"(i64 %11, i64 %10, i64 %6) #17, !dbg !2297
  ret i64 %12, !dbg !2298
}

; Function Attrs: inlinehint uwtable mustprogress
define linkonce_odr dso_local i8* @"?allocate@?$allocator@D@std@@QEAAPEAD_K@Z"(%"class.std::allocator"* nonnull dereferenceable(1) %0, i64 %1) #4 comdat align 2 !dbg !2299 {
  %3 = alloca i64, align 8
  %4 = alloca %"class.std::allocator"*, align 8
  store i64 %1, i64* %3, align 8, !tbaa !1861
  call void @llvm.dbg.declare(metadata i64* %3, metadata !2301, metadata !DIExpression()), !dbg !2303
  store %"class.std::allocator"* %0, %"class.std::allocator"** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %4, metadata !2302, metadata !DIExpression()), !dbg !2304
  %5 = load %"class.std::allocator"*, %"class.std::allocator"** %4, align 8
  %6 = load i64, i64* %3, align 8, !dbg !2305, !tbaa !1861
  %7 = call i64 @"??$_Get_size_of_n@$00@std@@YA_K_K@Z"(i64 %6), !dbg !2306
  %8 = call i8* @"??$_Allocate@$0BA@U_Default_allocate_traits@std@@$0A@@std@@YAPEAX_K@Z"(i64 %7), !dbg !2307, !heapallocsite !33
  ret i8* %8, !dbg !2308
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local void @"??R<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV23@QEBD_K@Z@QEBA?A?<auto>@@QEAD10@Z"(%class.anon* nonnull dereferenceable(1) %0, i8* %1, i64 %2, i8* %3) #6 comdat align 2 !dbg !2309 {
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca %class.anon*, align 8
  %9 = alloca i8, align 1
  store i8* %3, i8** %5, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %5, metadata !2319, metadata !DIExpression()), !dbg !2324
  store i64 %2, i64* %6, align 8, !tbaa !1861
  call void @llvm.dbg.declare(metadata i64* %6, metadata !2320, metadata !DIExpression()), !dbg !2325
  store i8* %1, i8** %7, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %7, metadata !2321, metadata !DIExpression()), !dbg !2326
  store %class.anon* %0, %class.anon** %8, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %class.anon** %8, metadata !2322, metadata !DIExpression()), !dbg !2327
  %10 = load %class.anon*, %class.anon** %8, align 8
  %11 = load i64, i64* %6, align 8, !dbg !2328, !tbaa !1861
  %12 = load i8*, i8** %5, align 8, !dbg !2329, !tbaa !1715
  %13 = load i8*, i8** %7, align 8, !dbg !2330, !tbaa !1715
  %14 = call i8* @"?copy@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z"(i8* %13, i8* %12, i64 %11) #17, !dbg !2331
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %9) #17, !dbg !2332
  store i8 0, i8* %9, align 1, !dbg !2332, !tbaa !1650
  %15 = load i8*, i8** %7, align 8, !dbg !2333, !tbaa !1715
  %16 = load i64, i64* %6, align 8, !dbg !2334, !tbaa !1861
  %17 = getelementptr inbounds i8, i8* %15, i64 %16, !dbg !2333
  call void @"?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z"(i8* nonnull align 1 dereferenceable(1) %17, i8* nonnull align 1 dereferenceable(1) %9) #17, !dbg !2335
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %9) #17, !dbg !2335
  ret void, !dbg !2336
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local void @"??$_Construct_in_place@PEADAEBQEAD@std@@YAXAEAPEADAEBQEAD@Z"(i8** nonnull align 8 dereferenceable(8) %0, i8** nonnull align 8 dereferenceable(8) %1) #6 comdat !dbg !2337 {
  %3 = alloca i8**, align 8
  %4 = alloca i8**, align 8
  store i8** %1, i8*** %3, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8*** %3, metadata !2342, metadata !DIExpression()), !dbg !2348
  store i8** %0, i8*** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8*** %4, metadata !2343, metadata !DIExpression()), !dbg !2349
  %5 = load i8**, i8*** %4, align 8, !dbg !2350, !tbaa !1715
  %6 = call i8** @"??$addressof@PEAD@std@@YAPEAPEADAEAPEAD@Z"(i8** nonnull align 8 dereferenceable(8) %5) #17, !dbg !2352
  %7 = call i8* @"??$_Voidify_iter@PEAPEAD@std@@YAPEAXPEAPEAD@Z"(i8** %6) #17, !dbg !2353
  %8 = bitcast i8* %7 to i8**, !dbg !2354
  %9 = load i8**, i8*** %3, align 8, !dbg !2355, !tbaa !1715
  %10 = call nonnull align 8 dereferenceable(8) i8** @"??$forward@AEBQEAD@std@@YAAEBQEADAEBQEAD@Z"(i8** nonnull align 8 dereferenceable(8) %9) #17, !dbg !2356
  %11 = load i8*, i8** %10, align 8, !dbg !2356, !tbaa !1715
  store i8* %11, i8** %8, align 8, !dbg !2354, !tbaa !1715
  ret void, !dbg !2357
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local i64 @"?max_size@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA_KAEBV?$allocator@D@2@@Z"(%"class.std::allocator"* nonnull align 1 dereferenceable(1) %0) #6 comdat align 2 !dbg !2358 {
  %2 = alloca %"class.std::allocator"*, align 8
  store %"class.std::allocator"* %0, %"class.std::allocator"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %2, metadata !2360, metadata !DIExpression()), !dbg !2361
  ret i64 -1, !dbg !2362
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBAAEBV?$allocator@D@2@XZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %0) #6 comdat align 2 !dbg !2363 {
  %2 = alloca %"class.std::basic_string"*, align 8
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %2, metadata !2365, metadata !DIExpression()), !dbg !2366
  %3 = load %"class.std::basic_string"*, %"class.std::basic_string"** %2, align 8
  %4 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %3, i32 0, i32 0, !dbg !2367
  %5 = call nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEBAAEBV?$allocator@D@2@XZ"(%"class.std::_Compressed_pair"* nonnull dereferenceable(32) %4) #17, !dbg !2368
  ret %"class.std::allocator"* %5, !dbg !2369
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local nonnull align 8 dereferenceable(8) i64* @"??$max@_K@std@@YAAEB_KAEB_K0@Z"(i64* nonnull align 8 dereferenceable(8) %0, i64* nonnull align 8 dereferenceable(8) %1) #7 comdat !dbg !2370 {
  %3 = alloca i64*, align 8
  %4 = alloca i64*, align 8
  store i64* %1, i64** %3, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i64** %3, metadata !2376, metadata !DIExpression()), !dbg !2380
  store i64* %0, i64** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i64** %4, metadata !2377, metadata !DIExpression()), !dbg !2381
  %5 = load i64*, i64** %4, align 8, !dbg !2382, !tbaa !1715
  %6 = load i64, i64* %5, align 8, !dbg !2382, !tbaa !1861
  %7 = load i64*, i64** %3, align 8, !dbg !2383, !tbaa !1715
  %8 = load i64, i64* %7, align 8, !dbg !2383, !tbaa !1861
  %9 = icmp ult i64 %6, %8, !dbg !2384
  br i1 %9, label %10, label %12, !dbg !2382

10:                                               ; preds = %2
  %11 = load i64*, i64** %3, align 8, !dbg !2385, !tbaa !1715
  br label %14, !dbg !2382

12:                                               ; preds = %2
  %13 = load i64*, i64** %4, align 8, !dbg !2386, !tbaa !1715
  br label %14, !dbg !2382

14:                                               ; preds = %12, %10
  %15 = phi i64* [ %11, %10 ], [ %13, %12 ], !dbg !2382
  ret i64* %15, !dbg !2387
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local nonnull align 8 dereferenceable(8) i64* @"??$min@_K@std@@YAAEB_KAEB_K0@Z"(i64* nonnull align 8 dereferenceable(8) %0, i64* nonnull align 8 dereferenceable(8) %1) #7 comdat !dbg !2388 {
  %3 = alloca i64*, align 8
  %4 = alloca i64*, align 8
  store i64* %1, i64** %3, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i64** %3, metadata !2390, metadata !DIExpression()), !dbg !2392
  store i64* %0, i64** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i64** %4, metadata !2391, metadata !DIExpression()), !dbg !2393
  %5 = load i64*, i64** %3, align 8, !dbg !2394, !tbaa !1715
  %6 = load i64, i64* %5, align 8, !dbg !2394, !tbaa !1861
  %7 = load i64*, i64** %4, align 8, !dbg !2395, !tbaa !1715
  %8 = load i64, i64* %7, align 8, !dbg !2395, !tbaa !1861
  %9 = icmp ult i64 %6, %8, !dbg !2396
  br i1 %9, label %10, label %12, !dbg !2394

10:                                               ; preds = %2
  %11 = load i64*, i64** %3, align 8, !dbg !2397, !tbaa !1715
  br label %14, !dbg !2394

12:                                               ; preds = %2
  %13 = load i64*, i64** %4, align 8, !dbg !2398, !tbaa !1715
  br label %14, !dbg !2394

14:                                               ; preds = %12, %10
  %15 = phi i64* [ %11, %10 ], [ %13, %12 ], !dbg !2394
  ret i64* %15, !dbg !2399
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i64 @"?max@?$numeric_limits@_J@std@@SA_JXZ"() #7 comdat align 2 !dbg !2400 {
  ret i64 9223372036854775807, !dbg !2455
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEBAAEBV?$allocator@D@2@XZ"(%"class.std::_Compressed_pair"* nonnull dereferenceable(32) %0) #7 comdat align 2 !dbg !2456 {
  %2 = alloca %"class.std::_Compressed_pair"*, align 8
  store %"class.std::_Compressed_pair"* %0, %"class.std::_Compressed_pair"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::_Compressed_pair"** %2, metadata !2458, metadata !DIExpression()), !dbg !2460
  %3 = load %"class.std::_Compressed_pair"*, %"class.std::_Compressed_pair"** %2, align 8
  %4 = bitcast %"class.std::_Compressed_pair"* %3 to %"class.std::allocator"*, !dbg !2461
  ret %"class.std::allocator"* %4, !dbg !2462
}

; Function Attrs: noreturn
declare dso_local void @"?_Xlength_error@std@@YAXPEBD@Z"(i8*) #9

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local i64 @"?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@CA_K_K00@Z"(i64 %0, i64 %1, i64 %2) #6 comdat align 2 !dbg !2463 {
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca i64, align 8
  store i64 %2, i64* %5, align 8, !tbaa !1861
  call void @llvm.dbg.declare(metadata i64* %5, metadata !2465, metadata !DIExpression()), !dbg !2469
  store i64 %1, i64* %6, align 8, !tbaa !1861
  call void @llvm.dbg.declare(metadata i64* %6, metadata !2466, metadata !DIExpression()), !dbg !2470
  store i64 %0, i64* %7, align 8, !tbaa !1861
  call void @llvm.dbg.declare(metadata i64* %7, metadata !2467, metadata !DIExpression()), !dbg !2471
  %11 = bitcast i64* %8 to i8*, !dbg !2472
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %11) #17, !dbg !2472
  call void @llvm.dbg.declare(metadata i64* %8, metadata !2468, metadata !DIExpression()), !dbg !2473
  %12 = load i64, i64* %7, align 8, !dbg !2474, !tbaa !1861
  %13 = or i64 %12, 15, !dbg !2475
  store i64 %13, i64* %8, align 8, !dbg !2473, !tbaa !1861
  %14 = load i64, i64* %8, align 8, !dbg !2476, !tbaa !1861
  %15 = load i64, i64* %5, align 8, !dbg !2478, !tbaa !1861
  %16 = icmp ugt i64 %14, %15, !dbg !2479
  br i1 %16, label %17, label %19, !dbg !2480

17:                                               ; preds = %3
  %18 = load i64, i64* %5, align 8, !dbg !2481, !tbaa !1861
  store i64 %18, i64* %4, align 8, !dbg !2483
  store i32 1, i32* %9, align 4
  br label %37, !dbg !2483

19:                                               ; preds = %3
  %20 = load i64, i64* %6, align 8, !dbg !2484, !tbaa !1861
  %21 = load i64, i64* %5, align 8, !dbg !2486, !tbaa !1861
  %22 = load i64, i64* %6, align 8, !dbg !2487, !tbaa !1861
  %23 = udiv i64 %22, 2, !dbg !2488
  %24 = sub i64 %21, %23, !dbg !2489
  %25 = icmp ugt i64 %20, %24, !dbg !2490
  br i1 %25, label %26, label %28, !dbg !2491

26:                                               ; preds = %19
  %27 = load i64, i64* %5, align 8, !dbg !2492, !tbaa !1861
  store i64 %27, i64* %4, align 8, !dbg !2494
  store i32 1, i32* %9, align 4
  br label %37, !dbg !2494

28:                                               ; preds = %19
  %29 = bitcast i64* %10 to i8*, !dbg !2495
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %29) #17, !dbg !2495
  %30 = load i64, i64* %6, align 8, !dbg !2495, !tbaa !1861
  %31 = load i64, i64* %6, align 8, !dbg !2496, !tbaa !1861
  %32 = udiv i64 %31, 2, !dbg !2497
  %33 = add i64 %30, %32, !dbg !2498
  store i64 %33, i64* %10, align 8, !dbg !2495, !tbaa !1861
  %34 = call nonnull align 8 dereferenceable(8) i64* @"??$max@_K@std@@YAAEB_KAEB_K0@Z"(i64* nonnull align 8 dereferenceable(8) %8, i64* nonnull align 8 dereferenceable(8) %10) #17, !dbg !2499
  %35 = load i64, i64* %34, align 8, !dbg !2499, !tbaa !1861
  store i64 %35, i64* %4, align 8, !dbg !2500
  %36 = bitcast i64* %10 to i8*, !dbg !2500
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %36) #17, !dbg !2500
  store i32 1, i32* %9, align 4
  br label %37, !dbg !2500

37:                                               ; preds = %28, %26, %17
  %38 = bitcast i64* %8 to i8*, !dbg !2501
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %38) #17, !dbg !2501
  %39 = load i64, i64* %4, align 8, !dbg !2501
  ret i64 %39, !dbg !2501
}

; Function Attrs: inlinehint uwtable mustprogress
define linkonce_odr dso_local i8* @"??$_Allocate@$0BA@U_Default_allocate_traits@std@@$0A@@std@@YAPEAX_K@Z"(i64 %0) #4 comdat !dbg !2502 {
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  store i64 %0, i64* %3, align 8, !tbaa !1861
  call void @llvm.dbg.declare(metadata i64* %3, metadata !2506, metadata !DIExpression()), !dbg !2512
  %4 = load i64, i64* %3, align 8, !dbg !2513, !tbaa !1861
  %5 = icmp uge i64 %4, 4096, !dbg !2516
  br i1 %5, label %6, label %9, !dbg !2517

6:                                                ; preds = %1
  %7 = load i64, i64* %3, align 8, !dbg !2518, !tbaa !1861
  %8 = call i8* @"??$_Allocate_manually_vector_aligned@U_Default_allocate_traits@std@@@std@@YAPEAX_K@Z"(i64 %7), !dbg !2520, !heapallocsite !6
  store i8* %8, i8** %2, align 8, !dbg !2521
  br label %16, !dbg !2521

9:                                                ; preds = %1
  %10 = load i64, i64* %3, align 8, !dbg !2522, !tbaa !1861
  %11 = icmp ne i64 %10, 0, !dbg !2524
  br i1 %11, label %12, label %15, !dbg !2525

12:                                               ; preds = %9
  %13 = load i64, i64* %3, align 8, !dbg !2526, !tbaa !1861
  %14 = call i8* @"?_Allocate@_Default_allocate_traits@std@@SAPEAX_K@Z"(i64 %13), !dbg !2528, !heapallocsite !6
  store i8* %14, i8** %2, align 8, !dbg !2529
  br label %16, !dbg !2529

15:                                               ; preds = %9
  store i8* null, i8** %2, align 8, !dbg !2530
  br label %16, !dbg !2530

16:                                               ; preds = %15, %12, %6
  %17 = load i8*, i8** %2, align 8, !dbg !2531
  ret i8* %17, !dbg !2531
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i64 @"??$_Get_size_of_n@$00@std@@YA_K_K@Z"(i64 %0) #7 comdat !dbg !2532 {
  %2 = alloca i64, align 8
  %3 = alloca i8, align 1
  store i64 %0, i64* %2, align 8, !tbaa !1861
  call void @llvm.dbg.declare(metadata i64* %2, metadata !2534, metadata !DIExpression()), !dbg !2538
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %3) #17, !dbg !2539
  call void @llvm.dbg.declare(metadata i8* %3, metadata !2535, metadata !DIExpression()), !dbg !2540
  store i8 0, i8* %3, align 1, !dbg !2540, !tbaa !1667
  %4 = load i64, i64* %2, align 8, !dbg !2541, !tbaa !1861
  %5 = mul i64 %4, 1, !dbg !2542
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %3) #17, !dbg !2543
  ret i64 %5, !dbg !2544
}

; Function Attrs: uwtable mustprogress
define linkonce_odr dso_local i8* @"??$_Allocate_manually_vector_aligned@U_Default_allocate_traits@std@@@std@@YAPEAX_K@Z"(i64 %0) #12 comdat !dbg !2545 {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  store i64 %0, i64* %2, align 8, !tbaa !1861
  call void @llvm.dbg.declare(metadata i64* %2, metadata !2547, metadata !DIExpression()), !dbg !2554
  %6 = bitcast i64* %3 to i8*, !dbg !2555
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #17, !dbg !2555
  call void @llvm.dbg.declare(metadata i64* %3, metadata !2548, metadata !DIExpression()), !dbg !2556
  %7 = load i64, i64* %2, align 8, !dbg !2557, !tbaa !1861
  %8 = add i64 39, %7, !dbg !2558
  store i64 %8, i64* %3, align 8, !dbg !2556, !tbaa !1861
  %9 = load i64, i64* %3, align 8, !dbg !2559, !tbaa !1861
  %10 = load i64, i64* %2, align 8, !dbg !2561, !tbaa !1861
  %11 = icmp ule i64 %9, %10, !dbg !2562
  br i1 %11, label %12, label %13, !dbg !2563

12:                                               ; preds = %1
  call void @"?_Throw_bad_array_new_length@std@@YAXXZ"() #19, !dbg !2564
  unreachable, !dbg !2564

13:                                               ; preds = %1
  %14 = bitcast i64* %4 to i8*, !dbg !2566
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %14) #17, !dbg !2566
  call void @llvm.dbg.declare(metadata i64* %4, metadata !2549, metadata !DIExpression()), !dbg !2567
  %15 = load i64, i64* %3, align 8, !dbg !2568, !tbaa !1861
  %16 = call i8* @"?_Allocate@_Default_allocate_traits@std@@SAPEAX_K@Z"(i64 %15), !dbg !2569, !heapallocsite !6
  %17 = ptrtoint i8* %16 to i64, !dbg !2570
  store i64 %17, i64* %4, align 8, !dbg !2567, !tbaa !1861
  br label %18, !dbg !2571

18:                                               ; preds = %13
  %19 = load i64, i64* %4, align 8, !dbg !2572, !tbaa !1861
  %20 = icmp ne i64 %19, 0, !dbg !2572
  br i1 %20, label %21, label %22, !dbg !2575

21:                                               ; preds = %18
  br label %26, !dbg !2576

22:                                               ; preds = %18
  br label %23, !dbg !2578

23:                                               ; preds = %22
  call void @_invalid_parameter_noinfo_noreturn() #19, !dbg !2580
  unreachable, !dbg !2580

24:                                               ; No predecessors!
  br label %25, !dbg !2580

25:                                               ; preds = %24
  br label %26

26:                                               ; preds = %25, %21
  br label %27, !dbg !2575

27:                                               ; preds = %26
  br label %28, !dbg !2575

28:                                               ; preds = %27
  %29 = bitcast i8** %5 to i8*, !dbg !2582
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %29) #17, !dbg !2582
  call void @llvm.dbg.declare(metadata i8** %5, metadata !2550, metadata !DIExpression()), !dbg !2583
  %30 = load i64, i64* %4, align 8, !dbg !2584, !tbaa !1861
  %31 = add i64 %30, 39, !dbg !2585
  %32 = and i64 %31, -32, !dbg !2586
  %33 = inttoptr i64 %32 to i8*, !dbg !2587
  store i8* %33, i8** %5, align 8, !dbg !2583, !tbaa !1715
  %34 = load i64, i64* %4, align 8, !dbg !2588, !tbaa !1861
  %35 = load i8*, i8** %5, align 8, !dbg !2589, !tbaa !1715
  %36 = bitcast i8* %35 to i64*, !dbg !2590
  %37 = getelementptr inbounds i64, i64* %36, i64 -1, !dbg !2590
  store i64 %34, i64* %37, align 8, !dbg !2591, !tbaa !1861
  %38 = load i8*, i8** %5, align 8, !dbg !2592, !tbaa !1715
  %39 = bitcast i8** %5 to i8*, !dbg !2593
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %39) #17, !dbg !2593
  %40 = bitcast i64* %4 to i8*, !dbg !2593
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %40) #17, !dbg !2593
  %41 = bitcast i64* %3 to i8*, !dbg !2593
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %41) #17, !dbg !2593
  ret i8* %38, !dbg !2594
}

; Function Attrs: inlinehint uwtable mustprogress
define linkonce_odr dso_local i8* @"?_Allocate@_Default_allocate_traits@std@@SAPEAX_K@Z"(i64 %0) #4 comdat align 2 !dbg !2595 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8, !tbaa !1861
  call void @llvm.dbg.declare(metadata i64* %2, metadata !2597, metadata !DIExpression()), !dbg !2598
  %3 = load i64, i64* %2, align 8, !dbg !2599, !tbaa !1861
  %4 = call noalias nonnull i8* @"??2@YAPEAX_K@Z"(i64 %3) #20, !dbg !2600, !heapallocsite !6
  ret i8* %4, !dbg !2601
}

; Function Attrs: inlinehint noreturn uwtable mustprogress
define linkonce_odr dso_local void @"?_Throw_bad_array_new_length@std@@YAXXZ"() #11 comdat !dbg !2602 {
  %1 = alloca %"class.std::bad_array_new_length", align 8
  %2 = call %"class.std::bad_array_new_length"* @"??0bad_array_new_length@std@@QEAA@XZ"(%"class.std::bad_array_new_length"* nonnull dereferenceable(24) %1) #17, !dbg !2603
  %3 = bitcast %"class.std::bad_array_new_length"* %1 to i8*, !dbg !2603
  call void @_CxxThrowException(i8* %3, %eh.ThrowInfo* @"_TI3?AVbad_array_new_length@std@@") #19, !dbg !2603
  unreachable, !dbg !2603
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local %"class.std::bad_array_new_length"* @"??0bad_array_new_length@std@@QEAA@XZ"(%"class.std::bad_array_new_length"* nonnull returned dereferenceable(24) %0) unnamed_addr #10 comdat align 2 !dbg !2604 {
  %2 = alloca %"class.std::bad_array_new_length"*, align 8
  store %"class.std::bad_array_new_length"* %0, %"class.std::bad_array_new_length"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::bad_array_new_length"** %2, metadata !2658, metadata !DIExpression()), !dbg !2660
  %3 = load %"class.std::bad_array_new_length"*, %"class.std::bad_array_new_length"** %2, align 8
  %4 = bitcast %"class.std::bad_array_new_length"* %3 to %"class.std::bad_alloc"*, !dbg !2661
  %5 = call %"class.std::bad_alloc"* @"??0bad_alloc@std@@AEAA@QEBD@Z"(%"class.std::bad_alloc"* nonnull dereferenceable(24) %4, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @"??_C@_0BF@KINCDENJ@bad?5array?5new?5length?$AA@", i64 0, i64 0)) #17, !dbg !2662
  %6 = bitcast %"class.std::bad_array_new_length"* %3 to i32 (...)***, !dbg !2661
  store i32 (...)** bitcast (i8** @"??_7bad_array_new_length@std@@6B@" to i32 (...)**), i32 (...)*** %6, align 8, !dbg !2661, !tbaa !2663
  ret %"class.std::bad_array_new_length"* %3, !dbg !2665
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local %"class.std::bad_array_new_length"* @"??0bad_array_new_length@std@@QEAA@AEBV01@@Z"(%"class.std::bad_array_new_length"* nonnull returned dereferenceable(24) %0, %"class.std::bad_array_new_length"* nonnull align 8 dereferenceable(24) %1) unnamed_addr #5 comdat align 2 !dbg !2666 {
  %3 = alloca %"class.std::bad_array_new_length"*, align 8
  %4 = alloca %"class.std::bad_array_new_length"*, align 8
  store %"class.std::bad_array_new_length"* %1, %"class.std::bad_array_new_length"** %3, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::bad_array_new_length"** %3, metadata !2673, metadata !DIExpression()), !dbg !2675
  store %"class.std::bad_array_new_length"* %0, %"class.std::bad_array_new_length"** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::bad_array_new_length"** %4, metadata !2674, metadata !DIExpression()), !dbg !2675
  %5 = load %"class.std::bad_array_new_length"*, %"class.std::bad_array_new_length"** %4, align 8
  %6 = bitcast %"class.std::bad_array_new_length"* %5 to %"class.std::bad_alloc"*, !dbg !2676
  %7 = load %"class.std::bad_array_new_length"*, %"class.std::bad_array_new_length"** %3, align 8, !dbg !2676, !tbaa !1715
  %8 = bitcast %"class.std::bad_array_new_length"* %7 to %"class.std::bad_alloc"*, !dbg !2676
  %9 = call %"class.std::bad_alloc"* @"??0bad_alloc@std@@QEAA@AEBV01@@Z"(%"class.std::bad_alloc"* nonnull dereferenceable(24) %6, %"class.std::bad_alloc"* nonnull align 8 dereferenceable(24) %8) #17, !dbg !2676
  %10 = bitcast %"class.std::bad_array_new_length"* %5 to i32 (...)***, !dbg !2676
  store i32 (...)** bitcast (i8** @"??_7bad_array_new_length@std@@6B@" to i32 (...)**), i32 (...)*** %10, align 8, !dbg !2676, !tbaa !2663
  ret %"class.std::bad_array_new_length"* %5, !dbg !2676
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local %"class.std::bad_alloc"* @"??0bad_alloc@std@@QEAA@AEBV01@@Z"(%"class.std::bad_alloc"* nonnull returned dereferenceable(24) %0, %"class.std::bad_alloc"* nonnull align 8 dereferenceable(24) %1) unnamed_addr #5 comdat align 2 !dbg !2677 {
  %3 = alloca %"class.std::bad_alloc"*, align 8
  %4 = alloca %"class.std::bad_alloc"*, align 8
  store %"class.std::bad_alloc"* %1, %"class.std::bad_alloc"** %3, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::bad_alloc"** %3, metadata !2684, metadata !DIExpression()), !dbg !2687
  store %"class.std::bad_alloc"* %0, %"class.std::bad_alloc"** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::bad_alloc"** %4, metadata !2685, metadata !DIExpression()), !dbg !2687
  %5 = load %"class.std::bad_alloc"*, %"class.std::bad_alloc"** %4, align 8
  %6 = bitcast %"class.std::bad_alloc"* %5 to %"class.std::exception"*, !dbg !2688
  %7 = load %"class.std::bad_alloc"*, %"class.std::bad_alloc"** %3, align 8, !dbg !2688, !tbaa !1715
  %8 = bitcast %"class.std::bad_alloc"* %7 to %"class.std::exception"*, !dbg !2688
  %9 = call %"class.std::exception"* @"??0exception@std@@QEAA@AEBV01@@Z"(%"class.std::exception"* nonnull dereferenceable(24) %6, %"class.std::exception"* nonnull align 8 dereferenceable(24) %8) #17, !dbg !2688
  %10 = bitcast %"class.std::bad_alloc"* %5 to i32 (...)***, !dbg !2688
  store i32 (...)** bitcast (i8** @"??_7bad_alloc@std@@6B@" to i32 (...)**), i32 (...)*** %10, align 8, !dbg !2688, !tbaa !2663
  ret %"class.std::bad_alloc"* %5, !dbg !2688
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local %"class.std::exception"* @"??0exception@std@@QEAA@AEBV01@@Z"(%"class.std::exception"* nonnull returned dereferenceable(24) %0, %"class.std::exception"* nonnull align 8 dereferenceable(24) %1) unnamed_addr #10 comdat align 2 personality i8* bitcast (i32 (...)* @__CxxFrameHandler3 to i8*) !dbg !2689 {
  %3 = alloca %"class.std::exception"*, align 8
  %4 = alloca %"class.std::exception"*, align 8
  store %"class.std::exception"* %1, %"class.std::exception"** %3, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::exception"** %3, metadata !2691, metadata !DIExpression()), !dbg !2694
  store %"class.std::exception"* %0, %"class.std::exception"** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::exception"** %4, metadata !2692, metadata !DIExpression()), !dbg !2695
  %5 = load %"class.std::exception"*, %"class.std::exception"** %4, align 8
  %6 = bitcast %"class.std::exception"* %5 to i32 (...)***, !dbg !2696
  store i32 (...)** bitcast (i8** @"??_7exception@std@@6B@" to i32 (...)**), i32 (...)*** %6, align 8, !dbg !2696, !tbaa !2663
  %7 = getelementptr inbounds %"class.std::exception", %"class.std::exception"* %5, i32 0, i32 1, !dbg !2697
  %8 = bitcast %struct.__std_exception_data* %7 to i8*, !dbg !2697
  call void @llvm.memset.p0i8.i64(i8* align 8 %8, i8 0, i64 16, i1 false), !dbg !2697
  %9 = getelementptr inbounds %"class.std::exception", %"class.std::exception"* %5, i32 0, i32 1, !dbg !2698
  %10 = load %"class.std::exception"*, %"class.std::exception"** %3, align 8, !dbg !2700, !tbaa !1715
  %11 = getelementptr inbounds %"class.std::exception", %"class.std::exception"* %10, i32 0, i32 1, !dbg !2701
  invoke void @__std_exception_copy(%struct.__std_exception_data* %11, %struct.__std_exception_data* %9)
          to label %12 unwind label %13, !dbg !2702

12:                                               ; preds = %2
  ret %"class.std::exception"* %5, !dbg !2703

13:                                               ; preds = %2
  %14 = cleanuppad within none [], !dbg !2702
  call void @__std_terminate() #18 [ "funclet"(token %14) ], !dbg !2702
  unreachable, !dbg !2702
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @"??1exception@std@@UEAA@XZ"(%"class.std::exception"* nonnull dereferenceable(24) %0) unnamed_addr #10 comdat align 2 personality i8* bitcast (i32 (...)* @__CxxFrameHandler3 to i8*) !dbg !2704 {
  %2 = alloca %"class.std::exception"*, align 8
  store %"class.std::exception"* %0, %"class.std::exception"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::exception"** %2, metadata !2706, metadata !DIExpression()), !dbg !2707
  %3 = load %"class.std::exception"*, %"class.std::exception"** %2, align 8
  %4 = bitcast %"class.std::exception"* %3 to i32 (...)***, !dbg !2708
  store i32 (...)** bitcast (i8** @"??_7exception@std@@6B@" to i32 (...)**), i32 (...)*** %4, align 8, !dbg !2708, !tbaa !2663
  %5 = getelementptr inbounds %"class.std::exception", %"class.std::exception"* %3, i32 0, i32 1, !dbg !2709
  invoke void @__std_exception_destroy(%struct.__std_exception_data* %5)
          to label %6 unwind label %7, !dbg !2711

6:                                                ; preds = %1
  ret void, !dbg !2712

7:                                                ; preds = %1
  %8 = cleanuppad within none [], !dbg !2711
  call void @__std_terminate() #18 [ "funclet"(token %8) ], !dbg !2711
  unreachable, !dbg !2711
}

declare dso_local void @_CxxThrowException(i8*, %eh.ThrowInfo*)

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local %"class.std::bad_alloc"* @"??0bad_alloc@std@@AEAA@QEBD@Z"(%"class.std::bad_alloc"* nonnull returned dereferenceable(24) %0, i8* %1) unnamed_addr #10 comdat align 2 !dbg !2713 {
  %3 = alloca i8*, align 8
  %4 = alloca %"class.std::bad_alloc"*, align 8
  store i8* %1, i8** %3, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %3, metadata !2715, metadata !DIExpression()), !dbg !2717
  store %"class.std::bad_alloc"* %0, %"class.std::bad_alloc"** %4, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::bad_alloc"** %4, metadata !2716, metadata !DIExpression()), !dbg !2718
  %5 = load %"class.std::bad_alloc"*, %"class.std::bad_alloc"** %4, align 8
  %6 = bitcast %"class.std::bad_alloc"* %5 to %"class.std::exception"*, !dbg !2719
  %7 = load i8*, i8** %3, align 8, !dbg !2720, !tbaa !1715
  %8 = call %"class.std::exception"* @"??0exception@std@@QEAA@QEBDH@Z"(%"class.std::exception"* nonnull dereferenceable(24) %6, i8* %7, i32 1) #17, !dbg !2721
  %9 = bitcast %"class.std::bad_alloc"* %5 to i32 (...)***, !dbg !2719
  store i32 (...)** bitcast (i8** @"??_7bad_alloc@std@@6B@" to i32 (...)**), i32 (...)*** %9, align 8, !dbg !2719, !tbaa !2663
  ret %"class.std::bad_alloc"* %5, !dbg !2722
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local i8* @"??_Gbad_array_new_length@std@@UEAAPEAXI@Z"(%"class.std::bad_array_new_length"* nonnull dereferenceable(24) %0, i32 %1) unnamed_addr #5 comdat align 2 !dbg !2723 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %"class.std::bad_array_new_length"*, align 8
  store i32 %1, i32* %4, align 4, !tbaa !1642
  call void @llvm.dbg.declare(metadata i32* %4, metadata !2726, metadata !DIExpression()), !dbg !2728
  store %"class.std::bad_array_new_length"* %0, %"class.std::bad_array_new_length"** %5, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::bad_array_new_length"** %5, metadata !2727, metadata !DIExpression()), !dbg !2728
  %6 = load %"class.std::bad_array_new_length"*, %"class.std::bad_array_new_length"** %5, align 8
  %7 = bitcast %"class.std::bad_array_new_length"* %6 to i8*
  store i8* %7, i8** %3, align 8
  %8 = load i32, i32* %4, align 4
  call void bitcast (void (%"class.std::exception"*)* @"??1exception@std@@UEAA@XZ" to void (%"class.std::bad_array_new_length"*)*)(%"class.std::bad_array_new_length"* nonnull dereferenceable(24) %6) #17, !dbg !2729
  %9 = icmp eq i32 %8, 0, !dbg !2729
  br i1 %9, label %12, label %10, !dbg !2729

10:                                               ; preds = %2
  %11 = bitcast %"class.std::bad_array_new_length"* %6 to i8*, !dbg !2729
  call void @"??3@YAXPEAX@Z"(i8* %11) #21, !dbg !2729
  br label %12, !dbg !2729

12:                                               ; preds = %10, %2
  %13 = load i8*, i8** %3, align 8, !dbg !2729
  ret i8* %13, !dbg !2729
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i8* @"?what@exception@std@@UEBAPEBDXZ"(%"class.std::exception"* nonnull dereferenceable(24) %0) unnamed_addr #7 comdat align 2 !dbg !2730 {
  %2 = alloca %"class.std::exception"*, align 8
  store %"class.std::exception"* %0, %"class.std::exception"** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::exception"** %2, metadata !2732, metadata !DIExpression()), !dbg !2734
  %3 = load %"class.std::exception"*, %"class.std::exception"** %2, align 8
  %4 = getelementptr inbounds %"class.std::exception", %"class.std::exception"* %3, i32 0, i32 1, !dbg !2735
  %5 = getelementptr inbounds %struct.__std_exception_data, %struct.__std_exception_data* %4, i32 0, i32 0, !dbg !2736
  %6 = load i8*, i8** %5, align 8, !dbg !2736, !tbaa !2737
  %7 = icmp ne i8* %6, null, !dbg !2735
  br i1 %7, label %8, label %12, !dbg !2735

8:                                                ; preds = %1
  %9 = getelementptr inbounds %"class.std::exception", %"class.std::exception"* %3, i32 0, i32 1, !dbg !2740
  %10 = getelementptr inbounds %struct.__std_exception_data, %struct.__std_exception_data* %9, i32 0, i32 0, !dbg !2741
  %11 = load i8*, i8** %10, align 8, !dbg !2741, !tbaa !2737
  br label %13, !dbg !2735

12:                                               ; preds = %1
  br label %13, !dbg !2735

13:                                               ; preds = %12, %8
  %14 = phi i8* [ %11, %8 ], [ getelementptr inbounds ([18 x i8], [18 x i8]* @"??_C@_0BC@EOODALEL@Unknown?5exception?$AA@", i64 0, i64 0), %12 ], !dbg !2735
  ret i8* %14, !dbg !2742
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local %"class.std::exception"* @"??0exception@std@@QEAA@QEBDH@Z"(%"class.std::exception"* nonnull returned dereferenceable(24) %0, i8* %1, i32 %2) unnamed_addr #10 comdat align 2 !dbg !2743 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca %"class.std::exception"*, align 8
  store i32 %2, i32* %4, align 4, !tbaa !1642
  call void @llvm.dbg.declare(metadata i32* %4, metadata !2745, metadata !DIExpression()), !dbg !2748
  store i8* %1, i8** %5, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %5, metadata !2746, metadata !DIExpression()), !dbg !2749
  store %"class.std::exception"* %0, %"class.std::exception"** %6, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::exception"** %6, metadata !2747, metadata !DIExpression()), !dbg !2750
  %7 = load %"class.std::exception"*, %"class.std::exception"** %6, align 8
  %8 = bitcast %"class.std::exception"* %7 to i32 (...)***, !dbg !2751
  store i32 (...)** bitcast (i8** @"??_7exception@std@@6B@" to i32 (...)**), i32 (...)*** %8, align 8, !dbg !2751, !tbaa !2663
  %9 = getelementptr inbounds %"class.std::exception", %"class.std::exception"* %7, i32 0, i32 1, !dbg !2752
  %10 = bitcast %struct.__std_exception_data* %9 to i8*, !dbg !2752
  call void @llvm.memset.p0i8.i64(i8* align 8 %10, i8 0, i64 16, i1 false), !dbg !2752
  %11 = load i8*, i8** %5, align 8, !dbg !2753, !tbaa !1715
  %12 = getelementptr inbounds %"class.std::exception", %"class.std::exception"* %7, i32 0, i32 1, !dbg !2755
  %13 = getelementptr inbounds %struct.__std_exception_data, %struct.__std_exception_data* %12, i32 0, i32 0, !dbg !2756
  store i8* %11, i8** %13, align 8, !dbg !2757, !tbaa !2737
  ret %"class.std::exception"* %7, !dbg !2758
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local i8* @"??_Gbad_alloc@std@@UEAAPEAXI@Z"(%"class.std::bad_alloc"* nonnull dereferenceable(24) %0, i32 %1) unnamed_addr #5 comdat align 2 !dbg !2759 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %"class.std::bad_alloc"*, align 8
  store i32 %1, i32* %4, align 4, !tbaa !1642
  call void @llvm.dbg.declare(metadata i32* %4, metadata !2762, metadata !DIExpression()), !dbg !2764
  store %"class.std::bad_alloc"* %0, %"class.std::bad_alloc"** %5, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::bad_alloc"** %5, metadata !2763, metadata !DIExpression()), !dbg !2764
  %6 = load %"class.std::bad_alloc"*, %"class.std::bad_alloc"** %5, align 8
  %7 = bitcast %"class.std::bad_alloc"* %6 to i8*
  store i8* %7, i8** %3, align 8
  %8 = load i32, i32* %4, align 4
  call void bitcast (void (%"class.std::exception"*)* @"??1exception@std@@UEAA@XZ" to void (%"class.std::bad_alloc"*)*)(%"class.std::bad_alloc"* nonnull dereferenceable(24) %6) #17, !dbg !2765
  %9 = icmp eq i32 %8, 0, !dbg !2765
  br i1 %9, label %12, label %10, !dbg !2765

10:                                               ; preds = %2
  %11 = bitcast %"class.std::bad_alloc"* %6 to i8*, !dbg !2765
  call void @"??3@YAXPEAX@Z"(i8* %11) #21, !dbg !2765
  br label %12, !dbg !2765

12:                                               ; preds = %10, %2
  %13 = load i8*, i8** %3, align 8, !dbg !2765
  ret i8* %13, !dbg !2765
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #13

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local i8* @"??_Gexception@std@@UEAAPEAXI@Z"(%"class.std::exception"* nonnull dereferenceable(24) %0, i32 %1) unnamed_addr #10 comdat align 2 !dbg !2766 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %"class.std::exception"*, align 8
  store i32 %1, i32* %4, align 4, !tbaa !1642
  call void @llvm.dbg.declare(metadata i32* %4, metadata !2768, metadata !DIExpression()), !dbg !2770
  store %"class.std::exception"* %0, %"class.std::exception"** %5, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata %"class.std::exception"** %5, metadata !2769, metadata !DIExpression()), !dbg !2770
  %6 = load %"class.std::exception"*, %"class.std::exception"** %5, align 8
  %7 = bitcast %"class.std::exception"* %6 to i8*
  store i8* %7, i8** %3, align 8
  %8 = load i32, i32* %4, align 4
  call void @"??1exception@std@@UEAA@XZ"(%"class.std::exception"* nonnull dereferenceable(24) %6) #17, !dbg !2771
  %9 = icmp eq i32 %8, 0, !dbg !2771
  br i1 %9, label %12, label %10, !dbg !2771

10:                                               ; preds = %2
  %11 = bitcast %"class.std::exception"* %6 to i8*, !dbg !2771
  call void @"??3@YAXPEAX@Z"(i8* %11) #21, !dbg !2771
  br label %12, !dbg !2771

12:                                               ; preds = %10, %2
  %13 = load i8*, i8** %3, align 8, !dbg !2772
  ret i8* %13, !dbg !2772
}

; Function Attrs: nobuiltin nounwind
declare dso_local void @"??3@YAXPEAX@Z"(i8*) #14

declare dso_local void @__std_exception_destroy(%struct.__std_exception_data*) #15

declare dso_local void @__std_exception_copy(%struct.__std_exception_data*, %struct.__std_exception_data*) #15

; Function Attrs: nobuiltin allocsize(0)
declare dso_local nonnull i8* @"??2@YAPEAX_K@Z"(i64) #16

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local i8* @"?copy@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z"(i8* %0, i8* %1, i64 %2) #6 comdat align 2 !dbg !2773 {
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  store i64 %2, i64* %4, align 8, !tbaa !1861
  call void @llvm.dbg.declare(metadata i64* %4, metadata !2775, metadata !DIExpression()), !dbg !2778
  store i8* %1, i8** %5, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %5, metadata !2776, metadata !DIExpression()), !dbg !2779
  store i8* %0, i8** %6, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8** %6, metadata !2777, metadata !DIExpression()), !dbg !2780
  %7 = load i8*, i8** %6, align 8, !dbg !2781, !tbaa !1715
  %8 = load i8*, i8** %5, align 8, !dbg !2782, !tbaa !1715
  %9 = load i64, i64* %4, align 8, !dbg !2783, !tbaa !1861
  %10 = mul i64 %9, 1, !dbg !2784
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 %8, i64 %10, i1 false), !dbg !2785
  %11 = load i8*, i8** %6, align 8, !dbg !2786, !tbaa !1715
  ret i8* %11, !dbg !2787
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i8* @"??$_Voidify_iter@PEAPEAD@std@@YAPEAXPEAPEAD@Z"(i8** %0) #7 comdat !dbg !2788 {
  %2 = alloca i8**, align 8
  store i8** %0, i8*** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8*** %2, metadata !2792, metadata !DIExpression()), !dbg !2795
  %3 = load i8**, i8*** %2, align 8, !dbg !2796, !tbaa !1715
  %4 = bitcast i8** %3 to i8*, !dbg !2796
  ret i8* %4, !dbg !2799
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i8** @"??$addressof@PEAD@std@@YAPEAPEADAEAPEAD@Z"(i8** nonnull align 8 dereferenceable(8) %0) #7 comdat !dbg !2800 {
  %2 = alloca i8**, align 8
  store i8** %0, i8*** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8*** %2, metadata !2804, metadata !DIExpression()), !dbg !2805
  %3 = load i8**, i8*** %2, align 8, !dbg !2806, !tbaa !1715
  ret i8** %3, !dbg !2807
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local nonnull align 8 dereferenceable(8) i8** @"??$forward@AEBQEAD@std@@YAAEBQEADAEBQEAD@Z"(i8** nonnull align 8 dereferenceable(8) %0) #7 comdat !dbg !2808 {
  %2 = alloca i8**, align 8
  store i8** %0, i8*** %2, align 8, !tbaa !1715
  call void @llvm.dbg.declare(metadata i8*** %2, metadata !2820, metadata !DIExpression()), !dbg !2821
  %3 = load i8**, i8*** %2, align 8, !dbg !2822, !tbaa !1715
  ret i8** %3, !dbg !2823
}

declare dso_local i64 @strlen(i8*) #15

attributes #0 = { norecurse uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { inlinehint uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { inlinehint uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { inlinehint nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { inlinehint nounwind uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noreturn "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { inlinehint noreturn uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #14 = { nobuiltin nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #16 = { nobuiltin allocsize(0) "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #17 = { nounwind }
attributes #18 = { noreturn nounwind }
attributes #19 = { noreturn }
attributes #20 = { allocsize(0) }
attributes #21 = { builtin nounwind }

!llvm.dbg.cu = !{!7}
!llvm.linker.options = !{!1616, !1617, !1618, !1619, !1620}
!llvm.module.flags = !{!1621, !1622, !1623, !1624}
!llvm.ident = !{!1625}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_Fake_alloc", linkageName: "?_Fake_alloc@std@@3U_Fake_allocator@1@B", scope: !2, file: !3, line: 1341, type: !4, isLocal: true, isDefinition: true)
!2 = !DINamespace(name: "std", scope: null)
!3 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\xmemory", directory: "", checksumkind: CSK_MD5, checksum: "975865db9edf6f230ee4f2aabe3a8b80")
!4 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!5 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Fake_allocator", scope: !2, file: !3, line: 1034, size: 8, flags: DIFlagTypePassByValue, elements: !6, identifier: ".?AU_Fake_allocator@std@@")
!6 = !{}
!7 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !8, producer: "clang version 12.0.0", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, retainedTypes: !24, globals: !815, imports: !822, nameTableKind: None)
!8 = !DIFile(filename: "assignmentTest.cpp", directory: "E:\\Documents\\Work Stuff\\Active Work Files\\Code Examples\\test_cpp01", checksumkind: CSK_MD5, checksum: "670376e6b09a8effd4a6847d111b9d53")
!9 = !{!10, !17}
!10 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "float_denorm_style", scope: !2, file: !11, line: 27, baseType: !12, size: 32, elements: !13, identifier: ".?AW4float_denorm_style@std@@")
!11 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\limits", directory: "", checksumkind: CSK_MD5, checksum: "e77969fbddca4fa5c641ba7a15e2a47b")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{!14, !15, !16}
!14 = !DIEnumerator(name: "denorm_indeterminate", value: -1)
!15 = !DIEnumerator(name: "denorm_absent", value: 0)
!16 = !DIEnumerator(name: "denorm_present", value: 1)
!17 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "float_round_style", scope: !2, file: !11, line: 34, baseType: !12, size: 32, elements: !18, identifier: ".?AW4float_round_style@std@@")
!18 = !{!19, !20, !21, !22, !23}
!19 = !DIEnumerator(name: "round_indeterminate", value: -1)
!20 = !DIEnumerator(name: "round_toward_zero", value: 0)
!21 = !DIEnumerator(name: "round_to_nearest", value: 1)
!22 = !DIEnumerator(name: "round_toward_infinity", value: 2)
!23 = !DIEnumerator(name: "round_toward_neg_infinity", value: 3)
!24 = !{!25, !26, !29, !30, !32, !34, !37, !39, !186}
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !27, line: 61, baseType: !28)
!27 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\vadefs.h", directory: "", checksumkind: CSK_MD5, checksum: "a4b8f96637d0704c82f39ecb6bde2ab4")
!28 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !31, line: 46, baseType: !28)
!31 = !DIFile(filename: "C:\\Program Files\\LLVM\\lib\\clang\\12.0.0\\include\\stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !36)
!36 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: null)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!38 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !33)
!39 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "basic_string<char,std::char_traits<char>,std::allocator<char> >", scope: !2, file: !40, line: 2378, size: 256, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !41, templateParams: !813, identifier: ".?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@")
!40 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\xstring", directory: "", checksumkind: CSK_MD5, checksum: "ced2d8e240a38a43f200b64e568f1d06")
!41 = !{!42, !172, !185, !278, !390, !391, !392, !393, !394, !395, !396, !398, !401, !403, !405, !408, !410, !412, !413, !414, !415, !416, !417, !436, !442, !445, !448, !451, !455, !458, !461, !464, !467, !470, !473, !476, !489, !492, !496, !499, !503, !507, !511, !515, !519, !522, !523, !524, !527, !528, !533, !536, !537, !538, !539, !544, !547, !548, !549, !552, !555, !558, !561, !564, !565, !566, !569, !570, !573, !576, !577, !580, !581, !582, !583, !584, !585, !588, !591, !594, !597, !600, !603, !606, !609, !612, !615, !618, !621, !622, !625, !628, !631, !634, !637, !640, !643, !646, !649, !652, !656, !657, !658, !661, !664, !665, !666, !669, !672, !673, !674, !675, !676, !677, !678, !679, !682, !685, !686, !687, !690, !691, !694, !697, !698, !699, !700, !701, !704, !705, !706, !707, !708, !711, !714, !717, !720, !724, !725, !726, !729, !732, !735, !738, !739, !740, !741, !742, !743, !744, !745, !746, !749, !750, !751, !752, !753, !754, !757, !758, !759, !760, !761, !762, !765, !768, !771, !774, !777, !780, !783, !786, !789, !792, !795, !798, !799, !800, !801, !802, !803, !804, !808}
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Alty", scope: !39, file: !40, line: 2383, baseType: !43)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Rebind_alloc_t<std::allocator<char>,char>", scope: !2, file: !3, line: 756, baseType: !44)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "rebind_alloc<char>", scope: !45, file: !3, line: 660, baseType: !48)
!45 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Default_allocator_traits<std::allocator<char> >", scope: !2, file: !3, line: 642, size: 8, flags: DIFlagTypePassByValue, elements: !46, templateParams: !170, identifier: ".?AU?$_Default_allocator_traits@V?$allocator@D@std@@@std@@")
!46 = !{!47, !122, !123, !125, !128, !129, !130, !131, !132, !148, !149, !150, !151, !156, !160, !164, !167}
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !45, file: !3, line: 643, baseType: !48)
!48 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "allocator<char>", scope: !2, file: !3, line: 786, size: 8, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !49, templateParams: !120, identifier: ".?AV?$allocator@D@std@@")
!49 = !{!50, !51, !52, !53, !54, !56, !58, !59, !62, !82, !83, !88, !91, !95, !99, !100, !104, !109, !112, !117}
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "_From_primary", scope: !48, file: !3, line: 791, baseType: !48)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !48, file: !3, line: 793, baseType: !33)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !48, file: !3, line: 796, baseType: !32)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !48, file: !3, line: 797, baseType: !37)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !48, file: !3, line: 799, baseType: !55)
!55 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !33, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !48, file: !3, line: 800, baseType: !57)
!57 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !38, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !48, file: !3, line: 803, baseType: !30)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !48, file: !3, line: 804, baseType: !60)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", file: !31, line: 35, baseType: !61)
!61 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "propagate_on_container_move_assignment", scope: !48, file: !3, line: 806, baseType: !63)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "true_type", scope: !2, file: !64, line: 41, baseType: !65)
!64 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\xtr1common", directory: "", checksumkind: CSK_MD5, checksum: "30144ce5d9b954ba3b99adea12ced09e")
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "bool_constant<true>", scope: !2, file: !64, line: 39, baseType: !66)
!66 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "integral_constant<bool,1>", scope: !2, file: !64, line: 22, size: 8, flags: DIFlagTypePassByValue, elements: !67, templateParams: !79, identifier: ".?AU?$integral_constant@_N$00@std@@")
!67 = !{!68, !71, !72, !73, !78}
!68 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !66, file: !64, line: 23, baseType: !69, flags: DIFlagStaticMember)
!69 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !70)
!70 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !66, file: !64, line: 25, baseType: !70)
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !66, file: !64, line: 26, baseType: !66)
!73 = !DISubprogram(name: "operator bool", linkageName: "??B?$integral_constant@_N$00@std@@QEBA_NXZ", scope: !66, file: !64, line: 28, type: !74, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!74 = !DISubroutineType(types: !75)
!75 = !{!71, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!77 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !66)
!78 = !DISubprogram(name: "operator()", linkageName: "??R?$integral_constant@_N$00@std@@QEBA_NXZ", scope: !66, file: !64, line: 32, type: !74, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!79 = !{!80, !81}
!80 = !DITemplateTypeParameter(name: "_Ty", type: !70)
!81 = !DITemplateValueParameter(name: "_Val", type: !70, value: i8 1)
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "is_always_equal", scope: !48, file: !3, line: 809, baseType: !63)
!83 = !DISubprogram(name: "address", linkageName: "?address@?$allocator@D@std@@QEBAPEADAEAD@Z", scope: !48, file: !3, line: 816, type: !84, scopeLine: 816, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!84 = !DISubroutineType(types: !85)
!85 = !{!32, !86, !55}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!87 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !48)
!88 = !DISubprogram(name: "address", linkageName: "?address@?$allocator@D@std@@QEBAPEBDAEBD@Z", scope: !48, file: !3, line: 820, type: !89, scopeLine: 820, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!89 = !DISubroutineType(types: !90)
!90 = !{!37, !86, !57}
!91 = !DISubprogram(name: "allocator", scope: !48, file: !3, line: 825, type: !92, scopeLine: 825, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!92 = !DISubroutineType(types: !93)
!93 = !{null, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!95 = !DISubprogram(name: "allocator", scope: !48, file: !3, line: 827, type: !96, scopeLine: 827, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!96 = !DISubroutineType(types: !97)
!97 = !{null, !94, !98}
!98 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !87, size: 64)
!99 = !DISubprogram(name: "~allocator", scope: !48, file: !3, line: 830, type: !92, scopeLine: 830, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!100 = !DISubprogram(name: "operator=", linkageName: "??4?$allocator@D@std@@QEAAAEAV01@AEBV01@@Z", scope: !48, file: !3, line: 831, type: !101, scopeLine: 831, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!101 = !DISubroutineType(types: !102)
!102 = !{!103, !94, !98}
!103 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !48, size: 64)
!104 = !DISubprogram(name: "deallocate", linkageName: "?deallocate@?$allocator@D@std@@QEAAXQEAD_K@Z", scope: !48, file: !3, line: 833, type: !105, scopeLine: 833, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!105 = !DISubroutineType(types: !106)
!106 = !{null, !94, !107, !108}
!107 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !32)
!108 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !30)
!109 = !DISubprogram(name: "allocate", linkageName: "?allocate@?$allocator@D@std@@QEAAPEAD_K@Z", scope: !48, file: !3, line: 838, type: !110, scopeLine: 838, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!110 = !DISubroutineType(types: !111)
!111 = !{!32, !94, !108}
!112 = !DISubprogram(name: "allocate", linkageName: "?allocate@?$allocator@D@std@@QEAAPEAD_KPEBX@Z", scope: !48, file: !3, line: 843, type: !113, scopeLine: 843, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!113 = !DISubroutineType(types: !114)
!114 = !{!32, !94, !108, !115}
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!116 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!117 = !DISubprogram(name: "max_size", linkageName: "?max_size@?$allocator@D@std@@QEBA_KXZ", scope: !48, file: !3, line: 858, type: !118, scopeLine: 858, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!118 = !DISubroutineType(types: !119)
!119 = !{!30, !86}
!120 = !{!121}
!121 = !DITemplateTypeParameter(name: "_Ty", type: !33)
!122 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !45, file: !3, line: 644, baseType: !51)
!123 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !45, file: !3, line: 646, baseType: !124)
!124 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !122, size: 64)
!125 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !45, file: !3, line: 647, baseType: !126)
!126 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !127, size: 64)
!127 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !122)
!128 = !DIDerivedType(tag: DW_TAG_typedef, name: "void_pointer", scope: !45, file: !3, line: 648, baseType: !29)
!129 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_void_pointer", scope: !45, file: !3, line: 649, baseType: !115)
!130 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !45, file: !3, line: 651, baseType: !30)
!131 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !45, file: !3, line: 652, baseType: !60)
!132 = !DIDerivedType(tag: DW_TAG_typedef, name: "propagate_on_container_copy_assignment", scope: !45, file: !3, line: 654, baseType: !133)
!133 = !DIDerivedType(tag: DW_TAG_typedef, name: "false_type", scope: !2, file: !64, line: 42, baseType: !134)
!134 = !DIDerivedType(tag: DW_TAG_typedef, name: "bool_constant<false>", scope: !2, file: !64, line: 39, baseType: !135)
!135 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "integral_constant<bool,0>", scope: !2, file: !64, line: 22, size: 8, flags: DIFlagTypePassByValue, elements: !136, templateParams: !146, identifier: ".?AU?$integral_constant@_N$0A@@std@@")
!136 = !{!137, !138, !139, !140, !145}
!137 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !135, file: !64, line: 23, baseType: !69, flags: DIFlagStaticMember)
!138 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !135, file: !64, line: 25, baseType: !70)
!139 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !135, file: !64, line: 26, baseType: !135)
!140 = !DISubprogram(name: "operator bool", linkageName: "??B?$integral_constant@_N$0A@@std@@QEBA_NXZ", scope: !135, file: !64, line: 28, type: !141, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!141 = !DISubroutineType(types: !142)
!142 = !{!138, !143}
!143 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !144, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!144 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !135)
!145 = !DISubprogram(name: "operator()", linkageName: "??R?$integral_constant@_N$0A@@std@@QEBA_NXZ", scope: !135, file: !64, line: 32, type: !141, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!146 = !{!80, !147}
!147 = !DITemplateValueParameter(name: "_Val", type: !70, value: i8 0)
!148 = !DIDerivedType(tag: DW_TAG_typedef, name: "propagate_on_container_move_assignment", scope: !45, file: !3, line: 655, baseType: !63)
!149 = !DIDerivedType(tag: DW_TAG_typedef, name: "propagate_on_container_swap", scope: !45, file: !3, line: 656, baseType: !133)
!150 = !DIDerivedType(tag: DW_TAG_typedef, name: "is_always_equal", scope: !45, file: !3, line: 657, baseType: !63)
!151 = !DISubprogram(name: "allocate", linkageName: "?allocate@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SAPEADAEAV?$allocator@D@2@_K@Z", scope: !45, file: !3, line: 666, type: !152, scopeLine: 666, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!152 = !DISubroutineType(types: !153)
!153 = !{!123, !103, !154}
!154 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !155)
!155 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", file: !3, line: 651, baseType: !30)
!156 = !DISubprogram(name: "allocate", linkageName: "?allocate@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SAPEADAEAV?$allocator@D@2@_KPEBX@Z", scope: !45, file: !3, line: 680, type: !157, scopeLine: 680, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!157 = !DISubroutineType(types: !158)
!158 = !{!123, !103, !154, !159}
!159 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_void_pointer", file: !3, line: 649, baseType: !115)
!160 = !DISubprogram(name: "deallocate", linkageName: "?deallocate@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SAXAEAV?$allocator@D@2@QEAD_K@Z", scope: !45, file: !3, line: 693, type: !161, scopeLine: 693, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!161 = !DISubroutineType(types: !162)
!162 = !{null, !103, !163, !154}
!163 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !123)
!164 = !DISubprogram(name: "max_size", linkageName: "?max_size@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA_KAEBV?$allocator@D@2@@Z", scope: !45, file: !3, line: 727, type: !165, scopeLine: 727, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!165 = !DISubroutineType(types: !166)
!166 = !{!130, !98}
!167 = !DISubprogram(name: "select_on_container_copy_construction", linkageName: "?select_on_container_copy_construction@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA?AV?$allocator@D@2@AEBV32@@Z", scope: !45, file: !3, line: 731, type: !168, scopeLine: 731, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!168 = !DISubroutineType(types: !169)
!169 = !{!48, !98}
!170 = !{!171}
!171 = !DITemplateTypeParameter(name: "_Alloc", type: !48)
!172 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Alty_traits", scope: !39, file: !40, line: 2384, baseType: !173)
!173 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "allocator_traits<std::allocator<char> >", scope: !2, file: !3, line: 737, size: 8, flags: DIFlagTypePassByValue, elements: !174, templateParams: !170, identifier: ".?AU?$allocator_traits@V?$allocator@D@std@@@std@@")
!174 = !{!175}
!175 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !173, baseType: !176, extraData: i32 0)
!176 = !DIDerivedType(tag: DW_TAG_typedef, name: "conditional_t<_Is_default_allocator<allocator<char> >::value,_Default_allocator_traits<std::allocator<char> >,_Normal_allocator_traits<std::allocator<char> > >", scope: !2, file: !64, line: 68, baseType: !177)
!177 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !178, file: !64, line: 59, baseType: !45)
!178 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "conditional<1,std::_Default_allocator_traits<std::allocator<char> >,std::_Normal_allocator_traits<std::allocator<char> > >", scope: !2, file: !64, line: 58, size: 8, flags: DIFlagTypePassByValue, elements: !179, templateParams: !180, identifier: ".?AU?$conditional@$00U?$_Default_allocator_traits@V?$allocator@D@std@@@std@@U?$_Normal_allocator_traits@V?$allocator@D@std@@@2@@std@@")
!179 = !{!177}
!180 = !{!181, !182, !183}
!181 = !DITemplateValueParameter(name: "_Test", type: !70, value: i8 1)
!182 = !DITemplateTypeParameter(name: "_Ty1", type: !45)
!183 = !DITemplateTypeParameter(name: "_Ty2", type: !184)
!184 = !DICompositeType(tag: DW_TAG_structure_type, name: "_Normal_allocator_traits<std::allocator<char> >", scope: !2, file: !3, line: 555, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AU?$_Normal_allocator_traits@V?$allocator@D@std@@@std@@")
!185 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Scary_val", scope: !39, file: !40, line: 2386, baseType: !186)
!186 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "_String_val<std::_Simple_types<char> >", scope: !2, file: !40, line: 2274, size: 256, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !187, templateParams: !276, identifier: ".?AV?$_String_val@U?$_Simple_types@D@std@@@std@@")
!187 = !{!188, !207, !220, !221, !222, !223, !224, !226, !229, !231, !232, !246, !247, !248, !249, !253, !257, !263, !266, !269, !270, !273}
!188 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !186, baseType: !189, flags: DIFlagPublic, extraData: i32 0)
!189 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Container_base", scope: !2, file: !3, line: 1272, baseType: !190)
!190 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Container_base0", scope: !2, file: !3, line: 1036, size: 8, flags: DIFlagTypePassByValue, elements: !191, identifier: ".?AU_Container_base0@std@@")
!191 = !{!192, !196, !200, !204}
!192 = !DISubprogram(name: "_Orphan_all", linkageName: "?_Orphan_all@_Container_base0@std@@QEAAXXZ", scope: !190, file: !3, line: 1037, type: !193, scopeLine: 1037, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!193 = !DISubroutineType(types: !194)
!194 = !{null, !195}
!195 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !190, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!196 = !DISubprogram(name: "_Swap_proxy_and_iterators", linkageName: "?_Swap_proxy_and_iterators@_Container_base0@std@@QEAAXAEAU12@@Z", scope: !190, file: !3, line: 1038, type: !197, scopeLine: 1038, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!197 = !DISubroutineType(types: !198)
!198 = !{null, !195, !199}
!199 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !190, size: 64)
!200 = !DISubprogram(name: "_Alloc_proxy", linkageName: "?_Alloc_proxy@_Container_base0@std@@QEAAXAEBU_Fake_allocator@2@@Z", scope: !190, file: !3, line: 1039, type: !201, scopeLine: 1039, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!201 = !DISubroutineType(types: !202)
!202 = !{null, !195, !203}
!203 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !4, size: 64)
!204 = !DISubprogram(name: "_Reload_proxy", linkageName: "?_Reload_proxy@_Container_base0@std@@QEAAXAEBU_Fake_allocator@2@0@Z", scope: !190, file: !3, line: 1040, type: !205, scopeLine: 1040, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!205 = !DISubroutineType(types: !206)
!206 = !{null, !195, !203, !203}
!207 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !186, file: !40, line: 2276, baseType: !208)
!208 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !209, file: !3, line: 777, baseType: !33)
!209 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Simple_types<char>", scope: !2, file: !3, line: 775, size: 8, flags: DIFlagTypePassByValue, elements: !210, templateParams: !218, identifier: ".?AU?$_Simple_types@D@std@@")
!210 = !{!208, !211, !212, !213, !215}
!211 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !209, file: !3, line: 778, baseType: !30)
!212 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !209, file: !3, line: 779, baseType: !60)
!213 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !209, file: !3, line: 780, baseType: !214)
!214 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !208, size: 64)
!215 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !209, file: !3, line: 781, baseType: !216)
!216 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !217, size: 64)
!217 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !208)
!218 = !{!219}
!219 = !DITemplateTypeParameter(name: "_Value_type", type: !33)
!220 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !186, file: !40, line: 2277, baseType: !211)
!221 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !186, file: !40, line: 2278, baseType: !212)
!222 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !186, file: !40, line: 2279, baseType: !213)
!223 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !186, file: !40, line: 2280, baseType: !215)
!224 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !186, file: !40, line: 2281, baseType: !225)
!225 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !207, size: 64)
!226 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !186, file: !40, line: 2282, baseType: !227)
!227 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !228, size: 64)
!228 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !207)
!229 = !DIDerivedType(tag: DW_TAG_member, name: "_BUF_SIZE", scope: !186, file: !40, line: 2287, baseType: !230, flags: DIFlagPublic | DIFlagStaticMember, extraData: i64 16)
!230 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !220)
!231 = !DIDerivedType(tag: DW_TAG_member, name: "_ALLOC_MASK", scope: !186, file: !40, line: 2289, baseType: !230, flags: DIFlagPublic | DIFlagStaticMember, extraData: i64 15)
!232 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "_Bxty", scope: !186, file: !40, line: 2345, size: 128, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !233, identifier: ".?AT_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@")
!233 = !{!234, !238, !239, !241, !245}
!234 = !DIDerivedType(tag: DW_TAG_member, name: "_Buf", scope: !232, file: !40, line: 2350, baseType: !235, size: 128)
!235 = !DICompositeType(tag: DW_TAG_array_type, baseType: !207, size: 128, elements: !236)
!236 = !{!237}
!237 = !DISubrange(count: 16)
!238 = !DIDerivedType(tag: DW_TAG_member, name: "_Ptr", scope: !232, file: !40, line: 2351, baseType: !222, size: 64)
!239 = !DIDerivedType(tag: DW_TAG_member, name: "_Alias", scope: !232, file: !40, line: 2352, baseType: !240, size: 128)
!240 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 128, elements: !236)
!241 = !DISubprogram(name: "_Bxty", scope: !232, file: !40, line: 2346, type: !242, scopeLine: 2346, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!242 = !DISubroutineType(types: !243)
!243 = !{null, !244}
!244 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !232, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!245 = !DISubprogram(name: "~_Bxty", scope: !232, file: !40, line: 2348, type: !242, scopeLine: 2348, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!246 = !DIDerivedType(tag: DW_TAG_member, name: "_Bx", scope: !186, file: !40, line: 2353, baseType: !232, size: 128, flags: DIFlagPublic)
!247 = !DIDerivedType(tag: DW_TAG_member, name: "_Mysize", scope: !186, file: !40, line: 2355, baseType: !220, size: 64, offset: 128, flags: DIFlagPublic)
!248 = !DIDerivedType(tag: DW_TAG_member, name: "_Myres", scope: !186, file: !40, line: 2356, baseType: !220, size: 64, offset: 192, flags: DIFlagPublic)
!249 = !DISubprogram(name: "_String_val", scope: !186, file: !40, line: 2284, type: !250, scopeLine: 2284, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!250 = !DISubroutineType(types: !251)
!251 = !{null, !252}
!252 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !186, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!253 = !DISubprogram(name: "_Myptr", linkageName: "?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAAPEADXZ", scope: !186, file: !40, line: 2295, type: !254, scopeLine: 2295, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!254 = !DISubroutineType(types: !255)
!255 = !{!256, !252}
!256 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !207, size: 64)
!257 = !DISubprogram(name: "_Myptr", linkageName: "?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBAPEBDXZ", scope: !186, file: !40, line: 2304, type: !258, scopeLine: 2304, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!258 = !DISubroutineType(types: !259)
!259 = !{!260, !261}
!260 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !228, size: 64)
!261 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !262, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!262 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !186)
!263 = !DISubprogram(name: "_Large_string_engaged", linkageName: "?_Large_string_engaged@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_NXZ", scope: !186, file: !40, line: 2313, type: !264, scopeLine: 2313, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!264 = !DISubroutineType(types: !265)
!265 = !{!70, !261}
!266 = !DISubprogram(name: "_Check_offset", linkageName: "?_Check_offset@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBAX_K@Z", scope: !186, file: !40, line: 2322, type: !267, scopeLine: 2322, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!267 = !DISubroutineType(types: !268)
!268 = !{null, !261, !230}
!269 = !DISubprogram(name: "_Check_offset_exclusive", linkageName: "?_Check_offset_exclusive@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBAX_K@Z", scope: !186, file: !40, line: 2329, type: !267, scopeLine: 2329, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!270 = !DISubprogram(name: "_Xran", linkageName: "?_Xran@?$_String_val@U?$_Simple_types@D@std@@@std@@SAXXZ", scope: !186, file: !40, line: 2336, type: !271, scopeLine: 2336, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!271 = !DISubroutineType(types: !272)
!272 = !{null}
!273 = !DISubprogram(name: "_Clamp_suffix_size", linkageName: "?_Clamp_suffix_size@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_K_K0@Z", scope: !186, file: !40, line: 2340, type: !274, scopeLine: 2340, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!274 = !DISubroutineType(types: !275)
!275 = !{!220, !261, !230, !230}
!276 = !{!277}
!277 = !DITemplateTypeParameter(name: "_Val_types", type: !209)
!278 = !DIDerivedType(tag: DW_TAG_typedef, name: "traits_type", scope: !39, file: !40, line: 2402, baseType: !279)
!279 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "char_traits<char>", scope: !2, file: !40, line: 487, size: 8, flags: DIFlagTypePassByValue, elements: !280, templateParams: !389, identifier: ".?AU?$char_traits@D@std@@")
!280 = !{!281}
!281 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !279, baseType: !282, extraData: i32 0)
!282 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Narrow_char_traits<char,int>", scope: !2, file: !40, line: 367, size: 8, flags: DIFlagTypePassByValue, elements: !283, templateParams: !349, identifier: ".?AU?$_Narrow_char_traits@DH@std@@")
!283 = !{!284, !352, !353, !354, !355, !356, !357, !359, !362, !365, !368, !369, !370, !371, !372, !377, !380, !383, !386}
!284 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !282, baseType: !285, flags: DIFlagPrivate, extraData: i32 0)
!285 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Char_traits<char,int>", scope: !2, file: !40, line: 36, size: 8, flags: DIFlagTypePassByValue, elements: !286, templateParams: !349, identifier: ".?AU?$_Char_traits@DH@std@@")
!286 = !{!287, !288, !289, !293, !295, !305, !309, !312, !313, !316, !319, !322, !325, !328, !331, !332, !337, !340, !343, !346}
!287 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !285, file: !40, line: 37, baseType: !33)
!288 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_type", scope: !285, file: !40, line: 38, baseType: !12)
!289 = !DIDerivedType(tag: DW_TAG_typedef, name: "pos_type", scope: !285, file: !40, line: 39, baseType: !290)
!290 = !DIDerivedType(tag: DW_TAG_typedef, name: "streampos", scope: !2, file: !291, line: 139, baseType: !292)
!291 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\iosfwd", directory: "", checksumkind: CSK_MD5, checksum: "7f4c15d03d7c70c537a2ffea8d07c995")
!292 = !DICompositeType(tag: DW_TAG_class_type, name: "fpos<_Mbstatet>", scope: !2, file: !291, line: 53, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AV?$fpos@U_Mbstatet@@@std@@")
!293 = !DIDerivedType(tag: DW_TAG_typedef, name: "off_type", scope: !285, file: !40, line: 40, baseType: !294)
!294 = !DIDerivedType(tag: DW_TAG_typedef, name: "streamoff", scope: !2, file: !291, line: 48, baseType: !61)
!295 = !DIDerivedType(tag: DW_TAG_typedef, name: "state_type", scope: !285, file: !40, line: 41, baseType: !296)
!296 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Mbstatet", file: !297, line: 615, baseType: !298)
!297 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt.h", directory: "", checksumkind: CSK_MD5, checksum: "db0cd8b4d76ec84d3625032eaca2a3ca")
!298 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Mbstatet", file: !297, line: 611, size: 64, flags: DIFlagTypePassByValue, elements: !299, identifier: ".?AU_Mbstatet@@")
!299 = !{!300, !302, !304}
!300 = !DIDerivedType(tag: DW_TAG_member, name: "_Wchar", scope: !298, file: !297, line: 613, baseType: !301, size: 32)
!301 = !DIBasicType(name: "long unsigned int", size: 32, encoding: DW_ATE_unsigned)
!302 = !DIDerivedType(tag: DW_TAG_member, name: "_Byte", scope: !298, file: !297, line: 614, baseType: !303, size: 16, offset: 32)
!303 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!304 = !DIDerivedType(tag: DW_TAG_member, name: "_State", scope: !298, file: !297, line: 614, baseType: !303, size: 16, offset: 48)
!305 = !DISubprogram(name: "copy", linkageName: "?copy@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z", scope: !285, file: !40, line: 48, type: !306, scopeLine: 48, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!306 = !DISubroutineType(types: !307)
!307 = !{!32, !107, !308, !108}
!308 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !37)
!309 = !DISubprogram(name: "_Copy_s", linkageName: "?_Copy_s@?$_Char_traits@DH@std@@SAPEADQEAD_KQEBD1@Z", scope: !285, file: !40, line: 71, type: !310, scopeLine: 71, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!310 = !DISubroutineType(types: !311)
!311 = !{!32, !107, !108, !308, !108}
!312 = !DISubprogram(name: "move", linkageName: "?move@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z", scope: !285, file: !40, line: 79, type: !306, scopeLine: 79, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!313 = !DISubprogram(name: "compare", linkageName: "?compare@?$_Char_traits@DH@std@@SAHPEBD0_K@Z", scope: !285, file: !40, line: 131, type: !314, scopeLine: 131, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!314 = !DISubroutineType(types: !315)
!315 = !{!12, !37, !37, !30}
!316 = !DISubprogram(name: "length", linkageName: "?length@?$_Char_traits@DH@std@@SA_KPEBD@Z", scope: !285, file: !40, line: 143, type: !317, scopeLine: 143, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!317 = !DISubroutineType(types: !318)
!318 = !{!30, !37}
!319 = !DISubprogram(name: "find", linkageName: "?find@?$_Char_traits@DH@std@@SAPEBDPEBD_KAEBD@Z", scope: !285, file: !40, line: 154, type: !320, scopeLine: 154, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!320 = !DISubroutineType(types: !321)
!321 = !{!37, !37, !30, !57}
!322 = !DISubprogram(name: "assign", linkageName: "?assign@?$_Char_traits@DH@std@@SAPEADQEAD_KD@Z", scope: !285, file: !40, line: 166, type: !323, scopeLine: 166, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!323 = !DISubroutineType(types: !324)
!324 = !{!32, !107, !30, !38}
!325 = !DISubprogram(name: "assign", linkageName: "?assign@?$_Char_traits@DH@std@@SAXAEADAEBD@Z", scope: !285, file: !40, line: 185, type: !326, scopeLine: 185, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!326 = !DISubroutineType(types: !327)
!327 = !{null, !55, !57}
!328 = !DISubprogram(name: "eq", linkageName: "?eq@?$_Char_traits@DH@std@@SA_NAEBD0@Z", scope: !285, file: !40, line: 196, type: !329, scopeLine: 196, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!329 = !DISubroutineType(types: !330)
!330 = !{!70, !57, !57}
!331 = !DISubprogram(name: "lt", linkageName: "?lt@?$_Char_traits@DH@std@@SA_NAEBD0@Z", scope: !285, file: !40, line: 200, type: !329, scopeLine: 200, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!332 = !DISubprogram(name: "to_char_type", linkageName: "?to_char_type@?$_Char_traits@DH@std@@SADAEBH@Z", scope: !285, file: !40, line: 204, type: !333, scopeLine: 204, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!333 = !DISubroutineType(types: !334)
!334 = !{!33, !335}
!335 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !336, size: 64)
!336 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !288)
!337 = !DISubprogram(name: "to_int_type", linkageName: "?to_int_type@?$_Char_traits@DH@std@@SAHAEBD@Z", scope: !285, file: !40, line: 208, type: !338, scopeLine: 208, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!338 = !DISubroutineType(types: !339)
!339 = !{!288, !57}
!340 = !DISubprogram(name: "eq_int_type", linkageName: "?eq_int_type@?$_Char_traits@DH@std@@SA_NAEBH0@Z", scope: !285, file: !40, line: 212, type: !341, scopeLine: 212, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!341 = !DISubroutineType(types: !342)
!342 = !{!70, !335, !335}
!343 = !DISubprogram(name: "not_eof", linkageName: "?not_eof@?$_Char_traits@DH@std@@SAHAEBH@Z", scope: !285, file: !40, line: 216, type: !344, scopeLine: 216, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!344 = !DISubroutineType(types: !345)
!345 = !{!288, !335}
!346 = !DISubprogram(name: "eof", linkageName: "?eof@?$_Char_traits@DH@std@@SAHXZ", scope: !285, file: !40, line: 220, type: !347, scopeLine: 220, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!347 = !DISubroutineType(types: !348)
!348 = !{!288}
!349 = !{!350, !351}
!350 = !DITemplateTypeParameter(name: "_Elem", type: !33)
!351 = !DITemplateTypeParameter(name: "_Int_type", type: !12)
!352 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Primary_char_traits", scope: !282, file: !40, line: 370, baseType: !285)
!353 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !282, file: !40, line: 373, baseType: !33)
!354 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_type", scope: !282, file: !40, line: 374, baseType: !12)
!355 = !DIDerivedType(tag: DW_TAG_typedef, name: "pos_type", scope: !282, file: !40, line: 375, baseType: !290)
!356 = !DIDerivedType(tag: DW_TAG_typedef, name: "off_type", scope: !282, file: !40, line: 376, baseType: !294)
!357 = !DIDerivedType(tag: DW_TAG_typedef, name: "state_type", scope: !282, file: !40, line: 377, baseType: !358)
!358 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !297, line: 617, baseType: !296)
!359 = !DISubprogram(name: "compare", linkageName: "?compare@?$_Narrow_char_traits@DH@std@@SAHQEBD0_K@Z", scope: !282, file: !40, line: 386, type: !360, scopeLine: 386, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!360 = !DISubroutineType(types: !361)
!361 = !{!12, !308, !308, !108}
!362 = !DISubprogram(name: "length", linkageName: "?length@?$_Narrow_char_traits@DH@std@@SA_KQEBD@Z", scope: !282, file: !40, line: 396, type: !363, scopeLine: 396, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!363 = !DISubroutineType(types: !364)
!364 = !{!30, !308}
!365 = !DISubprogram(name: "find", linkageName: "?find@?$_Narrow_char_traits@DH@std@@SAPEBDQEBD_KAEBD@Z", scope: !282, file: !40, line: 416, type: !366, scopeLine: 416, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!366 = !DISubroutineType(types: !367)
!367 = !{!37, !308, !108, !57}
!368 = !DISubprogram(name: "assign", linkageName: "?assign@?$_Narrow_char_traits@DH@std@@SAPEADQEAD_KD@Z", scope: !282, file: !40, line: 437, type: !323, scopeLine: 437, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!369 = !DISubprogram(name: "assign", linkageName: "?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z", scope: !282, file: !40, line: 449, type: !326, scopeLine: 449, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!370 = !DISubprogram(name: "eq", linkageName: "?eq@?$_Narrow_char_traits@DH@std@@SA_NAEBD0@Z", scope: !282, file: !40, line: 453, type: !329, scopeLine: 453, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!371 = !DISubprogram(name: "lt", linkageName: "?lt@?$_Narrow_char_traits@DH@std@@SA_NAEBD0@Z", scope: !282, file: !40, line: 457, type: !329, scopeLine: 457, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!372 = !DISubprogram(name: "to_char_type", linkageName: "?to_char_type@?$_Narrow_char_traits@DH@std@@SADAEBH@Z", scope: !282, file: !40, line: 461, type: !373, scopeLine: 461, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!373 = !DISubroutineType(types: !374)
!374 = !{!33, !375}
!375 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !376, size: 64)
!376 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !354)
!377 = !DISubprogram(name: "to_int_type", linkageName: "?to_int_type@?$_Narrow_char_traits@DH@std@@SAHAEBD@Z", scope: !282, file: !40, line: 465, type: !378, scopeLine: 465, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!378 = !DISubroutineType(types: !379)
!379 = !{!354, !57}
!380 = !DISubprogram(name: "eq_int_type", linkageName: "?eq_int_type@?$_Narrow_char_traits@DH@std@@SA_NAEBH0@Z", scope: !282, file: !40, line: 469, type: !381, scopeLine: 469, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!381 = !DISubroutineType(types: !382)
!382 = !{!70, !375, !375}
!383 = !DISubprogram(name: "not_eof", linkageName: "?not_eof@?$_Narrow_char_traits@DH@std@@SAHAEBH@Z", scope: !282, file: !40, line: 473, type: !384, scopeLine: 473, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!384 = !DISubroutineType(types: !385)
!385 = !{!354, !375}
!386 = !DISubprogram(name: "eof", linkageName: "?eof@?$_Narrow_char_traits@DH@std@@SAHXZ", scope: !282, file: !40, line: 477, type: !387, scopeLine: 477, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!387 = !DISubroutineType(types: !388)
!388 = !{!354}
!389 = !{!350}
!390 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !39, file: !40, line: 2403, baseType: !48)
!391 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !39, file: !40, line: 2405, baseType: !33)
!392 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !39, file: !40, line: 2406, baseType: !130)
!393 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !39, file: !40, line: 2407, baseType: !131)
!394 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !39, file: !40, line: 2408, baseType: !123)
!395 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !39, file: !40, line: 2409, baseType: !125)
!396 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !39, file: !40, line: 2410, baseType: !397)
!397 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !391, size: 64)
!398 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !39, file: !40, line: 2411, baseType: !399)
!399 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !400, size: 64)
!400 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !391)
!401 = !DIDerivedType(tag: DW_TAG_typedef, name: "iterator", scope: !39, file: !40, line: 2413, baseType: !402)
!402 = !DICompositeType(tag: DW_TAG_class_type, name: "_String_iterator<std::_String_val<std::_Simple_types<char> > >", scope: !2, file: !40, line: 2141, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@")
!403 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_iterator", scope: !39, file: !40, line: 2414, baseType: !404)
!404 = !DICompositeType(tag: DW_TAG_class_type, name: "_String_const_iterator<std::_String_val<std::_Simple_types<char> > >", scope: !2, file: !40, line: 1899, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AV?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@")
!405 = !DIDerivedType(tag: DW_TAG_typedef, name: "reverse_iterator", scope: !39, file: !40, line: 2416, baseType: !406)
!406 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<std::_String_iterator<std::_String_val<std::_Simple_types<char> > > >", scope: !2, file: !407, line: 1636, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AV?$reverse_iterator@V?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@std@@")
!407 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\xutility", directory: "", checksumkind: CSK_MD5, checksum: "a7a009a6fa0cf7dd260ba0ba2140332c")
!408 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reverse_iterator", scope: !39, file: !40, line: 2417, baseType: !409)
!409 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<std::_String_const_iterator<std::_String_val<std::_Simple_types<char> > > >", scope: !2, file: !407, line: 1636, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AV?$reverse_iterator@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@std@@")
!410 = !DIDerivedType(tag: DW_TAG_member, name: "_BUF_SIZE", scope: !39, file: !40, line: 2420, baseType: !411, flags: DIFlagStaticMember, extraData: i64 16)
!411 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !28)
!412 = !DIDerivedType(tag: DW_TAG_member, name: "_ALLOC_MASK", scope: !39, file: !40, line: 2421, baseType: !411, flags: DIFlagStaticMember, extraData: i64 15)
!413 = !DIDerivedType(tag: DW_TAG_member, name: "_Can_memcpy_val", scope: !39, file: !40, line: 2433, baseType: !69, flags: DIFlagStaticMember)
!414 = !DIDerivedType(tag: DW_TAG_member, name: "_Memcpy_val_offset", scope: !39, file: !40, line: 2435, baseType: !108, flags: DIFlagStaticMember)
!415 = !DIDerivedType(tag: DW_TAG_member, name: "_Memcpy_val_size", scope: !39, file: !40, line: 2436, baseType: !108, flags: DIFlagStaticMember)
!416 = !DIDerivedType(tag: DW_TAG_member, name: "npos", scope: !39, file: !40, line: 3012, baseType: !411, flags: DIFlagPublic | DIFlagStaticMember, extraData: i64 -1)
!417 = !DIDerivedType(tag: DW_TAG_member, name: "_Mypair", scope: !39, file: !40, line: 4658, baseType: !418, size: 256)
!418 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "_Compressed_pair<std::allocator<char>,std::_String_val<std::_Simple_types<char> >,1>", scope: !2, file: !3, line: 1361, size: 256, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !419, templateParams: !432, identifier: ".?AV?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@")
!419 = !{!420, !421, !422, !423, !427}
!420 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !418, baseType: !48, extraData: i32 0)
!421 = !DIDerivedType(tag: DW_TAG_member, name: "_Myval2", scope: !418, file: !3, line: 1363, baseType: !186, size: 256, flags: DIFlagPublic)
!422 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Mybase", scope: !418, file: !3, line: 1365, baseType: !48)
!423 = !DISubprogram(name: "_Get_first", linkageName: "?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAAAEAV?$allocator@D@2@XZ", scope: !418, file: !3, line: 1377, type: !424, scopeLine: 1377, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!424 = !DISubroutineType(types: !425)
!425 = !{!103, !426}
!426 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !418, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!427 = !DISubprogram(name: "_Get_first", linkageName: "?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEBAAEBV?$allocator@D@2@XZ", scope: !418, file: !3, line: 1381, type: !428, scopeLine: 1381, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!428 = !DISubroutineType(types: !429)
!429 = !{!98, !430}
!430 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !431, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!431 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !418)
!432 = !{!433, !434, !435}
!433 = !DITemplateTypeParameter(name: "_Ty1", type: !48)
!434 = !DITemplateTypeParameter(name: "_Ty2", type: !186)
!435 = !DITemplateValueParameter(type: !70, value: i8 1)
!436 = !DISubprogram(name: "basic_string", scope: !39, file: !40, line: 2450, type: !437, scopeLine: 2450, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!437 = !DISubroutineType(types: !438)
!438 = !{null, !439, !440}
!439 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!440 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !441, size: 64)
!441 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !39)
!442 = !DISubprogram(name: "basic_string", scope: !39, file: !40, line: 2458, type: !443, scopeLine: 2458, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!443 = !DISubroutineType(types: !444)
!444 = !{null, !439, !440, !98}
!445 = !DISubprogram(name: "basic_string", scope: !39, file: !40, line: 2466, type: !446, scopeLine: 2466, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!446 = !DISubroutineType(types: !447)
!447 = !{null, !439}
!448 = !DISubprogram(name: "basic_string", scope: !39, file: !40, line: 2472, type: !449, scopeLine: 2472, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!449 = !DISubroutineType(types: !450)
!450 = !{null, !439, !98}
!451 = !DISubprogram(name: "basic_string", scope: !39, file: !40, line: 2478, type: !452, scopeLine: 2478, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!452 = !DISubroutineType(types: !453)
!453 = !{null, !439, !440, !454, !98}
!454 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !392)
!455 = !DISubprogram(name: "basic_string", scope: !39, file: !40, line: 2487, type: !456, scopeLine: 2487, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!456 = !DISubroutineType(types: !457)
!457 = !{null, !439, !440, !454, !454, !98}
!458 = !DISubprogram(name: "basic_string", scope: !39, file: !40, line: 2497, type: !459, scopeLine: 2497, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!459 = !DISubroutineType(types: !460)
!460 = !{null, !439, !308, !454}
!461 = !DISubprogram(name: "basic_string", scope: !39, file: !40, line: 2507, type: !462, scopeLine: 2507, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!462 = !DISubroutineType(types: !463)
!463 = !{null, !439, !308, !454, !98}
!464 = !DISubprogram(name: "basic_string", scope: !39, file: !40, line: 2517, type: !465, scopeLine: 2517, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!465 = !DISubroutineType(types: !466)
!466 = !{null, !439, !308}
!467 = !DISubprogram(name: "basic_string", scope: !39, file: !40, line: 2528, type: !468, scopeLine: 2528, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!468 = !DISubroutineType(types: !469)
!469 = !{null, !439, !308, !98}
!470 = !DISubprogram(name: "basic_string", scope: !39, file: !40, line: 2537, type: !471, scopeLine: 2537, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!471 = !DISubroutineType(types: !472)
!472 = !{null, !439, !454, !38}
!473 = !DISubprogram(name: "basic_string", scope: !39, file: !40, line: 2550, type: !474, scopeLine: 2550, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!474 = !DISubroutineType(types: !475)
!475 = !{null, !439, !454, !38, !98}
!476 = !DISubprogram(name: "_Construct", linkageName: "?_Construct@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXQEAD0Urandom_access_iterator_tag@2@@Z", scope: !39, file: !40, line: 2589, type: !477, scopeLine: 2589, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!477 = !DISubroutineType(types: !478)
!478 = !{null, !439, !107, !107, !479}
!479 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "random_access_iterator_tag", scope: !2, file: !407, line: 291, size: 8, flags: DIFlagTypePassByValue, elements: !480, identifier: ".?AUrandom_access_iterator_tag@std@@")
!480 = !{!481}
!481 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !479, baseType: !482, extraData: i32 0)
!482 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bidirectional_iterator_tag", scope: !2, file: !407, line: 289, size: 8, flags: DIFlagTypePassByValue, elements: !483, identifier: ".?AUbidirectional_iterator_tag@std@@")
!483 = !{!484}
!484 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !482, baseType: !485, extraData: i32 0)
!485 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "forward_iterator_tag", scope: !2, file: !407, line: 287, size: 8, flags: DIFlagTypePassByValue, elements: !486, identifier: ".?AUforward_iterator_tag@std@@")
!486 = !{!487}
!487 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !485, baseType: !488, extraData: i32 0)
!488 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "input_iterator_tag", scope: !2, file: !407, line: 283, size: 8, flags: DIFlagTypePassByValue, elements: !6, identifier: ".?AUinput_iterator_tag@std@@")
!489 = !DISubprogram(name: "_Construct", linkageName: "?_Construct@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXQEBD0Urandom_access_iterator_tag@2@@Z", scope: !39, file: !40, line: 2596, type: !490, scopeLine: 2596, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!490 = !DISubroutineType(types: !491)
!491 = !{null, !439, !308, !308, !479}
!492 = !DISubprogram(name: "basic_string", scope: !39, file: !40, line: 2604, type: !493, scopeLine: 2604, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!493 = !DISubroutineType(types: !494)
!494 = !{null, !439, !495}
!495 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !39, size: 64)
!496 = !DISubprogram(name: "basic_string", scope: !39, file: !40, line: 2610, type: !497, scopeLine: 2610, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!497 = !DISubroutineType(types: !498)
!498 = !{null, !439, !495, !98}
!499 = !DISubprogram(name: "basic_string", scope: !39, file: !40, line: 2627, type: !500, scopeLine: 2627, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!500 = !DISubroutineType(types: !501)
!501 = !{null, !439, !502, !440, !308, !454, !308, !454}
!502 = !DICompositeType(tag: DW_TAG_structure_type, name: "_String_constructor_concat_tag", scope: !2, file: !40, line: 2363, size: 8, flags: DIFlagFwdDecl, identifier: ".?AU_String_constructor_concat_tag@std@@")
!503 = !DISubprogram(name: "basic_string", scope: !39, file: !40, line: 2671, type: !504, scopeLine: 2671, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!504 = !DISubroutineType(types: !505)
!505 = !{null, !439, !502, !506, !506}
!506 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !39, size: 64)
!507 = !DISubprogram(name: "_Move_assign", linkageName: "?_Move_assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEAV12@U_Equal_allocators@2@@Z", scope: !39, file: !40, line: 2775, type: !508, scopeLine: 2775, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!508 = !DISubroutineType(types: !509)
!509 = !{null, !439, !506, !510}
!510 = !DICompositeType(tag: DW_TAG_structure_type, name: "_Equal_allocators", scope: !2, file: !3, line: 746, size: 8, flags: DIFlagFwdDecl, identifier: ".?AU_Equal_allocators@std@@")
!511 = !DISubprogram(name: "_Move_assign", linkageName: "?_Move_assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEAV12@U?$integral_constant@_N$00@2@@Z", scope: !39, file: !40, line: 2781, type: !512, scopeLine: 2781, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!512 = !DISubroutineType(types: !513)
!513 = !{null, !439, !506, !514}
!514 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Propagate_allocators", scope: !2, file: !3, line: 747, baseType: !63)
!515 = !DISubprogram(name: "_Move_assign", linkageName: "?_Move_assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEAV12@U?$integral_constant@_N$0A@@2@@Z", scope: !39, file: !40, line: 2794, type: !516, scopeLine: 2794, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!516 = !DISubroutineType(types: !517)
!517 = !{null, !439, !506, !518}
!518 = !DIDerivedType(tag: DW_TAG_typedef, name: "_No_propagate_allocators", scope: !2, file: !3, line: 748, baseType: !133)
!519 = !DISubprogram(name: "operator=", linkageName: "??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@$$QEAV01@@Z", scope: !39, file: !40, line: 2848, type: !520, scopeLine: 2848, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!520 = !DISubroutineType(types: !521)
!521 = !{!506, !439, !495}
!522 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@$$QEAV12@@Z", scope: !39, file: !40, line: 2857, type: !520, scopeLine: 2857, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!523 = !DISubprogram(name: "_Memcpy_val_from", linkageName: "?_Memcpy_val_from@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@@Z", scope: !39, file: !40, line: 2863, type: !437, scopeLine: 2863, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!524 = !DISubprogram(name: "_Take_contents", linkageName: "?_Take_contents@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEAV12@@Z", scope: !39, file: !40, line: 2872, type: !525, scopeLine: 2872, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!525 = !DISubroutineType(types: !526)
!526 = !{null, !439, !506}
!527 = !DISubprogram(name: "_Construct_lv_contents", linkageName: "?_Construct_lv_contents@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@@Z", scope: !39, file: !40, line: 2915, type: !437, scopeLine: 2915, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!528 = !DISubprogram(name: "basic_string", scope: !39, file: !40, line: 2956, type: !529, scopeLine: 2956, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!529 = !DISubroutineType(types: !530)
!530 = !{null, !439, !531, !98}
!531 = !DICompositeType(tag: DW_TAG_class_type, name: "initializer_list<char>", scope: !2, file: !532, line: 23, size: 128, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AV?$initializer_list@D@std@@")
!532 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\initializer_list", directory: "", checksumkind: CSK_MD5, checksum: "614c28410587cda93b19bfa2da486ff6")
!533 = !DISubprogram(name: "operator=", linkageName: "??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@V?$initializer_list@D@1@@Z", scope: !39, file: !40, line: 2965, type: !534, scopeLine: 2965, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!534 = !DISubroutineType(types: !535)
!535 = !{!506, !439, !531}
!536 = !DISubprogram(name: "operator+=", linkageName: "??Y?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@V?$initializer_list@D@1@@Z", scope: !39, file: !40, line: 2969, type: !534, scopeLine: 2969, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!537 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$initializer_list@D@2@@Z", scope: !39, file: !40, line: 2973, type: !534, scopeLine: 2973, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!538 = !DISubprogram(name: "append", linkageName: "?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$initializer_list@D@2@@Z", scope: !39, file: !40, line: 2977, type: !534, scopeLine: 2977, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!539 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$initializer_list@D@2@@Z", scope: !39, file: !40, line: 2981, type: !540, scopeLine: 2981, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!540 = !DISubroutineType(types: !541)
!541 = !{!401, !439, !542, !543}
!542 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !403)
!543 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !531)
!544 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0V?$initializer_list@D@2@@Z", scope: !39, file: !40, line: 2990, type: !545, scopeLine: 2990, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!545 = !DISubroutineType(types: !546)
!546 = !{!506, !439, !542, !542, !543}
!547 = !DISubprogram(name: "~basic_string", scope: !39, file: !40, line: 3002, type: !446, scopeLine: 3002, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!548 = !DISubprogram(name: "_Copy_assign_val_from_small", linkageName: "?_Copy_assign_val_from_small@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@@Z", scope: !39, file: !40, line: 3015, type: !437, scopeLine: 3015, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!549 = !DISubprogram(name: "_Copy_assign", linkageName: "?_Copy_assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@U?$integral_constant@_N$0A@@2@@Z", scope: !39, file: !40, line: 3033, type: !550, scopeLine: 3033, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!550 = !DISubroutineType(types: !551)
!551 = !{null, !439, !440, !133}
!552 = !DISubprogram(name: "_Copy_assign", linkageName: "?_Copy_assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@U?$integral_constant@_N$00@2@@Z", scope: !39, file: !40, line: 3038, type: !553, scopeLine: 3038, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!553 = !DISubroutineType(types: !554)
!554 = !{null, !439, !440, !63}
!555 = !DISubprogram(name: "operator=", linkageName: "??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@AEBV01@@Z", scope: !39, file: !40, line: 3076, type: !556, scopeLine: 3076, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!556 = !DISubroutineType(types: !557)
!557 = !{!506, !439, !440}
!558 = !DISubprogram(name: "operator=", linkageName: "??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@QEBD@Z", scope: !39, file: !40, line: 3091, type: !559, scopeLine: 3091, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!559 = !DISubroutineType(types: !560)
!560 = !{!506, !439, !308}
!561 = !DISubprogram(name: "operator=", linkageName: "??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@D@Z", scope: !39, file: !40, line: 3095, type: !562, scopeLine: 3095, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!562 = !DISubroutineType(types: !563)
!563 = !{!506, !439, !38}
!564 = !DISubprogram(name: "operator+=", linkageName: "??Y?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@AEBV01@@Z", scope: !39, file: !40, line: 3103, type: !556, scopeLine: 3103, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!565 = !DISubprogram(name: "operator+=", linkageName: "??Y?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@QEBD@Z", scope: !39, file: !40, line: 3114, type: !559, scopeLine: 3114, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!566 = !DISubprogram(name: "operator+=", linkageName: "??Y?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@D@Z", scope: !39, file: !40, line: 3118, type: !567, scopeLine: 3118, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!567 = !DISubroutineType(types: !568)
!568 = !{!506, !439, !33}
!569 = !DISubprogram(name: "append", linkageName: "?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@AEBV12@@Z", scope: !39, file: !40, line: 3123, type: !556, scopeLine: 3123, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!570 = !DISubprogram(name: "append", linkageName: "?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@AEBV12@_K_K@Z", scope: !39, file: !40, line: 3127, type: !571, scopeLine: 3127, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!571 = !DISubroutineType(types: !572)
!572 = !{!506, !439, !440, !454, !392}
!573 = !DISubprogram(name: "append", linkageName: "?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD_K@Z", scope: !39, file: !40, line: 3151, type: !574, scopeLine: 3151, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!574 = !DISubroutineType(types: !575)
!575 = !{!506, !439, !308, !454}
!576 = !DISubprogram(name: "append", linkageName: "?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD@Z", scope: !39, file: !40, line: 3174, type: !559, scopeLine: 3174, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!577 = !DISubprogram(name: "append", linkageName: "?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KD@Z", scope: !39, file: !40, line: 3178, type: !578, scopeLine: 3178, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!578 = !DISubroutineType(types: !579)
!579 = !{!506, !439, !454, !38}
!580 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@AEBV12@@Z", scope: !39, file: !40, line: 3214, type: !556, scopeLine: 3214, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!581 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@AEBV12@_K_K@Z", scope: !39, file: !40, line: 3219, type: !571, scopeLine: 3219, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!582 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD_K@Z", scope: !39, file: !40, line: 3243, type: !574, scopeLine: 3243, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!583 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD@Z", scope: !39, file: !40, line: 3263, type: !559, scopeLine: 3263, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!584 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KD@Z", scope: !39, file: !40, line: 3267, type: !578, scopeLine: 3267, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!585 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KAEBV12@@Z", scope: !39, file: !40, line: 3305, type: !586, scopeLine: 3305, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!586 = !DISubroutineType(types: !587)
!587 = !{!506, !439, !454, !440}
!588 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KAEBV12@0_K@Z", scope: !39, file: !40, line: 3310, type: !589, scopeLine: 3310, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!589 = !DISubroutineType(types: !590)
!590 = !{!506, !439, !454, !440, !454, !392}
!591 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KQEBD0@Z", scope: !39, file: !40, line: 3335, type: !592, scopeLine: 3335, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!592 = !DISubroutineType(types: !593)
!593 = !{!506, !439, !454, !308, !454}
!594 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KQEBD@Z", scope: !39, file: !40, line: 3383, type: !595, scopeLine: 3383, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!595 = !DISubroutineType(types: !596)
!596 = !{!506, !439, !454, !308}
!597 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K0D@Z", scope: !39, file: !40, line: 3388, type: !598, scopeLine: 3388, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!598 = !DISubroutineType(types: !599)
!599 = !{!506, !439, !454, !454, !38}
!600 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@D@Z", scope: !39, file: !40, line: 3413, type: !601, scopeLine: 3413, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!601 = !DISubroutineType(types: !602)
!602 = !{!401, !439, !542, !38}
!603 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@_KD@Z", scope: !39, file: !40, line: 3422, type: !604, scopeLine: 3422, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!604 = !DISubroutineType(types: !605)
!605 = !{!401, !439, !542, !454, !38}
!606 = !DISubprogram(name: "erase", linkageName: "?erase@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K@Z", scope: !39, file: !40, line: 3453, type: !607, scopeLine: 3453, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!607 = !DISubroutineType(types: !608)
!608 = !{!506, !439, !454}
!609 = !DISubprogram(name: "_Erase_noexcept", linkageName: "?_Erase_noexcept@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV12@_K_K@Z", scope: !39, file: !40, line: 3460, type: !610, scopeLine: 3460, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!610 = !DISubroutineType(types: !611)
!611 = !{!506, !439, !454, !392}
!612 = !DISubprogram(name: "erase", linkageName: "?erase@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K0@Z", scope: !39, file: !40, line: 3472, type: !613, scopeLine: 3472, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!613 = !DISubroutineType(types: !614)
!614 = !{!506, !439, !454, !454}
!615 = !DISubprogram(name: "erase", linkageName: "?erase@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@@Z", scope: !39, file: !40, line: 3478, type: !616, scopeLine: 3478, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!616 = !DISubroutineType(types: !617)
!617 = !{!401, !439, !542}
!618 = !DISubprogram(name: "erase", linkageName: "?erase@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0@Z", scope: !39, file: !40, line: 3487, type: !619, scopeLine: 3487, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!619 = !DISubroutineType(types: !620)
!620 = !{!401, !439, !542, !542}
!621 = !DISubprogram(name: "clear", linkageName: "?clear@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXXZ", scope: !39, file: !40, line: 3498, type: !446, scopeLine: 3498, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!622 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K0AEBV12@@Z", scope: !39, file: !40, line: 3502, type: !623, scopeLine: 3502, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!623 = !DISubroutineType(types: !624)
!624 = !{!506, !439, !454, !454, !440}
!625 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K_KAEBV12@01@Z", scope: !39, file: !40, line: 3508, type: !626, scopeLine: 3508, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!626 = !DISubroutineType(types: !627)
!627 = !{!506, !439, !454, !392, !440, !454, !392}
!628 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K_KQEBD0@Z", scope: !39, file: !40, line: 3534, type: !629, scopeLine: 3534, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!629 = !DISubroutineType(types: !630)
!630 = !{!506, !439, !454, !392, !308, !454}
!631 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K0QEBD@Z", scope: !39, file: !40, line: 3602, type: !632, scopeLine: 3602, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!632 = !DISubroutineType(types: !633)
!633 = !{!506, !439, !454, !454, !308}
!634 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K_K0D@Z", scope: !39, file: !40, line: 3608, type: !635, scopeLine: 3608, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!635 = !DISubroutineType(types: !636)
!636 = !{!506, !439, !454, !392, !454, !38}
!637 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0AEBV12@@Z", scope: !39, file: !40, line: 3641, type: !638, scopeLine: 3641, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!638 = !DISubroutineType(types: !639)
!639 = !{!506, !439, !542, !542, !440}
!640 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0QEBD_K@Z", scope: !39, file: !40, line: 3666, type: !641, scopeLine: 3666, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!641 = !DISubroutineType(types: !642)
!642 = !{!506, !439, !542, !542, !308, !454}
!643 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0QEBD@Z", scope: !39, file: !40, line: 3677, type: !644, scopeLine: 3677, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!644 = !DISubroutineType(types: !645)
!645 = !{!506, !439, !542, !542, !308}
!646 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0_KD@Z", scope: !39, file: !40, line: 3688, type: !647, scopeLine: 3688, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!647 = !DISubroutineType(types: !648)
!648 = !{!506, !439, !542, !542, !454, !38}
!649 = !DISubprogram(name: "begin", linkageName: "?begin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ", scope: !39, file: !40, line: 3720, type: !650, scopeLine: 3720, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!650 = !DISubroutineType(types: !651)
!651 = !{!401, !439}
!652 = !DISubprogram(name: "begin", linkageName: "?begin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ", scope: !39, file: !40, line: 3724, type: !653, scopeLine: 3724, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!653 = !DISubroutineType(types: !654)
!654 = !{!403, !655}
!655 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !441, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!656 = !DISubprogram(name: "end", linkageName: "?end@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ", scope: !39, file: !40, line: 3728, type: !650, scopeLine: 3728, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!657 = !DISubprogram(name: "end", linkageName: "?end@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ", scope: !39, file: !40, line: 3734, type: !653, scopeLine: 3734, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!658 = !DISubprogram(name: "_Unchecked_begin", linkageName: "?_Unchecked_begin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAPEADXZ", scope: !39, file: !40, line: 3740, type: !659, scopeLine: 3740, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!659 = !DISubroutineType(types: !660)
!660 = !{!32, !439}
!661 = !DISubprogram(name: "_Unchecked_begin", linkageName: "?_Unchecked_begin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAPEBDXZ", scope: !39, file: !40, line: 3744, type: !662, scopeLine: 3744, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!662 = !DISubroutineType(types: !663)
!663 = !{!37, !655}
!664 = !DISubprogram(name: "_Unchecked_end", linkageName: "?_Unchecked_end@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAPEADXZ", scope: !39, file: !40, line: 3748, type: !659, scopeLine: 3748, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!665 = !DISubprogram(name: "_Unchecked_end", linkageName: "?_Unchecked_end@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAPEBDXZ", scope: !39, file: !40, line: 3752, type: !662, scopeLine: 3752, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!666 = !DISubprogram(name: "rbegin", linkageName: "?rbegin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$reverse_iterator@V?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ", scope: !39, file: !40, line: 3756, type: !667, scopeLine: 3756, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!667 = !DISubroutineType(types: !668)
!668 = !{!405, !439}
!669 = !DISubprogram(name: "rbegin", linkageName: "?rbegin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$reverse_iterator@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ", scope: !39, file: !40, line: 3760, type: !670, scopeLine: 3760, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!670 = !DISubroutineType(types: !671)
!671 = !{!408, !655}
!672 = !DISubprogram(name: "rend", linkageName: "?rend@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$reverse_iterator@V?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ", scope: !39, file: !40, line: 3764, type: !667, scopeLine: 3764, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!673 = !DISubprogram(name: "rend", linkageName: "?rend@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$reverse_iterator@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ", scope: !39, file: !40, line: 3768, type: !670, scopeLine: 3768, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!674 = !DISubprogram(name: "cbegin", linkageName: "?cbegin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ", scope: !39, file: !40, line: 3772, type: !653, scopeLine: 3772, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!675 = !DISubprogram(name: "cend", linkageName: "?cend@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ", scope: !39, file: !40, line: 3776, type: !653, scopeLine: 3776, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!676 = !DISubprogram(name: "crbegin", linkageName: "?crbegin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$reverse_iterator@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ", scope: !39, file: !40, line: 3780, type: !670, scopeLine: 3780, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!677 = !DISubprogram(name: "crend", linkageName: "?crend@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$reverse_iterator@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ", scope: !39, file: !40, line: 3784, type: !670, scopeLine: 3784, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!678 = !DISubprogram(name: "shrink_to_fit", linkageName: "?shrink_to_fit@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXXZ", scope: !39, file: !40, line: 3788, type: !446, scopeLine: 3788, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!679 = !DISubprogram(name: "at", linkageName: "?at@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAD_K@Z", scope: !39, file: !40, line: 3829, type: !680, scopeLine: 3829, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!680 = !DISubroutineType(types: !681)
!681 = !{!396, !439, !454}
!682 = !DISubprogram(name: "at", linkageName: "?at@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAAEBD_K@Z", scope: !39, file: !40, line: 3834, type: !683, scopeLine: 3834, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!683 = !DISubroutineType(types: !684)
!684 = !{!398, !655, !454}
!685 = !DISubprogram(name: "operator[]", linkageName: "??A?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAD_K@Z", scope: !39, file: !40, line: 3839, type: !680, scopeLine: 3839, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!686 = !DISubprogram(name: "operator[]", linkageName: "??A?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAAEBD_K@Z", scope: !39, file: !40, line: 3846, type: !683, scopeLine: 3846, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!687 = !DISubprogram(name: "push_back", linkageName: "?push_back@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXD@Z", scope: !39, file: !40, line: 3861, type: !688, scopeLine: 3861, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!688 = !DISubroutineType(types: !689)
!689 = !{null, !439, !38}
!690 = !DISubprogram(name: "pop_back", linkageName: "?pop_back@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXXZ", scope: !39, file: !40, line: 3881, type: !446, scopeLine: 3881, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!691 = !DISubprogram(name: "front", linkageName: "?front@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEADXZ", scope: !39, file: !40, line: 3889, type: !692, scopeLine: 3889, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!692 = !DISubroutineType(types: !693)
!693 = !{!396, !439}
!694 = !DISubprogram(name: "front", linkageName: "?front@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAAEBDXZ", scope: !39, file: !40, line: 3897, type: !695, scopeLine: 3897, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!695 = !DISubroutineType(types: !696)
!696 = !{!398, !655}
!697 = !DISubprogram(name: "back", linkageName: "?back@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEADXZ", scope: !39, file: !40, line: 3905, type: !692, scopeLine: 3905, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!698 = !DISubprogram(name: "back", linkageName: "?back@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAAEBDXZ", scope: !39, file: !40, line: 3913, type: !695, scopeLine: 3913, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!699 = !DISubprogram(name: "c_str", linkageName: "?c_str@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAPEBDXZ", scope: !39, file: !40, line: 3921, type: !662, scopeLine: 3921, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!700 = !DISubprogram(name: "data", linkageName: "?data@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAPEBDXZ", scope: !39, file: !40, line: 3925, type: !662, scopeLine: 3925, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!701 = !DISubprogram(name: "length", linkageName: "?length@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ", scope: !39, file: !40, line: 3935, type: !702, scopeLine: 3935, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!702 = !DISubroutineType(types: !703)
!703 = !{!392, !655}
!704 = !DISubprogram(name: "size", linkageName: "?size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ", scope: !39, file: !40, line: 3939, type: !702, scopeLine: 3939, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!705 = !DISubprogram(name: "max_size", linkageName: "?max_size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ", scope: !39, file: !40, line: 3943, type: !702, scopeLine: 3943, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!706 = !DISubprogram(name: "resize", linkageName: "?resize@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAX_KD@Z", scope: !39, file: !40, line: 3952, type: !471, scopeLine: 3952, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!707 = !DISubprogram(name: "capacity", linkageName: "?capacity@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ", scope: !39, file: !40, line: 3962, type: !702, scopeLine: 3962, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!708 = !DISubprogram(name: "reserve", linkageName: "?reserve@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAX_K@Z", scope: !39, file: !40, line: 3988, type: !709, scopeLine: 3988, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!709 = !DISubroutineType(types: !710)
!710 = !{null, !439, !454}
!711 = !DISubprogram(name: "empty", linkageName: "?empty@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_NXZ", scope: !39, file: !40, line: 4018, type: !712, scopeLine: 4018, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!712 = !DISubroutineType(types: !713)
!713 = !{!70, !655}
!714 = !DISubprogram(name: "copy", linkageName: "?copy@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEAD_K_K@Z", scope: !39, file: !40, line: 4022, type: !715, scopeLine: 4022, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!715 = !DISubroutineType(types: !716)
!716 = !{!392, !655, !107, !392, !454}
!717 = !DISubprogram(name: "_Copy_s", linkageName: "?_Copy_s@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEAD_K_K1@Z", scope: !39, file: !40, line: 4032, type: !718, scopeLine: 4032, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!718 = !DISubroutineType(types: !719)
!719 = !{!392, !655, !107, !454, !392, !454}
!720 = !DISubprogram(name: "_Swap_bx_large_with_small", linkageName: "?_Swap_bx_large_with_small@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXAEAV?$_String_val@U?$_Simple_types@D@std@@@2@0@Z", scope: !39, file: !40, line: 4041, type: !721, scopeLine: 4041, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!721 = !DISubroutineType(types: !722)
!722 = !{null, !439, !723, !723}
!723 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !185, size: 64)
!724 = !DISubprogram(name: "_Swap_data", linkageName: "?_Swap_data@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXAEAV12@@Z", scope: !39, file: !40, line: 4051, type: !525, scopeLine: 4051, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!725 = !DISubprogram(name: "swap", linkageName: "?swap@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXAEAV12@@Z", scope: !39, file: !40, line: 4095, type: !525, scopeLine: 4095, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!726 = !DISubprogram(name: "find", linkageName: "?find@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z", scope: !39, file: !40, line: 4129, type: !727, scopeLine: 4129, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!727 = !DISubroutineType(types: !728)
!728 = !{!392, !655, !440, !454}
!729 = !DISubprogram(name: "find", linkageName: "?find@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z", scope: !39, file: !40, line: 4136, type: !730, scopeLine: 4136, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!730 = !DISubroutineType(types: !731)
!731 = !{!392, !655, !308, !454, !454}
!732 = !DISubprogram(name: "find", linkageName: "?find@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z", scope: !39, file: !40, line: 4143, type: !733, scopeLine: 4143, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!733 = !DISubroutineType(types: !734)
!734 = !{!392, !655, !308, !454}
!735 = !DISubprogram(name: "find", linkageName: "?find@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z", scope: !39, file: !40, line: 4150, type: !736, scopeLine: 4150, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!736 = !DISubroutineType(types: !737)
!737 = !{!392, !655, !38, !454}
!738 = !DISubprogram(name: "rfind", linkageName: "?rfind@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z", scope: !39, file: !40, line: 4167, type: !727, scopeLine: 4167, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!739 = !DISubprogram(name: "rfind", linkageName: "?rfind@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z", scope: !39, file: !40, line: 4174, type: !730, scopeLine: 4174, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!740 = !DISubprogram(name: "rfind", linkageName: "?rfind@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z", scope: !39, file: !40, line: 4181, type: !733, scopeLine: 4181, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!741 = !DISubprogram(name: "rfind", linkageName: "?rfind@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z", scope: !39, file: !40, line: 4188, type: !736, scopeLine: 4188, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!742 = !DISubprogram(name: "find_first_of", linkageName: "?find_first_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z", scope: !39, file: !40, line: 4206, type: !727, scopeLine: 4206, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!743 = !DISubprogram(name: "find_first_of", linkageName: "?find_first_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z", scope: !39, file: !40, line: 4214, type: !730, scopeLine: 4214, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!744 = !DISubprogram(name: "find_first_of", linkageName: "?find_first_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z", scope: !39, file: !40, line: 4221, type: !733, scopeLine: 4221, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!745 = !DISubprogram(name: "find_first_of", linkageName: "?find_first_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z", scope: !39, file: !40, line: 4228, type: !736, scopeLine: 4228, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!746 = !DISubprogram(name: "find_last_of", linkageName: "?find_last_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z", scope: !39, file: !40, line: 4246, type: !747, scopeLine: 4246, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!747 = !DISubroutineType(types: !748)
!748 = !{!392, !655, !440, !392}
!749 = !DISubprogram(name: "find_last_of", linkageName: "?find_last_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z", scope: !39, file: !40, line: 4254, type: !730, scopeLine: 4254, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!750 = !DISubprogram(name: "find_last_of", linkageName: "?find_last_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z", scope: !39, file: !40, line: 4261, type: !733, scopeLine: 4261, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!751 = !DISubprogram(name: "find_last_of", linkageName: "?find_last_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z", scope: !39, file: !40, line: 4268, type: !736, scopeLine: 4268, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!752 = !DISubprogram(name: "find_first_not_of", linkageName: "?find_first_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z", scope: !39, file: !40, line: 4287, type: !727, scopeLine: 4287, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!753 = !DISubprogram(name: "find_first_not_of", linkageName: "?find_first_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z", scope: !39, file: !40, line: 4295, type: !730, scopeLine: 4295, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!754 = !DISubprogram(name: "find_first_not_of", linkageName: "?find_first_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z", scope: !39, file: !40, line: 4302, type: !755, scopeLine: 4302, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!755 = !DISubroutineType(types: !756)
!756 = !{!392, !655, !308, !392}
!757 = !DISubprogram(name: "find_first_not_of", linkageName: "?find_first_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z", scope: !39, file: !40, line: 4309, type: !736, scopeLine: 4309, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!758 = !DISubprogram(name: "find_last_not_of", linkageName: "?find_last_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z", scope: !39, file: !40, line: 4328, type: !727, scopeLine: 4328, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!759 = !DISubprogram(name: "find_last_not_of", linkageName: "?find_last_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z", scope: !39, file: !40, line: 4336, type: !730, scopeLine: 4336, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!760 = !DISubprogram(name: "find_last_not_of", linkageName: "?find_last_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z", scope: !39, file: !40, line: 4343, type: !733, scopeLine: 4343, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!761 = !DISubprogram(name: "find_last_not_of", linkageName: "?find_last_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z", scope: !39, file: !40, line: 4350, type: !736, scopeLine: 4350, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!762 = !DISubprogram(name: "substr", linkageName: "?substr@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV12@_K0@Z", scope: !39, file: !40, line: 4364, type: !763, scopeLine: 4364, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!763 = !DISubroutineType(types: !764)
!764 = !{!39, !655, !454, !454}
!765 = !DISubprogram(name: "_Equal", linkageName: "?_Equal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_NAEBV12@@Z", scope: !39, file: !40, line: 4370, type: !766, scopeLine: 4370, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!766 = !DISubroutineType(types: !767)
!767 = !{!70, !655, !440}
!768 = !DISubprogram(name: "_Equal", linkageName: "?_Equal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_NQEBD@Z", scope: !39, file: !40, line: 4376, type: !769, scopeLine: 4376, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!769 = !DISubroutineType(types: !770)
!770 = !{!70, !655, !308}
!771 = !DISubprogram(name: "compare", linkageName: "?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAHAEBV12@@Z", scope: !39, file: !40, line: 4412, type: !772, scopeLine: 4412, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!772 = !DISubroutineType(types: !773)
!773 = !{!12, !655, !440}
!774 = !DISubprogram(name: "compare", linkageName: "?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAH_K0AEBV12@@Z", scope: !39, file: !40, line: 4418, type: !775, scopeLine: 4418, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!775 = !DISubroutineType(types: !776)
!776 = !{!12, !655, !392, !392, !440}
!777 = !DISubprogram(name: "compare", linkageName: "?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAH_K0AEBV12@00@Z", scope: !39, file: !40, line: 4425, type: !778, scopeLine: 4425, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!778 = !DISubroutineType(types: !779)
!779 = !{!12, !655, !454, !454, !440, !454, !454}
!780 = !DISubprogram(name: "compare", linkageName: "?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAHQEBD@Z", scope: !39, file: !40, line: 4434, type: !781, scopeLine: 4434, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!781 = !DISubroutineType(types: !782)
!782 = !{!12, !655, !308}
!783 = !DISubprogram(name: "compare", linkageName: "?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAH_K0QEBD@Z", scope: !39, file: !40, line: 4439, type: !784, scopeLine: 4439, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!784 = !DISubroutineType(types: !785)
!785 = !{!12, !655, !454, !454, !308}
!786 = !DISubprogram(name: "compare", linkageName: "?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAH_K0QEBD0@Z", scope: !39, file: !40, line: 4447, type: !787, scopeLine: 4447, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!787 = !DISubroutineType(types: !788)
!788 = !{!12, !655, !454, !454, !308, !454}
!789 = !DISubprogram(name: "get_allocator", linkageName: "?get_allocator@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$allocator@D@2@XZ", scope: !39, file: !40, line: 4481, type: !790, scopeLine: 4481, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!790 = !DISubroutineType(types: !791)
!791 = !{!390, !655}
!792 = !DISubprogram(name: "_Calculate_growth", linkageName: "?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@CA_K_K00@Z", scope: !39, file: !40, line: 4486, type: !793, scopeLine: 4486, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!793 = !DISubroutineType(types: !794)
!794 = !{!392, !454, !454, !454}
!795 = !DISubprogram(name: "_Calculate_growth", linkageName: "?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBA_K_K@Z", scope: !39, file: !40, line: 4500, type: !796, scopeLine: 4500, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!796 = !DISubroutineType(types: !797)
!797 = !{!392, !655, !454}
!798 = !DISubprogram(name: "_Become_small", linkageName: "?_Become_small@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ", scope: !39, file: !40, line: 4575, type: !446, scopeLine: 4575, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!799 = !DISubprogram(name: "_Eos", linkageName: "?_Eos@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAX_K@Z", scope: !39, file: !40, line: 4590, type: !709, scopeLine: 4590, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!800 = !DISubprogram(name: "_Tidy_init", linkageName: "?_Tidy_init@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ", scope: !39, file: !40, line: 4594, type: !446, scopeLine: 4594, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!801 = !DISubprogram(name: "_Tidy_deallocate", linkageName: "?_Tidy_deallocate@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ", scope: !39, file: !40, line: 4616, type: !446, scopeLine: 4616, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!802 = !DISubprogram(name: "_Orphan_all", linkageName: "?_Orphan_all@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXXZ", scope: !39, file: !40, line: 4641, type: !446, scopeLine: 4641, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!803 = !DISubprogram(name: "_Swap_proxy_and_iterators", linkageName: "?_Swap_proxy_and_iterators@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEAV12@@Z", scope: !39, file: !40, line: 4646, type: !525, scopeLine: 4646, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!804 = !DISubprogram(name: "_Getal", linkageName: "?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV?$allocator@D@2@XZ", scope: !39, file: !40, line: 4650, type: !805, scopeLine: 4650, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!805 = !DISubroutineType(types: !806)
!806 = !{!807, !439}
!807 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !42, size: 64)
!808 = !DISubprogram(name: "_Getal", linkageName: "?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBAAEBV?$allocator@D@2@XZ", scope: !39, file: !40, line: 4654, type: !809, scopeLine: 4654, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!809 = !DISubroutineType(types: !810)
!810 = !{!811, !655}
!811 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !812, size: 64)
!812 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !42)
!813 = !{!350, !814, !171}
!814 = !DITemplateTypeParameter(name: "_Traits", type: !279)
!815 = !{!816, !818, !0, !820}
!816 = !DIGlobalVariableExpression(var: !817, expr: !DIExpression(DW_OP_constu, 4096, DW_OP_stack_value))
!817 = distinct !DIGlobalVariable(name: "_Big_allocation_threshold", scope: !2, file: !3, line: 113, type: !108, isLocal: true, isDefinition: true)
!818 = !DIGlobalVariableExpression(var: !819, expr: !DIExpression(DW_OP_constu, 39, DW_OP_stack_value))
!819 = distinct !DIGlobalVariable(name: "_Non_user_size", scope: !2, file: !3, line: 123, type: !108, isLocal: true, isDefinition: true)
!820 = !DIGlobalVariableExpression(var: !821, expr: !DIExpression(DW_OP_constu, 32, DW_OP_stack_value))
!821 = distinct !DIGlobalVariable(name: "_Big_allocation_alignment", scope: !2, file: !3, line: 114, type: !108, isLocal: true, isDefinition: true)
!822 = !{!823, !828, !829, !832, !835, !836, !841, !845, !847, !849, !851, !853, !858, !862, !866, !871, !875, !879, !883, !887, !889, !894, !900, !904, !908, !910, !914, !918, !920, !924, !928, !932, !934, !938, !940, !942, !946, !950, !954, !958, !962, !966, !968, !973, !977, !981, !986, !990, !992, !994, !998, !1000, !1005, !1010, !1014, !1016, !1018, !1023, !1028, !1030, !1032, !1034, !1038, !1042, !1046, !1050, !1054, !1056, !1060, !1062, !1064, !1066, !1068, !1072, !1074, !1075, !1076, !1079, !1081, !1086, !1090, !1096, !1100, !1106, !1110, !1115, !1117, !1119, !1123, !1128, !1132, !1137, !1143, !1145, !1149, !1154, !1158, !1162, !1166, !1170, !1174, !1178, !1182, !1184, !1189, !1195, !1200, !1204, !1208, !1210, !1212, !1216, !1220, !1224, !1228, !1230, !1232, !1234, !1236, !1241, !1245, !1247, !1249, !1253, !1257, !1261, !1263, !1265, !1267, !1269, !1275, !1277, !1281, !1283, !1288, !1293, !1297, !1301, !1304, !1306, !1307, !1309, !1311, !1315, !1321, !1323, !1327, !1332, !1336, !1338, !1342, !1351, !1356, !1366, !1370, !1374, !1378, !1382, !1386, !1390, !1394, !1398, !1402, !1404, !1408, !1413, !1418, !1422, !1426, !1430, !1434, !1435, !1439, !1441, !1445, !1449, !1453, !1457, !1461, !1465, !1469, !1471, !1473, !1475, !1480, !1483, !1485, !1487, !1490, !1492, !1494, !1496, !1498, !1500, !1502, !1504, !1506, !1508, !1510, !1512, !1514, !1516, !1518, !1520, !1522, !1524, !1526, !1528, !1530, !1532, !1534, !1535, !1537, !1538, !1539, !1540, !1541, !1542, !1543, !1544, !1545, !1546, !1547, !1548, !1549, !1550, !1551, !1552, !1553, !1554, !1555, !1556, !1557, !1558, !1559, !1560, !1561, !1562, !1563, !1564, !1566, !1567, !1571, !1576, !1577, !1580, !1585, !1586, !1590, !1592, !1594, !1596, !1598, !1600, !1602, !1604, !1606, !1608, !1610, !1612, !1614}
!823 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !824, file: !827, line: 37)
!824 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !825, line: 31, baseType: !826)
!825 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_wstdio.h", directory: "", checksumkind: CSK_MD5, checksum: "bf50373b435d0afd0235dd3e05c4a277")
!826 = !DICompositeType(tag: DW_TAG_structure_type, name: "_iobuf", file: !825, line: 28, size: 64, flags: DIFlagFwdDecl, identifier: ".?AU_iobuf@@")
!827 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\cstdio", directory: "", checksumkind: CSK_MD5, checksum: "c450e3bb97b2af18a3a83f1f772c2644")
!828 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !296, file: !827, line: 38)
!829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !830, file: !827, line: 40)
!830 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !831, line: 193, baseType: !28)
!831 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\vcruntime.h", directory: "", checksumkind: CSK_MD5, checksum: "1147c94afb6f25c377433eef20bc3e8f")
!832 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !833, file: !827, line: 41)
!833 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !834, line: 73, baseType: !61)
!834 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "c1a1fbc43e7d45f0ea4ae539ddcffb19")
!835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !824, file: !827, line: 42)
!836 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !837, file: !827, line: 43)
!837 = !DISubprogram(name: "clearerr", scope: !834, file: !834, line: 146, type: !838, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!838 = !DISubroutineType(types: !839)
!839 = !{null, !840}
!840 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !824, size: 64)
!841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !842, file: !827, line: 44)
!842 = !DISubprogram(name: "fclose", scope: !834, file: !834, line: 152, type: !843, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!843 = !DISubroutineType(types: !844)
!844 = !{!12, !840}
!845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !846, file: !827, line: 45)
!846 = !DISubprogram(name: "feof", scope: !834, file: !834, line: 166, type: !843, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!847 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !848, file: !827, line: 46)
!848 = !DISubprogram(name: "ferror", scope: !834, file: !834, line: 171, type: !843, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !850, file: !827, line: 47)
!850 = !DISubprogram(name: "fflush", scope: !834, file: !834, line: 176, type: !843, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !852, file: !827, line: 48)
!852 = !DISubprogram(name: "fgetc", scope: !834, file: !834, line: 182, type: !843, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!853 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !854, file: !827, line: 49)
!854 = !DISubprogram(name: "fgetpos", scope: !834, file: !834, line: 191, type: !855, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!855 = !DISubroutineType(types: !856)
!856 = !{!12, !840, !857}
!857 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !833, size: 64)
!858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !859, file: !827, line: 50)
!859 = !DISubprogram(name: "fgets", scope: !834, file: !834, line: 198, type: !860, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!860 = !DISubroutineType(types: !861)
!861 = !{!32, !32, !12, !840}
!862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !863, file: !827, line: 51)
!863 = !DISubprogram(name: "fopen", scope: !834, file: !834, line: 213, type: !864, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!864 = !DISubroutineType(types: !865)
!865 = !{!840, !37, !37}
!866 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !867, file: !827, line: 52)
!867 = !DISubprogram(name: "fprintf", scope: !834, file: !834, line: 830, type: !868, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!868 = !DISubroutineType(types: !869)
!869 = !{!12, !870, !308, null}
!870 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !840)
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !872, file: !827, line: 53)
!872 = !DISubprogram(name: "fputc", scope: !834, file: !834, line: 221, type: !873, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!873 = !DISubroutineType(types: !874)
!874 = !{!12, !12, !840}
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !876, file: !827, line: 54)
!876 = !DISubprogram(name: "fputs", scope: !834, file: !834, line: 233, type: !877, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!877 = !DISubroutineType(types: !878)
!878 = !{!12, !37, !840}
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !880, file: !827, line: 55)
!880 = !DISubprogram(name: "fread", scope: !834, file: !834, line: 239, type: !881, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!881 = !DISubroutineType(types: !882)
!882 = !{!830, !29, !830, !830, !840}
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !884, file: !827, line: 56)
!884 = !DISubprogram(name: "freopen", scope: !834, file: !834, line: 248, type: !885, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!885 = !DISubroutineType(types: !886)
!886 = !{!840, !37, !37, !840}
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !888, file: !827, line: 57)
!888 = !DISubprogram(name: "fscanf", scope: !834, file: !834, line: 1199, type: !868, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !890, file: !827, line: 58)
!890 = !DISubprogram(name: "fseek", scope: !834, file: !834, line: 270, type: !891, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!891 = !DISubroutineType(types: !892)
!892 = !{!12, !840, !893, !12}
!893 = !DIBasicType(name: "long int", size: 32, encoding: DW_ATE_signed)
!894 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !895, file: !827, line: 59)
!895 = !DISubprogram(name: "fsetpos", scope: !834, file: !834, line: 263, type: !896, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!896 = !DISubroutineType(types: !897)
!897 = !{!12, !840, !898}
!898 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !899, size: 64)
!899 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !833)
!900 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !901, file: !827, line: 60)
!901 = !DISubprogram(name: "ftell", scope: !834, file: !834, line: 286, type: !902, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!902 = !DISubroutineType(types: !903)
!903 = !{!893, !840}
!904 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !905, file: !827, line: 61)
!905 = !DISubprogram(name: "fwrite", scope: !834, file: !834, line: 297, type: !906, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!906 = !DISubroutineType(types: !907)
!907 = !{!830, !115, !830, !830, !840}
!908 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !909, file: !827, line: 62)
!909 = !DISubprogram(name: "getc", scope: !834, file: !834, line: 306, type: !843, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!910 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !911, file: !827, line: 63)
!911 = !DISubprogram(name: "getchar", scope: !834, file: !834, line: 311, type: !912, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!912 = !DISubroutineType(types: !913)
!913 = !{!12}
!914 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !915, file: !827, line: 64)
!915 = !DISubprogram(name: "perror", scope: !834, file: !834, line: 325, type: !916, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!916 = !DISubroutineType(types: !917)
!917 = !{null, !37}
!918 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !919, file: !827, line: 65)
!919 = !DISubprogram(name: "putc", scope: !834, file: !834, line: 347, type: !873, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!920 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !921, file: !827, line: 66)
!921 = !DISubprogram(name: "putchar", scope: !834, file: !834, line: 353, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!922 = !DISubroutineType(types: !923)
!923 = !{!12, !12}
!924 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !925, file: !827, line: 67)
!925 = !DISubprogram(name: "printf", scope: !834, file: !834, line: 950, type: !926, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!926 = !DISubroutineType(types: !927)
!927 = !{!12, !308, null}
!928 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !929, file: !827, line: 68)
!929 = !DISubprogram(name: "puts", scope: !834, file: !834, line: 358, type: !930, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!930 = !DISubroutineType(types: !931)
!931 = !{!12, !37}
!932 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !933, file: !827, line: 69)
!933 = !DISubprogram(name: "remove", scope: !834, file: !834, line: 369, type: !930, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!934 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !935, file: !827, line: 70)
!935 = !DISubprogram(name: "rename", scope: !834, file: !834, line: 374, type: !936, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!936 = !DISubroutineType(types: !937)
!937 = !{!12, !37, !37}
!938 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !939, file: !827, line: 71)
!939 = !DISubprogram(name: "rewind", scope: !834, file: !834, line: 392, type: !838, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!940 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !941, file: !827, line: 72)
!941 = !DISubprogram(name: "scanf", scope: !834, file: !834, line: 1276, type: !926, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!942 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !943, file: !827, line: 73)
!943 = !DISubprogram(name: "setbuf", scope: !834, file: !834, line: 400, type: !944, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!944 = !DISubroutineType(types: !945)
!945 = !{null, !840, !32}
!946 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !947, file: !827, line: 74)
!947 = !DISubprogram(name: "setvbuf", scope: !834, file: !834, line: 412, type: !948, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!948 = !DISubroutineType(types: !949)
!949 = !{!12, !840, !32, !12, !830}
!950 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !951, file: !827, line: 75)
!951 = !DISubprogram(name: "sprintf", scope: !834, file: !834, line: 1783, type: !952, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!952 = !DISubroutineType(types: !953)
!953 = !{!12, !32, !37, null}
!954 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !955, file: !827, line: 76)
!955 = !DISubprogram(name: "sscanf", scope: !834, file: !834, line: 2240, type: !956, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!956 = !DISubroutineType(types: !957)
!957 = !{!12, !308, !308, null}
!958 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !959, file: !827, line: 77)
!959 = !DISubprogram(name: "tmpfile", scope: !834, file: !834, line: 435, type: !960, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!960 = !DISubroutineType(types: !961)
!961 = !{!840}
!962 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !963, file: !827, line: 78)
!963 = !DISubprogram(name: "tmpnam", scope: !834, file: !834, line: 443, type: !964, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!964 = !DISubroutineType(types: !965)
!965 = !{!32, !32}
!966 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !967, file: !827, line: 79)
!967 = !DISubprogram(name: "ungetc", scope: !834, file: !834, line: 451, type: !873, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!968 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !969, file: !827, line: 80)
!969 = !DISubprogram(name: "vfprintf", scope: !834, file: !834, line: 650, type: !970, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!970 = !DISubroutineType(types: !971)
!971 = !{!12, !870, !308, !972}
!972 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !27, line: 72, baseType: !32)
!973 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !974, file: !827, line: 81)
!974 = !DISubprogram(name: "vprintf", scope: !834, file: !834, line: 740, type: !975, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!975 = !DISubroutineType(types: !976)
!976 = !{!12, !308, !972}
!977 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !978, file: !827, line: 82)
!978 = !DISubprogram(name: "vsprintf", scope: !834, file: !834, line: 1783, type: !979, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!979 = !DISubroutineType(types: !980)
!980 = !{!12, !32, !37, !972}
!981 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !982, file: !827, line: 84)
!982 = !DISubprogram(name: "snprintf", scope: !834, file: !834, line: 1919, type: !983, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!983 = !DISubroutineType(types: !984)
!984 = !{!12, !107, !985, !308, null}
!985 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !830)
!986 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !987, file: !827, line: 85)
!987 = !DISubprogram(name: "vsnprintf", scope: !834, file: !834, line: 1429, type: !988, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!988 = !DISubroutineType(types: !989)
!989 = !{!12, !107, !985, !308, !972}
!990 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !991, file: !827, line: 86)
!991 = !DISubprogram(name: "vfscanf", scope: !834, file: !834, line: 1072, type: !970, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!992 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !993, file: !827, line: 87)
!993 = !DISubprogram(name: "vscanf", scope: !834, file: !834, line: 1136, type: !975, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!994 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !995, file: !827, line: 88)
!995 = !DISubprogram(name: "vsscanf", scope: !834, file: !834, line: 2160, type: !996, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!996 = !DISubroutineType(types: !997)
!997 = !{!12, !308, !308, !972}
!998 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !830, file: !999, line: 25)
!999 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\cstring", directory: "", checksumkind: CSK_MD5, checksum: "8836d22258dd0dcd58ea9d9763256c9c")
!1000 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1001, file: !999, line: 26)
!1001 = !DISubprogram(name: "memchr", linkageName: "?memchr@@YAPEAXPEAXH_K@Z", scope: !1002, file: !1002, line: 104, type: !1003, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1002 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_memory.h", directory: "", checksumkind: CSK_MD5, checksum: "0b971aeac8757ee8ec347a03047c3b4a")
!1003 = !DISubroutineType(types: !1004)
!1004 = !{!29, !29, !12, !830}
!1005 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1006, file: !999, line: 27)
!1006 = !DISubprogram(name: "memcmp", scope: !1007, file: !1007, line: 29, type: !1008, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1007 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\vcruntime_string.h", directory: "", checksumkind: CSK_MD5, checksum: "a54b085ffcc86a11803fd825bf8abeaa")
!1008 = !DISubroutineType(types: !1009)
!1009 = !{!12, !115, !115, !830}
!1010 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1011, file: !999, line: 28)
!1011 = !DISubprogram(name: "memcpy", scope: !1007, file: !1007, line: 43, type: !1012, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1012 = !DISubroutineType(types: !1013)
!1013 = !{!29, !29, !115, !830}
!1014 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1015, file: !999, line: 29)
!1015 = !DISubprogram(name: "memmove", scope: !1007, file: !1007, line: 50, type: !1012, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1016 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1017, file: !999, line: 30)
!1017 = !DISubprogram(name: "memset", scope: !1007, file: !1007, line: 63, type: !1003, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1018 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1019, file: !999, line: 31)
!1019 = !DISubprogram(name: "strcat", scope: !1020, file: !1020, line: 91, type: !1021, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1020 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\string.h", directory: "", checksumkind: CSK_MD5, checksum: "9f780e8d323a4f33b8c61853c3c9471c")
!1021 = !DISubroutineType(types: !1022)
!1022 = !{!32, !32, !37}
!1023 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1024, file: !999, line: 32)
!1024 = !DISubprogram(name: "strchr", linkageName: "?strchr@@YAPEADQEADH@Z", scope: !1020, file: !1020, line: 500, type: !1025, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1025 = !DISubroutineType(types: !1026)
!1026 = !{!32, !107, !1027}
!1027 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!1028 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1029, file: !999, line: 33)
!1029 = !DISubprogram(name: "strcmp", scope: !1020, file: !1020, line: 100, type: !936, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1030 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1031, file: !999, line: 34)
!1031 = !DISubprogram(name: "strcoll", scope: !1020, file: !1020, line: 112, type: !936, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1032 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1033, file: !999, line: 35)
!1033 = !DISubprogram(name: "strcpy", scope: !1020, file: !1020, line: 130, type: !1021, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1034 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1035, file: !999, line: 36)
!1035 = !DISubprogram(name: "strcspn", scope: !1020, file: !1020, line: 137, type: !1036, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1036 = !DISubroutineType(types: !1037)
!1037 = !{!830, !37, !37}
!1038 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1039, file: !999, line: 37)
!1039 = !DISubprogram(name: "strerror", scope: !1020, file: !1020, line: 178, type: !1040, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1040 = !DISubroutineType(types: !1041)
!1041 = !{!32, !12}
!1042 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1043, file: !999, line: 38)
!1043 = !DISubprogram(name: "strlen", scope: !1020, file: !1020, line: 215, type: !1044, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1044 = !DISubroutineType(types: !1045)
!1045 = !{!830, !37}
!1046 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1047, file: !999, line: 39)
!1047 = !DISubprogram(name: "strncat", scope: !1020, file: !1020, line: 262, type: !1048, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1048 = !DISubroutineType(types: !1049)
!1049 = !{!32, !32, !37, !830}
!1050 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1051, file: !999, line: 40)
!1051 = !DISubprogram(name: "strncmp", scope: !1020, file: !1020, line: 271, type: !1052, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1052 = !DISubroutineType(types: !1053)
!1053 = !{!12, !37, !37, !830}
!1054 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1055, file: !999, line: 41)
!1055 = !DISubprogram(name: "strncpy", scope: !1020, file: !1020, line: 334, type: !1048, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1056 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1057, file: !999, line: 42)
!1057 = !DISubprogram(name: "strpbrk", linkageName: "?strpbrk@@YAPEADQEADQEBD@Z", scope: !1020, file: !1020, line: 506, type: !1058, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1058 = !DISubroutineType(types: !1059)
!1059 = !{!32, !107, !308}
!1060 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1061, file: !999, line: 43)
!1061 = !DISubprogram(name: "strrchr", linkageName: "?strrchr@@YAPEADQEADH@Z", scope: !1020, file: !1020, line: 512, type: !1025, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1062 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1063, file: !999, line: 44)
!1063 = !DISubprogram(name: "strspn", scope: !1020, file: !1020, line: 430, type: !1036, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1064 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1065, file: !999, line: 45)
!1065 = !DISubprogram(name: "strstr", linkageName: "?strstr@@YAPEADQEADQEBD@Z", scope: !1020, file: !1020, line: 518, type: !1058, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1066 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1067, file: !999, line: 46)
!1067 = !DISubprogram(name: "strtok", scope: !1020, file: !1020, line: 436, type: !1021, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1068 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1069, file: !999, line: 47)
!1069 = !DISubprogram(name: "strxfrm", scope: !1020, file: !1020, line: 479, type: !1070, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1070 = !DISubroutineType(types: !1071)
!1071 = !{!830, !32, !37, !830}
!1072 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !296, file: !1073, line: 28)
!1073 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\cwchar", directory: "", checksumkind: CSK_MD5, checksum: "de41ecfa6d57874e2c7d1a30e0e4ad43")
!1074 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !358, file: !1073, line: 30)
!1075 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !830, file: !1073, line: 31)
!1076 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1077, file: !1073, line: 32)
!1077 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !1078, line: 26, size: 288, flags: DIFlagFwdDecl, identifier: ".?AUtm@@")
!1078 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_wtime.h", directory: "", checksumkind: CSK_MD5, checksum: "2492ba0e16e5eeaa8a93d311a7316d6b")
!1079 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1080, file: !1073, line: 33)
!1080 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !297, line: 591, baseType: !303)
!1081 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1082, file: !1073, line: 35)
!1082 = !DISubprogram(name: "btowc", scope: !1083, file: !1083, line: 62, type: !1084, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1083 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "50992c87c826ae29a05757af3914e0dd")
!1084 = !DISubroutineType(types: !1085)
!1085 = !{!1080, !12}
!1086 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1087, file: !1073, line: 36)
!1087 = !DISubprogram(name: "fgetwc", scope: !825, file: !825, line: 51, type: !1088, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1088 = !DISubroutineType(types: !1089)
!1089 = !{!1080, !840}
!1090 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1091, file: !1073, line: 37)
!1091 = !DISubprogram(name: "fgetws", scope: !825, file: !825, line: 79, type: !1092, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1092 = !DISubroutineType(types: !1093)
!1093 = !{!1094, !1094, !12, !840}
!1094 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1095, size: 64)
!1095 = !DIBasicType(name: "wchar_t", size: 16, encoding: DW_ATE_unsigned)
!1096 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1097, file: !1073, line: 38)
!1097 = !DISubprogram(name: "fputwc", scope: !825, file: !825, line: 59, type: !1098, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1098 = !DISubroutineType(types: !1099)
!1099 = !{!1080, !1095, !840}
!1100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1101, file: !1073, line: 39)
!1101 = !DISubprogram(name: "fputws", scope: !825, file: !825, line: 86, type: !1102, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1102 = !DISubroutineType(types: !1103)
!1103 = !{!12, !1104, !840}
!1104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1105, size: 64)
!1105 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1095)
!1106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1107, file: !1073, line: 40)
!1107 = !DISubprogram(name: "fwide", scope: !1083, file: !1083, line: 184, type: !1108, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1108 = !DISubroutineType(types: !1109)
!1109 = !{!12, !840, !12}
!1110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1111, file: !1073, line: 41)
!1111 = !DISubprogram(name: "fwprintf", scope: !825, file: !825, line: 494, type: !1112, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1112 = !DISubroutineType(types: !1113)
!1113 = !{!12, !870, !1114, null}
!1114 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1104)
!1115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1116, file: !1073, line: 42)
!1116 = !DISubprogram(name: "fwscanf", scope: !825, file: !825, line: 856, type: !1112, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1118, file: !1073, line: 43)
!1118 = !DISubprogram(name: "getwc", scope: !825, file: !825, line: 69, type: !1088, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1120, file: !1073, line: 44)
!1120 = !DISubprogram(name: "getwchar", scope: !825, file: !825, line: 74, type: !1121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1121 = !DISubroutineType(types: !1122)
!1122 = !{!1080}
!1123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1124, file: !1073, line: 45)
!1124 = !DISubprogram(name: "mbrlen", scope: !1083, file: !1083, line: 66, type: !1125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1125 = !DISubroutineType(types: !1126)
!1126 = !{!830, !37, !830, !1127}
!1127 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !358, size: 64)
!1128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1129, file: !1073, line: 46)
!1129 = !DISubprogram(name: "mbrtowc", scope: !1083, file: !1083, line: 72, type: !1130, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1130 = !DISubroutineType(types: !1131)
!1131 = !{!830, !1094, !37, !830, !1127}
!1132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1133, file: !1073, line: 47)
!1133 = !DISubprogram(name: "mbsrtowcs", scope: !1083, file: !1083, line: 99, type: !1134, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1134 = !DISubroutineType(types: !1135)
!1135 = !{!830, !1094, !1136, !830, !1127}
!1136 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!1137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1138, file: !1073, line: 48)
!1138 = !DISubprogram(name: "mbsinit", scope: !1083, file: !1083, line: 193, type: !1139, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1139 = !DISubroutineType(types: !1140)
!1140 = !{!12, !1141}
!1141 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1142, size: 64)
!1142 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !358)
!1143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1144, file: !1073, line: 49)
!1144 = !DISubprogram(name: "putwc", scope: !825, file: !825, line: 105, type: !1098, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1146, file: !1073, line: 50)
!1146 = !DISubprogram(name: "putwchar", scope: !825, file: !825, line: 111, type: !1147, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1147 = !DISubroutineType(types: !1148)
!1148 = !{!1080, !1095}
!1149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1150, file: !1073, line: 51)
!1150 = !DISubprogram(name: "swprintf", linkageName: "?swprintf@@YAHQEA_WQEB_WZZ", scope: !825, file: !825, line: 1803, type: !1151, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1151 = !DISubroutineType(types: !1152)
!1152 = !{!12, !1153, !1114, null}
!1153 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1094)
!1154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1155, file: !1073, line: 52)
!1155 = !DISubprogram(name: "swscanf", scope: !825, file: !825, line: 2018, type: !1156, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1156 = !DISubroutineType(types: !1157)
!1157 = !{!12, !1114, !1114, null}
!1158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1159, file: !1073, line: 53)
!1159 = !DISubprogram(name: "ungetwc", scope: !825, file: !825, line: 121, type: !1160, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1160 = !DISubroutineType(types: !1161)
!1161 = !{!1080, !1080, !840}
!1162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1163, file: !1073, line: 54)
!1163 = !DISubprogram(name: "vfwprintf", scope: !825, file: !825, line: 314, type: !1164, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1164 = !DISubroutineType(types: !1165)
!1165 = !{!12, !870, !1114, !972}
!1166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1167, file: !1073, line: 55)
!1167 = !DISubprogram(name: "vswprintf", linkageName: "?vswprintf@@YAHQEA_WQEB_WPEAD@Z", scope: !825, file: !825, line: 1817, type: !1168, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1168 = !DISubroutineType(types: !1169)
!1169 = !{!12, !1153, !1114, !972}
!1170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1171, file: !1073, line: 56)
!1171 = !DISubprogram(name: "vwprintf", scope: !825, file: !825, line: 404, type: !1172, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1172 = !DISubroutineType(types: !1173)
!1173 = !{!12, !1114, !972}
!1174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1175, file: !1073, line: 57)
!1175 = !DISubprogram(name: "wcrtomb", scope: !1083, file: !1083, line: 125, type: !1176, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1176 = !DISubroutineType(types: !1177)
!1177 = !{!830, !32, !1095, !1127}
!1178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1179, file: !1073, line: 58)
!1179 = !DISubprogram(name: "wprintf", scope: !825, file: !825, line: 608, type: !1180, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1180 = !DISubroutineType(types: !1181)
!1181 = !{!12, !1114, null}
!1182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1183, file: !1073, line: 59)
!1183 = !DISubprogram(name: "wscanf", scope: !825, file: !825, line: 933, type: !1180, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1185, file: !1073, line: 60)
!1185 = !DISubprogram(name: "wcsrtombs", scope: !1083, file: !1083, line: 152, type: !1186, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1186 = !DISubroutineType(types: !1187)
!1187 = !{!830, !32, !1188, !830, !1127}
!1188 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1104, size: 64)
!1189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1190, file: !1073, line: 61)
!1190 = !DISubprogram(name: "wcstol", scope: !1191, file: !1191, line: 134, type: !1192, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1191 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_wstdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "5b96d4421a65eb4a3e16dd6dc0574ba7")
!1192 = !DISubroutineType(types: !1193)
!1193 = !{!893, !1104, !1194, !12}
!1194 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1094, size: 64)
!1195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1196, file: !1073, line: 62)
!1196 = !DISubprogram(name: "wcscat", scope: !1197, file: !1197, line: 100, type: !1198, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1197 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_wstring.h", directory: "", checksumkind: CSK_MD5, checksum: "1e9764c381f45184fd3c47aaada60bf9")
!1198 = !DISubroutineType(types: !1199)
!1199 = !{!1094, !1094, !1104}
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1201, file: !1073, line: 63)
!1201 = !DISubprogram(name: "wcschr", linkageName: "?wcschr@@YAPEA_WPEA_W_W@Z", scope: !1197, file: !1197, line: 529, type: !1202, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1202 = !DISubroutineType(types: !1203)
!1203 = !{!1094, !1094, !1095}
!1204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1205, file: !1073, line: 64)
!1205 = !DISubprogram(name: "wcscmp", scope: !1197, file: !1197, line: 108, type: !1206, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1206 = !DISubroutineType(types: !1207)
!1207 = !{!12, !1104, !1104}
!1208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1209, file: !1073, line: 65)
!1209 = !DISubprogram(name: "wcscoll", scope: !1197, file: !1197, line: 462, type: !1206, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1211, file: !1073, line: 66)
!1211 = !DISubprogram(name: "wcscpy", scope: !1197, file: !1197, line: 119, type: !1198, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1213, file: !1073, line: 67)
!1213 = !DISubprogram(name: "wcscspn", scope: !1197, file: !1197, line: 126, type: !1214, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1214 = !DISubroutineType(types: !1215)
!1215 = !{!830, !1104, !1104}
!1216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1217, file: !1073, line: 68)
!1217 = !DISubprogram(name: "wcslen", scope: !1197, file: !1197, line: 132, type: !1218, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1218 = !DISubroutineType(types: !1219)
!1219 = !{!830, !1104}
!1220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1221, file: !1073, line: 69)
!1221 = !DISubprogram(name: "wcsncat", scope: !1197, file: !1197, line: 178, type: !1222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1222 = !DISubroutineType(types: !1223)
!1223 = !{!1094, !1094, !1104, !830}
!1224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1225, file: !1073, line: 70)
!1225 = !DISubprogram(name: "wcsncmp", scope: !1197, file: !1197, line: 187, type: !1226, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1226 = !DISubroutineType(types: !1227)
!1227 = !{!12, !1104, !1104, !830}
!1228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1229, file: !1073, line: 71)
!1229 = !DISubprogram(name: "wcsncpy", scope: !1197, file: !1197, line: 200, type: !1222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1231, file: !1073, line: 72)
!1231 = !DISubprogram(name: "wcspbrk", linkageName: "?wcspbrk@@YAPEA_WPEA_WPEB_W@Z", scope: !1197, file: !1197, line: 535, type: !1198, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1233, file: !1073, line: 73)
!1233 = !DISubprogram(name: "wcsrchr", linkageName: "?wcsrchr@@YAPEA_WPEA_W_W@Z", scope: !1197, file: !1197, line: 541, type: !1202, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1235, file: !1073, line: 74)
!1235 = !DISubprogram(name: "wcsspn", scope: !1197, file: !1197, line: 215, type: !1214, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1237, file: !1073, line: 75)
!1237 = !DISubprogram(name: "wcstod", scope: !1191, file: !1191, line: 121, type: !1238, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1238 = !DISubroutineType(types: !1239)
!1239 = !{!1240, !1104, !1194}
!1240 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!1241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1242, file: !1073, line: 76)
!1242 = !DISubprogram(name: "wcstoul", scope: !1191, file: !1191, line: 164, type: !1243, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1243 = !DISubroutineType(types: !1244)
!1244 = !{!301, !1104, !1194, !12}
!1245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1246, file: !1073, line: 77)
!1246 = !DISubprogram(name: "wcsstr", linkageName: "?wcsstr@@YAPEA_WPEA_WPEB_W@Z", scope: !1197, file: !1197, line: 548, type: !1198, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1248, file: !1073, line: 78)
!1248 = !DISubprogram(name: "wcstok", linkageName: "?wcstok@@YAPEA_WPEA_WPEB_W@Z", scope: !1197, file: !1197, line: 253, type: !1198, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1250, file: !1073, line: 79)
!1250 = !DISubprogram(name: "wcsxfrm", scope: !1197, file: !1197, line: 446, type: !1251, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1251 = !DISubroutineType(types: !1252)
!1252 = !{!830, !1094, !1104, !830}
!1253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1254, file: !1073, line: 80)
!1254 = !DISubprogram(name: "wctob", scope: !1083, file: !1083, line: 160, type: !1255, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1255 = !DISubroutineType(types: !1256)
!1256 = !{!12, !1080}
!1257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1258, file: !1073, line: 81)
!1258 = !DISubprogram(name: "wmemchr", linkageName: "?wmemchr@@YAPEA_WPEA_W_W_K@Z", scope: !1083, file: !1083, line: 268, type: !1259, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1259 = !DISubroutineType(types: !1260)
!1260 = !{!1094, !1094, !1095, !830}
!1261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1262, file: !1073, line: 82)
!1262 = !DISubprogram(name: "wmemcmp", scope: !1083, file: !1083, line: 213, type: !1226, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1264, file: !1073, line: 83)
!1264 = !DISubprogram(name: "wmemcpy", scope: !1083, file: !1083, line: 229, type: !1222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1266, file: !1073, line: 84)
!1266 = !DISubprogram(name: "wmemmove", scope: !1083, file: !1083, line: 240, type: !1222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1268, file: !1073, line: 85)
!1268 = !DISubprogram(name: "wmemset", scope: !1083, file: !1083, line: 252, type: !1259, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1270, file: !1073, line: 86)
!1270 = !DISubprogram(name: "wcsftime", scope: !1078, file: !1078, line: 69, type: !1271, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1271 = !DISubroutineType(types: !1272)
!1272 = !{!830, !1094, !830, !1104, !1273}
!1273 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1274, size: 64)
!1274 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1077)
!1275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1276, file: !1073, line: 88)
!1276 = !DISubprogram(name: "vfwscanf", scope: !825, file: !825, line: 731, type: !1164, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1278, file: !1073, line: 89)
!1278 = !DISubprogram(name: "vswscanf", scope: !825, file: !825, line: 1900, type: !1279, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1279 = !DISubroutineType(types: !1280)
!1280 = !{!12, !1104, !1104, !972}
!1281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1282, file: !1073, line: 90)
!1282 = !DISubprogram(name: "vwscanf", scope: !825, file: !825, line: 793, type: !1172, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1284, file: !1073, line: 91)
!1284 = !DISubprogram(name: "wcstof", scope: !1191, file: !1191, line: 207, type: !1285, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1285 = !DISubroutineType(types: !1286)
!1286 = !{!1287, !1104, !1194}
!1287 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!1288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1289, file: !1073, line: 92)
!1289 = !DISubprogram(name: "wcstold", scope: !1191, file: !1191, line: 194, type: !1290, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1290 = !DISubroutineType(types: !1291)
!1291 = !{!1292, !1104, !1194}
!1292 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!1293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1294, file: !1073, line: 93)
!1294 = !DISubprogram(name: "wcstoll", scope: !1191, file: !1191, line: 149, type: !1295, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1295 = !DISubroutineType(types: !1296)
!1296 = !{!61, !1104, !1194, !12}
!1297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1298, file: !1073, line: 94)
!1298 = !DISubprogram(name: "wcstoull", scope: !1191, file: !1191, line: 179, type: !1299, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1299 = !DISubroutineType(types: !1300)
!1300 = !{!28, !1104, !1194, !12}
!1301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !7, entity: !1302, file: !31, line: 94)
!1302 = !DIDerivedType(tag: DW_TAG_typedef, name: "nullptr_t", scope: !2, file: !31, line: 93, baseType: !1303)
!1303 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "decltype(nullptr)")
!1304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !60, file: !1305, line: 23)
!1305 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\cstddef", directory: "", checksumkind: CSK_MD5, checksum: "1479f3900768e26e8836fd19109e117d")
!1306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !30, file: !1305, line: 24)
!1307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !7, entity: !1308, file: !1305, line: 95)
!1308 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", scope: !2, file: !1305, line: 25, baseType: !1240)
!1309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !30, file: !1310, line: 36)
!1310 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\cstdlib", directory: "", checksumkind: CSK_MD5, checksum: "721d4b06441c95b75ef8fd32d75af028")
!1311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1312, file: !1310, line: 37)
!1312 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !1313, line: 279, baseType: !1314)
!1313 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "f957baaaf7f972e5b8d08c2855b49589")
!1314 = !DICompositeType(tag: DW_TAG_structure_type, name: "_div_t", file: !1313, line: 275, size: 64, flags: DIFlagFwdDecl, identifier: ".?AU_div_t@@")
!1315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1316, file: !1310, line: 38)
!1316 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !1313, line: 285, baseType: !1317)
!1317 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_ldiv_t", file: !1313, line: 281, size: 64, flags: DIFlagTypePassByValue, elements: !1318, identifier: ".?AU_ldiv_t@@")
!1318 = !{!1319, !1320}
!1319 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1317, file: !1313, line: 283, baseType: !893, size: 32)
!1320 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1317, file: !1313, line: 284, baseType: !893, size: 32, offset: 32)
!1321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1322, file: !1310, line: 39)
!1322 = !DISubprogram(name: "abort", scope: !1313, file: !1313, line: 60, type: !271, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1324, file: !1310, line: 40)
!1324 = !DISubprogram(name: "abs", linkageName: "?abs@@YAOO@Z", scope: !1310, file: !1310, line: 31, type: !1325, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1325 = !DISubroutineType(types: !1326)
!1326 = !{!1292, !1292}
!1327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1328, file: !1310, line: 41)
!1328 = !DISubprogram(name: "atexit", scope: !1313, file: !1313, line: 144, type: !1329, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1329 = !DISubroutineType(types: !1330)
!1330 = !{!12, !1331}
!1331 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !271, size: 64)
!1332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1333, file: !1310, line: 42)
!1333 = !DISubprogram(name: "atof", scope: !1313, file: !1313, line: 450, type: !1334, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1334 = !DISubroutineType(types: !1335)
!1335 = !{!1240, !37}
!1336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1337, file: !1310, line: 43)
!1337 = !DISubprogram(name: "atoi", scope: !1313, file: !1313, line: 451, type: !930, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1339, file: !1310, line: 44)
!1339 = !DISubprogram(name: "atol", scope: !1313, file: !1313, line: 452, type: !1340, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1340 = !DISubroutineType(types: !1341)
!1341 = !{!893, !37}
!1342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1343, file: !1310, line: 45)
!1343 = !DISubprogram(name: "bsearch", scope: !1344, file: !1344, line: 52, type: !1345, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1344 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_search.h", directory: "", checksumkind: CSK_MD5, checksum: "2a0a917cdb5d977c5fc7f09a83507d29")
!1345 = !DISubroutineType(types: !1346)
!1346 = !{!29, !115, !115, !30, !30, !1347}
!1347 = !DIDerivedType(tag: DW_TAG_typedef, name: "_CoreCrtNonSecureSearchSortCompareFunction", file: !1344, line: 24, baseType: !1348)
!1348 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1349, size: 64)
!1349 = !DISubroutineType(types: !1350)
!1350 = !{!12, !115, !115}
!1351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1352, file: !1310, line: 46)
!1352 = !DISubprogram(name: "calloc", scope: !1353, file: !1353, line: 66, type: !1354, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1353 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_malloc.h", directory: "", checksumkind: CSK_MD5, checksum: "e7cb4d2b08d978a19e592af472eb7bd0")
!1354 = !DISubroutineType(types: !1355)
!1355 = !{!29, !30, !30}
!1356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1357, file: !1310, line: 47)
!1357 = !DISubprogram(name: "div", linkageName: "?div@@YA?AU_lldiv_t@@_J0@Z", scope: !1313, file: !1313, line: 378, type: !1358, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1358 = !DISubroutineType(types: !1359)
!1359 = !{!1360, !1365, !1365}
!1360 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !1313, line: 291, baseType: !1361)
!1361 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_lldiv_t", file: !1313, line: 287, size: 128, flags: DIFlagTypePassByValue, elements: !1362, identifier: ".?AU_lldiv_t@@")
!1362 = !{!1363, !1364}
!1363 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1361, file: !1313, line: 289, baseType: !61, size: 64)
!1364 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1361, file: !1313, line: 290, baseType: !61, size: 64, offset: 64)
!1365 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !61)
!1366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1367, file: !1310, line: 48)
!1367 = !DISubprogram(name: "exit", scope: !1313, file: !1313, line: 56, type: !1368, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1368 = !DISubroutineType(types: !1369)
!1369 = !{null, !12}
!1370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1371, file: !1310, line: 49)
!1371 = !DISubprogram(name: "free", scope: !1353, file: !1353, line: 89, type: !1372, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1372 = !DISubroutineType(types: !1373)
!1373 = !{null, !29}
!1374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1375, file: !1310, line: 50)
!1375 = !DISubprogram(name: "labs", scope: !1313, file: !1313, line: 294, type: !1376, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1376 = !DISubroutineType(types: !1377)
!1377 = !{!893, !893}
!1378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1379, file: !1310, line: 51)
!1379 = !DISubprogram(name: "ldiv", scope: !1313, file: !1313, line: 303, type: !1380, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1380 = !DISubroutineType(types: !1381)
!1381 = !{!1316, !893, !893}
!1382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1383, file: !1310, line: 52)
!1383 = !DISubprogram(name: "malloc", scope: !1353, file: !1353, line: 101, type: !1384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1384 = !DISubroutineType(types: !1385)
!1385 = !{!29, !30}
!1386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1387, file: !1310, line: 53)
!1387 = !DISubprogram(name: "mblen", scope: !1313, file: !1313, line: 852, type: !1388, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1388 = !DISubroutineType(types: !1389)
!1389 = !{!12, !37, !30}
!1390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1391, file: !1310, line: 54)
!1391 = !DISubprogram(name: "mbstowcs", scope: !1313, file: !1313, line: 924, type: !1392, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1392 = !DISubroutineType(types: !1393)
!1393 = !{!30, !1094, !37, !30}
!1394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1395, file: !1310, line: 55)
!1395 = !DISubprogram(name: "mbtowc", scope: !1313, file: !1313, line: 893, type: !1396, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1396 = !DISubroutineType(types: !1397)
!1397 = !{!12, !1094, !37, !30}
!1398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1399, file: !1310, line: 56)
!1399 = !DISubprogram(name: "qsort", scope: !1344, file: !1344, line: 60, type: !1400, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1400 = !DISubroutineType(types: !1401)
!1401 = !{null, !29, !30, !30, !1347}
!1402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1403, file: !1310, line: 57)
!1403 = !DISubprogram(name: "rand", scope: !1313, file: !1313, line: 352, type: !912, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1405, file: !1310, line: 58)
!1405 = !DISubprogram(name: "realloc", scope: !1353, file: !1353, line: 126, type: !1406, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1406 = !DISubroutineType(types: !1407)
!1407 = !{!29, !29, !30}
!1408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1409, file: !1310, line: 59)
!1409 = !DISubprogram(name: "srand", scope: !1313, file: !1313, line: 350, type: !1410, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1410 = !DISubroutineType(types: !1411)
!1411 = !{null, !1412}
!1412 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!1413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1414, file: !1310, line: 60)
!1414 = !DISubprogram(name: "strtod", scope: !1313, file: !1313, line: 502, type: !1415, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1415 = !DISubroutineType(types: !1416)
!1416 = !{!1240, !37, !1417}
!1417 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!1418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1419, file: !1310, line: 61)
!1419 = !DISubprogram(name: "strtol", scope: !1313, file: !1313, line: 528, type: !1420, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1420 = !DISubroutineType(types: !1421)
!1421 = !{!893, !37, !1417, !12}
!1422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1423, file: !1310, line: 62)
!1423 = !DISubprogram(name: "strtoul", scope: !1313, file: !1313, line: 558, type: !1424, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1424 = !DISubroutineType(types: !1425)
!1425 = !{!301, !37, !1417, !12}
!1426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1427, file: !1310, line: 63)
!1427 = !DISubprogram(name: "wcstombs", scope: !1313, file: !1313, line: 1012, type: !1428, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1428 = !DISubroutineType(types: !1429)
!1429 = !{!30, !32, !1104, !30}
!1430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1431, file: !1310, line: 64)
!1431 = !DISubprogram(name: "wctomb", scope: !1313, file: !1313, line: 963, type: !1432, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1432 = !DISubroutineType(types: !1433)
!1433 = !{!12, !32, !1095}
!1434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1360, file: !1310, line: 66)
!1435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1436, file: !1310, line: 69)
!1436 = !DISubprogram(name: "getenv", scope: !1313, file: !1313, line: 1184, type: !1437, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1437 = !DISubroutineType(types: !1438)
!1438 = !{!32, !37}
!1439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1440, file: !1310, line: 70)
!1440 = !DISubprogram(name: "system", scope: !1313, file: !1313, line: 1211, type: !930, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1442, file: !1310, line: 73)
!1442 = !DISubprogram(name: "atoll", scope: !1313, file: !1313, line: 453, type: !1443, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1443 = !DISubroutineType(types: !1444)
!1444 = !{!61, !37}
!1445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1446, file: !1310, line: 74)
!1446 = !DISubprogram(name: "llabs", scope: !1313, file: !1313, line: 295, type: !1447, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1447 = !DISubroutineType(types: !1448)
!1448 = !{!61, !61}
!1449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1450, file: !1310, line: 75)
!1450 = !DISubprogram(name: "lldiv", scope: !1313, file: !1313, line: 304, type: !1451, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1451 = !DISubroutineType(types: !1452)
!1452 = !{!1360, !61, !61}
!1453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1454, file: !1310, line: 76)
!1454 = !DISubprogram(name: "strtof", scope: !1313, file: !1313, line: 489, type: !1455, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1455 = !DISubroutineType(types: !1456)
!1456 = !{!1287, !37, !1417}
!1457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1458, file: !1310, line: 77)
!1458 = !DISubprogram(name: "strtold", scope: !1313, file: !1313, line: 515, type: !1459, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1459 = !DISubroutineType(types: !1460)
!1460 = !{!1292, !37, !1417}
!1461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1462, file: !1310, line: 78)
!1462 = !DISubprogram(name: "strtoll", scope: !1313, file: !1313, line: 543, type: !1463, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1463 = !DISubroutineType(types: !1464)
!1464 = !{!61, !37, !1417, !12}
!1465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1466, file: !1310, line: 79)
!1466 = !DISubprogram(name: "strtoull", scope: !1313, file: !1313, line: 573, type: !1467, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1467 = !DISubroutineType(types: !1468)
!1468 = !{!28, !37, !1417, !12}
!1469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1470, file: !1310, line: 81)
!1470 = !DISubprogram(name: "_Exit", scope: !1313, file: !1313, line: 58, type: !1368, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1472, file: !1310, line: 82)
!1472 = !DISubprogram(name: "at_quick_exit", scope: !1313, file: !1313, line: 148, type: !1329, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1474, file: !1310, line: 83)
!1474 = !DISubprogram(name: "quick_exit", scope: !1313, file: !1313, line: 59, type: !1368, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1476, file: !1479, line: 22)
!1476 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !1477, line: 18, baseType: !1478)
!1477 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "56e2956fe219a08d408dc2fb7a857cfc")
!1478 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!1479 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\cstdint", directory: "", checksumkind: CSK_MD5, checksum: "a82d27cf0f774e165b06000e45047591")
!1480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1481, file: !1479, line: 23)
!1481 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !1477, line: 19, baseType: !1482)
!1482 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!1483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1484, file: !1479, line: 24)
!1484 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !1477, line: 20, baseType: !12)
!1485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1486, file: !1479, line: 25)
!1486 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !1477, line: 21, baseType: !61)
!1487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1488, file: !1479, line: 26)
!1488 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !1477, line: 22, baseType: !1489)
!1489 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!1490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1491, file: !1479, line: 27)
!1491 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !1477, line: 23, baseType: !303)
!1492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1493, file: !1479, line: 28)
!1493 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !1477, line: 24, baseType: !1412)
!1494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1495, file: !1479, line: 29)
!1495 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !1477, line: 25, baseType: !28)
!1496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1497, file: !1479, line: 31)
!1497 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !1477, line: 27, baseType: !1478)
!1498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1499, file: !1479, line: 32)
!1499 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !1477, line: 28, baseType: !1482)
!1500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1501, file: !1479, line: 33)
!1501 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !1477, line: 29, baseType: !12)
!1502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1503, file: !1479, line: 34)
!1503 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !1477, line: 30, baseType: !61)
!1504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1505, file: !1479, line: 35)
!1505 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !1477, line: 31, baseType: !1489)
!1506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1507, file: !1479, line: 36)
!1507 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !1477, line: 32, baseType: !303)
!1508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1509, file: !1479, line: 37)
!1509 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !1477, line: 33, baseType: !1412)
!1510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1511, file: !1479, line: 38)
!1511 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !1477, line: 34, baseType: !28)
!1512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1513, file: !1479, line: 40)
!1513 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !1477, line: 36, baseType: !1478)
!1514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1515, file: !1479, line: 41)
!1515 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !1477, line: 37, baseType: !12)
!1516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1517, file: !1479, line: 42)
!1517 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !1477, line: 38, baseType: !12)
!1518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1519, file: !1479, line: 43)
!1519 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !1477, line: 39, baseType: !61)
!1520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1521, file: !1479, line: 44)
!1521 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !1477, line: 40, baseType: !1489)
!1522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1523, file: !1479, line: 45)
!1523 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !1477, line: 41, baseType: !1412)
!1524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1525, file: !1479, line: 46)
!1525 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !1477, line: 42, baseType: !1412)
!1526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1527, file: !1479, line: 47)
!1527 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !1477, line: 43, baseType: !28)
!1528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1529, file: !1479, line: 49)
!1529 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !1477, line: 45, baseType: !61)
!1530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1531, file: !1479, line: 50)
!1531 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !831, line: 195, baseType: !61)
!1532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1533, file: !1479, line: 51)
!1533 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !1477, line: 46, baseType: !28)
!1534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !26, file: !1479, line: 52)
!1535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1476, file: !1479, line: 56)
!1536 = !DINamespace(name: "tr1", scope: !2)
!1537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1481, file: !1479, line: 57)
!1538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1484, file: !1479, line: 58)
!1539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1486, file: !1479, line: 59)
!1540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1488, file: !1479, line: 60)
!1541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1491, file: !1479, line: 61)
!1542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1493, file: !1479, line: 62)
!1543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1495, file: !1479, line: 63)
!1544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1497, file: !1479, line: 65)
!1545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1499, file: !1479, line: 66)
!1546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1501, file: !1479, line: 67)
!1547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1503, file: !1479, line: 68)
!1548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1505, file: !1479, line: 69)
!1549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1507, file: !1479, line: 70)
!1550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1509, file: !1479, line: 71)
!1551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1511, file: !1479, line: 72)
!1552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1513, file: !1479, line: 74)
!1553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1515, file: !1479, line: 75)
!1554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1517, file: !1479, line: 76)
!1555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1519, file: !1479, line: 77)
!1556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1521, file: !1479, line: 78)
!1557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1523, file: !1479, line: 79)
!1558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1525, file: !1479, line: 80)
!1559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1527, file: !1479, line: 81)
!1560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1529, file: !1479, line: 83)
!1561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1531, file: !1479, line: 84)
!1562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1533, file: !1479, line: 85)
!1563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !26, file: !1479, line: 86)
!1564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !133, file: !1565, line: 2366)
!1565 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\type_traits", directory: "", checksumkind: CSK_MD5, checksum: "55860436635b6df159970c2c6dabdaae")
!1566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !63, file: !1565, line: 2408)
!1567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1568, file: !1570, line: 37)
!1568 = !DISubprogram(name: "terminate", scope: !1569, file: !1569, line: 33, type: !271, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1569 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_terminate.h", directory: "", checksumkind: CSK_MD5, checksum: "2a539d6fe462a6cd4820acb34d25230b")
!1570 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\exception", directory: "", checksumkind: CSK_MD5, checksum: "f8e93cba096d8f4141d5f7504f6592c1")
!1571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1572, file: !1570, line: 40)
!1572 = !DISubprogram(name: "set_terminate", scope: !1569, file: !1569, line: 37, type: !1573, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1573 = !DISubroutineType(types: !1574)
!1574 = !{!1575, !1575}
!1575 = !DIDerivedType(tag: DW_TAG_typedef, name: "terminate_handler", file: !1569, line: 22, baseType: !1331)
!1576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1575, file: !1570, line: 41)
!1577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1578, file: !1570, line: 49)
!1578 = !DISubprogram(name: "unexpected", scope: !1579, file: !1579, line: 35, type: !271, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1579 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\eh.h", directory: "", checksumkind: CSK_MD5, checksum: "4a999be6308e84b5845d84cd2463ce9d")
!1580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1581, file: !1570, line: 52)
!1581 = !DISubprogram(name: "set_unexpected", scope: !1579, file: !1579, line: 39, type: !1582, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1582 = !DISubroutineType(types: !1583)
!1583 = !{!1584, !1584}
!1584 = !DIDerivedType(tag: DW_TAG_typedef, name: "unexpected_handler", file: !1579, line: 23, baseType: !1331)
!1585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1584, file: !1570, line: 53)
!1586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1587, file: !1589, line: 38)
!1587 = !DISubprogram(name: "isalnum", scope: !1588, file: !1588, line: 53, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1588 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "637d97803cfc8841aa28027834c41330")
!1589 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\cctype", directory: "", checksumkind: CSK_MD5, checksum: "02efabf6237906f874632fa4f9f858e4")
!1590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1591, file: !1589, line: 39)
!1591 = !DISubprogram(name: "isalpha", scope: !1588, file: !1588, line: 31, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1593, file: !1589, line: 40)
!1593 = !DISubprogram(name: "iscntrl", scope: !1588, file: !1588, line: 59, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1595, file: !1589, line: 41)
!1595 = !DISubprogram(name: "isdigit", scope: !1588, file: !1588, line: 39, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1597, file: !1589, line: 42)
!1597 = !DISubprogram(name: "isgraph", scope: !1588, file: !1588, line: 57, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1599, file: !1589, line: 43)
!1599 = !DISubprogram(name: "islower", scope: !1588, file: !1588, line: 35, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1601, file: !1589, line: 44)
!1601 = !DISubprogram(name: "isprint", scope: !1588, file: !1588, line: 55, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1603, file: !1589, line: 45)
!1603 = !DISubprogram(name: "ispunct", scope: !1588, file: !1588, line: 49, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1605, file: !1589, line: 46)
!1605 = !DISubprogram(name: "isspace", scope: !1588, file: !1588, line: 46, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1607, file: !1589, line: 47)
!1607 = !DISubprogram(name: "isupper", scope: !1588, file: !1588, line: 33, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1609, file: !1589, line: 48)
!1609 = !DISubprogram(name: "isxdigit", scope: !1588, file: !1588, line: 42, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1611, file: !1589, line: 49)
!1611 = !DISubprogram(name: "tolower", scope: !1588, file: !1588, line: 66, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1613, file: !1589, line: 50)
!1613 = !DISubprogram(name: "toupper", scope: !1588, file: !1588, line: 63, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1615, file: !1589, line: 52)
!1615 = !DISubprogram(name: "isblank", scope: !1588, file: !1588, line: 51, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1616 = !{!"/FAILIFMISMATCH:\22_MSC_VER=1900\22"}
!1617 = !{!"/FAILIFMISMATCH:\22_ITERATOR_DEBUG_LEVEL=0\22"}
!1618 = !{!"/FAILIFMISMATCH:\22RuntimeLibrary=MT_StaticRelease\22"}
!1619 = !{!"/DEFAULTLIB:libcpmt.lib"}
!1620 = !{!"/FAILIFMISMATCH:\22_CRT_STDIO_ISO_WIDE_SPECIFIERS=0\22"}
!1621 = !{i32 2, !"CodeView", i32 1}
!1622 = !{i32 2, !"Debug Info Version", i32 3}
!1623 = !{i32 1, !"wchar_size", i32 2}
!1624 = !{i32 7, !"PIC Level", i32 2}
!1625 = !{!"clang version 12.0.0"}
!1626 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 3, type: !912, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !1627)
!1627 = !{!1628, !1630, !1631, !1632, !1633, !1634}
!1628 = !DILocalVariable(name: "assignedString", scope: !1626, file: !8, line: 4, type: !1629)
!1629 = !DIDerivedType(tag: DW_TAG_typedef, name: "string", scope: !2, file: !40, line: 4905, baseType: !39)
!1630 = !DILocalVariable(name: "assignedInt", scope: !1626, file: !8, line: 7, type: !12)
!1631 = !DILocalVariable(name: "assignedChar", scope: !1626, file: !8, line: 10, type: !33)
!1632 = !DILocalVariable(name: "assignedFloat", scope: !1626, file: !8, line: 13, type: !1287)
!1633 = !DILocalVariable(name: "assignedDouble", scope: !1626, file: !8, line: 16, type: !1240)
!1634 = !DILocalVariable(name: "assignedBool", scope: !1626, file: !8, line: 19, type: !70)
!1635 = !DILocation(line: 4, column: 2, scope: !1626)
!1636 = !DILocation(line: 4, column: 14, scope: !1626)
!1637 = !DILocation(line: 4, column: 31, scope: !1626)
!1638 = !DILocation(line: 5, column: 17, scope: !1626)
!1639 = !DILocation(line: 6, column: 17, scope: !1626)
!1640 = !DILocation(line: 7, column: 2, scope: !1626)
!1641 = !DILocation(line: 7, column: 6, scope: !1626)
!1642 = !{!1643, !1643, i64 0}
!1643 = !{!"int", !1644, i64 0}
!1644 = !{!"omnipotent char", !1645, i64 0}
!1645 = !{!"Simple C++ TBAA"}
!1646 = !DILocation(line: 8, column: 14, scope: !1626)
!1647 = !DILocation(line: 9, column: 14, scope: !1626)
!1648 = !DILocation(line: 10, column: 2, scope: !1626)
!1649 = !DILocation(line: 10, column: 7, scope: !1626)
!1650 = !{!1644, !1644, i64 0}
!1651 = !DILocation(line: 11, column: 15, scope: !1626)
!1652 = !DILocation(line: 12, column: 15, scope: !1626)
!1653 = !DILocation(line: 13, column: 2, scope: !1626)
!1654 = !DILocation(line: 13, column: 8, scope: !1626)
!1655 = !{!1656, !1656, i64 0}
!1656 = !{!"float", !1644, i64 0}
!1657 = !DILocation(line: 14, column: 16, scope: !1626)
!1658 = !DILocation(line: 15, column: 16, scope: !1626)
!1659 = !DILocation(line: 16, column: 2, scope: !1626)
!1660 = !DILocation(line: 16, column: 9, scope: !1626)
!1661 = !{!1662, !1662, i64 0}
!1662 = !{!"double", !1644, i64 0}
!1663 = !DILocation(line: 17, column: 17, scope: !1626)
!1664 = !DILocation(line: 18, column: 17, scope: !1626)
!1665 = !DILocation(line: 19, column: 2, scope: !1626)
!1666 = !DILocation(line: 19, column: 7, scope: !1626)
!1667 = !{!1668, !1668, i64 0}
!1668 = !{!"bool", !1644, i64 0}
!1669 = !DILocation(line: 20, column: 15, scope: !1626)
!1670 = !DILocation(line: 21, column: 15, scope: !1626)
!1671 = !DILocation(line: 22, column: 2, scope: !1626)
!1672 = !DILocation(line: 23, column: 1, scope: !1626)
!1673 = distinct !DISubprogram(name: "basic_string", linkageName: "??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@QEBD@Z", scope: !39, file: !40, line: 2517, type: !465, scopeLine: 2517, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !464, retainedNodes: !1674)
!1674 = !{!1675, !1676, !1678, !1680}
!1675 = !DILocalVariable(name: "_Ptr", arg: 2, scope: !1673, file: !40, line: 2517, type: !308)
!1676 = !DILocalVariable(name: "this", arg: 1, scope: !1673, type: !1677, flags: DIFlagArtificial | DIFlagObjectPointer)
!1677 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!1678 = !DILocalVariable(name: "_Alproxy", scope: !1679, file: !40, line: 2518, type: !203)
!1679 = distinct !DILexicalBlock(scope: !1673, file: !40, line: 2517, column: 113)
!1680 = !DILocalVariable(name: "_Proxy", scope: !1679, file: !40, line: 2519, type: !1681)
!1681 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Container_proxy_ptr<std::basic_string<char>::_Alty>", scope: !2, file: !3, line: 1344, baseType: !1682)
!1682 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Fake_proxy_ptr_impl", scope: !2, file: !3, line: 1284, size: 8, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !1683, identifier: ".?AU_Fake_proxy_ptr_impl@std@@")
!1683 = !{!1684, !1690, !1694, !1703, !1708, !1712}
!1684 = !DISubprogram(name: "_Fake_proxy_ptr_impl", scope: !1682, file: !3, line: 1285, type: !1685, scopeLine: 1285, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized | DISPFlagDeleted)
!1685 = !DISubroutineType(types: !1686)
!1686 = !{null, !1687, !1688}
!1687 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1682, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1688 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1689, size: 64)
!1689 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1682)
!1690 = !DISubprogram(name: "operator=", linkageName: "??4_Fake_proxy_ptr_impl@std@@QEAAAEAU01@AEBU01@@Z", scope: !1682, file: !3, line: 1286, type: !1691, scopeLine: 1286, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized | DISPFlagDeleted)
!1691 = !DISubroutineType(types: !1692)
!1692 = !{!1693, !1687, !1688}
!1693 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1682, size: 64)
!1694 = !DISubprogram(name: "_Fake_proxy_ptr_impl", scope: !1682, file: !3, line: 1287, type: !1695, scopeLine: 1287, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1695 = !DISubroutineType(types: !1696)
!1696 = !{null, !1687, !203, !1697}
!1697 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Leave_proxy_unbound", scope: !2, file: !3, line: 1280, size: 8, flags: DIFlagTypePassByValue, elements: !1698, identifier: ".?AU_Leave_proxy_unbound@std@@")
!1698 = !{!1699}
!1699 = !DISubprogram(name: "_Leave_proxy_unbound", scope: !1697, file: !3, line: 1281, type: !1700, scopeLine: 1281, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1700 = !DISubroutineType(types: !1701)
!1701 = !{null, !1702}
!1702 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1697, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1703 = !DISubprogram(name: "_Fake_proxy_ptr_impl", scope: !1682, file: !3, line: 1288, type: !1704, scopeLine: 1288, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1704 = !DISubroutineType(types: !1705)
!1705 = !{null, !1687, !203, !1706}
!1706 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1707, size: 64)
!1707 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !190)
!1708 = !DISubprogram(name: "_Bind", linkageName: "?_Bind@_Fake_proxy_ptr_impl@std@@QEAAXAEBU_Fake_allocator@2@PEAU_Container_base0@2@@Z", scope: !1682, file: !3, line: 1290, type: !1709, scopeLine: 1290, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1709 = !DISubroutineType(types: !1710)
!1710 = !{null, !1687, !203, !1711}
!1711 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !190, size: 64)
!1712 = !DISubprogram(name: "_Release", linkageName: "?_Release@_Fake_proxy_ptr_impl@std@@QEAAXXZ", scope: !1682, file: !3, line: 1291, type: !1713, scopeLine: 1291, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1713 = !DISubroutineType(types: !1714)
!1714 = !{null, !1687}
!1715 = !{!1716, !1716, i64 0}
!1716 = !{!"any pointer", !1644, i64 0}
!1717 = !DILocation(line: 2517, column: 67, scope: !1673)
!1718 = !DILocation(line: 0, scope: !1673)
!1719 = !DILocation(line: 2517, column: 75, scope: !1673)
!1720 = !DILocation(line: 2518, column: 9, scope: !1679)
!1721 = !DILocation(line: 2518, column: 16, scope: !1679)
!1722 = !DILocation(line: 2519, column: 9, scope: !1679)
!1723 = !DILocation(line: 2519, column: 37, scope: !1679)
!1724 = !DILocation(line: 2519, column: 54, scope: !1679)
!1725 = !DILocation(line: 2519, column: 62, scope: !1679)
!1726 = !DILocation(line: 2520, column: 9, scope: !1679)
!1727 = !DILocation(line: 2521, column: 16, scope: !1679)
!1728 = !DILocation(line: 2521, column: 9, scope: !1679)
!1729 = !DILocation(line: 2522, column: 16, scope: !1679)
!1730 = !DILocation(line: 2523, column: 5, scope: !1673)
!1731 = !DILocation(line: 2523, column: 5, scope: !1679)
!1732 = distinct !DISubprogram(name: "operator=", linkageName: "??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@QEBD@Z", scope: !39, file: !40, line: 3091, type: !559, scopeLine: 3091, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !558, retainedNodes: !1733)
!1733 = !{!1734, !1735}
!1734 = !DILocalVariable(name: "_Ptr", arg: 2, scope: !1732, file: !40, line: 3091, type: !308)
!1735 = !DILocalVariable(name: "this", arg: 1, scope: !1732, type: !1677, flags: DIFlagArtificial | DIFlagObjectPointer)
!1736 = !DILocation(line: 3091, column: 78, scope: !1732)
!1737 = !DILocation(line: 0, scope: !1732)
!1738 = !DILocation(line: 3092, column: 23, scope: !1732)
!1739 = !DILocation(line: 3092, column: 16, scope: !1732)
!1740 = !DILocation(line: 3092, column: 9, scope: !1732)
!1741 = distinct !DISubprogram(name: "~basic_string", linkageName: "??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ", scope: !39, file: !40, line: 3002, type: !446, scopeLine: 3002, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !547, retainedNodes: !1742)
!1742 = !{!1743}
!1743 = !DILocalVariable(name: "this", arg: 1, scope: !1741, type: !1677, flags: DIFlagArtificial | DIFlagObjectPointer)
!1744 = !DILocation(line: 0, scope: !1741)
!1745 = !DILocation(line: 3003, column: 9, scope: !1746)
!1746 = distinct !DILexicalBlock(scope: !1741, file: !40, line: 3002, column: 53)
!1747 = !DILocation(line: 3010, column: 5, scope: !1746)
!1748 = !DILocation(line: 3010, column: 5, scope: !1741)
!1749 = distinct !DISubprogram(name: "_Tidy_deallocate", linkageName: "?_Tidy_deallocate@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ", scope: !39, file: !40, line: 4616, type: !446, scopeLine: 4616, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !801, retainedNodes: !1750)
!1750 = !{!1751, !1752, !1756}
!1751 = !DILocalVariable(name: "this", arg: 1, scope: !1749, type: !1677, flags: DIFlagArtificial | DIFlagObjectPointer)
!1752 = !DILocalVariable(name: "_Ptr", scope: !1753, file: !40, line: 4619, type: !1755)
!1753 = distinct !DILexicalBlock(scope: !1754, file: !40, line: 4618, column: 54)
!1754 = distinct !DILexicalBlock(scope: !1749, file: !40, line: 4618, column: 13)
!1755 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !394)
!1756 = !DILocalVariable(name: "_Al", scope: !1753, file: !40, line: 4620, type: !103)
!1757 = !DILocation(line: 0, scope: !1749)
!1758 = !DILocation(line: 4617, column: 9, scope: !1749)
!1759 = !DILocation(line: 4617, column: 17, scope: !1749)
!1760 = !DILocation(line: 4617, column: 25, scope: !1749)
!1761 = !DILocation(line: 4618, column: 13, scope: !1754)
!1762 = !DILocation(line: 4618, column: 21, scope: !1754)
!1763 = !DILocation(line: 4618, column: 29, scope: !1754)
!1764 = !DILocation(line: 4618, column: 13, scope: !1749)
!1765 = !DILocation(line: 4619, column: 13, scope: !1753)
!1766 = !DILocation(line: 4619, column: 27, scope: !1753)
!1767 = !DILocation(line: 4619, column: 34, scope: !1753)
!1768 = !DILocation(line: 4619, column: 42, scope: !1753)
!1769 = !DILocation(line: 4619, column: 50, scope: !1753)
!1770 = !DILocation(line: 4619, column: 54, scope: !1753)
!1771 = !DILocation(line: 4620, column: 13, scope: !1753)
!1772 = !DILocation(line: 4620, column: 19, scope: !1753)
!1773 = !DILocation(line: 4620, column: 34, scope: !1753)
!1774 = !DILocation(line: 4621, column: 31, scope: !1753)
!1775 = !DILocation(line: 4621, column: 39, scope: !1753)
!1776 = !DILocation(line: 4621, column: 47, scope: !1753)
!1777 = !DILocation(line: 4621, column: 51, scope: !1753)
!1778 = !DILocation(line: 4621, column: 13, scope: !1753)
!1779 = !DILocation(line: 4622, column: 13, scope: !1753)
!1780 = !DILocation(line: 4622, column: 34, scope: !1753)
!1781 = !DILocation(line: 4622, column: 42, scope: !1753)
!1782 = !DILocation(line: 4622, column: 50, scope: !1753)
!1783 = !{!1784, !1787, i64 24}
!1784 = !{!"?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@", !1785, i64 0}
!1785 = !{!"?AV?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@", !1786, i64 0}
!1786 = !{!"?AV?$_String_val@U?$_Simple_types@D@std@@@std@@", !1644, i64 0, !1787, i64 16, !1787, i64 24}
!1787 = !{!"long long", !1644, i64 0}
!1788 = !DILocation(line: 4622, column: 57, scope: !1753)
!1789 = !DILocation(line: 4622, column: 28, scope: !1753)
!1790 = !DILocation(line: 4622, column: 17, scope: !1753)
!1791 = !DILocation(line: 4623, column: 9, scope: !1754)
!1792 = !DILocation(line: 4623, column: 9, scope: !1753)
!1793 = !DILocation(line: 4633, column: 13, scope: !1794)
!1794 = distinct !DILexicalBlock(scope: !1749, file: !40, line: 4632, column: 9)
!1795 = !DILocation(line: 4633, column: 21, scope: !1794)
!1796 = !DILocation(line: 4633, column: 29, scope: !1794)
!1797 = !DILocation(line: 4633, column: 37, scope: !1794)
!1798 = !{!1784, !1787, i64 16}
!1799 = !DILocation(line: 4634, column: 13, scope: !1794)
!1800 = !DILocation(line: 4634, column: 21, scope: !1794)
!1801 = !DILocation(line: 4634, column: 29, scope: !1794)
!1802 = !DILocation(line: 4634, column: 37, scope: !1794)
!1803 = !DILocation(line: 4636, column: 58, scope: !1794)
!1804 = !DILocation(line: 4636, column: 29, scope: !1794)
!1805 = !DILocation(line: 4636, column: 37, scope: !1794)
!1806 = !DILocation(line: 4636, column: 45, scope: !1794)
!1807 = !DILocation(line: 4636, column: 49, scope: !1794)
!1808 = !DILocation(line: 4636, column: 13, scope: !1794)
!1809 = !DILocation(line: 4638, column: 5, scope: !1749)
!1810 = distinct !DISubprogram(name: "~_Compressed_pair", linkageName: "??1?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@XZ", scope: !418, file: !3, line: 1361, type: !1811, scopeLine: 1361, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !1813, retainedNodes: !1814)
!1811 = !DISubroutineType(types: !1812)
!1812 = !{null, !426}
!1813 = !DISubprogram(name: "~_Compressed_pair", scope: !418, type: !1811, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1814 = !{!1815}
!1815 = !DILocalVariable(name: "this", arg: 1, scope: !1810, type: !1816, flags: DIFlagArtificial | DIFlagObjectPointer)
!1816 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !418, size: 64)
!1817 = !DILocation(line: 0, scope: !1810)
!1818 = !DILocation(line: 1361, column: 7, scope: !1819)
!1819 = distinct !DILexicalBlock(scope: !1810, file: !3, line: 1361, column: 7)
!1820 = !DILocation(line: 1361, column: 7, scope: !1810)
!1821 = distinct !DISubprogram(name: "_Orphan_all", linkageName: "?_Orphan_all@_Container_base0@std@@QEAAXXZ", scope: !190, file: !3, line: 1037, type: !193, scopeLine: 1037, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !192, retainedNodes: !1822)
!1822 = !{!1823}
!1823 = !DILocalVariable(name: "this", arg: 1, scope: !1821, type: !1711, flags: DIFlagArtificial | DIFlagObjectPointer)
!1824 = !DILocation(line: 0, scope: !1821)
!1825 = !DILocation(line: 1037, column: 57, scope: !1821)
!1826 = distinct !DISubprogram(name: "_Large_string_engaged", linkageName: "?_Large_string_engaged@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_NXZ", scope: !186, file: !40, line: 2313, type: !264, scopeLine: 2313, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !263, retainedNodes: !1827)
!1827 = !{!1828}
!1828 = !DILocalVariable(name: "this", arg: 1, scope: !1826, type: !1829, flags: DIFlagArtificial | DIFlagObjectPointer)
!1829 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !262, size: 64)
!1830 = !DILocation(line: 0, scope: !1826)
!1831 = !DILocation(line: 2319, column: 29, scope: !1826)
!1832 = !{!1786, !1787, i64 24}
!1833 = !DILocation(line: 2319, column: 26, scope: !1826)
!1834 = !DILocation(line: 2319, column: 9, scope: !1826)
!1835 = distinct !DISubprogram(name: "_Getal", linkageName: "?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV?$allocator@D@2@XZ", scope: !39, file: !40, line: 4650, type: !805, scopeLine: 4650, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !804, retainedNodes: !1836)
!1836 = !{!1837}
!1837 = !DILocalVariable(name: "this", arg: 1, scope: !1835, type: !1677, flags: DIFlagArtificial | DIFlagObjectPointer)
!1838 = !DILocation(line: 0, scope: !1835)
!1839 = !DILocation(line: 4651, column: 16, scope: !1835)
!1840 = !DILocation(line: 4651, column: 24, scope: !1835)
!1841 = !DILocation(line: 4651, column: 9, scope: !1835)
!1842 = distinct !DISubprogram(name: "_Destroy_in_place<char *>", linkageName: "??$_Destroy_in_place@PEAD@std@@YAXAEAPEAD@Z", scope: !2, file: !3, line: 307, type: !1843, scopeLine: 307, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, templateParams: !1848, retainedNodes: !1846)
!1843 = !DISubroutineType(types: !1844)
!1844 = !{null, !1845}
!1845 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !32, size: 64)
!1846 = !{!1847}
!1847 = !DILocalVariable(name: "_Obj", arg: 1, scope: !1842, file: !3, line: 307, type: !1845)
!1848 = !{!1849}
!1849 = !DITemplateTypeParameter(name: "_Ty", type: !32)
!1850 = !DILocation(line: 307, column: 51, scope: !1842)
!1851 = !DILocation(line: 311, column: 9, scope: !1852)
!1852 = distinct !DILexicalBlock(scope: !1853, file: !3, line: 310, column: 12)
!1853 = distinct !DILexicalBlock(scope: !1842, file: !3, line: 308, column: 19)
!1854 = !DILocation(line: 313, column: 1, scope: !1842)
!1855 = distinct !DISubprogram(name: "deallocate", linkageName: "?deallocate@?$allocator@D@std@@QEAAXQEAD_K@Z", scope: !48, file: !3, line: 833, type: !105, scopeLine: 833, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !104, retainedNodes: !1856)
!1856 = !{!1857, !1858, !1859}
!1857 = !DILocalVariable(name: "_Count", arg: 3, scope: !1855, file: !3, line: 833, type: !108)
!1858 = !DILocalVariable(name: "_Ptr", arg: 2, scope: !1855, file: !3, line: 833, type: !107)
!1859 = !DILocalVariable(name: "this", arg: 1, scope: !1855, type: !1860, flags: DIFlagArtificial | DIFlagObjectPointer)
!1860 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!1861 = !{!1787, !1787, i64 0}
!1862 = !DILocation(line: 833, column: 73, scope: !1855)
!1863 = !DILocation(line: 833, column: 54, scope: !1855)
!1864 = !DILocation(line: 0, scope: !1855)
!1865 = !DILocation(line: 835, column: 60, scope: !1855)
!1866 = !DILocation(line: 835, column: 58, scope: !1855)
!1867 = !DILocation(line: 835, column: 40, scope: !1855)
!1868 = !DILocation(line: 835, column: 9, scope: !1855)
!1869 = !DILocation(line: 836, column: 5, scope: !1855)
!1870 = distinct !DISubprogram(name: "assign", linkageName: "?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z", scope: !282, file: !40, line: 449, type: !326, scopeLine: 449, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !369, retainedNodes: !1871)
!1871 = !{!1872, !1873}
!1872 = !DILocalVariable(name: "_Right", arg: 2, scope: !1870, file: !40, line: 449, type: !57)
!1873 = !DILocalVariable(name: "_Left", arg: 1, scope: !1870, file: !40, line: 449, type: !55)
!1874 = !DILocation(line: 449, column: 64, scope: !1870)
!1875 = !DILocation(line: 449, column: 44, scope: !1870)
!1876 = !DILocation(line: 450, column: 17, scope: !1870)
!1877 = !DILocation(line: 450, column: 9, scope: !1870)
!1878 = !DILocation(line: 450, column: 15, scope: !1870)
!1879 = !DILocation(line: 451, column: 5, scope: !1870)
!1880 = distinct !DISubprogram(name: "_Get_first", linkageName: "?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAAAEAV?$allocator@D@2@XZ", scope: !418, file: !3, line: 1377, type: !424, scopeLine: 1377, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !423, retainedNodes: !1881)
!1881 = !{!1882}
!1882 = !DILocalVariable(name: "this", arg: 1, scope: !1880, type: !1816, flags: DIFlagArtificial | DIFlagObjectPointer)
!1883 = !DILocation(line: 0, scope: !1880)
!1884 = !DILocation(line: 1378, column: 16, scope: !1880)
!1885 = !DILocation(line: 1378, column: 9, scope: !1880)
!1886 = distinct !DISubprogram(name: "_Deallocate<16,0>", linkageName: "??$_Deallocate@$0BA@$0A@@std@@YAXPEAX_K@Z", scope: !2, file: !3, line: 251, type: !1887, scopeLine: 251, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, templateParams: !1892, retainedNodes: !1889)
!1887 = !DISubroutineType(types: !1888)
!1888 = !{null, !29, !30}
!1889 = !{!1890, !1891}
!1890 = !DILocalVariable(name: "_Bytes", arg: 2, scope: !1886, file: !3, line: 251, type: !30)
!1891 = !DILocalVariable(name: "_Ptr", arg: 1, scope: !1886, file: !3, line: 251, type: !29)
!1892 = !{!1893, !1894}
!1893 = !DITemplateValueParameter(name: "_Align", type: !28, value: i64 16)
!1894 = !DITemplateValueParameter(type: !12, value: i32 0)
!1895 = !DILocation(line: 251, column: 59, scope: !1886)
!1896 = !DILocation(line: 251, column: 46, scope: !1886)
!1897 = !DILocation(line: 260, column: 13, scope: !1898)
!1898 = distinct !DILexicalBlock(scope: !1899, file: !3, line: 260, column: 13)
!1899 = distinct !DILexicalBlock(scope: !1886, file: !3, line: 258, column: 5)
!1900 = !DILocation(line: 260, column: 20, scope: !1898)
!1901 = !DILocation(line: 260, column: 13, scope: !1899)
!1902 = !DILocation(line: 261, column: 13, scope: !1903)
!1903 = distinct !DILexicalBlock(scope: !1898, file: !3, line: 260, column: 50)
!1904 = !DILocation(line: 262, column: 9, scope: !1903)
!1905 = !DILocation(line: 264, column: 33, scope: !1899)
!1906 = !DILocation(line: 264, column: 27, scope: !1899)
!1907 = !DILocation(line: 264, column: 9, scope: !1899)
!1908 = !DILocation(line: 266, column: 1, scope: !1886)
!1909 = distinct !DISubprogram(name: "_Adjust_manually_vector_aligned", linkageName: "?_Adjust_manually_vector_aligned@std@@YAXAEAPEAXAEA_K@Z", scope: !2, file: !3, line: 153, type: !1910, scopeLine: 153, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !1914)
!1910 = !DISubroutineType(types: !1911)
!1911 = !{null, !1912, !1913}
!1912 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !29, size: 64)
!1913 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !30, size: 64)
!1914 = !{!1915, !1916, !1917, !1921, !1922, !1923}
!1915 = !DILocalVariable(name: "_Bytes", arg: 2, scope: !1909, file: !3, line: 153, type: !1913)
!1916 = !DILocalVariable(name: "_Ptr", arg: 1, scope: !1909, file: !3, line: 153, type: !1912)
!1917 = !DILocalVariable(name: "_Ptr_user", scope: !1909, file: !3, line: 157, type: !1918)
!1918 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1919)
!1919 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1920, size: 64)
!1920 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !26)
!1921 = !DILocalVariable(name: "_Ptr_container", scope: !1909, file: !3, line: 158, type: !1920)
!1922 = !DILocalVariable(name: "_Min_back_shift", scope: !1909, file: !3, line: 169, type: !1920)
!1923 = !DILocalVariable(name: "_Back_shift", scope: !1909, file: !3, line: 171, type: !1920)
!1924 = !DILocation(line: 153, column: 66, scope: !1909)
!1925 = !DILocation(line: 153, column: 52, scope: !1909)
!1926 = !DILocation(line: 155, column: 5, scope: !1909)
!1927 = !DILocation(line: 155, column: 12, scope: !1909)
!1928 = !DILocation(line: 157, column: 5, scope: !1909)
!1929 = !DILocation(line: 157, column: 28, scope: !1909)
!1930 = !DILocation(line: 157, column: 69, scope: !1909)
!1931 = !DILocation(line: 157, column: 40, scope: !1909)
!1932 = !DILocation(line: 158, column: 5, scope: !1909)
!1933 = !DILocation(line: 158, column: 21, scope: !1909)
!1934 = !DILocation(line: 158, column: 40, scope: !1909)
!1935 = !DILocation(line: 169, column: 5, scope: !1909)
!1936 = !DILocation(line: 169, column: 25, scope: !1909)
!1937 = !DILocation(line: 171, column: 5, scope: !1909)
!1938 = !DILocation(line: 171, column: 21, scope: !1909)
!1939 = !DILocation(line: 171, column: 63, scope: !1909)
!1940 = !DILocation(line: 171, column: 35, scope: !1909)
!1941 = !DILocation(line: 171, column: 71, scope: !1909)
!1942 = !DILocation(line: 171, column: 69, scope: !1909)
!1943 = !DILocation(line: 172, column: 5, scope: !1909)
!1944 = !DILocation(line: 172, column: 5, scope: !1945)
!1945 = distinct !DILexicalBlock(scope: !1946, file: !3, line: 172, column: 5)
!1946 = distinct !DILexicalBlock(scope: !1909, file: !3, line: 172, column: 5)
!1947 = !DILocation(line: 172, column: 5, scope: !1946)
!1948 = !DILocation(line: 172, column: 5, scope: !1949)
!1949 = distinct !DILexicalBlock(scope: !1945, file: !3, line: 172, column: 5)
!1950 = !DILocation(line: 172, column: 5, scope: !1951)
!1951 = distinct !DILexicalBlock(scope: !1945, file: !3, line: 172, column: 5)
!1952 = !DILocation(line: 172, column: 5, scope: !1953)
!1953 = distinct !DILexicalBlock(scope: !1951, file: !3, line: 172, column: 5)
!1954 = !DILocation(line: 173, column: 36, scope: !1909)
!1955 = !DILocation(line: 173, column: 12, scope: !1909)
!1956 = !DILocation(line: 173, column: 5, scope: !1909)
!1957 = !DILocation(line: 173, column: 10, scope: !1909)
!1958 = !DILocation(line: 174, column: 1, scope: !1909)
!1959 = distinct !DISubprogram(name: "~_String_val", linkageName: "??1?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ", scope: !186, file: !40, line: 2274, type: !250, scopeLine: 2274, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !1960, retainedNodes: !1961)
!1960 = !DISubprogram(name: "~_String_val", scope: !186, type: !250, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1961 = !{!1962}
!1962 = !DILocalVariable(name: "this", arg: 1, scope: !1959, type: !1963, flags: DIFlagArtificial | DIFlagObjectPointer)
!1963 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !186, size: 64)
!1964 = !DILocation(line: 0, scope: !1959)
!1965 = !DILocation(line: 2274, column: 7, scope: !1966)
!1966 = distinct !DILexicalBlock(scope: !1959, file: !40, line: 2274, column: 7)
!1967 = !DILocation(line: 2274, column: 7, scope: !1959)
!1968 = distinct !DISubprogram(name: "~_Bxty", linkageName: "??1_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ", scope: !232, file: !40, line: 2348, type: !242, scopeLine: 2348, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !245, retainedNodes: !1969)
!1969 = !{!1970}
!1970 = !DILocalVariable(name: "this", arg: 1, scope: !1968, type: !1971, flags: DIFlagArtificial | DIFlagObjectPointer)
!1971 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !232, size: 64)
!1972 = !DILocation(line: 0, scope: !1968)
!1973 = !DILocation(line: 2348, column: 51, scope: !1968)
!1974 = distinct !DISubprogram(name: "_Compressed_pair<>", linkageName: "??$?0$$V@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@U_Zero_then_variadic_args_t@1@@Z", scope: !418, file: !3, line: 1368, type: !1975, scopeLine: 1370, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, templateParams: !1984, declaration: !1983, retainedNodes: !1986)
!1975 = !DISubroutineType(types: !1976)
!1976 = !{null, !426, !1977}
!1977 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Zero_then_variadic_args_t", scope: !2, file: !3, line: 1352, size: 8, flags: DIFlagTypePassByValue, elements: !1978, identifier: ".?AU_Zero_then_variadic_args_t@std@@")
!1978 = !{!1979}
!1979 = !DISubprogram(name: "_Zero_then_variadic_args_t", scope: !1977, file: !3, line: 1353, type: !1980, scopeLine: 1353, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1980 = !DISubroutineType(types: !1981)
!1981 = !{null, !1982}
!1982 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1977, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1983 = !DISubprogram(name: "_Compressed_pair<>", scope: !418, file: !3, line: 1368, type: !1975, scopeLine: 1368, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized, templateParams: !1984)
!1984 = !{!1985}
!1985 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Other2", value: !6)
!1986 = !{!1987, !1988}
!1987 = !DILocalVariable(arg: 2, scope: !1974, file: !3, line: 1368, type: !1977)
!1988 = !DILocalVariable(name: "this", arg: 1, scope: !1974, type: !1816, flags: DIFlagArtificial | DIFlagObjectPointer)
!1989 = !DILocation(line: 1368, column: 67, scope: !1974)
!1990 = !DILocation(line: 0, scope: !1974)
!1991 = !DILocation(line: 1370, column: 60, scope: !1974)
!1992 = !DILocation(line: 1370, column: 11, scope: !1974)
!1993 = !DILocation(line: 1370, column: 19, scope: !1974)
!1994 = !DILocation(line: 1370, column: 61, scope: !1974)
!1995 = distinct !DISubprogram(name: "_Fake_proxy_ptr_impl", linkageName: "??0_Fake_proxy_ptr_impl@std@@QEAA@AEBU_Fake_allocator@1@AEBU_Container_base0@1@@Z", scope: !1682, file: !3, line: 1288, type: !1704, scopeLine: 1288, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !1703, retainedNodes: !1996)
!1996 = !{!1997, !1998, !1999}
!1997 = !DILocalVariable(arg: 3, scope: !1995, file: !3, line: 1288, type: !1706)
!1998 = !DILocalVariable(arg: 2, scope: !1995, file: !3, line: 1288, type: !203)
!1999 = !DILocalVariable(name: "this", arg: 1, scope: !1995, type: !2000, flags: DIFlagArtificial | DIFlagObjectPointer)
!2000 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1682, size: 64)
!2001 = !DILocation(line: 1288, column: 96, scope: !1995)
!2002 = !DILocation(line: 1288, column: 71, scope: !1995)
!2003 = !DILocation(line: 0, scope: !1995)
!2004 = !DILocation(line: 1288, column: 108, scope: !1995)
!2005 = distinct !DISubprogram(name: "_Tidy_init", linkageName: "?_Tidy_init@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ", scope: !39, file: !40, line: 4594, type: !446, scopeLine: 4594, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !800, retainedNodes: !2006)
!2006 = !{!2007, !2008}
!2007 = !DILocalVariable(name: "this", arg: 1, scope: !2005, type: !1677, flags: DIFlagArtificial | DIFlagObjectPointer)
!2008 = !DILocalVariable(name: "_My_data", scope: !2005, file: !40, line: 4595, type: !2009)
!2009 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !186, size: 64)
!2010 = !DILocation(line: 0, scope: !2005)
!2011 = !DILocation(line: 4595, column: 9, scope: !2005)
!2012 = !DILocation(line: 4595, column: 15, scope: !2005)
!2013 = !DILocation(line: 4595, column: 28, scope: !2005)
!2014 = !DILocation(line: 4595, column: 36, scope: !2005)
!2015 = !DILocation(line: 4596, column: 9, scope: !2005)
!2016 = !DILocation(line: 4596, column: 18, scope: !2005)
!2017 = !DILocation(line: 4596, column: 26, scope: !2005)
!2018 = !{!1786, !1787, i64 16}
!2019 = !DILocation(line: 4610, column: 13, scope: !2020)
!2020 = distinct !DILexicalBlock(scope: !2005, file: !40, line: 4609, column: 9)
!2021 = !DILocation(line: 4610, column: 22, scope: !2020)
!2022 = !DILocation(line: 4610, column: 29, scope: !2020)
!2023 = !DILocation(line: 4612, column: 51, scope: !2020)
!2024 = !DILocation(line: 4612, column: 29, scope: !2020)
!2025 = !DILocation(line: 4612, column: 38, scope: !2020)
!2026 = !DILocation(line: 4612, column: 42, scope: !2020)
!2027 = !DILocation(line: 4612, column: 13, scope: !2020)
!2028 = !DILocation(line: 4614, column: 5, scope: !2005)
!2029 = distinct !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD@Z", scope: !39, file: !40, line: 3263, type: !559, scopeLine: 3263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !583, retainedNodes: !2030)
!2030 = !{!2031, !2032}
!2031 = !DILocalVariable(name: "_Ptr", arg: 2, scope: !2029, file: !40, line: 3263, type: !308)
!2032 = !DILocalVariable(name: "this", arg: 1, scope: !2029, type: !1677, flags: DIFlagArtificial | DIFlagObjectPointer)
!2033 = !DILocation(line: 3263, column: 75, scope: !2029)
!2034 = !DILocation(line: 0, scope: !2029)
!2035 = !DILocation(line: 3264, column: 70, scope: !2029)
!2036 = !DILocation(line: 3264, column: 54, scope: !2029)
!2037 = !DILocation(line: 3264, column: 29, scope: !2029)
!2038 = !DILocation(line: 3264, column: 23, scope: !2029)
!2039 = !DILocation(line: 3264, column: 16, scope: !2029)
!2040 = !DILocation(line: 3264, column: 9, scope: !2029)
!2041 = distinct !DISubprogram(name: "_Release", linkageName: "?_Release@_Fake_proxy_ptr_impl@std@@QEAAXXZ", scope: !1682, file: !3, line: 1291, type: !1713, scopeLine: 1291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !1712, retainedNodes: !2042)
!2042 = !{!2043}
!2043 = !DILocalVariable(name: "this", arg: 1, scope: !2041, type: !2000, flags: DIFlagArtificial | DIFlagObjectPointer)
!2044 = !DILocation(line: 0, scope: !2041)
!2045 = !DILocation(line: 1291, column: 54, scope: !2041)
!2046 = distinct !DISubprogram(name: "allocator", linkageName: "??0?$allocator@D@std@@QEAA@XZ", scope: !48, file: !3, line: 825, type: !92, scopeLine: 825, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !91, retainedNodes: !2047)
!2047 = !{!2048}
!2048 = !DILocalVariable(name: "this", arg: 1, scope: !2046, type: !1860, flags: DIFlagArtificial | DIFlagObjectPointer)
!2049 = !DILocation(line: 0, scope: !2046)
!2050 = !DILocation(line: 825, column: 37, scope: !2046)
!2051 = distinct !DISubprogram(name: "_String_val", linkageName: "??0?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ", scope: !186, file: !40, line: 2284, type: !250, scopeLine: 2284, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !249, retainedNodes: !2052)
!2052 = !{!2053}
!2053 = !DILocalVariable(name: "this", arg: 1, scope: !2051, type: !1963, flags: DIFlagArtificial | DIFlagObjectPointer)
!2054 = !DILocation(line: 0, scope: !2051)
!2055 = !DILocation(line: 2284, column: 59, scope: !2051)
!2056 = !DILocation(line: 2284, column: 53, scope: !2051)
!2057 = !DILocation(line: 2355, column: 15, scope: !2051)
!2058 = !DILocation(line: 2356, column: 15, scope: !2051)
!2059 = !DILocation(line: 2284, column: 60, scope: !2051)
!2060 = distinct !DISubprogram(name: "_Bxty", linkageName: "??0_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ", scope: !232, file: !40, line: 2346, type: !242, scopeLine: 2346, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !241, retainedNodes: !2061)
!2061 = !{!2062}
!2062 = !DILocalVariable(name: "this", arg: 1, scope: !2060, type: !1971, flags: DIFlagArtificial | DIFlagObjectPointer)
!2063 = !DILocation(line: 0, scope: !2060)
!2064 = !DILocation(line: 2346, column: 51, scope: !2060)
!2065 = !DILocation(line: 2346, column: 59, scope: !2060)
!2066 = distinct !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD_K@Z", scope: !39, file: !40, line: 3243, type: !574, scopeLine: 3244, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !582, retainedNodes: !2067)
!2067 = !{!2068, !2069, !2070, !2071}
!2068 = !DILocalVariable(name: "_Count", arg: 3, scope: !2066, file: !40, line: 3244, type: !454)
!2069 = !DILocalVariable(name: "_Ptr", arg: 2, scope: !2066, file: !40, line: 3244, type: !308)
!2070 = !DILocalVariable(name: "this", arg: 1, scope: !2066, type: !1677, flags: DIFlagArtificial | DIFlagObjectPointer)
!2071 = !DILocalVariable(name: "_Old_ptr", scope: !2072, file: !40, line: 3247, type: !107)
!2072 = distinct !DILexicalBlock(scope: !2073, file: !40, line: 3246, column: 47)
!2073 = distinct !DILexicalBlock(scope: !2066, file: !40, line: 3246, column: 13)
!2074 = !DILocation(line: 3244, column: 88, scope: !2066)
!2075 = !DILocation(line: 3244, column: 47, scope: !2066)
!2076 = !DILocation(line: 0, scope: !2066)
!2077 = !DILocation(line: 3246, column: 13, scope: !2073)
!2078 = !DILocation(line: 3246, column: 23, scope: !2073)
!2079 = !DILocation(line: 3246, column: 31, scope: !2073)
!2080 = !DILocation(line: 3246, column: 39, scope: !2073)
!2081 = !DILocation(line: 3246, column: 20, scope: !2073)
!2082 = !DILocation(line: 3246, column: 13, scope: !2066)
!2083 = !DILocation(line: 3247, column: 13, scope: !2072)
!2084 = !DILocation(line: 3247, column: 26, scope: !2072)
!2085 = !DILocation(line: 3247, column: 39, scope: !2072)
!2086 = !DILocation(line: 3247, column: 47, scope: !2072)
!2087 = !DILocation(line: 3247, column: 55, scope: !2072)
!2088 = !DILocation(line: 3248, column: 39, scope: !2072)
!2089 = !DILocation(line: 3248, column: 13, scope: !2072)
!2090 = !DILocation(line: 3248, column: 21, scope: !2072)
!2091 = !DILocation(line: 3248, column: 29, scope: !2072)
!2092 = !DILocation(line: 3248, column: 37, scope: !2072)
!2093 = !DILocation(line: 3249, column: 43, scope: !2072)
!2094 = !DILocation(line: 3249, column: 37, scope: !2072)
!2095 = !DILocation(line: 3249, column: 27, scope: !2072)
!2096 = !DILocation(line: 3249, column: 13, scope: !2072)
!2097 = !DILocation(line: 3250, column: 47, scope: !2072)
!2098 = !DILocation(line: 3250, column: 29, scope: !2072)
!2099 = !DILocation(line: 3250, column: 38, scope: !2072)
!2100 = !DILocation(line: 3250, column: 13, scope: !2072)
!2101 = !DILocation(line: 3251, column: 13, scope: !2072)
!2102 = !DILocation(line: 3252, column: 9, scope: !2073)
!2103 = !DILocation(line: 3260, column: 13, scope: !2066)
!2104 = !DILocation(line: 3255, column: 13, scope: !2066)
!2105 = !DILocation(line: 3254, column: 16, scope: !2066)
!2106 = !DILocation(line: 3254, column: 9, scope: !2066)
!2107 = !DILocation(line: 3261, column: 5, scope: !2066)
!2108 = distinct !DISubprogram(name: "_Convert_size<unsigned long long>", linkageName: "??$_Convert_size@_K@std@@YA_K_K@Z", scope: !2, file: !3, line: 978, type: !2109, scopeLine: 978, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, templateParams: !2113, retainedNodes: !2111)
!2109 = !DISubroutineType(types: !2110)
!2110 = !{!30, !108}
!2111 = !{!2112}
!2112 = !DILocalVariable(name: "_Len", arg: 1, scope: !2108, file: !3, line: 978, type: !108)
!2113 = !{!2114}
!2114 = !DITemplateTypeParameter(name: "_Size_type", type: !28)
!2115 = !DILocation(line: 978, column: 64, scope: !2108)
!2116 = !DILocation(line: 980, column: 12, scope: !2108)
!2117 = !DILocation(line: 980, column: 5, scope: !2108)
!2118 = distinct !DISubprogram(name: "length", linkageName: "?length@?$_Narrow_char_traits@DH@std@@SA_KQEBD@Z", scope: !282, file: !40, line: 396, type: !363, scopeLine: 396, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !362, retainedNodes: !2119)
!2119 = !{!2120}
!2120 = !DILocalVariable(name: "_First", arg: 1, scope: !2118, file: !40, line: 396, type: !308)
!2121 = !DILocation(line: 396, column: 76, scope: !2118)
!2122 = !DILocation(line: 412, column: 59, scope: !2118)
!2123 = !DILocation(line: 412, column: 16, scope: !2118)
!2124 = !DILocation(line: 412, column: 9, scope: !2118)
!2125 = distinct !DISubprogram(name: "_Myptr", linkageName: "?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAAPEADXZ", scope: !186, file: !40, line: 2295, type: !254, scopeLine: 2295, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !253, retainedNodes: !2126)
!2126 = !{!2127, !2128}
!2127 = !DILocalVariable(name: "this", arg: 1, scope: !2125, type: !1963, flags: DIFlagArtificial | DIFlagObjectPointer)
!2128 = !DILocalVariable(name: "_Result", scope: !2125, file: !40, line: 2296, type: !256)
!2129 = !DILocation(line: 0, scope: !2125)
!2130 = !DILocation(line: 2296, column: 9, scope: !2125)
!2131 = !DILocation(line: 2296, column: 21, scope: !2125)
!2132 = !DILocation(line: 2296, column: 31, scope: !2125)
!2133 = !DILocation(line: 2296, column: 35, scope: !2125)
!2134 = !DILocation(line: 2297, column: 13, scope: !2135)
!2135 = distinct !DILexicalBlock(scope: !2125, file: !40, line: 2297, column: 13)
!2136 = !DILocation(line: 2297, column: 13, scope: !2125)
!2137 = !DILocation(line: 2298, column: 32, scope: !2138)
!2138 = distinct !DILexicalBlock(scope: !2135, file: !40, line: 2297, column: 38)
!2139 = !DILocation(line: 2298, column: 36, scope: !2138)
!2140 = !DILocation(line: 2298, column: 23, scope: !2138)
!2141 = !DILocation(line: 2298, column: 21, scope: !2138)
!2142 = !DILocation(line: 2299, column: 9, scope: !2138)
!2143 = !DILocation(line: 2301, column: 16, scope: !2125)
!2144 = !DILocation(line: 2302, column: 5, scope: !2125)
!2145 = !DILocation(line: 2301, column: 9, scope: !2125)
!2146 = distinct !DISubprogram(name: "move", linkageName: "?move@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z", scope: !285, file: !40, line: 79, type: !306, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !312, retainedNodes: !2147)
!2147 = !{!2148, !2149, !2150}
!2148 = !DILocalVariable(name: "_Count", arg: 3, scope: !2146, file: !40, line: 80, type: !108)
!2149 = !DILocalVariable(name: "_First2", arg: 2, scope: !2146, file: !40, line: 80, type: !308)
!2150 = !DILocalVariable(name: "_First1", arg: 1, scope: !2146, file: !40, line: 79, type: !107)
!2151 = !DILocation(line: 80, column: 69, scope: !2146)
!2152 = !DILocation(line: 80, column: 47, scope: !2146)
!2153 = !DILocation(line: 79, column: 75, scope: !2146)
!2154 = !DILocation(line: 83, column: 27, scope: !2146)
!2155 = !DILocation(line: 83, column: 36, scope: !2146)
!2156 = !DILocation(line: 83, column: 45, scope: !2146)
!2157 = !DILocation(line: 83, column: 52, scope: !2146)
!2158 = !DILocation(line: 83, column: 9, scope: !2146)
!2159 = !DILocation(line: 125, column: 16, scope: !2146)
!2160 = !DILocation(line: 125, column: 9, scope: !2146)
!2161 = distinct !DISubprogram(name: "_Reallocate_for<`lambda at C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\xstring:3256:13',const char *>", linkageName: "??$_Reallocate_for@V<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??assign@01@QEAAAEAV01@QEBD0@Z@PEBD@Z", scope: !39, file: !40, line: 4505, type: !2162, scopeLine: 4505, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, templateParams: !2166, declaration: !2165, retainedNodes: !2171)
!2162 = !DISubroutineType(types: !2163)
!2163 = !{!506, !439, !454, !2164, !37}
!2164 = distinct !DICompositeType(tag: DW_TAG_class_type, scope: !2066, file: !40, line: 3256, size: 8, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !6, identifier: ".?AV<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV23@QEBD_K@Z@")
!2165 = !DISubprogram(name: "_Reallocate_for<`lambda at C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\xstring:3256:13',const char *>", linkageName: "??$_Reallocate_for@V<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??assign@01@QEAAAEAV01@QEBD0@Z@PEBD@Z", scope: !39, file: !40, line: 4505, type: !2162, scopeLine: 4505, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, templateParams: !2166)
!2166 = !{!2167, !2168}
!2167 = !DITemplateTypeParameter(name: "_Fty", type: !2164)
!2168 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_ArgTys", value: !2169)
!2169 = !{!2170}
!2170 = !DITemplateTypeParameter(type: !37)
!2171 = !{!2172, !2173, !2174, !2175, !2176, !2177, !2178, !2179}
!2172 = !DILocalVariable(name: "_Args", arg: 4, scope: !2161, file: !40, line: 4505, type: !37)
!2173 = !DILocalVariable(name: "_Fn", arg: 3, scope: !2161, file: !40, line: 4505, type: !2164)
!2174 = !DILocalVariable(name: "_New_size", arg: 2, scope: !2161, file: !40, line: 4505, type: !454)
!2175 = !DILocalVariable(name: "this", arg: 1, scope: !2161, type: !1677, flags: DIFlagArtificial | DIFlagObjectPointer)
!2176 = !DILocalVariable(name: "_Old_capacity", scope: !2161, file: !40, line: 4512, type: !454)
!2177 = !DILocalVariable(name: "_New_capacity", scope: !2161, file: !40, line: 4513, type: !454)
!2178 = !DILocalVariable(name: "_Al", scope: !2161, file: !40, line: 4514, type: !103)
!2179 = !DILocalVariable(name: "_New_ptr", scope: !2161, file: !40, line: 4515, type: !1755)
!2180 = !DILocation(line: 4505, column: 106, scope: !2161)
!2181 = !DILocation(line: 4505, column: 90, scope: !2161)
!2182 = !DILocation(line: 4505, column: 74, scope: !2161)
!2183 = !DILocation(line: 0, scope: !2161)
!2184 = !DILocation(line: 4508, column: 13, scope: !2185)
!2185 = distinct !DILexicalBlock(scope: !2161, file: !40, line: 4508, column: 13)
!2186 = !DILocation(line: 4508, column: 25, scope: !2185)
!2187 = !DILocation(line: 4508, column: 23, scope: !2185)
!2188 = !DILocation(line: 4508, column: 13, scope: !2161)
!2189 = !DILocation(line: 4509, column: 13, scope: !2190)
!2190 = distinct !DILexicalBlock(scope: !2185, file: !40, line: 4508, column: 37)
!2191 = !DILocation(line: 4512, column: 9, scope: !2161)
!2192 = !DILocation(line: 4512, column: 25, scope: !2161)
!2193 = !DILocation(line: 4512, column: 41, scope: !2161)
!2194 = !DILocation(line: 4512, column: 49, scope: !2161)
!2195 = !DILocation(line: 4512, column: 57, scope: !2161)
!2196 = !DILocation(line: 4513, column: 9, scope: !2161)
!2197 = !DILocation(line: 4513, column: 25, scope: !2161)
!2198 = !DILocation(line: 4513, column: 59, scope: !2161)
!2199 = !DILocation(line: 4513, column: 41, scope: !2161)
!2200 = !DILocation(line: 4514, column: 9, scope: !2161)
!2201 = !DILocation(line: 4514, column: 15, scope: !2161)
!2202 = !DILocation(line: 4514, column: 41, scope: !2161)
!2203 = !DILocation(line: 4515, column: 9, scope: !2161)
!2204 = !DILocation(line: 4515, column: 23, scope: !2161)
!2205 = !DILocation(line: 4515, column: 41, scope: !2161)
!2206 = !DILocation(line: 4515, column: 54, scope: !2161)
!2207 = !DILocation(line: 4515, column: 68, scope: !2161)
!2208 = !DILocation(line: 4515, column: 45, scope: !2161)
!2209 = !DILocation(line: 4522, column: 9, scope: !2161)
!2210 = !DILocation(line: 4522, column: 17, scope: !2161)
!2211 = !DILocation(line: 4522, column: 25, scope: !2161)
!2212 = !DILocation(line: 4523, column: 35, scope: !2161)
!2213 = !DILocation(line: 4523, column: 9, scope: !2161)
!2214 = !DILocation(line: 4523, column: 17, scope: !2161)
!2215 = !DILocation(line: 4523, column: 25, scope: !2161)
!2216 = !DILocation(line: 4523, column: 33, scope: !2161)
!2217 = !DILocation(line: 4524, column: 35, scope: !2161)
!2218 = !DILocation(line: 4524, column: 9, scope: !2161)
!2219 = !DILocation(line: 4524, column: 17, scope: !2161)
!2220 = !DILocation(line: 4524, column: 25, scope: !2161)
!2221 = !DILocation(line: 4524, column: 33, scope: !2161)
!2222 = !DILocation(line: 4525, column: 44, scope: !2161)
!2223 = !DILocation(line: 4525, column: 33, scope: !2161)
!2224 = !DILocation(line: 4525, column: 22, scope: !2161)
!2225 = !DILocation(line: 4525, column: 13, scope: !2161)
!2226 = !DILocation(line: 4525, column: 9, scope: !2161)
!2227 = !DILocation(line: 4526, column: 26, scope: !2228)
!2228 = distinct !DILexicalBlock(scope: !2161, file: !40, line: 4526, column: 13)
!2229 = !DILocation(line: 4526, column: 23, scope: !2228)
!2230 = !DILocation(line: 4526, column: 13, scope: !2161)
!2231 = !DILocation(line: 4527, column: 13, scope: !2232)
!2232 = distinct !DILexicalBlock(scope: !2228, file: !40, line: 4526, column: 41)
!2233 = !DILocation(line: 4527, column: 54, scope: !2232)
!2234 = !DILocation(line: 4527, column: 68, scope: !2232)
!2235 = !DILocation(line: 4527, column: 28, scope: !2232)
!2236 = !DILocation(line: 4527, column: 36, scope: !2232)
!2237 = !DILocation(line: 4527, column: 44, scope: !2232)
!2238 = !DILocation(line: 4527, column: 48, scope: !2232)
!2239 = !DILocation(line: 4527, column: 17, scope: !2232)
!2240 = !DILocation(line: 4528, column: 40, scope: !2232)
!2241 = !DILocation(line: 4528, column: 13, scope: !2232)
!2242 = !DILocation(line: 4528, column: 21, scope: !2232)
!2243 = !DILocation(line: 4528, column: 29, scope: !2232)
!2244 = !DILocation(line: 4528, column: 33, scope: !2232)
!2245 = !DILocation(line: 4528, column: 38, scope: !2232)
!2246 = !DILocation(line: 4529, column: 9, scope: !2232)
!2247 = !DILocation(line: 4530, column: 33, scope: !2248)
!2248 = distinct !DILexicalBlock(scope: !2228, file: !40, line: 4529, column: 16)
!2249 = !DILocation(line: 4530, column: 41, scope: !2248)
!2250 = !DILocation(line: 4530, column: 49, scope: !2248)
!2251 = !DILocation(line: 4530, column: 53, scope: !2248)
!2252 = !DILocation(line: 4530, column: 13, scope: !2248)
!2253 = !DILocation(line: 4534, column: 5, scope: !2161)
!2254 = !DILocation(line: 4533, column: 9, scope: !2161)
!2255 = distinct !DISubprogram(name: "_Unfancy<char>", linkageName: "??$_Unfancy@D@std@@YAPEADPEAD@Z", scope: !2, file: !2256, line: 288, type: !964, scopeLine: 288, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, templateParams: !120, retainedNodes: !2257)
!2256 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\xstddef", directory: "", checksumkind: CSK_MD5, checksum: "9f716b3ccbb87fef0387470dd4655d4e")
!2257 = !{!2258}
!2258 = !DILocalVariable(name: "_Ptr", arg: 1, scope: !2255, file: !2256, line: 288, type: !32)
!2259 = !DILocation(line: 288, column: 41, scope: !2255)
!2260 = !DILocation(line: 289, column: 12, scope: !2255)
!2261 = !DILocation(line: 289, column: 5, scope: !2255)
!2262 = distinct !DISubprogram(name: "max_size", linkageName: "?max_size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ", scope: !39, file: !40, line: 3943, type: !702, scopeLine: 3943, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !705, retainedNodes: !2263)
!2263 = !{!2264, !2266, !2267}
!2264 = !DILocalVariable(name: "this", arg: 1, scope: !2262, type: !2265, flags: DIFlagArtificial | DIFlagObjectPointer)
!2265 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !441, size: 64)
!2266 = !DILocalVariable(name: "_Alloc_max", scope: !2262, file: !40, line: 3944, type: !454)
!2267 = !DILocalVariable(name: "_Storage_max", scope: !2262, file: !40, line: 3945, type: !454)
!2268 = !DILocation(line: 0, scope: !2262)
!2269 = !DILocation(line: 3944, column: 9, scope: !2262)
!2270 = !DILocation(line: 3944, column: 25, scope: !2262)
!2271 = !DILocation(line: 3944, column: 63, scope: !2262)
!2272 = !DILocation(line: 3944, column: 40, scope: !2262)
!2273 = !DILocation(line: 3945, column: 9, scope: !2262)
!2274 = !DILocation(line: 3945, column: 25, scope: !2262)
!2275 = !DILocation(line: 3946, column: 36, scope: !2262)
!2276 = !DILocation(line: 3946, column: 13, scope: !2262)
!2277 = !DILocation(line: 3948, column: 13, scope: !2262)
!2278 = !DILocation(line: 3948, column: 26, scope: !2262)
!2279 = !DILocation(line: 3947, column: 27, scope: !2262)
!2280 = !DILocation(line: 3947, column: 50, scope: !2262)
!2281 = !DILocation(line: 3947, column: 16, scope: !2262)
!2282 = !DILocation(line: 3947, column: 9, scope: !2262)
!2283 = !DILocation(line: 3950, column: 5, scope: !2262)
!2284 = distinct !DISubprogram(name: "_Xlen_string", linkageName: "?_Xlen_string@std@@YAXXZ", scope: !2, file: !40, line: 2373, type: !271, scopeLine: 2373, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !6)
!2285 = !DILocation(line: 2374, column: 5, scope: !2284)
!2286 = distinct !DISubprogram(name: "_Calculate_growth", linkageName: "?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBA_K_K@Z", scope: !39, file: !40, line: 4500, type: !796, scopeLine: 4500, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !795, retainedNodes: !2287)
!2287 = !{!2288, !2289}
!2288 = !DILocalVariable(name: "_Requested", arg: 2, scope: !2286, file: !40, line: 4500, type: !454)
!2289 = !DILocalVariable(name: "this", arg: 1, scope: !2286, type: !2265, flags: DIFlagArtificial | DIFlagObjectPointer)
!2290 = !DILocation(line: 4500, column: 83, scope: !2286)
!2291 = !DILocation(line: 0, scope: !2286)
!2292 = !DILocation(line: 4501, column: 70, scope: !2286)
!2293 = !DILocation(line: 4501, column: 46, scope: !2286)
!2294 = !DILocation(line: 4501, column: 54, scope: !2286)
!2295 = !DILocation(line: 4501, column: 62, scope: !2286)
!2296 = !DILocation(line: 4501, column: 34, scope: !2286)
!2297 = !DILocation(line: 4501, column: 16, scope: !2286)
!2298 = !DILocation(line: 4501, column: 9, scope: !2286)
!2299 = distinct !DISubprogram(name: "allocate", linkageName: "?allocate@?$allocator@D@std@@QEAAPEAD_K@Z", scope: !48, file: !3, line: 838, type: !110, scopeLine: 838, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !109, retainedNodes: !2300)
!2300 = !{!2301, !2302}
!2301 = !DILocalVariable(name: "_Count", arg: 2, scope: !2299, file: !3, line: 838, type: !108)
!2302 = !DILocalVariable(name: "this", arg: 1, scope: !2299, type: !1860, flags: DIFlagArtificial | DIFlagObjectPointer)
!2303 = !DILocation(line: 838, column: 106, scope: !2299)
!2304 = !DILocation(line: 0, scope: !2299)
!2305 = !DILocation(line: 839, column: 91, scope: !2299)
!2306 = !DILocation(line: 839, column: 63, scope: !2299)
!2307 = !DILocation(line: 839, column: 34, scope: !2299)
!2308 = !DILocation(line: 839, column: 9, scope: !2299)
!2309 = distinct !DISubprogram(name: "operator()", linkageName: "??R<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV23@QEBD_K@Z@QEBA?A?<auto>@@QEAD10@Z", scope: !2164, file: !40, line: 3256, type: !2310, scopeLine: 3256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !2314, retainedNodes: !2318)
!2310 = !DISubroutineType(types: !2311)
!2311 = !{null, !2312, !107, !454, !308}
!2312 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2313, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2313 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2164)
!2314 = !DISubprogram(name: "operator()", scope: !2164, file: !40, line: 3256, type: !2315, scopeLine: 3256, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2315 = !DISubroutineType(types: !2316)
!2316 = !{!2317, !2312, !107, !454, !308}
!2317 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "auto")
!2318 = !{!2319, !2320, !2321, !2322}
!2319 = !DILocalVariable(name: "_Ptr", arg: 4, scope: !2309, file: !40, line: 3256, type: !308)
!2320 = !DILocalVariable(name: "_Count", arg: 3, scope: !2309, file: !40, line: 3256, type: !454)
!2321 = !DILocalVariable(name: "_New_ptr", arg: 2, scope: !2309, file: !40, line: 3256, type: !107)
!2322 = !DILocalVariable(name: "this", arg: 1, scope: !2309, type: !2323, flags: DIFlagArtificial | DIFlagObjectPointer)
!2323 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2313, size: 64)
!2324 = !DILocation(line: 3256, column: 82, scope: !2309)
!2325 = !DILocation(line: 3256, column: 55, scope: !2309)
!2326 = !DILocation(line: 3256, column: 29, scope: !2309)
!2327 = !DILocation(line: 0, scope: !2309)
!2328 = !DILocation(line: 3257, column: 47, scope: !2309)
!2329 = !DILocation(line: 3257, column: 41, scope: !2309)
!2330 = !DILocation(line: 3257, column: 31, scope: !2309)
!2331 = !DILocation(line: 3257, column: 17, scope: !2309)
!2332 = !DILocation(line: 3258, column: 51, scope: !2309)
!2333 = !DILocation(line: 3258, column: 33, scope: !2309)
!2334 = !DILocation(line: 3258, column: 42, scope: !2309)
!2335 = !DILocation(line: 3258, column: 17, scope: !2309)
!2336 = !DILocation(line: 3259, column: 13, scope: !2309)
!2337 = distinct !DISubprogram(name: "_Construct_in_place<char *,char *const &>", linkageName: "??$_Construct_in_place@PEADAEBQEAD@std@@YAXAEAPEADAEBQEAD@Z", scope: !2, file: !407, line: 150, type: !2338, scopeLine: 151, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, templateParams: !2344, retainedNodes: !2341)
!2338 = !DISubroutineType(types: !2339)
!2339 = !{null, !1845, !2340}
!2340 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !107, size: 64)
!2341 = !{!2342, !2343}
!2342 = !DILocalVariable(name: "_Args", arg: 2, scope: !2337, file: !407, line: 150, type: !2340)
!2343 = !DILocalVariable(name: "_Obj", arg: 1, scope: !2337, file: !407, line: 150, type: !1845)
!2344 = !{!1849, !2345}
!2345 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Types", value: !2346)
!2346 = !{!2347}
!2347 = !DITemplateTypeParameter(type: !2340)
!2348 = !DILocation(line: 150, column: 71, scope: !2337)
!2349 = !DILocation(line: 150, column: 53, scope: !2337)
!2350 = !DILocation(line: 158, column: 45, scope: !2351)
!2351 = distinct !DILexicalBlock(scope: !2337, file: !407, line: 157, column: 5)
!2352 = !DILocation(line: 158, column: 30, scope: !2351)
!2353 = !DILocation(line: 158, column: 16, scope: !2351)
!2354 = !DILocation(line: 158, column: 9, scope: !2351)
!2355 = !DILocation(line: 158, column: 78, scope: !2351)
!2356 = !DILocation(line: 158, column: 57, scope: !2351)
!2357 = !DILocation(line: 160, column: 1, scope: !2337)
!2358 = distinct !DISubprogram(name: "max_size", linkageName: "?max_size@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA_KAEBV?$allocator@D@2@@Z", scope: !45, file: !3, line: 727, type: !165, scopeLine: 727, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !164, retainedNodes: !2359)
!2359 = !{!2360}
!2360 = !DILocalVariable(arg: 1, scope: !2358, file: !3, line: 727, type: !98)
!2361 = !DILocation(line: 727, column: 77, scope: !2358)
!2362 = !DILocation(line: 728, column: 9, scope: !2358)
!2363 = distinct !DISubprogram(name: "_Getal", linkageName: "?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBAAEBV?$allocator@D@2@XZ", scope: !39, file: !40, line: 4654, type: !809, scopeLine: 4654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !808, retainedNodes: !2364)
!2364 = !{!2365}
!2365 = !DILocalVariable(name: "this", arg: 1, scope: !2363, type: !2265, flags: DIFlagArtificial | DIFlagObjectPointer)
!2366 = !DILocation(line: 0, scope: !2363)
!2367 = !DILocation(line: 4655, column: 16, scope: !2363)
!2368 = !DILocation(line: 4655, column: 24, scope: !2363)
!2369 = !DILocation(line: 4655, column: 9, scope: !2363)
!2370 = distinct !DISubprogram(name: "max<unsigned long long>", linkageName: "??$max@_K@std@@YAAEB_KAEB_K0@Z", scope: !2, file: !2371, line: 41, type: !2372, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, templateParams: !2378, retainedNodes: !2375)
!2371 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\utility", directory: "", checksumkind: CSK_MD5, checksum: "40c744850a52f0c2a0471aab6b30cfeb")
!2372 = !DISubroutineType(types: !2373)
!2373 = !{!2374, !2374, !2374}
!2374 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !411, size: 64)
!2375 = !{!2376, !2377}
!2376 = !DILocalVariable(name: "_Right", arg: 2, scope: !2370, file: !2371, line: 42, type: !2374)
!2377 = !DILocalVariable(name: "_Left", arg: 1, scope: !2370, file: !2371, line: 42, type: !2374)
!2378 = !{!2379}
!2379 = !DITemplateTypeParameter(name: "_Ty", type: !28)
!2380 = !DILocation(line: 42, column: 34, scope: !2370)
!2381 = !DILocation(line: 42, column: 16, scope: !2370)
!2382 = !DILocation(line: 44, column: 12, scope: !2370)
!2383 = !DILocation(line: 44, column: 20, scope: !2370)
!2384 = !DILocation(line: 44, column: 18, scope: !2370)
!2385 = !DILocation(line: 44, column: 29, scope: !2370)
!2386 = !DILocation(line: 44, column: 38, scope: !2370)
!2387 = !DILocation(line: 44, column: 5, scope: !2370)
!2388 = distinct !DISubprogram(name: "min<unsigned long long>", linkageName: "??$min@_K@std@@YAAEB_KAEB_K0@Z", scope: !2, file: !2371, line: 65, type: !2372, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, templateParams: !2378, retainedNodes: !2389)
!2389 = !{!2390, !2391}
!2390 = !DILocalVariable(name: "_Right", arg: 2, scope: !2388, file: !2371, line: 66, type: !2374)
!2391 = !DILocalVariable(name: "_Left", arg: 1, scope: !2388, file: !2371, line: 66, type: !2374)
!2392 = !DILocation(line: 66, column: 34, scope: !2388)
!2393 = !DILocation(line: 66, column: 16, scope: !2388)
!2394 = !DILocation(line: 68, column: 12, scope: !2388)
!2395 = !DILocation(line: 68, column: 21, scope: !2388)
!2396 = !DILocation(line: 68, column: 19, scope: !2388)
!2397 = !DILocation(line: 68, column: 29, scope: !2388)
!2398 = !DILocation(line: 68, column: 38, scope: !2388)
!2399 = !DILocation(line: 68, column: 5, scope: !2388)
!2400 = distinct !DISubprogram(name: "max", linkageName: "?max@?$numeric_limits@_J@std@@SA_JXZ", scope: !2401, file: !11, line: 647, type: !2443, scopeLine: 647, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !2445, retainedNodes: !6)
!2401 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "numeric_limits<long long>", scope: !2, file: !11, line: 641, size: 8, flags: DIFlagTypePassByValue, elements: !2402, templateParams: !2453, identifier: ".?AV?$numeric_limits@_J@std@@")
!2402 = !{!2403, !2439, !2440, !2441, !2442, !2445, !2446, !2447, !2448, !2449, !2450, !2451, !2452}
!2403 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2401, baseType: !2404, flags: DIFlagPublic, extraData: i32 0)
!2404 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Num_int_base", scope: !2, file: !11, line: 120, size: 8, flags: DIFlagTypePassByValue, elements: !2405, identifier: ".?AU_Num_int_base@std@@")
!2405 = !{!2406, !2434, !2435, !2436, !2437, !2438}
!2406 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2404, baseType: !2407, extraData: i32 0)
!2407 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Num_base", scope: !2, file: !11, line: 43, size: 8, flags: DIFlagTypePassByValue, elements: !2408, identifier: ".?AU_Num_base@std@@")
!2408 = !{!2409, !2411, !2412, !2413, !2414, !2415, !2416, !2417, !2418, !2419, !2420, !2421, !2422, !2423, !2424, !2426, !2427, !2428, !2429, !2430, !2431, !2432, !2433}
!2409 = !DIDerivedType(tag: DW_TAG_member, name: "has_denorm", scope: !2407, file: !11, line: 44, baseType: !2410, flags: DIFlagStaticMember, extraData: i32 0)
!2410 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !10)
!2411 = !DIDerivedType(tag: DW_TAG_member, name: "has_denorm_loss", scope: !2407, file: !11, line: 45, baseType: !69, flags: DIFlagStaticMember, extraData: i1 false)
!2412 = !DIDerivedType(tag: DW_TAG_member, name: "has_infinity", scope: !2407, file: !11, line: 46, baseType: !69, flags: DIFlagStaticMember, extraData: i1 false)
!2413 = !DIDerivedType(tag: DW_TAG_member, name: "has_quiet_NaN", scope: !2407, file: !11, line: 47, baseType: !69, flags: DIFlagStaticMember, extraData: i1 false)
!2414 = !DIDerivedType(tag: DW_TAG_member, name: "has_signaling_NaN", scope: !2407, file: !11, line: 48, baseType: !69, flags: DIFlagStaticMember, extraData: i1 false)
!2415 = !DIDerivedType(tag: DW_TAG_member, name: "is_bounded", scope: !2407, file: !11, line: 49, baseType: !69, flags: DIFlagStaticMember, extraData: i1 false)
!2416 = !DIDerivedType(tag: DW_TAG_member, name: "is_exact", scope: !2407, file: !11, line: 50, baseType: !69, flags: DIFlagStaticMember, extraData: i1 false)
!2417 = !DIDerivedType(tag: DW_TAG_member, name: "is_iec559", scope: !2407, file: !11, line: 51, baseType: !69, flags: DIFlagStaticMember, extraData: i1 false)
!2418 = !DIDerivedType(tag: DW_TAG_member, name: "is_integer", scope: !2407, file: !11, line: 52, baseType: !69, flags: DIFlagStaticMember, extraData: i1 false)
!2419 = !DIDerivedType(tag: DW_TAG_member, name: "is_modulo", scope: !2407, file: !11, line: 53, baseType: !69, flags: DIFlagStaticMember, extraData: i1 false)
!2420 = !DIDerivedType(tag: DW_TAG_member, name: "is_signed", scope: !2407, file: !11, line: 54, baseType: !69, flags: DIFlagStaticMember, extraData: i1 false)
!2421 = !DIDerivedType(tag: DW_TAG_member, name: "is_specialized", scope: !2407, file: !11, line: 55, baseType: !69, flags: DIFlagStaticMember, extraData: i1 false)
!2422 = !DIDerivedType(tag: DW_TAG_member, name: "tinyness_before", scope: !2407, file: !11, line: 56, baseType: !69, flags: DIFlagStaticMember, extraData: i1 false)
!2423 = !DIDerivedType(tag: DW_TAG_member, name: "traps", scope: !2407, file: !11, line: 57, baseType: !69, flags: DIFlagStaticMember, extraData: i1 false)
!2424 = !DIDerivedType(tag: DW_TAG_member, name: "round_style", scope: !2407, file: !11, line: 58, baseType: !2425, flags: DIFlagStaticMember, extraData: i32 0)
!2425 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !17)
!2426 = !DIDerivedType(tag: DW_TAG_member, name: "digits", scope: !2407, file: !11, line: 59, baseType: !1027, flags: DIFlagStaticMember, extraData: i32 0)
!2427 = !DIDerivedType(tag: DW_TAG_member, name: "digits10", scope: !2407, file: !11, line: 60, baseType: !1027, flags: DIFlagStaticMember, extraData: i32 0)
!2428 = !DIDerivedType(tag: DW_TAG_member, name: "max_digits10", scope: !2407, file: !11, line: 61, baseType: !1027, flags: DIFlagStaticMember, extraData: i32 0)
!2429 = !DIDerivedType(tag: DW_TAG_member, name: "max_exponent", scope: !2407, file: !11, line: 62, baseType: !1027, flags: DIFlagStaticMember, extraData: i32 0)
!2430 = !DIDerivedType(tag: DW_TAG_member, name: "max_exponent10", scope: !2407, file: !11, line: 63, baseType: !1027, flags: DIFlagStaticMember, extraData: i32 0)
!2431 = !DIDerivedType(tag: DW_TAG_member, name: "min_exponent", scope: !2407, file: !11, line: 64, baseType: !1027, flags: DIFlagStaticMember, extraData: i32 0)
!2432 = !DIDerivedType(tag: DW_TAG_member, name: "min_exponent10", scope: !2407, file: !11, line: 65, baseType: !1027, flags: DIFlagStaticMember, extraData: i32 0)
!2433 = !DIDerivedType(tag: DW_TAG_member, name: "radix", scope: !2407, file: !11, line: 66, baseType: !1027, flags: DIFlagStaticMember, extraData: i32 0)
!2434 = !DIDerivedType(tag: DW_TAG_member, name: "is_bounded", scope: !2404, file: !11, line: 121, baseType: !69, flags: DIFlagStaticMember, extraData: i1 true)
!2435 = !DIDerivedType(tag: DW_TAG_member, name: "is_exact", scope: !2404, file: !11, line: 122, baseType: !69, flags: DIFlagStaticMember, extraData: i1 true)
!2436 = !DIDerivedType(tag: DW_TAG_member, name: "is_integer", scope: !2404, file: !11, line: 123, baseType: !69, flags: DIFlagStaticMember, extraData: i1 true)
!2437 = !DIDerivedType(tag: DW_TAG_member, name: "is_specialized", scope: !2404, file: !11, line: 124, baseType: !69, flags: DIFlagStaticMember, extraData: i1 true)
!2438 = !DIDerivedType(tag: DW_TAG_member, name: "radix", scope: !2404, file: !11, line: 125, baseType: !1027, flags: DIFlagStaticMember, extraData: i32 2)
!2439 = !DIDerivedType(tag: DW_TAG_member, name: "is_signed", scope: !2401, file: !11, line: 679, baseType: !69, flags: DIFlagPublic | DIFlagStaticMember, extraData: i1 true)
!2440 = !DIDerivedType(tag: DW_TAG_member, name: "digits", scope: !2401, file: !11, line: 680, baseType: !1027, flags: DIFlagPublic | DIFlagStaticMember, extraData: i32 63)
!2441 = !DIDerivedType(tag: DW_TAG_member, name: "digits10", scope: !2401, file: !11, line: 681, baseType: !1027, flags: DIFlagPublic | DIFlagStaticMember, extraData: i32 18)
!2442 = !DISubprogram(name: "min", linkageName: "?min@?$numeric_limits@_J@std@@SA_JXZ", scope: !2401, file: !11, line: 643, type: !2443, scopeLine: 643, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2443 = !DISubroutineType(types: !2444)
!2444 = !{!61}
!2445 = !DISubprogram(name: "max", linkageName: "?max@?$numeric_limits@_J@std@@SA_JXZ", scope: !2401, file: !11, line: 647, type: !2443, scopeLine: 647, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2446 = !DISubprogram(name: "lowest", linkageName: "?lowest@?$numeric_limits@_J@std@@SA_JXZ", scope: !2401, file: !11, line: 651, type: !2443, scopeLine: 651, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2447 = !DISubprogram(name: "epsilon", linkageName: "?epsilon@?$numeric_limits@_J@std@@SA_JXZ", scope: !2401, file: !11, line: 655, type: !2443, scopeLine: 655, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2448 = !DISubprogram(name: "round_error", linkageName: "?round_error@?$numeric_limits@_J@std@@SA_JXZ", scope: !2401, file: !11, line: 659, type: !2443, scopeLine: 659, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2449 = !DISubprogram(name: "denorm_min", linkageName: "?denorm_min@?$numeric_limits@_J@std@@SA_JXZ", scope: !2401, file: !11, line: 663, type: !2443, scopeLine: 663, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2450 = !DISubprogram(name: "infinity", linkageName: "?infinity@?$numeric_limits@_J@std@@SA_JXZ", scope: !2401, file: !11, line: 667, type: !2443, scopeLine: 667, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2451 = !DISubprogram(name: "quiet_NaN", linkageName: "?quiet_NaN@?$numeric_limits@_J@std@@SA_JXZ", scope: !2401, file: !11, line: 671, type: !2443, scopeLine: 671, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2452 = !DISubprogram(name: "signaling_NaN", linkageName: "?signaling_NaN@?$numeric_limits@_J@std@@SA_JXZ", scope: !2401, file: !11, line: 675, type: !2443, scopeLine: 675, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2453 = !{!2454}
!2454 = !DITemplateTypeParameter(name: "_Ty", type: !61)
!2455 = !DILocation(line: 648, column: 9, scope: !2400)
!2456 = distinct !DISubprogram(name: "_Get_first", linkageName: "?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEBAAEBV?$allocator@D@2@XZ", scope: !418, file: !3, line: 1381, type: !428, scopeLine: 1381, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !427, retainedNodes: !2457)
!2457 = !{!2458}
!2458 = !DILocalVariable(name: "this", arg: 1, scope: !2456, type: !2459, flags: DIFlagArtificial | DIFlagObjectPointer)
!2459 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !431, size: 64)
!2460 = !DILocation(line: 0, scope: !2456)
!2461 = !DILocation(line: 1382, column: 16, scope: !2456)
!2462 = !DILocation(line: 1382, column: 9, scope: !2456)
!2463 = distinct !DISubprogram(name: "_Calculate_growth", linkageName: "?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@CA_K_K00@Z", scope: !39, file: !40, line: 4486, type: !793, scopeLine: 4487, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !792, retainedNodes: !2464)
!2464 = !{!2465, !2466, !2467, !2468}
!2465 = !DILocalVariable(name: "_Max", arg: 3, scope: !2463, file: !40, line: 4487, type: !454)
!2466 = !DILocalVariable(name: "_Old", arg: 2, scope: !2463, file: !40, line: 4487, type: !454)
!2467 = !DILocalVariable(name: "_Requested", arg: 1, scope: !2463, file: !40, line: 4487, type: !454)
!2468 = !DILocalVariable(name: "_Masked", scope: !2463, file: !40, line: 4488, type: !454)
!2469 = !DILocation(line: 4487, column: 75, scope: !2463)
!2470 = !DILocation(line: 4487, column: 53, scope: !2463)
!2471 = !DILocation(line: 4487, column: 25, scope: !2463)
!2472 = !DILocation(line: 4488, column: 9, scope: !2463)
!2473 = !DILocation(line: 4488, column: 25, scope: !2463)
!2474 = !DILocation(line: 4488, column: 35, scope: !2463)
!2475 = !DILocation(line: 4488, column: 46, scope: !2463)
!2476 = !DILocation(line: 4489, column: 13, scope: !2477)
!2477 = distinct !DILexicalBlock(scope: !2463, file: !40, line: 4489, column: 13)
!2478 = !DILocation(line: 4489, column: 23, scope: !2477)
!2479 = !DILocation(line: 4489, column: 21, scope: !2477)
!2480 = !DILocation(line: 4489, column: 13, scope: !2463)
!2481 = !DILocation(line: 4490, column: 20, scope: !2482)
!2482 = distinct !DILexicalBlock(scope: !2477, file: !40, line: 4489, column: 29)
!2483 = !DILocation(line: 4490, column: 13, scope: !2482)
!2484 = !DILocation(line: 4493, column: 13, scope: !2485)
!2485 = distinct !DILexicalBlock(scope: !2463, file: !40, line: 4493, column: 13)
!2486 = !DILocation(line: 4493, column: 20, scope: !2485)
!2487 = !DILocation(line: 4493, column: 27, scope: !2485)
!2488 = !DILocation(line: 4493, column: 32, scope: !2485)
!2489 = !DILocation(line: 4493, column: 25, scope: !2485)
!2490 = !DILocation(line: 4493, column: 18, scope: !2485)
!2491 = !DILocation(line: 4493, column: 13, scope: !2463)
!2492 = !DILocation(line: 4494, column: 20, scope: !2493)
!2493 = distinct !DILexicalBlock(scope: !2485, file: !40, line: 4493, column: 37)
!2494 = !DILocation(line: 4494, column: 13, scope: !2493)
!2495 = !DILocation(line: 4497, column: 36, scope: !2463)
!2496 = !DILocation(line: 4497, column: 43, scope: !2463)
!2497 = !DILocation(line: 4497, column: 48, scope: !2463)
!2498 = !DILocation(line: 4497, column: 41, scope: !2463)
!2499 = !DILocation(line: 4497, column: 16, scope: !2463)
!2500 = !DILocation(line: 4497, column: 9, scope: !2463)
!2501 = !DILocation(line: 4498, column: 5, scope: !2463)
!2502 = distinct !DISubprogram(name: "_Allocate<16,std::_Default_allocate_traits,0>", linkageName: "??$_Allocate@$0BA@U_Default_allocate_traits@std@@$0A@@std@@YAPEAX_K@Z", scope: !2, file: !3, line: 230, type: !2503, scopeLine: 230, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, templateParams: !2507, retainedNodes: !2505)
!2503 = !DISubroutineType(types: !2504)
!2504 = !{!29, !108}
!2505 = !{!2506}
!2506 = !DILocalVariable(name: "_Bytes", arg: 1, scope: !2502, file: !3, line: 230, type: !108)
!2507 = !{!1893, !2508, !1894}
!2508 = !DITemplateTypeParameter(name: "_Traits", type: !2509, defaulted: true)
!2509 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Default_allocate_traits", scope: !2, file: !3, line: 79, size: 8, flags: DIFlagTypePassByValue, elements: !2510, identifier: ".?AU_Default_allocate_traits@std@@")
!2510 = !{!2511}
!2511 = !DISubprogram(name: "_Allocate", linkageName: "?_Allocate@_Default_allocate_traits@std@@SAPEAX_K@Z", scope: !2509, file: !3, line: 84, type: !2503, scopeLine: 84, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2512 = !DILocation(line: 230, column: 74, scope: !2502)
!2513 = !DILocation(line: 237, column: 13, scope: !2514)
!2514 = distinct !DILexicalBlock(scope: !2515, file: !3, line: 237, column: 13)
!2515 = distinct !DILexicalBlock(scope: !2502, file: !3, line: 236, column: 5)
!2516 = !DILocation(line: 237, column: 20, scope: !2514)
!2517 = !DILocation(line: 237, column: 13, scope: !2515)
!2518 = !DILocation(line: 238, column: 63, scope: !2519)
!2519 = distinct !DILexicalBlock(scope: !2514, file: !3, line: 237, column: 50)
!2520 = !DILocation(line: 238, column: 20, scope: !2519)
!2521 = !DILocation(line: 238, column: 13, scope: !2519)
!2522 = !DILocation(line: 243, column: 9, scope: !2523)
!2523 = distinct !DILexicalBlock(scope: !2502, file: !3, line: 243, column: 9)
!2524 = !DILocation(line: 243, column: 16, scope: !2523)
!2525 = !DILocation(line: 243, column: 9, scope: !2502)
!2526 = !DILocation(line: 244, column: 35, scope: !2527)
!2527 = distinct !DILexicalBlock(scope: !2523, file: !3, line: 243, column: 22)
!2528 = !DILocation(line: 244, column: 16, scope: !2527)
!2529 = !DILocation(line: 244, column: 9, scope: !2527)
!2530 = !DILocation(line: 247, column: 5, scope: !2502)
!2531 = !DILocation(line: 248, column: 1, scope: !2502)
!2532 = distinct !DISubprogram(name: "_Get_size_of_n<1>", linkageName: "??$_Get_size_of_n@$00@std@@YA_K_K@Z", scope: !2, file: !3, line: 59, type: !2109, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, templateParams: !2536, retainedNodes: !2533)
!2533 = !{!2534, !2535}
!2534 = !DILocalVariable(name: "_Count", arg: 1, scope: !2532, file: !3, line: 59, type: !108)
!2535 = !DILocalVariable(name: "_Overflow_is_possible", scope: !2532, file: !3, line: 60, type: !69)
!2536 = !{!2537}
!2537 = !DITemplateValueParameter(name: "_Ty_size", type: !28, value: i64 1)
!2538 = !DILocation(line: 59, column: 57, scope: !2532)
!2539 = !DILocation(line: 60, column: 5, scope: !2532)
!2540 = !DILocation(line: 60, column: 20, scope: !2532)
!2541 = !DILocation(line: 69, column: 12, scope: !2532)
!2542 = !DILocation(line: 69, column: 19, scope: !2532)
!2543 = !DILocation(line: 70, column: 1, scope: !2532)
!2544 = !DILocation(line: 69, column: 5, scope: !2532)
!2545 = distinct !DISubprogram(name: "_Allocate_manually_vector_aligned<std::_Default_allocate_traits>", linkageName: "??$_Allocate_manually_vector_aligned@U_Default_allocate_traits@std@@@std@@YAPEAX_K@Z", scope: !2, file: !3, line: 134, type: !2503, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, templateParams: !2552, retainedNodes: !2546)
!2546 = !{!2547, !2548, !2549, !2550}
!2547 = !DILocalVariable(name: "_Bytes", arg: 1, scope: !2545, file: !3, line: 134, type: !108)
!2548 = !DILocalVariable(name: "_Block_size", scope: !2545, file: !3, line: 136, type: !108)
!2549 = !DILocalVariable(name: "_Ptr_container", scope: !2545, file: !3, line: 141, type: !1920)
!2550 = !DILocalVariable(name: "_Ptr", scope: !2545, file: !3, line: 143, type: !2551)
!2551 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !29)
!2552 = !{!2553}
!2553 = !DITemplateTypeParameter(name: "_Traits", type: !2509)
!2554 = !DILocation(line: 134, column: 76, scope: !2545)
!2555 = !DILocation(line: 136, column: 5, scope: !2545)
!2556 = !DILocation(line: 136, column: 18, scope: !2545)
!2557 = !DILocation(line: 136, column: 49, scope: !2545)
!2558 = !DILocation(line: 136, column: 47, scope: !2545)
!2559 = !DILocation(line: 137, column: 9, scope: !2560)
!2560 = distinct !DILexicalBlock(scope: !2545, file: !3, line: 137, column: 9)
!2561 = !DILocation(line: 137, column: 24, scope: !2560)
!2562 = !DILocation(line: 137, column: 21, scope: !2560)
!2563 = !DILocation(line: 137, column: 9, scope: !2545)
!2564 = !DILocation(line: 138, column: 9, scope: !2565)
!2565 = distinct !DILexicalBlock(scope: !2560, file: !3, line: 137, column: 32)
!2566 = !DILocation(line: 141, column: 5, scope: !2545)
!2567 = !DILocation(line: 141, column: 21, scope: !2545)
!2568 = !DILocation(line: 141, column: 85, scope: !2545)
!2569 = !DILocation(line: 141, column: 66, scope: !2545)
!2570 = !DILocation(line: 141, column: 38, scope: !2545)
!2571 = !DILocation(line: 142, column: 5, scope: !2545)
!2572 = !DILocation(line: 142, column: 5, scope: !2573)
!2573 = distinct !DILexicalBlock(scope: !2574, file: !3, line: 142, column: 5)
!2574 = distinct !DILexicalBlock(scope: !2545, file: !3, line: 142, column: 5)
!2575 = !DILocation(line: 142, column: 5, scope: !2574)
!2576 = !DILocation(line: 142, column: 5, scope: !2577)
!2577 = distinct !DILexicalBlock(scope: !2573, file: !3, line: 142, column: 5)
!2578 = !DILocation(line: 142, column: 5, scope: !2579)
!2579 = distinct !DILexicalBlock(scope: !2573, file: !3, line: 142, column: 5)
!2580 = !DILocation(line: 142, column: 5, scope: !2581)
!2581 = distinct !DILexicalBlock(scope: !2579, file: !3, line: 142, column: 5)
!2582 = !DILocation(line: 143, column: 5, scope: !2545)
!2583 = !DILocation(line: 143, column: 17, scope: !2545)
!2584 = !DILocation(line: 143, column: 49, scope: !2545)
!2585 = !DILocation(line: 143, column: 64, scope: !2545)
!2586 = !DILocation(line: 143, column: 82, scope: !2545)
!2587 = !DILocation(line: 143, column: 24, scope: !2545)
!2588 = !DILocation(line: 144, column: 41, scope: !2545)
!2589 = !DILocation(line: 144, column: 29, scope: !2545)
!2590 = !DILocation(line: 144, column: 5, scope: !2545)
!2591 = !DILocation(line: 144, column: 39, scope: !2545)
!2592 = !DILocation(line: 149, column: 12, scope: !2545)
!2593 = !DILocation(line: 150, column: 1, scope: !2545)
!2594 = !DILocation(line: 149, column: 5, scope: !2545)
!2595 = distinct !DISubprogram(name: "_Allocate", linkageName: "?_Allocate@_Default_allocate_traits@std@@SAPEAX_K@Z", scope: !2509, file: !3, line: 84, type: !2503, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !2511, retainedNodes: !2596)
!2596 = !{!2597}
!2597 = !DILocalVariable(name: "_Bytes", arg: 1, scope: !2595, file: !3, line: 84, type: !108)
!2598 = !DILocation(line: 84, column: 38, scope: !2595)
!2599 = !DILocation(line: 85, column: 31, scope: !2595)
!2600 = !DILocation(line: 85, column: 16, scope: !2595)
!2601 = !DILocation(line: 85, column: 9, scope: !2595)
!2602 = distinct !DISubprogram(name: "_Throw_bad_array_new_length", linkageName: "?_Throw_bad_array_new_length@std@@YAXXZ", scope: !2, file: !1570, line: 320, type: !271, scopeLine: 320, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !6)
!2603 = !DILocation(line: 321, column: 5, scope: !2602)
!2604 = distinct !DISubprogram(name: "bad_array_new_length", linkageName: "??0bad_array_new_length@std@@QEAA@XZ", scope: !2606, file: !2605, line: 139, type: !2654, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !2653, retainedNodes: !2657)
!2605 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.29.30037\\include\\vcruntime_exception.h", directory: "", checksumkind: CSK_MD5, checksum: "aa62b99a88eea7594b2d8954526d3841")
!2606 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "bad_array_new_length", scope: !2, file: !2605, line: 134, size: 192, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !2607, vtableHolder: !2612, identifier: ".?AVbad_array_new_length@std@@")
!2607 = !{!2608, !2614, !2653}
!2608 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2606, baseType: !2609, flags: DIFlagPublic, extraData: i32 0)
!2609 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "bad_alloc", scope: !2, file: !2605, line: 114, size: 192, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !2610, vtableHolder: !2612, identifier: ".?AVbad_alloc@std@@")
!2610 = !{!2611, !2614, !2646, !2650}
!2611 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2609, baseType: !2612, flags: DIFlagPublic, extraData: i32 0)
!2612 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "exception", scope: !2, file: !2605, line: 48, size: 192, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !2613, vtableHolder: !2612, identifier: ".?AVexception@std@@")
!2613 = !{!2614, !2615, !2617, !2622, !2626, !2629, !2632, !2637, !2641, !2642}
!2614 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "__vtbl_ptr_type", baseType: null, size: 128)
!2615 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$exception", scope: !2605, file: !2605, baseType: !2616, size: 64, flags: DIFlagArtificial)
!2616 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2614, size: 64)
!2617 = !DIDerivedType(tag: DW_TAG_member, name: "_Data", scope: !2612, file: !2605, line: 100, baseType: !2618, size: 128, offset: 64)
!2618 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__std_exception_data", file: !2605, line: 25, size: 128, flags: DIFlagTypePassByValue, elements: !2619, identifier: ".?AU__std_exception_data@@")
!2619 = !{!2620, !2621}
!2620 = !DIDerivedType(tag: DW_TAG_member, name: "_What", scope: !2618, file: !2605, line: 27, baseType: !37, size: 64)
!2621 = !DIDerivedType(tag: DW_TAG_member, name: "_DoFree", scope: !2618, file: !2605, line: 28, baseType: !70, size: 8, offset: 64)
!2622 = !DISubprogram(name: "exception", scope: !2612, file: !2605, line: 52, type: !2623, scopeLine: 52, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2623 = !DISubroutineType(types: !2624)
!2624 = !{null, !2625}
!2625 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2612, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2626 = !DISubprogram(name: "exception", scope: !2612, file: !2605, line: 57, type: !2627, scopeLine: 57, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2627 = !DISubroutineType(types: !2628)
!2628 = !{null, !2625, !308}
!2629 = !DISubprogram(name: "exception", scope: !2612, file: !2605, line: 64, type: !2630, scopeLine: 64, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2630 = !DISubroutineType(types: !2631)
!2631 = !{null, !2625, !308, !12}
!2632 = !DISubprogram(name: "exception", scope: !2612, file: !2605, line: 70, type: !2633, scopeLine: 70, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2633 = !DISubroutineType(types: !2634)
!2634 = !{null, !2625, !2635}
!2635 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2636, size: 64)
!2636 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2612)
!2637 = !DISubprogram(name: "operator=", linkageName: "??4exception@std@@QEAAAEAV01@AEBV01@@Z", scope: !2612, file: !2605, line: 76, type: !2638, scopeLine: 76, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2638 = !DISubroutineType(types: !2639)
!2639 = !{!2640, !2625, !2635}
!2640 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2612, size: 64)
!2641 = !DISubprogram(name: "~exception", scope: !2612, file: !2605, line: 88, type: !2623, scopeLine: 88, containingType: !2612, virtualIndex: 0, flags: DIFlagPublic | DIFlagPrototyped | DIFlagIntroducedVirtual, spFlags: DISPFlagVirtual | DISPFlagOptimized)
!2642 = !DISubprogram(name: "what", linkageName: "?what@exception@std@@UEBAPEBDXZ", scope: !2612, file: !2605, line: 93, type: !2643, scopeLine: 93, containingType: !2612, virtualIndex: 1, flags: DIFlagPublic | DIFlagPrototyped | DIFlagIntroducedVirtual, spFlags: DISPFlagVirtual | DISPFlagOptimized)
!2643 = !DISubroutineType(types: !2644)
!2644 = !{!37, !2645}
!2645 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2636, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2646 = !DISubprogram(name: "bad_alloc", scope: !2609, file: !2605, line: 119, type: !2647, scopeLine: 119, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2647 = !DISubroutineType(types: !2648)
!2648 = !{null, !2649}
!2649 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2609, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2650 = !DISubprogram(name: "bad_alloc", scope: !2609, file: !2605, line: 128, type: !2651, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2651 = !DISubroutineType(types: !2652)
!2652 = !{null, !2649, !308}
!2653 = !DISubprogram(name: "bad_array_new_length", scope: !2606, file: !2605, line: 139, type: !2654, scopeLine: 139, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2654 = !DISubroutineType(types: !2655)
!2655 = !{null, !2656}
!2656 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2606, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2657 = !{!2658}
!2658 = !DILocalVariable(name: "this", arg: 1, scope: !2604, type: !2659, flags: DIFlagArtificial | DIFlagObjectPointer)
!2659 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2606, size: 64)
!2660 = !DILocation(line: 0, scope: !2604)
!2661 = !DILocation(line: 141, column: 5, scope: !2604)
!2662 = !DILocation(line: 140, column: 11, scope: !2604)
!2663 = !{!2664, !2664, i64 0}
!2664 = !{!"vtable pointer", !1645, i64 0}
!2665 = !DILocation(line: 142, column: 5, scope: !2604)
!2666 = distinct !DISubprogram(name: "bad_array_new_length", linkageName: "??0bad_array_new_length@std@@QEAA@AEBV01@@Z", scope: !2606, file: !2605, line: 134, type: !2667, scopeLine: 134, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !2671, retainedNodes: !2672)
!2667 = !DISubroutineType(types: !2668)
!2668 = !{null, !2656, !2669}
!2669 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2670, size: 64)
!2670 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2606)
!2671 = !DISubprogram(name: "bad_array_new_length", scope: !2606, type: !2667, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2672 = !{!2673, !2674}
!2673 = !DILocalVariable(arg: 2, scope: !2666, type: !2669)
!2674 = !DILocalVariable(name: "this", arg: 1, scope: !2666, type: !2659, flags: DIFlagArtificial | DIFlagObjectPointer)
!2675 = !DILocation(line: 0, scope: !2666)
!2676 = !DILocation(line: 134, column: 7, scope: !2666)
!2677 = distinct !DISubprogram(name: "bad_alloc", linkageName: "??0bad_alloc@std@@QEAA@AEBV01@@Z", scope: !2609, file: !2605, line: 114, type: !2678, scopeLine: 114, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !2682, retainedNodes: !2683)
!2678 = !DISubroutineType(types: !2679)
!2679 = !{null, !2649, !2680}
!2680 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2681, size: 64)
!2681 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2609)
!2682 = !DISubprogram(name: "bad_alloc", scope: !2609, type: !2678, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2683 = !{!2684, !2685}
!2684 = !DILocalVariable(arg: 2, scope: !2677, type: !2680)
!2685 = !DILocalVariable(name: "this", arg: 1, scope: !2677, type: !2686, flags: DIFlagArtificial | DIFlagObjectPointer)
!2686 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2609, size: 64)
!2687 = !DILocation(line: 0, scope: !2677)
!2688 = !DILocation(line: 114, column: 7, scope: !2677)
!2689 = distinct !DISubprogram(name: "exception", linkageName: "??0exception@std@@QEAA@AEBV01@@Z", scope: !2612, file: !2605, line: 70, type: !2633, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !2632, retainedNodes: !2690)
!2690 = !{!2691, !2692}
!2691 = !DILocalVariable(name: "_Other", arg: 2, scope: !2689, file: !2605, line: 70, type: !2635)
!2692 = !DILocalVariable(name: "this", arg: 1, scope: !2689, type: !2693, flags: DIFlagArtificial | DIFlagObjectPointer)
!2693 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2612, size: 64)
!2694 = !DILocation(line: 70, column: 32, scope: !2689)
!2695 = !DILocation(line: 0, scope: !2689)
!2696 = !DILocation(line: 72, column: 5, scope: !2689)
!2697 = !DILocation(line: 71, column: 11, scope: !2689)
!2698 = !DILocation(line: 73, column: 46, scope: !2699)
!2699 = distinct !DILexicalBlock(scope: !2689, file: !2605, line: 72, column: 5)
!2700 = !DILocation(line: 73, column: 31, scope: !2699)
!2701 = !DILocation(line: 73, column: 38, scope: !2699)
!2702 = !DILocation(line: 73, column: 9, scope: !2699)
!2703 = !DILocation(line: 74, column: 5, scope: !2689)
!2704 = distinct !DISubprogram(name: "~exception", linkageName: "??1exception@std@@UEAA@XZ", scope: !2612, file: !2605, line: 88, type: !2623, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !2641, retainedNodes: !2705)
!2705 = !{!2706}
!2706 = !DILocalVariable(name: "this", arg: 1, scope: !2704, type: !2693, flags: DIFlagArtificial | DIFlagObjectPointer)
!2707 = !DILocation(line: 0, scope: !2704)
!2708 = !DILocation(line: 89, column: 5, scope: !2704)
!2709 = !DILocation(line: 90, column: 34, scope: !2710)
!2710 = distinct !DILexicalBlock(scope: !2704, file: !2605, line: 89, column: 5)
!2711 = !DILocation(line: 90, column: 9, scope: !2710)
!2712 = !DILocation(line: 91, column: 5, scope: !2704)
!2713 = distinct !DISubprogram(name: "bad_alloc", linkageName: "??0bad_alloc@std@@AEAA@QEBD@Z", scope: !2609, file: !2605, line: 128, type: !2651, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !2650, retainedNodes: !2714)
!2714 = !{!2715, !2716}
!2715 = !DILocalVariable(name: "_Message", arg: 2, scope: !2713, file: !2605, line: 128, type: !308)
!2716 = !DILocalVariable(name: "this", arg: 1, scope: !2713, type: !2686, flags: DIFlagArtificial | DIFlagObjectPointer)
!2717 = !DILocation(line: 128, column: 33, scope: !2713)
!2718 = !DILocation(line: 0, scope: !2713)
!2719 = !DILocation(line: 130, column: 5, scope: !2713)
!2720 = !DILocation(line: 129, column: 21, scope: !2713)
!2721 = !DILocation(line: 129, column: 11, scope: !2713)
!2722 = !DILocation(line: 131, column: 5, scope: !2713)
!2723 = distinct !DISubprogram(name: "~bad_array_new_length", linkageName: "??_Gbad_array_new_length@std@@UEAAPEAXI@Z", scope: !2606, file: !2605, line: 134, type: !2654, scopeLine: 134, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !2724, retainedNodes: !2725)
!2724 = !DISubprogram(name: "~bad_array_new_length", scope: !2606, type: !2654, containingType: !2606, virtualIndex: 0, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagVirtual | DISPFlagOptimized)
!2725 = !{!2726, !2727}
!2726 = !DILocalVariable(name: "should_call_delete", arg: 2, scope: !2723, type: !12, flags: DIFlagArtificial)
!2727 = !DILocalVariable(name: "this", arg: 1, scope: !2723, type: !2659, flags: DIFlagArtificial | DIFlagObjectPointer)
!2728 = !DILocation(line: 0, scope: !2723)
!2729 = !DILocation(line: 134, column: 7, scope: !2723)
!2730 = distinct !DISubprogram(name: "what", linkageName: "?what@exception@std@@UEBAPEBDXZ", scope: !2612, file: !2605, line: 93, type: !2643, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !2642, retainedNodes: !2731)
!2731 = !{!2732}
!2732 = !DILocalVariable(name: "this", arg: 1, scope: !2730, type: !2733, flags: DIFlagArtificial | DIFlagObjectPointer)
!2733 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2636, size: 64)
!2734 = !DILocation(line: 0, scope: !2730)
!2735 = !DILocation(line: 95, column: 16, scope: !2730)
!2736 = !DILocation(line: 95, column: 22, scope: !2730)
!2737 = !{!2738, !1716, i64 8}
!2738 = !{!"?AVexception@std@@", !2739, i64 8}
!2739 = !{!"?AU__std_exception_data@@", !1716, i64 0, !1668, i64 8}
!2740 = !DILocation(line: 95, column: 30, scope: !2730)
!2741 = !DILocation(line: 95, column: 36, scope: !2730)
!2742 = !DILocation(line: 95, column: 9, scope: !2730)
!2743 = distinct !DISubprogram(name: "exception", linkageName: "??0exception@std@@QEAA@QEBDH@Z", scope: !2612, file: !2605, line: 64, type: !2630, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !2629, retainedNodes: !2744)
!2744 = !{!2745, !2746, !2747}
!2745 = !DILocalVariable(arg: 3, scope: !2743, file: !2605, line: 64, type: !12)
!2746 = !DILocalVariable(name: "_Message", arg: 2, scope: !2743, file: !2605, line: 64, type: !308)
!2747 = !DILocalVariable(name: "this", arg: 1, scope: !2743, type: !2693, flags: DIFlagArtificial | DIFlagObjectPointer)
!2748 = !DILocation(line: 64, column: 46, scope: !2743)
!2749 = !DILocation(line: 64, column: 33, scope: !2743)
!2750 = !DILocation(line: 0, scope: !2743)
!2751 = !DILocation(line: 66, column: 5, scope: !2743)
!2752 = !DILocation(line: 65, column: 11, scope: !2743)
!2753 = !DILocation(line: 67, column: 23, scope: !2754)
!2754 = distinct !DILexicalBlock(scope: !2743, file: !2605, line: 66, column: 5)
!2755 = !DILocation(line: 67, column: 9, scope: !2754)
!2756 = !DILocation(line: 67, column: 15, scope: !2754)
!2757 = !DILocation(line: 67, column: 21, scope: !2754)
!2758 = !DILocation(line: 68, column: 5, scope: !2743)
!2759 = distinct !DISubprogram(name: "~bad_alloc", linkageName: "??_Gbad_alloc@std@@UEAAPEAXI@Z", scope: !2609, file: !2605, line: 114, type: !2647, scopeLine: 114, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !2760, retainedNodes: !2761)
!2760 = !DISubprogram(name: "~bad_alloc", scope: !2609, type: !2647, containingType: !2609, virtualIndex: 0, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagVirtual | DISPFlagOptimized)
!2761 = !{!2762, !2763}
!2762 = !DILocalVariable(name: "should_call_delete", arg: 2, scope: !2759, type: !12, flags: DIFlagArtificial)
!2763 = !DILocalVariable(name: "this", arg: 1, scope: !2759, type: !2686, flags: DIFlagArtificial | DIFlagObjectPointer)
!2764 = !DILocation(line: 0, scope: !2759)
!2765 = !DILocation(line: 114, column: 7, scope: !2759)
!2766 = distinct !DISubprogram(name: "~exception", linkageName: "??_Gexception@std@@UEAAPEAXI@Z", scope: !2612, file: !2605, line: 88, type: !2623, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !2641, retainedNodes: !2767)
!2767 = !{!2768, !2769}
!2768 = !DILocalVariable(name: "should_call_delete", arg: 2, scope: !2766, type: !12, flags: DIFlagArtificial)
!2769 = !DILocalVariable(name: "this", arg: 1, scope: !2766, type: !2693, flags: DIFlagArtificial | DIFlagObjectPointer)
!2770 = !DILocation(line: 0, scope: !2766)
!2771 = !DILocation(line: 89, column: 5, scope: !2766)
!2772 = !DILocation(line: 91, column: 5, scope: !2766)
!2773 = distinct !DISubprogram(name: "copy", linkageName: "?copy@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z", scope: !285, file: !40, line: 48, type: !306, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, declaration: !305, retainedNodes: !2774)
!2774 = !{!2775, !2776, !2777}
!2775 = !DILocalVariable(name: "_Count", arg: 3, scope: !2773, file: !40, line: 49, type: !108)
!2776 = !DILocalVariable(name: "_First2", arg: 2, scope: !2773, file: !40, line: 49, type: !308)
!2777 = !DILocalVariable(name: "_First1", arg: 1, scope: !2773, file: !40, line: 48, type: !107)
!2778 = !DILocation(line: 49, column: 69, scope: !2773)
!2779 = !DILocation(line: 49, column: 47, scope: !2773)
!2780 = !DILocation(line: 48, column: 75, scope: !2773)
!2781 = !DILocation(line: 52, column: 26, scope: !2773)
!2782 = !DILocation(line: 52, column: 35, scope: !2773)
!2783 = !DILocation(line: 52, column: 44, scope: !2773)
!2784 = !DILocation(line: 52, column: 51, scope: !2773)
!2785 = !DILocation(line: 52, column: 9, scope: !2773)
!2786 = !DILocation(line: 68, column: 16, scope: !2773)
!2787 = !DILocation(line: 68, column: 9, scope: !2773)
!2788 = distinct !DISubprogram(name: "_Voidify_iter<char **>", linkageName: "??$_Voidify_iter@PEAPEAD@std@@YAPEAXPEAPEAD@Z", scope: !2, file: !407, line: 130, type: !2789, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, templateParams: !2793, retainedNodes: !2791)
!2789 = !DISubroutineType(types: !2790)
!2790 = !{!29, !1417}
!2791 = !{!2792}
!2792 = !DILocalVariable(name: "_It", arg: 1, scope: !2788, file: !407, line: 130, type: !1417)
!2793 = !{!2794}
!2794 = !DITemplateTypeParameter(name: "_Iter", type: !1417)
!2795 = !DILocation(line: 130, column: 48, scope: !2788)
!2796 = !DILocation(line: 132, column: 68, scope: !2797)
!2797 = distinct !DILexicalBlock(scope: !2798, file: !407, line: 131, column: 40)
!2798 = distinct !DILexicalBlock(scope: !2788, file: !407, line: 131, column: 19)
!2799 = !DILocation(line: 132, column: 9, scope: !2797)
!2800 = distinct !DISubprogram(name: "addressof<char *>", linkageName: "??$addressof@PEAD@std@@YAPEAPEADAEAPEAD@Z", scope: !2, file: !2256, line: 274, type: !2801, scopeLine: 274, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, templateParams: !1848, retainedNodes: !2803)
!2801 = !DISubroutineType(types: !2802)
!2802 = !{!1417, !1845}
!2803 = !{!2804}
!2804 = !DILocalVariable(name: "_Val", arg: 1, scope: !2800, file: !2256, line: 274, type: !1845)
!2805 = !DILocation(line: 274, column: 42, scope: !2800)
!2806 = !DILocation(line: 275, column: 32, scope: !2800)
!2807 = !DILocation(line: 275, column: 5, scope: !2800)
!2808 = distinct !DISubprogram(name: "forward<char *const &>", linkageName: "??$forward@AEBQEAD@std@@YAAEBQEADAEBQEAD@Z", scope: !2, file: !1565, line: 1442, type: !2809, scopeLine: 1443, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, templateParams: !2817, retainedNodes: !2819)
!2809 = !DISubroutineType(types: !2810)
!2810 = !{!2340, !2811}
!2811 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2812, size: 64)
!2812 = !DIDerivedType(tag: DW_TAG_typedef, name: "remove_reference_t<char *const &>", scope: !2, file: !64, line: 232, baseType: !2813)
!2813 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !2814, file: !64, line: 221, baseType: !107)
!2814 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "remove_reference<char *const &>", scope: !2, file: !64, line: 220, size: 8, flags: DIFlagTypePassByValue, elements: !2815, templateParams: !2817, identifier: ".?AU?$remove_reference@AEBQEAD@std@@")
!2815 = !{!2813, !2816}
!2816 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Const_thru_ref_type", scope: !2814, file: !64, line: 222, baseType: !2340)
!2817 = !{!2818}
!2818 = !DITemplateTypeParameter(name: "_Ty", type: !2340)
!2819 = !{!2820}
!2820 = !DILocalVariable(name: "_Arg", arg: 1, scope: !2808, file: !1565, line: 1443, type: !2811)
!2821 = !DILocation(line: 1443, column: 30, scope: !2808)
!2822 = !DILocation(line: 1444, column: 31, scope: !2808)
!2823 = !DILocation(line: 1444, column: 5, scope: !2808)

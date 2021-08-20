; ModuleID = 'func2.cpp'
source_filename = "func2.cpp"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.28.29915"

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
%"struct.std::_Fake_allocator" = type { i8 }
%"struct.std::_Fake_proxy_ptr_impl" = type { i8 }
%"struct.std::_Container_base0" = type { i8 }
%"class.std::allocator" = type { i8 }
%class.anon = type { i8 }
%"class.std::bad_array_new_length" = type { %"class.std::bad_alloc" }
%"class.std::bad_alloc" = type { %"class.std::exception" }
%"class.std::exception" = type { i32 (...)**, %struct.__std_exception_data }
%struct.__std_exception_data = type { i8*, i8 }

$"??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@QEBD@Z" = comdat any

$"??$?0$$V@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@U_Zero_then_variadic_args_t@1@@Z" = comdat any

$"??0_Fake_proxy_ptr_impl@std@@QEAA@AEBU_Fake_allocator@1@AEBU_Container_base0@1@@Z" = comdat any

$"?_Tidy_init@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ" = comdat any

$"?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD@Z" = comdat any

$"?_Release@_Fake_proxy_ptr_impl@std@@QEAAXXZ" = comdat any

$"??1?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@XZ" = comdat any

$"??0?$allocator@D@std@@QEAA@XZ" = comdat any

$"??0?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ" = comdat any

$"??0_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ" = comdat any

$"?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z" = comdat any

$"?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD_K@Z" = comdat any

$"??$_Convert_size@_K@std@@YA_K_K@Z" = comdat any

$"?length@?$_Narrow_char_traits@DH@std@@SA_KQEBD@Z" = comdat any

$"?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAAPEADXZ" = comdat any

$"?move@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z" = comdat any

$"??$_Reallocate_for@V<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??assign@01@QEAAAEAV01@QEBD0@Z@PEBD@Z" = comdat any

$"?_Large_string_engaged@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_NXZ" = comdat any

$"??$_Unfancy@D@std@@YAPEADPEAD@Z" = comdat any

$"?max_size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ" = comdat any

$"?_Xlen_string@std@@YAXXZ" = comdat any

$"?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBA_K_K@Z" = comdat any

$"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV?$allocator@D@2@XZ" = comdat any

$"?allocate@?$allocator@D@std@@QEAAPEAD_K@Z" = comdat any

$"?_Orphan_all@_Container_base0@std@@QEAAXXZ" = comdat any

$"??R<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV23@QEBD_K@Z@QEBA?A?<auto>@@QEAD10@Z" = comdat any

$"?deallocate@?$allocator@D@std@@QEAAXQEAD_K@Z" = comdat any

$"??$_Construct_in_place@PEADAEBQEAD@std@@YAXAEAPEADAEBQEAD@Z" = comdat any

$"?max_size@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA_KAEBV?$allocator@D@2@@Z" = comdat any

$"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBAAEBV?$allocator@D@2@XZ" = comdat any

$"??$max@_K@std@@YAAEB_KAEB_K0@Z" = comdat any

$"??$min@_K@std@@YAAEB_KAEB_K0@Z" = comdat any

$"?max@?$numeric_limits@_J@std@@SA_JXZ" = comdat any

$"?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEBAAEBV?$allocator@D@2@XZ" = comdat any

$"?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@CA_K_K00@Z" = comdat any

$"?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAAAEAV?$allocator@D@2@XZ" = comdat any

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

$"??$_Deallocate@$0BA@$0A@@std@@YAXPEAX_K@Z" = comdat any

$"?_Adjust_manually_vector_aligned@std@@YAXAEAPEAXAEA_K@Z" = comdat any

$"??$_Voidify_iter@PEAPEAD@std@@YAPEAXPEAPEAD@Z" = comdat any

$"??$addressof@PEAD@std@@YAPEAPEADAEAPEAD@Z" = comdat any

$"??$forward@AEBQEAD@std@@YAAEBQEADAEBQEAD@Z" = comdat any

$"??1?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ" = comdat any

$"??1_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ" = comdat any

$"??_C@_0P@MFKBACLO@This?5is?5func2?$CB?$AA@" = comdat any

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

@"??_C@_0P@MFKBACLO@This?5is?5func2?$CB?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"This is func2!\00", comdat, align 1
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

; Function Attrs: uwtable mustprogress
define dso_local void @"?func2_hello@@YA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@XZ"(%"class.std::basic_string"* noalias sret(%"class.std::basic_string") align 8 %0) #0 !dbg !1626 {
  %2 = alloca i8*, align 8
  %3 = bitcast %"class.std::basic_string"* %0 to i8*
  store i8* %3, i8** %2, align 8
  %4 = call %"class.std::basic_string"* @"??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@QEBD@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @"??_C@_0P@MFKBACLO@This?5is?5func2?$CB?$AA@", i64 0, i64 0)), !dbg !1630
  ret void, !dbg !1631
}

; Function Attrs: uwtable
define linkonce_odr dso_local %"class.std::basic_string"* @"??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@QEBD@Z"(%"class.std::basic_string"* nonnull returned dereferenceable(32) %0, i8* %1) unnamed_addr #1 comdat align 2 personality i8* bitcast (i32 (...)* @__CxxFrameHandler3 to i8*) !dbg !1632 {
  %3 = alloca i8*, align 8
  %4 = alloca %"class.std::basic_string"*, align 8
  %5 = alloca %"struct.std::_Zero_then_variadic_args_t", align 1
  %6 = alloca %"struct.std::_Fake_allocator"*, align 8
  %7 = alloca %"struct.std::_Fake_allocator", align 1
  %8 = alloca %"struct.std::_Fake_proxy_ptr_impl", align 1
  store i8* %1, i8** %3, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i8** %3, metadata !1634, metadata !DIExpression()), !dbg !1679
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %4, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %4, metadata !1635, metadata !DIExpression()), !dbg !1680
  %9 = load %"class.std::basic_string"*, %"class.std::basic_string"** %4, align 8
  %10 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %9, i32 0, i32 0, !dbg !1681
  %11 = getelementptr inbounds %"struct.std::_Zero_then_variadic_args_t", %"struct.std::_Zero_then_variadic_args_t"* %5, i32 0, i32 0, !dbg !1681
  %12 = load i8, i8* %11, align 1, !dbg !1681
  %13 = call %"class.std::_Compressed_pair"* @"??$?0$$V@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@U_Zero_then_variadic_args_t@1@@Z"(%"class.std::_Compressed_pair"* nonnull dereferenceable(32) %10, i8 %12) #16, !dbg !1681
  %14 = bitcast %"struct.std::_Fake_allocator"** %6 to i8*, !dbg !1682
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %14) #16, !dbg !1682
  call void @llvm.dbg.declare(metadata %"struct.std::_Fake_allocator"** %6, metadata !1637, metadata !DIExpression()), !dbg !1683
  %15 = bitcast %"struct.std::_Fake_allocator"* %7 to i8*, !dbg !1684
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %15) #16, !dbg !1684
  store %"struct.std::_Fake_allocator"* %7, %"struct.std::_Fake_allocator"** %6, align 8, !dbg !1683, !tbaa !1675
  %16 = bitcast %"struct.std::_Fake_proxy_ptr_impl"* %8 to i8*, !dbg !1685
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %16) #16, !dbg !1685
  call void @llvm.dbg.declare(metadata %"struct.std::_Fake_proxy_ptr_impl"* %8, metadata !1640, metadata !DIExpression()), !dbg !1686
  %17 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %9, i32 0, i32 0, !dbg !1687
  %18 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %17, i32 0, i32 0, !dbg !1688
  %19 = bitcast %"class.std::_String_val"* %18 to %"struct.std::_Container_base0"*, !dbg !1687
  %20 = load %"struct.std::_Fake_allocator"*, %"struct.std::_Fake_allocator"** %6, align 8, !dbg !1689, !tbaa !1675
  %21 = call %"struct.std::_Fake_proxy_ptr_impl"* @"??0_Fake_proxy_ptr_impl@std@@QEAA@AEBU_Fake_allocator@1@AEBU_Container_base0@1@@Z"(%"struct.std::_Fake_proxy_ptr_impl"* nonnull dereferenceable(1) %8, %"struct.std::_Fake_allocator"* nonnull align 1 dereferenceable(1) %20, %"struct.std::_Container_base0"* nonnull align 1 dereferenceable(1) %19) #16, !dbg !1686
  call void @"?_Tidy_init@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %9) #16, !dbg !1690
  %22 = load i8*, i8** %3, align 8, !dbg !1691, !tbaa !1675
  %23 = invoke nonnull align 8 dereferenceable(32) %"class.std::basic_string"* @"?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %9, i8* %22)
          to label %24 unwind label %28, !dbg !1692

24:                                               ; preds = %2
  call void @"?_Release@_Fake_proxy_ptr_impl@std@@QEAAXXZ"(%"struct.std::_Fake_proxy_ptr_impl"* nonnull dereferenceable(1) %8) #16, !dbg !1693
  %25 = bitcast %"struct.std::_Fake_proxy_ptr_impl"* %8 to i8*, !dbg !1694
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %25) #16, !dbg !1694
  %26 = bitcast %"struct.std::_Fake_allocator"* %7 to i8*, !dbg !1694
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %26) #16, !dbg !1694
  %27 = bitcast %"struct.std::_Fake_allocator"** %6 to i8*, !dbg !1694
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %27) #16, !dbg !1694
  ret %"class.std::basic_string"* %9, !dbg !1694

28:                                               ; preds = %2
  %29 = cleanuppad within none [], !dbg !1694
  %30 = bitcast %"struct.std::_Fake_proxy_ptr_impl"* %8 to i8*, !dbg !1694
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %30) #16, !dbg !1694
  cleanupret from %29 unwind label %31, !dbg !1694

31:                                               ; preds = %28
  %32 = cleanuppad within none [], !dbg !1694
  %33 = bitcast %"struct.std::_Fake_allocator"* %7 to i8*, !dbg !1694
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %33) #16, !dbg !1694
  cleanupret from %32 unwind label %34, !dbg !1694

34:                                               ; preds = %31
  %35 = cleanuppad within none [], !dbg !1694
  %36 = bitcast %"struct.std::_Fake_allocator"** %6 to i8*, !dbg !1694
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %36) #16, !dbg !1694
  cleanupret from %35 unwind label %37, !dbg !1694

37:                                               ; preds = %34
  %38 = cleanuppad within none [], !dbg !1695
  call void @"??1?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@XZ"(%"class.std::_Compressed_pair"* nonnull dereferenceable(32) %10) #16 [ "funclet"(token %38) ], !dbg !1695
  cleanupret from %38 unwind to caller, !dbg !1695
}

; Function Attrs: nounwind uwtable mustprogress
define dso_local i32 @"?negate@@YAHH@Z"(i32 %0) #2 !dbg !1696 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !1699
  call void @llvm.dbg.declare(metadata i32* %2, metadata !1698, metadata !DIExpression()), !dbg !1701
  %3 = load i32, i32* %2, align 4, !dbg !1702, !tbaa !1699
  %4 = sub nsw i32 0, %3, !dbg !1703
  ret i32 %4, !dbg !1704
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #3

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local %"class.std::_Compressed_pair"* @"??$?0$$V@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@U_Zero_then_variadic_args_t@1@@Z"(%"class.std::_Compressed_pair"* nonnull returned dereferenceable(32) %0, i8 %1) unnamed_addr #4 comdat align 2 !dbg !1705 {
  %3 = alloca %"struct.std::_Zero_then_variadic_args_t", align 1
  %4 = alloca %"class.std::_Compressed_pair"*, align 8
  %5 = getelementptr inbounds %"struct.std::_Zero_then_variadic_args_t", %"struct.std::_Zero_then_variadic_args_t"* %3, i32 0, i32 0
  store i8 %1, i8* %5, align 1
  call void @llvm.dbg.declare(metadata %"struct.std::_Zero_then_variadic_args_t"* %3, metadata !1718, metadata !DIExpression()), !dbg !1721
  store %"class.std::_Compressed_pair"* %0, %"class.std::_Compressed_pair"** %4, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::_Compressed_pair"** %4, metadata !1719, metadata !DIExpression()), !dbg !1722
  %6 = load %"class.std::_Compressed_pair"*, %"class.std::_Compressed_pair"** %4, align 8
  %7 = bitcast %"class.std::_Compressed_pair"* %6 to %"class.std::allocator"*, !dbg !1723
  %8 = call %"class.std::allocator"* @"??0?$allocator@D@std@@QEAA@XZ"(%"class.std::allocator"* nonnull dereferenceable(1) %7) #16, !dbg !1724
  %9 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %6, i32 0, i32 0, !dbg !1725
  %10 = call %"class.std::_String_val"* @"??0?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %9) #16, !dbg !1725
  ret %"class.std::_Compressed_pair"* %6, !dbg !1726
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #5

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local %"struct.std::_Fake_proxy_ptr_impl"* @"??0_Fake_proxy_ptr_impl@std@@QEAA@AEBU_Fake_allocator@1@AEBU_Container_base0@1@@Z"(%"struct.std::_Fake_proxy_ptr_impl"* nonnull returned dereferenceable(1) %0, %"struct.std::_Fake_allocator"* nonnull align 1 dereferenceable(1) %1, %"struct.std::_Container_base0"* nonnull align 1 dereferenceable(1) %2) unnamed_addr #4 comdat align 2 !dbg !1727 {
  %4 = alloca %"struct.std::_Container_base0"*, align 8
  %5 = alloca %"struct.std::_Fake_allocator"*, align 8
  %6 = alloca %"struct.std::_Fake_proxy_ptr_impl"*, align 8
  store %"struct.std::_Container_base0"* %2, %"struct.std::_Container_base0"** %4, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"struct.std::_Container_base0"** %4, metadata !1729, metadata !DIExpression()), !dbg !1733
  store %"struct.std::_Fake_allocator"* %1, %"struct.std::_Fake_allocator"** %5, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"struct.std::_Fake_allocator"** %5, metadata !1730, metadata !DIExpression()), !dbg !1734
  store %"struct.std::_Fake_proxy_ptr_impl"* %0, %"struct.std::_Fake_proxy_ptr_impl"** %6, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"struct.std::_Fake_proxy_ptr_impl"** %6, metadata !1731, metadata !DIExpression()), !dbg !1735
  %7 = load %"struct.std::_Fake_proxy_ptr_impl"*, %"struct.std::_Fake_proxy_ptr_impl"** %6, align 8
  ret %"struct.std::_Fake_proxy_ptr_impl"* %7, !dbg !1736
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local void @"?_Tidy_init@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %0) #2 comdat align 2 !dbg !1737 {
  %2 = alloca %"class.std::basic_string"*, align 8
  %3 = alloca i8, align 1
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %2, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %2, metadata !1739, metadata !DIExpression()), !dbg !1740
  %4 = load %"class.std::basic_string"*, %"class.std::basic_string"** %2, align 8
  %5 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %4, i32 0, i32 0, !dbg !1741
  %6 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %5, i32 0, i32 0, !dbg !1742
  %7 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %6, i32 0, i32 1, !dbg !1743
  store i64 0, i64* %7, align 8, !dbg !1744, !tbaa !1745
  %8 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %4, i32 0, i32 0, !dbg !1750
  %9 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %8, i32 0, i32 0, !dbg !1751
  %10 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %9, i32 0, i32 2, !dbg !1752
  store i64 15, i64* %10, align 8, !dbg !1753, !tbaa !1754
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %3) #16, !dbg !1755
  store i8 0, i8* %3, align 1, !dbg !1755, !tbaa !1756
  %11 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %4, i32 0, i32 0, !dbg !1757
  %12 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %11, i32 0, i32 0, !dbg !1758
  %13 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %12, i32 0, i32 0, !dbg !1759
  %14 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %13 to [16 x i8]*, !dbg !1760
  %15 = getelementptr inbounds [16 x i8], [16 x i8]* %14, i64 0, i64 0, !dbg !1757
  call void @"?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z"(i8* nonnull align 1 dereferenceable(1) %15, i8* nonnull align 1 dereferenceable(1) %3) #16, !dbg !1761
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %3) #16, !dbg !1761
  ret void, !dbg !1762
}

; Function Attrs: uwtable mustprogress
define linkonce_odr dso_local nonnull align 8 dereferenceable(32) %"class.std::basic_string"* @"?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %0, i8* %1) #0 comdat align 2 !dbg !1763 {
  %3 = alloca i8*, align 8
  %4 = alloca %"class.std::basic_string"*, align 8
  store i8* %1, i8** %3, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i8** %3, metadata !1765, metadata !DIExpression()), !dbg !1767
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %4, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %4, metadata !1766, metadata !DIExpression()), !dbg !1768
  %5 = load %"class.std::basic_string"*, %"class.std::basic_string"** %4, align 8
  %6 = load i8*, i8** %3, align 8, !dbg !1769, !tbaa !1675
  %7 = call i64 @"?length@?$_Narrow_char_traits@DH@std@@SA_KQEBD@Z"(i8* %6) #16, !dbg !1770
  %8 = call i64 @"??$_Convert_size@_K@std@@YA_K_K@Z"(i64 %7) #16, !dbg !1771
  %9 = load i8*, i8** %3, align 8, !dbg !1772, !tbaa !1675
  %10 = call nonnull align 8 dereferenceable(32) %"class.std::basic_string"* @"?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD_K@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %5, i8* %9, i64 %8), !dbg !1773
  ret %"class.std::basic_string"* %10, !dbg !1774
}

declare dso_local i32 @__CxxFrameHandler3(...)

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local void @"?_Release@_Fake_proxy_ptr_impl@std@@QEAAXXZ"(%"struct.std::_Fake_proxy_ptr_impl"* nonnull dereferenceable(1) %0) #2 comdat align 2 !dbg !1775 {
  %2 = alloca %"struct.std::_Fake_proxy_ptr_impl"*, align 8
  store %"struct.std::_Fake_proxy_ptr_impl"* %0, %"struct.std::_Fake_proxy_ptr_impl"** %2, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"struct.std::_Fake_proxy_ptr_impl"** %2, metadata !1777, metadata !DIExpression()), !dbg !1778
  %3 = load %"struct.std::_Fake_proxy_ptr_impl"*, %"struct.std::_Fake_proxy_ptr_impl"** %2, align 8
  ret void, !dbg !1779
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #5

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @"??1?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@XZ"(%"class.std::_Compressed_pair"* nonnull dereferenceable(32) %0) unnamed_addr #6 comdat align 2 !dbg !1780 {
  %2 = alloca %"class.std::_Compressed_pair"*, align 8
  store %"class.std::_Compressed_pair"* %0, %"class.std::_Compressed_pair"** %2, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::_Compressed_pair"** %2, metadata !1785, metadata !DIExpression()), !dbg !1786
  %3 = load %"class.std::_Compressed_pair"*, %"class.std::_Compressed_pair"** %2, align 8
  %4 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %3, i32 0, i32 0, !dbg !1787
  call void @"??1?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %4) #16, !dbg !1787
  ret void, !dbg !1789
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local %"class.std::allocator"* @"??0?$allocator@D@std@@QEAA@XZ"(%"class.std::allocator"* nonnull returned dereferenceable(1) %0) unnamed_addr #4 comdat align 2 !dbg !1790 {
  %2 = alloca %"class.std::allocator"*, align 8
  store %"class.std::allocator"* %0, %"class.std::allocator"** %2, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %2, metadata !1792, metadata !DIExpression()), !dbg !1794
  %3 = load %"class.std::allocator"*, %"class.std::allocator"** %2, align 8
  ret %"class.std::allocator"* %3, !dbg !1795
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local %"class.std::_String_val"* @"??0?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(%"class.std::_String_val"* nonnull returned dereferenceable(32) %0) unnamed_addr #4 comdat align 2 !dbg !1796 {
  %2 = alloca %"class.std::_String_val"*, align 8
  store %"class.std::_String_val"* %0, %"class.std::_String_val"** %2, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::_String_val"** %2, metadata !1798, metadata !DIExpression()), !dbg !1800
  %3 = load %"class.std::_String_val"*, %"class.std::_String_val"** %2, align 8
  %4 = bitcast %"class.std::_String_val"* %3 to %"struct.std::_Container_base0"*, !dbg !1801
  %5 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %3, i32 0, i32 0, !dbg !1802
  %6 = call %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* @"??0_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(%"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* nonnull dereferenceable(16) %5) #16, !dbg !1802
  %7 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %3, i32 0, i32 1, !dbg !1803
  store i64 0, i64* %7, align 8, !dbg !1803, !tbaa !1804
  %8 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %3, i32 0, i32 2, !dbg !1805
  store i64 0, i64* %8, align 8, !dbg !1805, !tbaa !1806
  ret %"class.std::_String_val"* %3, !dbg !1807
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* @"??0_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(%"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* nonnull returned dereferenceable(16) %0) unnamed_addr #4 comdat align 2 !dbg !1808 {
  %2 = alloca %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"*, align 8
  store %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %0, %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"** %2, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"** %2, metadata !1810, metadata !DIExpression()), !dbg !1812
  %3 = load %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"*, %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"** %2, align 8
  ret %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %3, !dbg !1813
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local void @"?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z"(i8* nonnull align 1 dereferenceable(1) %0, i8* nonnull align 1 dereferenceable(1) %1) #7 comdat align 2 !dbg !1814 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %1, i8** %3, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i8** %3, metadata !1816, metadata !DIExpression()), !dbg !1818
  store i8* %0, i8** %4, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i8** %4, metadata !1817, metadata !DIExpression()), !dbg !1819
  %5 = load i8*, i8** %3, align 8, !dbg !1820, !tbaa !1675
  %6 = load i8, i8* %5, align 1, !dbg !1820, !tbaa !1756
  %7 = load i8*, i8** %4, align 8, !dbg !1821, !tbaa !1675
  store i8 %6, i8* %7, align 1, !dbg !1822, !tbaa !1756
  ret void, !dbg !1823
}

; Function Attrs: uwtable mustprogress
define linkonce_odr dso_local nonnull align 8 dereferenceable(32) %"class.std::basic_string"* @"?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD_K@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %0, i8* %1, i64 %2) #0 comdat align 2 !dbg !1824 {
  %4 = alloca %"class.std::basic_string"*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca %"class.std::basic_string"*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8, align 1
  %10 = alloca %class.anon, align 1
  store i64 %2, i64* %5, align 8, !tbaa !1832
  call void @llvm.dbg.declare(metadata i64* %5, metadata !1826, metadata !DIExpression()), !dbg !1833
  store i8* %1, i8** %6, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i8** %6, metadata !1827, metadata !DIExpression()), !dbg !1834
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %7, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %7, metadata !1828, metadata !DIExpression()), !dbg !1835
  %11 = load %"class.std::basic_string"*, %"class.std::basic_string"** %7, align 8
  %12 = load i64, i64* %5, align 8, !dbg !1836, !tbaa !1832
  %13 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %11, i32 0, i32 0, !dbg !1837
  %14 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %13, i32 0, i32 0, !dbg !1838
  %15 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %14, i32 0, i32 2, !dbg !1839
  %16 = load i64, i64* %15, align 8, !dbg !1839, !tbaa !1754
  %17 = icmp ule i64 %12, %16, !dbg !1840
  br i1 %17, label %18, label %35, !dbg !1841

18:                                               ; preds = %3
  %19 = bitcast i8** %8 to i8*, !dbg !1842
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %19) #16, !dbg !1842
  call void @llvm.dbg.declare(metadata i8** %8, metadata !1829, metadata !DIExpression()), !dbg !1843
  %20 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %11, i32 0, i32 0, !dbg !1844
  %21 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %20, i32 0, i32 0, !dbg !1845
  %22 = call i8* @"?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAAPEADXZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %21) #16, !dbg !1846
  store i8* %22, i8** %8, align 8, !dbg !1843, !tbaa !1675
  %23 = load i64, i64* %5, align 8, !dbg !1847, !tbaa !1832
  %24 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %11, i32 0, i32 0, !dbg !1848
  %25 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %24, i32 0, i32 0, !dbg !1849
  %26 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %25, i32 0, i32 1, !dbg !1850
  store i64 %23, i64* %26, align 8, !dbg !1851, !tbaa !1745
  %27 = load i64, i64* %5, align 8, !dbg !1852, !tbaa !1832
  %28 = load i8*, i8** %6, align 8, !dbg !1853, !tbaa !1675
  %29 = load i8*, i8** %8, align 8, !dbg !1854, !tbaa !1675
  %30 = call i8* @"?move@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z"(i8* %29, i8* %28, i64 %27) #16, !dbg !1855
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %9) #16, !dbg !1856
  store i8 0, i8* %9, align 1, !dbg !1856, !tbaa !1756
  %31 = load i8*, i8** %8, align 8, !dbg !1857, !tbaa !1675
  %32 = load i64, i64* %5, align 8, !dbg !1858, !tbaa !1832
  %33 = getelementptr inbounds i8, i8* %31, i64 %32, !dbg !1857
  call void @"?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z"(i8* nonnull align 1 dereferenceable(1) %33, i8* nonnull align 1 dereferenceable(1) %9) #16, !dbg !1859
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %9) #16, !dbg !1859
  store %"class.std::basic_string"* %11, %"class.std::basic_string"** %4, align 8, !dbg !1860
  %34 = bitcast i8** %8 to i8*, !dbg !1861
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %34) #16, !dbg !1861
  br label %41

35:                                               ; preds = %3
  %36 = load i8*, i8** %6, align 8, !dbg !1862, !tbaa !1675
  %37 = load i64, i64* %5, align 8, !dbg !1863, !tbaa !1832
  %38 = getelementptr inbounds %class.anon, %class.anon* %10, i32 0, i32 0, !dbg !1864
  %39 = load i8, i8* %38, align 1, !dbg !1864
  %40 = call nonnull align 8 dereferenceable(32) %"class.std::basic_string"* @"??$_Reallocate_for@V<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??assign@01@QEAAAEAV01@QEBD0@Z@PEBD@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %11, i64 %37, i8 %39, i8* %36), !dbg !1864
  store %"class.std::basic_string"* %40, %"class.std::basic_string"** %4, align 8, !dbg !1865
  br label %41, !dbg !1865

41:                                               ; preds = %35, %18
  %42 = load %"class.std::basic_string"*, %"class.std::basic_string"** %4, align 8, !dbg !1866
  ret %"class.std::basic_string"* %42, !dbg !1866
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i64 @"??$_Convert_size@_K@std@@YA_K_K@Z"(i64 %0) #2 comdat !dbg !1867 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8, !tbaa !1832
  call void @llvm.dbg.declare(metadata i64* %2, metadata !1871, metadata !DIExpression()), !dbg !1874
  %3 = load i64, i64* %2, align 8, !dbg !1875, !tbaa !1832
  ret i64 %3, !dbg !1876
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local i64 @"?length@?$_Narrow_char_traits@DH@std@@SA_KQEBD@Z"(i8* %0) #7 comdat align 2 personality i8* bitcast (i32 (...)* @__CxxFrameHandler3 to i8*) !dbg !1877 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i8** %2, metadata !1879, metadata !DIExpression()), !dbg !1880
  %3 = load i8*, i8** %2, align 8, !dbg !1881, !tbaa !1675
  %4 = invoke i64 @strlen(i8* %3)
          to label %5 unwind label %6, !dbg !1882

5:                                                ; preds = %1
  ret i64 %4, !dbg !1883

6:                                                ; preds = %1
  %7 = cleanuppad within none [], !dbg !1882
  call void @__std_terminate() #17 [ "funclet"(token %7) ], !dbg !1882
  unreachable, !dbg !1882
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i8* @"?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAAPEADXZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %0) #2 comdat align 2 !dbg !1884 {
  %2 = alloca %"class.std::_String_val"*, align 8
  %3 = alloca i8*, align 8
  store %"class.std::_String_val"* %0, %"class.std::_String_val"** %2, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::_String_val"** %2, metadata !1886, metadata !DIExpression()), !dbg !1888
  %4 = load %"class.std::_String_val"*, %"class.std::_String_val"** %2, align 8
  %5 = bitcast i8** %3 to i8*, !dbg !1889
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #16, !dbg !1889
  call void @llvm.dbg.declare(metadata i8** %3, metadata !1887, metadata !DIExpression()), !dbg !1890
  %6 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %4, i32 0, i32 0, !dbg !1891
  %7 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %6 to [16 x i8]*, !dbg !1892
  %8 = getelementptr inbounds [16 x i8], [16 x i8]* %7, i64 0, i64 0, !dbg !1891
  store i8* %8, i8** %3, align 8, !dbg !1890, !tbaa !1675
  %9 = call zeroext i1 @"?_Large_string_engaged@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_NXZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %4) #16, !dbg !1893
  br i1 %9, label %10, label %15, !dbg !1895

10:                                               ; preds = %1
  %11 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %4, i32 0, i32 0, !dbg !1896
  %12 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %11 to i8**, !dbg !1898
  %13 = load i8*, i8** %12, align 8, !dbg !1898, !tbaa !1756
  %14 = call i8* @"??$_Unfancy@D@std@@YAPEADPEAD@Z"(i8* %13) #16, !dbg !1899
  store i8* %14, i8** %3, align 8, !dbg !1900, !tbaa !1675
  br label %15, !dbg !1901

15:                                               ; preds = %10, %1
  %16 = load i8*, i8** %3, align 8, !dbg !1902, !tbaa !1675
  %17 = bitcast i8** %3 to i8*, !dbg !1903
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %17) #16, !dbg !1903
  ret i8* %16, !dbg !1904
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local i8* @"?move@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z"(i8* %0, i8* %1, i64 %2) #7 comdat align 2 !dbg !1905 {
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  store i64 %2, i64* %4, align 8, !tbaa !1832
  call void @llvm.dbg.declare(metadata i64* %4, metadata !1907, metadata !DIExpression()), !dbg !1910
  store i8* %1, i8** %5, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i8** %5, metadata !1908, metadata !DIExpression()), !dbg !1911
  store i8* %0, i8** %6, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i8** %6, metadata !1909, metadata !DIExpression()), !dbg !1912
  %7 = load i8*, i8** %6, align 8, !dbg !1913, !tbaa !1675
  %8 = load i8*, i8** %5, align 8, !dbg !1914, !tbaa !1675
  %9 = load i64, i64* %4, align 8, !dbg !1915, !tbaa !1832
  %10 = mul i64 %9, 1, !dbg !1916
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 %8, i64 %10, i1 false), !dbg !1917
  %11 = load i8*, i8** %6, align 8, !dbg !1918, !tbaa !1675
  ret i8* %11, !dbg !1919
}

; Function Attrs: uwtable mustprogress
define linkonce_odr dso_local nonnull align 8 dereferenceable(32) %"class.std::basic_string"* @"??$_Reallocate_for@V<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??assign@01@QEAAAEAV01@QEBD0@Z@PEBD@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %0, i64 %1, i8 %2, i8* %3) #0 comdat align 2 !dbg !1920 {
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
  store i8* %3, i8** %6, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i8** %6, metadata !1931, metadata !DIExpression()), !dbg !1940
  call void @llvm.dbg.declare(metadata %class.anon* %5, metadata !1932, metadata !DIExpression()), !dbg !1941
  store i64 %1, i64* %7, align 8, !tbaa !1832
  call void @llvm.dbg.declare(metadata i64* %7, metadata !1933, metadata !DIExpression()), !dbg !1942
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %8, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %8, metadata !1934, metadata !DIExpression()), !dbg !1943
  %14 = load %"class.std::basic_string"*, %"class.std::basic_string"** %8, align 8
  %15 = load i64, i64* %7, align 8, !dbg !1944, !tbaa !1832
  %16 = call i64 @"?max_size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %14) #16, !dbg !1946
  %17 = icmp ugt i64 %15, %16, !dbg !1947
  br i1 %17, label %18, label %19, !dbg !1948

18:                                               ; preds = %4
  call void @"?_Xlen_string@std@@YAXXZ"() #18, !dbg !1949
  unreachable, !dbg !1949

19:                                               ; preds = %4
  %20 = bitcast i64* %9 to i8*, !dbg !1951
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %20) #16, !dbg !1951
  call void @llvm.dbg.declare(metadata i64* %9, metadata !1935, metadata !DIExpression()), !dbg !1952
  %21 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %14, i32 0, i32 0, !dbg !1953
  %22 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %21, i32 0, i32 0, !dbg !1954
  %23 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %22, i32 0, i32 2, !dbg !1955
  %24 = load i64, i64* %23, align 8, !dbg !1955, !tbaa !1754
  store i64 %24, i64* %9, align 8, !dbg !1952, !tbaa !1832
  %25 = bitcast i64* %10 to i8*, !dbg !1956
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %25) #16, !dbg !1956
  call void @llvm.dbg.declare(metadata i64* %10, metadata !1936, metadata !DIExpression()), !dbg !1957
  %26 = load i64, i64* %7, align 8, !dbg !1958, !tbaa !1832
  %27 = call i64 @"?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBA_K_K@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %14, i64 %26) #16, !dbg !1959
  store i64 %27, i64* %10, align 8, !dbg !1957, !tbaa !1832
  %28 = bitcast %"class.std::allocator"** %11 to i8*, !dbg !1960
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %28) #16, !dbg !1960
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %11, metadata !1937, metadata !DIExpression()), !dbg !1961
  %29 = call nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV?$allocator@D@2@XZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %14) #16, !dbg !1962
  store %"class.std::allocator"* %29, %"class.std::allocator"** %11, align 8, !dbg !1961, !tbaa !1675
  %30 = bitcast i8** %12 to i8*, !dbg !1963
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %30) #16, !dbg !1963
  call void @llvm.dbg.declare(metadata i8** %12, metadata !1938, metadata !DIExpression()), !dbg !1964
  %31 = load %"class.std::allocator"*, %"class.std::allocator"** %11, align 8, !dbg !1965, !tbaa !1675
  %32 = load i64, i64* %10, align 8, !dbg !1966, !tbaa !1832
  %33 = add i64 %32, 1, !dbg !1967
  %34 = call i8* @"?allocate@?$allocator@D@std@@QEAAPEAD_K@Z"(%"class.std::allocator"* nonnull dereferenceable(1) %31, i64 %33), !dbg !1968, !heapallocsite !23
  store i8* %34, i8** %12, align 8, !dbg !1964, !tbaa !1675
  %35 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %14, i32 0, i32 0, !dbg !1969
  %36 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %35, i32 0, i32 0, !dbg !1970
  %37 = bitcast %"class.std::_String_val"* %36 to %"struct.std::_Container_base0"*, !dbg !1969
  call void @"?_Orphan_all@_Container_base0@std@@QEAAXXZ"(%"struct.std::_Container_base0"* nonnull dereferenceable(1) %37) #16, !dbg !1971
  %38 = load i64, i64* %7, align 8, !dbg !1972, !tbaa !1832
  %39 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %14, i32 0, i32 0, !dbg !1973
  %40 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %39, i32 0, i32 0, !dbg !1974
  %41 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %40, i32 0, i32 1, !dbg !1975
  store i64 %38, i64* %41, align 8, !dbg !1976, !tbaa !1745
  %42 = load i64, i64* %10, align 8, !dbg !1977, !tbaa !1832
  %43 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %14, i32 0, i32 0, !dbg !1978
  %44 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %43, i32 0, i32 0, !dbg !1979
  %45 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %44, i32 0, i32 2, !dbg !1980
  store i64 %42, i64* %45, align 8, !dbg !1981, !tbaa !1754
  %46 = load i8*, i8** %6, align 8, !dbg !1982, !tbaa !1675
  %47 = load i64, i64* %7, align 8, !dbg !1983, !tbaa !1832
  %48 = load i8*, i8** %12, align 8, !dbg !1984, !tbaa !1675
  %49 = call i8* @"??$_Unfancy@D@std@@YAPEADPEAD@Z"(i8* %48) #16, !dbg !1985
  call void @"??R<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV23@QEBD_K@Z@QEBA?A?<auto>@@QEAD10@Z"(%class.anon* nonnull dereferenceable(1) %5, i8* %49, i64 %47, i8* %46), !dbg !1986
  %50 = load i64, i64* %9, align 8, !dbg !1987, !tbaa !1832
  %51 = icmp ule i64 16, %50, !dbg !1989
  br i1 %51, label %52, label %66, !dbg !1990

52:                                               ; preds = %19
  %53 = load %"class.std::allocator"*, %"class.std::allocator"** %11, align 8, !dbg !1991, !tbaa !1675
  %54 = load i64, i64* %9, align 8, !dbg !1993, !tbaa !1832
  %55 = add i64 %54, 1, !dbg !1994
  %56 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %14, i32 0, i32 0, !dbg !1995
  %57 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %56, i32 0, i32 0, !dbg !1996
  %58 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %57, i32 0, i32 0, !dbg !1997
  %59 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %58 to i8**, !dbg !1998
  %60 = load i8*, i8** %59, align 8, !dbg !1998, !tbaa !1756
  call void @"?deallocate@?$allocator@D@std@@QEAAXQEAD_K@Z"(%"class.std::allocator"* nonnull dereferenceable(1) %53, i8* %60, i64 %55), !dbg !1999
  %61 = load i8*, i8** %12, align 8, !dbg !2000, !tbaa !1675
  %62 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %14, i32 0, i32 0, !dbg !2001
  %63 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %62, i32 0, i32 0, !dbg !2002
  %64 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %63, i32 0, i32 0, !dbg !2003
  %65 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %64 to i8**, !dbg !2004
  store i8* %61, i8** %65, align 8, !dbg !2005, !tbaa !1756
  br label %71, !dbg !2006

66:                                               ; preds = %19
  %67 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %14, i32 0, i32 0, !dbg !2007
  %68 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %67, i32 0, i32 0, !dbg !2009
  %69 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %68, i32 0, i32 0, !dbg !2010
  %70 = bitcast %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %69 to i8**, !dbg !2011
  call void @"??$_Construct_in_place@PEADAEBQEAD@std@@YAXAEAPEADAEBQEAD@Z"(i8** nonnull align 8 dereferenceable(8) %70, i8** nonnull align 8 dereferenceable(8) %12) #16, !dbg !2012
  br label %71

71:                                               ; preds = %66, %52
  %72 = bitcast i8** %12 to i8*, !dbg !2013
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %72) #16, !dbg !2013
  %73 = bitcast %"class.std::allocator"** %11 to i8*, !dbg !2013
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %73) #16, !dbg !2013
  %74 = bitcast i64* %10 to i8*, !dbg !2013
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %74) #16, !dbg !2013
  %75 = bitcast i64* %9 to i8*, !dbg !2013
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %75) #16, !dbg !2013
  ret %"class.std::basic_string"* %14, !dbg !2014
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local zeroext i1 @"?_Large_string_engaged@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_NXZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %0) #2 comdat align 2 !dbg !2015 {
  %2 = alloca %"class.std::_String_val"*, align 8
  store %"class.std::_String_val"* %0, %"class.std::_String_val"** %2, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::_String_val"** %2, metadata !2017, metadata !DIExpression()), !dbg !2019
  %3 = load %"class.std::_String_val"*, %"class.std::_String_val"** %2, align 8
  %4 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %3, i32 0, i32 2, !dbg !2020
  %5 = load i64, i64* %4, align 8, !dbg !2020, !tbaa !1806
  %6 = icmp ule i64 16, %5, !dbg !2021
  ret i1 %6, !dbg !2022
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i8* @"??$_Unfancy@D@std@@YAPEADPEAD@Z"(i8* %0) #2 comdat !dbg !2023 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i8** %2, metadata !2026, metadata !DIExpression()), !dbg !2027
  %3 = load i8*, i8** %2, align 8, !dbg !2028, !tbaa !1675
  ret i8* %3, !dbg !2029
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i64 @"?max_size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %0) #2 comdat align 2 !dbg !2030 {
  %2 = alloca %"class.std::basic_string"*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %2, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %2, metadata !2032, metadata !DIExpression()), !dbg !2036
  %8 = load %"class.std::basic_string"*, %"class.std::basic_string"** %2, align 8
  %9 = bitcast i64* %3 to i8*, !dbg !2037
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %9) #16, !dbg !2037
  call void @llvm.dbg.declare(metadata i64* %3, metadata !2034, metadata !DIExpression()), !dbg !2038
  %10 = call nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBAAEBV?$allocator@D@2@XZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %8) #16, !dbg !2039
  %11 = call i64 @"?max_size@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA_KAEBV?$allocator@D@2@@Z"(%"class.std::allocator"* nonnull align 1 dereferenceable(1) %10) #16, !dbg !2040
  store i64 %11, i64* %3, align 8, !dbg !2038, !tbaa !1832
  %12 = bitcast i64* %4 to i8*, !dbg !2041
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %12) #16, !dbg !2041
  call void @llvm.dbg.declare(metadata i64* %4, metadata !2035, metadata !DIExpression()), !dbg !2042
  %13 = bitcast i64* %5 to i8*, !dbg !2043
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %13) #16, !dbg !2043
  store i64 16, i64* %5, align 8, !dbg !2043, !tbaa !1832
  %14 = call nonnull align 8 dereferenceable(8) i64* @"??$max@_K@std@@YAAEB_KAEB_K0@Z"(i64* nonnull align 8 dereferenceable(8) %3, i64* nonnull align 8 dereferenceable(8) %5) #16, !dbg !2044
  %15 = load i64, i64* %14, align 8, !dbg !2044, !tbaa !1832
  %16 = bitcast i64* %5 to i8*, !dbg !2044
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %16) #16, !dbg !2044
  store i64 %15, i64* %4, align 8, !dbg !2042, !tbaa !1832
  %17 = bitcast i64* %6 to i8*, !dbg !2045
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %17) #16, !dbg !2045
  %18 = load i64, i64* %4, align 8, !dbg !2045, !tbaa !1832
  %19 = sub i64 %18, 1, !dbg !2046
  store i64 %19, i64* %6, align 8, !dbg !2045, !tbaa !1832
  %20 = bitcast i64* %7 to i8*, !dbg !2047
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %20) #16, !dbg !2047
  %21 = call i64 @"?max@?$numeric_limits@_J@std@@SA_JXZ"() #16, !dbg !2048
  store i64 %21, i64* %7, align 8, !dbg !2047, !tbaa !1832
  %22 = call nonnull align 8 dereferenceable(8) i64* @"??$min@_K@std@@YAAEB_KAEB_K0@Z"(i64* nonnull align 8 dereferenceable(8) %7, i64* nonnull align 8 dereferenceable(8) %6) #16, !dbg !2049
  %23 = load i64, i64* %22, align 8, !dbg !2049, !tbaa !1832
  %24 = bitcast i64* %7 to i8*, !dbg !2050
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %24) #16, !dbg !2050
  %25 = bitcast i64* %6 to i8*, !dbg !2050
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %25) #16, !dbg !2050
  %26 = bitcast i64* %4 to i8*, !dbg !2051
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %26) #16, !dbg !2051
  %27 = bitcast i64* %3 to i8*, !dbg !2051
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %27) #16, !dbg !2051
  ret i64 %23, !dbg !2050
}

; Function Attrs: inlinehint noreturn uwtable mustprogress
define linkonce_odr dso_local void @"?_Xlen_string@std@@YAXXZ"() #8 comdat !dbg !2052 {
  call void @"?_Xlength_error@std@@YAXPEBD@Z"(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @"??_C@_0BA@JFNIOLAK@string?5too?5long?$AA@", i64 0, i64 0)) #18, !dbg !2053
  unreachable, !dbg !2053
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i64 @"?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBA_K_K@Z"(%"class.std::basic_string"* nonnull dereferenceable(32) %0, i64 %1) #2 comdat align 2 !dbg !2054 {
  %3 = alloca i64, align 8
  %4 = alloca %"class.std::basic_string"*, align 8
  store i64 %1, i64* %3, align 8, !tbaa !1832
  call void @llvm.dbg.declare(metadata i64* %3, metadata !2056, metadata !DIExpression()), !dbg !2058
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %4, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %4, metadata !2057, metadata !DIExpression()), !dbg !2059
  %5 = load %"class.std::basic_string"*, %"class.std::basic_string"** %4, align 8
  %6 = call i64 @"?max_size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %5) #16, !dbg !2060
  %7 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %5, i32 0, i32 0, !dbg !2061
  %8 = getelementptr inbounds %"class.std::_Compressed_pair", %"class.std::_Compressed_pair"* %7, i32 0, i32 0, !dbg !2062
  %9 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %8, i32 0, i32 2, !dbg !2063
  %10 = load i64, i64* %9, align 8, !dbg !2063, !tbaa !1754
  %11 = load i64, i64* %3, align 8, !dbg !2064, !tbaa !1832
  %12 = call i64 @"?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@CA_K_K00@Z"(i64 %11, i64 %10, i64 %6) #16, !dbg !2065
  ret i64 %12, !dbg !2066
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV?$allocator@D@2@XZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %0) #2 comdat align 2 !dbg !2067 {
  %2 = alloca %"class.std::basic_string"*, align 8
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %2, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %2, metadata !2069, metadata !DIExpression()), !dbg !2070
  %3 = load %"class.std::basic_string"*, %"class.std::basic_string"** %2, align 8
  %4 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %3, i32 0, i32 0, !dbg !2071
  %5 = call nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAAAEAV?$allocator@D@2@XZ"(%"class.std::_Compressed_pair"* nonnull dereferenceable(32) %4) #16, !dbg !2072
  ret %"class.std::allocator"* %5, !dbg !2073
}

; Function Attrs: uwtable mustprogress
define linkonce_odr dso_local i8* @"?allocate@?$allocator@D@std@@QEAAPEAD_K@Z"(%"class.std::allocator"* nonnull dereferenceable(1) %0, i64 %1) #0 comdat align 2 !dbg !2074 {
  %3 = alloca i64, align 8
  %4 = alloca %"class.std::allocator"*, align 8
  store i64 %1, i64* %3, align 8, !tbaa !1832
  call void @llvm.dbg.declare(metadata i64* %3, metadata !2076, metadata !DIExpression()), !dbg !2078
  store %"class.std::allocator"* %0, %"class.std::allocator"** %4, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %4, metadata !2077, metadata !DIExpression()), !dbg !2079
  %5 = load %"class.std::allocator"*, %"class.std::allocator"** %4, align 8
  %6 = load i64, i64* %3, align 8, !dbg !2080, !tbaa !1832
  %7 = call i64 @"??$_Get_size_of_n@$00@std@@YA_K_K@Z"(i64 %6), !dbg !2081
  %8 = call i8* @"??$_Allocate@$0BA@U_Default_allocate_traits@std@@$0A@@std@@YAPEAX_K@Z"(i64 %7), !dbg !2082, !heapallocsite !23
  ret i8* %8, !dbg !2083
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local void @"?_Orphan_all@_Container_base0@std@@QEAAXXZ"(%"struct.std::_Container_base0"* nonnull dereferenceable(1) %0) #2 comdat align 2 !dbg !2084 {
  %2 = alloca %"struct.std::_Container_base0"*, align 8
  store %"struct.std::_Container_base0"* %0, %"struct.std::_Container_base0"** %2, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"struct.std::_Container_base0"** %2, metadata !2086, metadata !DIExpression()), !dbg !2087
  %3 = load %"struct.std::_Container_base0"*, %"struct.std::_Container_base0"** %2, align 8
  ret void, !dbg !2088
}

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local void @"??R<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV23@QEBD_K@Z@QEBA?A?<auto>@@QEAD10@Z"(%class.anon* nonnull dereferenceable(1) %0, i8* %1, i64 %2, i8* %3) #7 comdat align 2 !dbg !2089 {
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca %class.anon*, align 8
  %9 = alloca i8, align 1
  store i8* %3, i8** %5, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i8** %5, metadata !2099, metadata !DIExpression()), !dbg !2104
  store i64 %2, i64* %6, align 8, !tbaa !1832
  call void @llvm.dbg.declare(metadata i64* %6, metadata !2100, metadata !DIExpression()), !dbg !2105
  store i8* %1, i8** %7, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i8** %7, metadata !2101, metadata !DIExpression()), !dbg !2106
  store %class.anon* %0, %class.anon** %8, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %class.anon** %8, metadata !2102, metadata !DIExpression()), !dbg !2107
  %10 = load %class.anon*, %class.anon** %8, align 8
  %11 = load i64, i64* %6, align 8, !dbg !2108, !tbaa !1832
  %12 = load i8*, i8** %5, align 8, !dbg !2109, !tbaa !1675
  %13 = load i8*, i8** %7, align 8, !dbg !2110, !tbaa !1675
  %14 = call i8* @"?copy@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z"(i8* %13, i8* %12, i64 %11) #16, !dbg !2111
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %9) #16, !dbg !2112
  store i8 0, i8* %9, align 1, !dbg !2112, !tbaa !1756
  %15 = load i8*, i8** %7, align 8, !dbg !2113, !tbaa !1675
  %16 = load i64, i64* %6, align 8, !dbg !2114, !tbaa !1832
  %17 = getelementptr inbounds i8, i8* %15, i64 %16, !dbg !2113
  call void @"?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z"(i8* nonnull align 1 dereferenceable(1) %17, i8* nonnull align 1 dereferenceable(1) %9) #16, !dbg !2115
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %9) #16, !dbg !2115
  ret void, !dbg !2116
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local void @"?deallocate@?$allocator@D@std@@QEAAXQEAD_K@Z"(%"class.std::allocator"* nonnull dereferenceable(1) %0, i8* %1, i64 %2) #2 comdat align 2 !dbg !2117 {
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %"class.std::allocator"*, align 8
  store i64 %2, i64* %4, align 8, !tbaa !1832
  call void @llvm.dbg.declare(metadata i64* %4, metadata !2119, metadata !DIExpression()), !dbg !2122
  store i8* %1, i8** %5, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i8** %5, metadata !2120, metadata !DIExpression()), !dbg !2123
  store %"class.std::allocator"* %0, %"class.std::allocator"** %6, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %6, metadata !2121, metadata !DIExpression()), !dbg !2124
  %7 = load %"class.std::allocator"*, %"class.std::allocator"** %6, align 8
  %8 = load i64, i64* %4, align 8, !dbg !2125, !tbaa !1832
  %9 = mul i64 1, %8, !dbg !2126
  %10 = load i8*, i8** %5, align 8, !dbg !2127, !tbaa !1675
  call void @"??$_Deallocate@$0BA@$0A@@std@@YAXPEAX_K@Z"(i8* %10, i64 %9) #16, !dbg !2128
  ret void, !dbg !2129
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local void @"??$_Construct_in_place@PEADAEBQEAD@std@@YAXAEAPEADAEBQEAD@Z"(i8** nonnull align 8 dereferenceable(8) %0, i8** nonnull align 8 dereferenceable(8) %1) #2 comdat !dbg !2130 {
  %3 = alloca i8**, align 8
  %4 = alloca i8**, align 8
  store i8** %1, i8*** %3, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i8*** %3, metadata !2136, metadata !DIExpression()), !dbg !2143
  store i8** %0, i8*** %4, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i8*** %4, metadata !2137, metadata !DIExpression()), !dbg !2144
  %5 = load i8**, i8*** %4, align 8, !dbg !2145, !tbaa !1675
  %6 = call i8** @"??$addressof@PEAD@std@@YAPEAPEADAEAPEAD@Z"(i8** nonnull align 8 dereferenceable(8) %5) #16, !dbg !2146
  %7 = call i8* @"??$_Voidify_iter@PEAPEAD@std@@YAPEAXPEAPEAD@Z"(i8** %6) #16, !dbg !2147
  %8 = bitcast i8* %7 to i8**, !dbg !2148
  %9 = load i8**, i8*** %3, align 8, !dbg !2149, !tbaa !1675
  %10 = call nonnull align 8 dereferenceable(8) i8** @"??$forward@AEBQEAD@std@@YAAEBQEADAEBQEAD@Z"(i8** nonnull align 8 dereferenceable(8) %9) #16, !dbg !2150
  %11 = load i8*, i8** %10, align 8, !dbg !2150, !tbaa !1675
  store i8* %11, i8** %8, align 8, !dbg !2148, !tbaa !1675
  ret void, !dbg !2151
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i64 @"?max_size@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA_KAEBV?$allocator@D@2@@Z"(%"class.std::allocator"* nonnull align 1 dereferenceable(1) %0) #2 comdat align 2 !dbg !2152 {
  %2 = alloca %"class.std::allocator"*, align 8
  store %"class.std::allocator"* %0, %"class.std::allocator"** %2, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %2, metadata !2154, metadata !DIExpression()), !dbg !2155
  ret i64 -1, !dbg !2156
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBAAEBV?$allocator@D@2@XZ"(%"class.std::basic_string"* nonnull dereferenceable(32) %0) #2 comdat align 2 !dbg !2157 {
  %2 = alloca %"class.std::basic_string"*, align 8
  store %"class.std::basic_string"* %0, %"class.std::basic_string"** %2, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::basic_string"** %2, metadata !2159, metadata !DIExpression()), !dbg !2160
  %3 = load %"class.std::basic_string"*, %"class.std::basic_string"** %2, align 8
  %4 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %3, i32 0, i32 0, !dbg !2161
  %5 = call nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEBAAEBV?$allocator@D@2@XZ"(%"class.std::_Compressed_pair"* nonnull dereferenceable(32) %4) #16, !dbg !2162
  ret %"class.std::allocator"* %5, !dbg !2163
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local nonnull align 8 dereferenceable(8) i64* @"??$max@_K@std@@YAAEB_KAEB_K0@Z"(i64* nonnull align 8 dereferenceable(8) %0, i64* nonnull align 8 dereferenceable(8) %1) #2 comdat !dbg !2164 {
  %3 = alloca i64*, align 8
  %4 = alloca i64*, align 8
  store i64* %1, i64** %3, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i64** %3, metadata !2170, metadata !DIExpression()), !dbg !2174
  store i64* %0, i64** %4, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i64** %4, metadata !2171, metadata !DIExpression()), !dbg !2175
  %5 = load i64*, i64** %4, align 8, !dbg !2176, !tbaa !1675
  %6 = load i64, i64* %5, align 8, !dbg !2176, !tbaa !1832
  %7 = load i64*, i64** %3, align 8, !dbg !2177, !tbaa !1675
  %8 = load i64, i64* %7, align 8, !dbg !2177, !tbaa !1832
  %9 = icmp ult i64 %6, %8, !dbg !2178
  br i1 %9, label %10, label %12, !dbg !2176

10:                                               ; preds = %2
  %11 = load i64*, i64** %3, align 8, !dbg !2179, !tbaa !1675
  br label %14, !dbg !2176

12:                                               ; preds = %2
  %13 = load i64*, i64** %4, align 8, !dbg !2180, !tbaa !1675
  br label %14, !dbg !2176

14:                                               ; preds = %12, %10
  %15 = phi i64* [ %11, %10 ], [ %13, %12 ], !dbg !2176
  ret i64* %15, !dbg !2181
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local nonnull align 8 dereferenceable(8) i64* @"??$min@_K@std@@YAAEB_KAEB_K0@Z"(i64* nonnull align 8 dereferenceable(8) %0, i64* nonnull align 8 dereferenceable(8) %1) #2 comdat !dbg !2182 {
  %3 = alloca i64*, align 8
  %4 = alloca i64*, align 8
  store i64* %1, i64** %3, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i64** %3, metadata !2184, metadata !DIExpression()), !dbg !2186
  store i64* %0, i64** %4, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i64** %4, metadata !2185, metadata !DIExpression()), !dbg !2187
  %5 = load i64*, i64** %3, align 8, !dbg !2188, !tbaa !1675
  %6 = load i64, i64* %5, align 8, !dbg !2188, !tbaa !1832
  %7 = load i64*, i64** %4, align 8, !dbg !2189, !tbaa !1675
  %8 = load i64, i64* %7, align 8, !dbg !2189, !tbaa !1832
  %9 = icmp ult i64 %6, %8, !dbg !2190
  br i1 %9, label %10, label %12, !dbg !2188

10:                                               ; preds = %2
  %11 = load i64*, i64** %3, align 8, !dbg !2191, !tbaa !1675
  br label %14, !dbg !2188

12:                                               ; preds = %2
  %13 = load i64*, i64** %4, align 8, !dbg !2192, !tbaa !1675
  br label %14, !dbg !2188

14:                                               ; preds = %12, %10
  %15 = phi i64* [ %11, %10 ], [ %13, %12 ], !dbg !2188
  ret i64* %15, !dbg !2193
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i64 @"?max@?$numeric_limits@_J@std@@SA_JXZ"() #2 comdat align 2 !dbg !2194 {
  ret i64 9223372036854775807, !dbg !2249
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEBAAEBV?$allocator@D@2@XZ"(%"class.std::_Compressed_pair"* nonnull dereferenceable(32) %0) #2 comdat align 2 !dbg !2250 {
  %2 = alloca %"class.std::_Compressed_pair"*, align 8
  store %"class.std::_Compressed_pair"* %0, %"class.std::_Compressed_pair"** %2, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::_Compressed_pair"** %2, metadata !2252, metadata !DIExpression()), !dbg !2254
  %3 = load %"class.std::_Compressed_pair"*, %"class.std::_Compressed_pair"** %2, align 8
  %4 = bitcast %"class.std::_Compressed_pair"* %3 to %"class.std::allocator"*, !dbg !2255
  ret %"class.std::allocator"* %4, !dbg !2256
}

; Function Attrs: noreturn
declare dso_local void @"?_Xlength_error@std@@YAXPEBD@Z"(i8*) #9

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i64 @"?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@CA_K_K00@Z"(i64 %0, i64 %1, i64 %2) #2 comdat align 2 !dbg !2257 {
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca i64, align 8
  store i64 %2, i64* %5, align 8, !tbaa !1832
  call void @llvm.dbg.declare(metadata i64* %5, metadata !2259, metadata !DIExpression()), !dbg !2263
  store i64 %1, i64* %6, align 8, !tbaa !1832
  call void @llvm.dbg.declare(metadata i64* %6, metadata !2260, metadata !DIExpression()), !dbg !2264
  store i64 %0, i64* %7, align 8, !tbaa !1832
  call void @llvm.dbg.declare(metadata i64* %7, metadata !2261, metadata !DIExpression()), !dbg !2265
  %11 = bitcast i64* %8 to i8*, !dbg !2266
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %11) #16, !dbg !2266
  call void @llvm.dbg.declare(metadata i64* %8, metadata !2262, metadata !DIExpression()), !dbg !2267
  %12 = load i64, i64* %7, align 8, !dbg !2268, !tbaa !1832
  %13 = or i64 %12, 15, !dbg !2269
  store i64 %13, i64* %8, align 8, !dbg !2267, !tbaa !1832
  %14 = load i64, i64* %8, align 8, !dbg !2270, !tbaa !1832
  %15 = load i64, i64* %5, align 8, !dbg !2272, !tbaa !1832
  %16 = icmp ugt i64 %14, %15, !dbg !2273
  br i1 %16, label %17, label %19, !dbg !2274

17:                                               ; preds = %3
  %18 = load i64, i64* %5, align 8, !dbg !2275, !tbaa !1832
  store i64 %18, i64* %4, align 8, !dbg !2277
  store i32 1, i32* %9, align 4
  br label %37, !dbg !2277

19:                                               ; preds = %3
  %20 = load i64, i64* %6, align 8, !dbg !2278, !tbaa !1832
  %21 = load i64, i64* %5, align 8, !dbg !2280, !tbaa !1832
  %22 = load i64, i64* %6, align 8, !dbg !2281, !tbaa !1832
  %23 = udiv i64 %22, 2, !dbg !2282
  %24 = sub i64 %21, %23, !dbg !2283
  %25 = icmp ugt i64 %20, %24, !dbg !2284
  br i1 %25, label %26, label %28, !dbg !2285

26:                                               ; preds = %19
  %27 = load i64, i64* %5, align 8, !dbg !2286, !tbaa !1832
  store i64 %27, i64* %4, align 8, !dbg !2288
  store i32 1, i32* %9, align 4
  br label %37, !dbg !2288

28:                                               ; preds = %19
  %29 = bitcast i64* %10 to i8*, !dbg !2289
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %29) #16, !dbg !2289
  %30 = load i64, i64* %6, align 8, !dbg !2289, !tbaa !1832
  %31 = load i64, i64* %6, align 8, !dbg !2290, !tbaa !1832
  %32 = udiv i64 %31, 2, !dbg !2291
  %33 = add i64 %30, %32, !dbg !2292
  store i64 %33, i64* %10, align 8, !dbg !2289, !tbaa !1832
  %34 = call nonnull align 8 dereferenceable(8) i64* @"??$max@_K@std@@YAAEB_KAEB_K0@Z"(i64* nonnull align 8 dereferenceable(8) %8, i64* nonnull align 8 dereferenceable(8) %10) #16, !dbg !2293
  %35 = load i64, i64* %34, align 8, !dbg !2293, !tbaa !1832
  store i64 %35, i64* %4, align 8, !dbg !2294
  %36 = bitcast i64* %10 to i8*, !dbg !2294
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %36) #16, !dbg !2294
  store i32 1, i32* %9, align 4
  br label %37, !dbg !2294

37:                                               ; preds = %28, %26, %17
  %38 = bitcast i64* %8 to i8*, !dbg !2295
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %38) #16, !dbg !2295
  %39 = load i64, i64* %4, align 8, !dbg !2295
  ret i64 %39, !dbg !2295
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local nonnull align 1 dereferenceable(1) %"class.std::allocator"* @"?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAAAEAV?$allocator@D@2@XZ"(%"class.std::_Compressed_pair"* nonnull dereferenceable(32) %0) #2 comdat align 2 !dbg !2296 {
  %2 = alloca %"class.std::_Compressed_pair"*, align 8
  store %"class.std::_Compressed_pair"* %0, %"class.std::_Compressed_pair"** %2, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::_Compressed_pair"** %2, metadata !2298, metadata !DIExpression()), !dbg !2299
  %3 = load %"class.std::_Compressed_pair"*, %"class.std::_Compressed_pair"** %2, align 8
  %4 = bitcast %"class.std::_Compressed_pair"* %3 to %"class.std::allocator"*, !dbg !2300
  ret %"class.std::allocator"* %4, !dbg !2301
}

; Function Attrs: uwtable mustprogress
define linkonce_odr dso_local i8* @"??$_Allocate@$0BA@U_Default_allocate_traits@std@@$0A@@std@@YAPEAX_K@Z"(i64 %0) #0 comdat !dbg !2302 {
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  store i64 %0, i64* %3, align 8, !tbaa !1832
  call void @llvm.dbg.declare(metadata i64* %3, metadata !2306, metadata !DIExpression()), !dbg !2314
  %4 = load i64, i64* %3, align 8, !dbg !2315, !tbaa !1832
  %5 = icmp uge i64 %4, 4096, !dbg !2317
  br i1 %5, label %6, label %9, !dbg !2318

6:                                                ; preds = %1
  %7 = load i64, i64* %3, align 8, !dbg !2319, !tbaa !1832
  %8 = call i8* @"??$_Allocate_manually_vector_aligned@U_Default_allocate_traits@std@@@std@@YAPEAX_K@Z"(i64 %7), !dbg !2321, !heapallocsite !197
  store i8* %8, i8** %2, align 8, !dbg !2322
  br label %16, !dbg !2322

9:                                                ; preds = %1
  %10 = load i64, i64* %3, align 8, !dbg !2323, !tbaa !1832
  %11 = icmp ne i64 %10, 0, !dbg !2325
  br i1 %11, label %12, label %15, !dbg !2326

12:                                               ; preds = %9
  %13 = load i64, i64* %3, align 8, !dbg !2327, !tbaa !1832
  %14 = call i8* @"?_Allocate@_Default_allocate_traits@std@@SAPEAX_K@Z"(i64 %13), !dbg !2329, !heapallocsite !197
  store i8* %14, i8** %2, align 8, !dbg !2330
  br label %16, !dbg !2330

15:                                               ; preds = %9
  store i8* null, i8** %2, align 8, !dbg !2331
  br label %16, !dbg !2331

16:                                               ; preds = %15, %12, %6
  %17 = load i8*, i8** %2, align 8, !dbg !2332
  ret i8* %17, !dbg !2332
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i64 @"??$_Get_size_of_n@$00@std@@YA_K_K@Z"(i64 %0) #2 comdat !dbg !2333 {
  %2 = alloca i64, align 8
  %3 = alloca i8, align 1
  store i64 %0, i64* %2, align 8, !tbaa !1832
  call void @llvm.dbg.declare(metadata i64* %2, metadata !2335, metadata !DIExpression()), !dbg !2339
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %3) #16, !dbg !2340
  call void @llvm.dbg.declare(metadata i8* %3, metadata !2336, metadata !DIExpression()), !dbg !2341
  store i8 0, i8* %3, align 1, !dbg !2341, !tbaa !2342
  %4 = load i64, i64* %2, align 8, !dbg !2344, !tbaa !1832
  %5 = mul i64 %4, 1, !dbg !2345
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %3) #16, !dbg !2346
  ret i64 %5, !dbg !2347
}

; Function Attrs: uwtable mustprogress
define linkonce_odr dso_local i8* @"??$_Allocate_manually_vector_aligned@U_Default_allocate_traits@std@@@std@@YAPEAX_K@Z"(i64 %0) #0 comdat !dbg !2348 {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  store i64 %0, i64* %2, align 8, !tbaa !1832
  call void @llvm.dbg.declare(metadata i64* %2, metadata !2350, metadata !DIExpression()), !dbg !2358
  %6 = bitcast i64* %3 to i8*, !dbg !2359
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #16, !dbg !2359
  call void @llvm.dbg.declare(metadata i64* %3, metadata !2351, metadata !DIExpression()), !dbg !2360
  %7 = load i64, i64* %2, align 8, !dbg !2361, !tbaa !1832
  %8 = add i64 39, %7, !dbg !2362
  store i64 %8, i64* %3, align 8, !dbg !2360, !tbaa !1832
  %9 = load i64, i64* %3, align 8, !dbg !2363, !tbaa !1832
  %10 = load i64, i64* %2, align 8, !dbg !2365, !tbaa !1832
  %11 = icmp ule i64 %9, %10, !dbg !2366
  br i1 %11, label %12, label %13, !dbg !2367

12:                                               ; preds = %1
  call void @"?_Throw_bad_array_new_length@std@@YAXXZ"() #18, !dbg !2368
  unreachable, !dbg !2368

13:                                               ; preds = %1
  %14 = bitcast i64* %4 to i8*, !dbg !2370
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %14) #16, !dbg !2370
  call void @llvm.dbg.declare(metadata i64* %4, metadata !2352, metadata !DIExpression()), !dbg !2371
  %15 = load i64, i64* %3, align 8, !dbg !2372, !tbaa !1832
  %16 = call i8* @"?_Allocate@_Default_allocate_traits@std@@SAPEAX_K@Z"(i64 %15), !dbg !2373, !heapallocsite !197
  %17 = ptrtoint i8* %16 to i64, !dbg !2374
  store i64 %17, i64* %4, align 8, !dbg !2371, !tbaa !1832
  br label %18, !dbg !2375

18:                                               ; preds = %13
  %19 = load i64, i64* %4, align 8, !dbg !2376, !tbaa !1832
  %20 = icmp ne i64 %19, 0, !dbg !2376
  br i1 %20, label %21, label %22, !dbg !2379

21:                                               ; preds = %18
  br label %26, !dbg !2380

22:                                               ; preds = %18
  br label %23, !dbg !2382

23:                                               ; preds = %22
  call void @_invalid_parameter_noinfo_noreturn() #18, !dbg !2384
  unreachable, !dbg !2384

24:                                               ; No predecessors!
  br label %25, !dbg !2384

25:                                               ; preds = %24
  br label %26

26:                                               ; preds = %25, %21
  br label %27, !dbg !2379

27:                                               ; preds = %26
  br label %28, !dbg !2379

28:                                               ; preds = %27
  %29 = bitcast i8** %5 to i8*, !dbg !2386
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %29) #16, !dbg !2386
  call void @llvm.dbg.declare(metadata i8** %5, metadata !2354, metadata !DIExpression()), !dbg !2387
  %30 = load i64, i64* %4, align 8, !dbg !2388, !tbaa !1832
  %31 = add i64 %30, 39, !dbg !2389
  %32 = and i64 %31, -32, !dbg !2390
  %33 = inttoptr i64 %32 to i8*, !dbg !2391
  store i8* %33, i8** %5, align 8, !dbg !2387, !tbaa !1675
  %34 = load i64, i64* %4, align 8, !dbg !2392, !tbaa !1832
  %35 = load i8*, i8** %5, align 8, !dbg !2393, !tbaa !1675
  %36 = bitcast i8* %35 to i64*, !dbg !2394
  %37 = getelementptr inbounds i64, i64* %36, i64 -1, !dbg !2394
  store i64 %34, i64* %37, align 8, !dbg !2395, !tbaa !1832
  %38 = load i8*, i8** %5, align 8, !dbg !2396, !tbaa !1675
  %39 = bitcast i8** %5 to i8*, !dbg !2397
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %39) #16, !dbg !2397
  %40 = bitcast i64* %4 to i8*, !dbg !2397
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %40) #16, !dbg !2397
  %41 = bitcast i64* %3 to i8*, !dbg !2397
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %41) #16, !dbg !2397
  ret i8* %38, !dbg !2398
}

; Function Attrs: uwtable mustprogress
define linkonce_odr dso_local i8* @"?_Allocate@_Default_allocate_traits@std@@SAPEAX_K@Z"(i64 %0) #0 comdat align 2 !dbg !2399 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8, !tbaa !1832
  call void @llvm.dbg.declare(metadata i64* %2, metadata !2401, metadata !DIExpression()), !dbg !2402
  %3 = load i64, i64* %2, align 8, !dbg !2403, !tbaa !1832
  %4 = call noalias nonnull i8* @"??2@YAPEAX_K@Z"(i64 %3) #19, !dbg !2404, !heapallocsite !197
  ret i8* %4, !dbg !2405
}

; Function Attrs: inlinehint noreturn uwtable mustprogress
define linkonce_odr dso_local void @"?_Throw_bad_array_new_length@std@@YAXXZ"() #8 comdat !dbg !2406 {
  %1 = alloca %"class.std::bad_array_new_length", align 8
  %2 = call %"class.std::bad_array_new_length"* @"??0bad_array_new_length@std@@QEAA@XZ"(%"class.std::bad_array_new_length"* nonnull dereferenceable(24) %1) #16, !dbg !2407
  %3 = bitcast %"class.std::bad_array_new_length"* %1 to i8*, !dbg !2407
  call void @_CxxThrowException(i8* %3, %eh.ThrowInfo* @"_TI3?AVbad_array_new_length@std@@") #18, !dbg !2407
  unreachable, !dbg !2407
}

; Function Attrs: noreturn
declare dso_local void @_invalid_parameter_noinfo_noreturn() #9

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local %"class.std::bad_array_new_length"* @"??0bad_array_new_length@std@@QEAA@XZ"(%"class.std::bad_array_new_length"* nonnull returned dereferenceable(24) %0) unnamed_addr #4 comdat align 2 !dbg !2408 {
  %2 = alloca %"class.std::bad_array_new_length"*, align 8
  store %"class.std::bad_array_new_length"* %0, %"class.std::bad_array_new_length"** %2, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::bad_array_new_length"** %2, metadata !2462, metadata !DIExpression()), !dbg !2464
  %3 = load %"class.std::bad_array_new_length"*, %"class.std::bad_array_new_length"** %2, align 8
  %4 = bitcast %"class.std::bad_array_new_length"* %3 to %"class.std::bad_alloc"*, !dbg !2465
  %5 = call %"class.std::bad_alloc"* @"??0bad_alloc@std@@AEAA@QEBD@Z"(%"class.std::bad_alloc"* nonnull dereferenceable(24) %4, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @"??_C@_0BF@KINCDENJ@bad?5array?5new?5length?$AA@", i64 0, i64 0)) #16, !dbg !2466
  %6 = bitcast %"class.std::bad_array_new_length"* %3 to i32 (...)***, !dbg !2465
  store i32 (...)** bitcast (i8** @"??_7bad_array_new_length@std@@6B@" to i32 (...)**), i32 (...)*** %6, align 8, !dbg !2465, !tbaa !2467
  ret %"class.std::bad_array_new_length"* %3, !dbg !2469
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local %"class.std::bad_array_new_length"* @"??0bad_array_new_length@std@@QEAA@AEBV01@@Z"(%"class.std::bad_array_new_length"* nonnull returned dereferenceable(24) %0, %"class.std::bad_array_new_length"* nonnull align 8 dereferenceable(24) %1) unnamed_addr #6 comdat align 2 !dbg !2470 {
  %3 = alloca %"class.std::bad_array_new_length"*, align 8
  %4 = alloca %"class.std::bad_array_new_length"*, align 8
  store %"class.std::bad_array_new_length"* %1, %"class.std::bad_array_new_length"** %3, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::bad_array_new_length"** %3, metadata !2477, metadata !DIExpression()), !dbg !2479
  store %"class.std::bad_array_new_length"* %0, %"class.std::bad_array_new_length"** %4, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::bad_array_new_length"** %4, metadata !2478, metadata !DIExpression()), !dbg !2479
  %5 = load %"class.std::bad_array_new_length"*, %"class.std::bad_array_new_length"** %4, align 8
  %6 = bitcast %"class.std::bad_array_new_length"* %5 to %"class.std::bad_alloc"*, !dbg !2480
  %7 = load %"class.std::bad_array_new_length"*, %"class.std::bad_array_new_length"** %3, align 8, !dbg !2480, !tbaa !1675
  %8 = bitcast %"class.std::bad_array_new_length"* %7 to %"class.std::bad_alloc"*, !dbg !2480
  %9 = call %"class.std::bad_alloc"* @"??0bad_alloc@std@@QEAA@AEBV01@@Z"(%"class.std::bad_alloc"* nonnull dereferenceable(24) %6, %"class.std::bad_alloc"* nonnull align 8 dereferenceable(24) %8) #16, !dbg !2480
  %10 = bitcast %"class.std::bad_array_new_length"* %5 to i32 (...)***, !dbg !2480
  store i32 (...)** bitcast (i8** @"??_7bad_array_new_length@std@@6B@" to i32 (...)**), i32 (...)*** %10, align 8, !dbg !2480, !tbaa !2467
  ret %"class.std::bad_array_new_length"* %5, !dbg !2480
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local %"class.std::bad_alloc"* @"??0bad_alloc@std@@QEAA@AEBV01@@Z"(%"class.std::bad_alloc"* nonnull returned dereferenceable(24) %0, %"class.std::bad_alloc"* nonnull align 8 dereferenceable(24) %1) unnamed_addr #6 comdat align 2 !dbg !2481 {
  %3 = alloca %"class.std::bad_alloc"*, align 8
  %4 = alloca %"class.std::bad_alloc"*, align 8
  store %"class.std::bad_alloc"* %1, %"class.std::bad_alloc"** %3, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::bad_alloc"** %3, metadata !2488, metadata !DIExpression()), !dbg !2491
  store %"class.std::bad_alloc"* %0, %"class.std::bad_alloc"** %4, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::bad_alloc"** %4, metadata !2489, metadata !DIExpression()), !dbg !2491
  %5 = load %"class.std::bad_alloc"*, %"class.std::bad_alloc"** %4, align 8
  %6 = bitcast %"class.std::bad_alloc"* %5 to %"class.std::exception"*, !dbg !2492
  %7 = load %"class.std::bad_alloc"*, %"class.std::bad_alloc"** %3, align 8, !dbg !2492, !tbaa !1675
  %8 = bitcast %"class.std::bad_alloc"* %7 to %"class.std::exception"*, !dbg !2492
  %9 = call %"class.std::exception"* @"??0exception@std@@QEAA@AEBV01@@Z"(%"class.std::exception"* nonnull dereferenceable(24) %6, %"class.std::exception"* nonnull align 8 dereferenceable(24) %8) #16, !dbg !2492
  %10 = bitcast %"class.std::bad_alloc"* %5 to i32 (...)***, !dbg !2492
  store i32 (...)** bitcast (i8** @"??_7bad_alloc@std@@6B@" to i32 (...)**), i32 (...)*** %10, align 8, !dbg !2492, !tbaa !2467
  ret %"class.std::bad_alloc"* %5, !dbg !2492
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local %"class.std::exception"* @"??0exception@std@@QEAA@AEBV01@@Z"(%"class.std::exception"* nonnull returned dereferenceable(24) %0, %"class.std::exception"* nonnull align 8 dereferenceable(24) %1) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__CxxFrameHandler3 to i8*) !dbg !2493 {
  %3 = alloca %"class.std::exception"*, align 8
  %4 = alloca %"class.std::exception"*, align 8
  store %"class.std::exception"* %1, %"class.std::exception"** %3, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::exception"** %3, metadata !2495, metadata !DIExpression()), !dbg !2498
  store %"class.std::exception"* %0, %"class.std::exception"** %4, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::exception"** %4, metadata !2496, metadata !DIExpression()), !dbg !2499
  %5 = load %"class.std::exception"*, %"class.std::exception"** %4, align 8
  %6 = bitcast %"class.std::exception"* %5 to i32 (...)***, !dbg !2500
  store i32 (...)** bitcast (i8** @"??_7exception@std@@6B@" to i32 (...)**), i32 (...)*** %6, align 8, !dbg !2500, !tbaa !2467
  %7 = getelementptr inbounds %"class.std::exception", %"class.std::exception"* %5, i32 0, i32 1, !dbg !2501
  %8 = bitcast %struct.__std_exception_data* %7 to i8*, !dbg !2501
  call void @llvm.memset.p0i8.i64(i8* align 8 %8, i8 0, i64 16, i1 false), !dbg !2501
  %9 = getelementptr inbounds %"class.std::exception", %"class.std::exception"* %5, i32 0, i32 1, !dbg !2502
  %10 = load %"class.std::exception"*, %"class.std::exception"** %3, align 8, !dbg !2504, !tbaa !1675
  %11 = getelementptr inbounds %"class.std::exception", %"class.std::exception"* %10, i32 0, i32 1, !dbg !2505
  invoke void @__std_exception_copy(%struct.__std_exception_data* %11, %struct.__std_exception_data* %9)
          to label %12 unwind label %13, !dbg !2506

12:                                               ; preds = %2
  ret %"class.std::exception"* %5, !dbg !2507

13:                                               ; preds = %2
  %14 = cleanuppad within none [], !dbg !2506
  call void @__std_terminate() #17 [ "funclet"(token %14) ], !dbg !2506
  unreachable, !dbg !2506
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @"??1exception@std@@UEAA@XZ"(%"class.std::exception"* nonnull dereferenceable(24) %0) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__CxxFrameHandler3 to i8*) !dbg !2508 {
  %2 = alloca %"class.std::exception"*, align 8
  store %"class.std::exception"* %0, %"class.std::exception"** %2, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::exception"** %2, metadata !2510, metadata !DIExpression()), !dbg !2511
  %3 = load %"class.std::exception"*, %"class.std::exception"** %2, align 8
  %4 = bitcast %"class.std::exception"* %3 to i32 (...)***, !dbg !2512
  store i32 (...)** bitcast (i8** @"??_7exception@std@@6B@" to i32 (...)**), i32 (...)*** %4, align 8, !dbg !2512, !tbaa !2467
  %5 = getelementptr inbounds %"class.std::exception", %"class.std::exception"* %3, i32 0, i32 1, !dbg !2513
  invoke void @__std_exception_destroy(%struct.__std_exception_data* %5)
          to label %6 unwind label %7, !dbg !2515

6:                                                ; preds = %1
  ret void, !dbg !2516

7:                                                ; preds = %1
  %8 = cleanuppad within none [], !dbg !2515
  call void @__std_terminate() #17 [ "funclet"(token %8) ], !dbg !2515
  unreachable, !dbg !2515
}

declare dso_local void @_CxxThrowException(i8*, %eh.ThrowInfo*)

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local %"class.std::bad_alloc"* @"??0bad_alloc@std@@AEAA@QEBD@Z"(%"class.std::bad_alloc"* nonnull returned dereferenceable(24) %0, i8* %1) unnamed_addr #4 comdat align 2 !dbg !2517 {
  %3 = alloca i8*, align 8
  %4 = alloca %"class.std::bad_alloc"*, align 8
  store i8* %1, i8** %3, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i8** %3, metadata !2519, metadata !DIExpression()), !dbg !2521
  store %"class.std::bad_alloc"* %0, %"class.std::bad_alloc"** %4, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::bad_alloc"** %4, metadata !2520, metadata !DIExpression()), !dbg !2522
  %5 = load %"class.std::bad_alloc"*, %"class.std::bad_alloc"** %4, align 8
  %6 = bitcast %"class.std::bad_alloc"* %5 to %"class.std::exception"*, !dbg !2523
  %7 = load i8*, i8** %3, align 8, !dbg !2524, !tbaa !1675
  %8 = call %"class.std::exception"* @"??0exception@std@@QEAA@QEBDH@Z"(%"class.std::exception"* nonnull dereferenceable(24) %6, i8* %7, i32 1) #16, !dbg !2525
  %9 = bitcast %"class.std::bad_alloc"* %5 to i32 (...)***, !dbg !2523
  store i32 (...)** bitcast (i8** @"??_7bad_alloc@std@@6B@" to i32 (...)**), i32 (...)*** %9, align 8, !dbg !2523, !tbaa !2467
  ret %"class.std::bad_alloc"* %5, !dbg !2526
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local i8* @"??_Gbad_array_new_length@std@@UEAAPEAXI@Z"(%"class.std::bad_array_new_length"* nonnull dereferenceable(24) %0, i32 %1) unnamed_addr #6 comdat align 2 !dbg !2527 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %"class.std::bad_array_new_length"*, align 8
  store i32 %1, i32* %4, align 4, !tbaa !1699
  call void @llvm.dbg.declare(metadata i32* %4, metadata !2530, metadata !DIExpression()), !dbg !2532
  store %"class.std::bad_array_new_length"* %0, %"class.std::bad_array_new_length"** %5, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::bad_array_new_length"** %5, metadata !2531, metadata !DIExpression()), !dbg !2532
  %6 = load %"class.std::bad_array_new_length"*, %"class.std::bad_array_new_length"** %5, align 8
  %7 = bitcast %"class.std::bad_array_new_length"* %6 to i8*
  store i8* %7, i8** %3, align 8
  %8 = load i32, i32* %4, align 4
  call void bitcast (void (%"class.std::exception"*)* @"??1exception@std@@UEAA@XZ" to void (%"class.std::bad_array_new_length"*)*)(%"class.std::bad_array_new_length"* nonnull dereferenceable(24) %6) #16, !dbg !2533
  %9 = icmp eq i32 %8, 0, !dbg !2533
  br i1 %9, label %12, label %10, !dbg !2533

10:                                               ; preds = %2
  %11 = bitcast %"class.std::bad_array_new_length"* %6 to i8*, !dbg !2533
  call void @"??3@YAXPEAX@Z"(i8* %11) #20, !dbg !2533
  br label %12, !dbg !2533

12:                                               ; preds = %10, %2
  %13 = load i8*, i8** %3, align 8, !dbg !2533
  ret i8* %13, !dbg !2533
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i8* @"?what@exception@std@@UEBAPEBDXZ"(%"class.std::exception"* nonnull dereferenceable(24) %0) unnamed_addr #2 comdat align 2 !dbg !2534 {
  %2 = alloca %"class.std::exception"*, align 8
  store %"class.std::exception"* %0, %"class.std::exception"** %2, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::exception"** %2, metadata !2536, metadata !DIExpression()), !dbg !2538
  %3 = load %"class.std::exception"*, %"class.std::exception"** %2, align 8
  %4 = getelementptr inbounds %"class.std::exception", %"class.std::exception"* %3, i32 0, i32 1, !dbg !2539
  %5 = getelementptr inbounds %struct.__std_exception_data, %struct.__std_exception_data* %4, i32 0, i32 0, !dbg !2540
  %6 = load i8*, i8** %5, align 8, !dbg !2540, !tbaa !2541
  %7 = icmp ne i8* %6, null, !dbg !2539
  br i1 %7, label %8, label %12, !dbg !2539

8:                                                ; preds = %1
  %9 = getelementptr inbounds %"class.std::exception", %"class.std::exception"* %3, i32 0, i32 1, !dbg !2544
  %10 = getelementptr inbounds %struct.__std_exception_data, %struct.__std_exception_data* %9, i32 0, i32 0, !dbg !2545
  %11 = load i8*, i8** %10, align 8, !dbg !2545, !tbaa !2541
  br label %13, !dbg !2539

12:                                               ; preds = %1
  br label %13, !dbg !2539

13:                                               ; preds = %12, %8
  %14 = phi i8* [ %11, %8 ], [ getelementptr inbounds ([18 x i8], [18 x i8]* @"??_C@_0BC@EOODALEL@Unknown?5exception?$AA@", i64 0, i64 0), %12 ], !dbg !2539
  ret i8* %14, !dbg !2546
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local %"class.std::exception"* @"??0exception@std@@QEAA@QEBDH@Z"(%"class.std::exception"* nonnull returned dereferenceable(24) %0, i8* %1, i32 %2) unnamed_addr #4 comdat align 2 !dbg !2547 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca %"class.std::exception"*, align 8
  store i32 %2, i32* %4, align 4, !tbaa !1699
  call void @llvm.dbg.declare(metadata i32* %4, metadata !2549, metadata !DIExpression()), !dbg !2552
  store i8* %1, i8** %5, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i8** %5, metadata !2550, metadata !DIExpression()), !dbg !2553
  store %"class.std::exception"* %0, %"class.std::exception"** %6, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::exception"** %6, metadata !2551, metadata !DIExpression()), !dbg !2554
  %7 = load %"class.std::exception"*, %"class.std::exception"** %6, align 8
  %8 = bitcast %"class.std::exception"* %7 to i32 (...)***, !dbg !2555
  store i32 (...)** bitcast (i8** @"??_7exception@std@@6B@" to i32 (...)**), i32 (...)*** %8, align 8, !dbg !2555, !tbaa !2467
  %9 = getelementptr inbounds %"class.std::exception", %"class.std::exception"* %7, i32 0, i32 1, !dbg !2556
  %10 = bitcast %struct.__std_exception_data* %9 to i8*, !dbg !2556
  call void @llvm.memset.p0i8.i64(i8* align 8 %10, i8 0, i64 16, i1 false), !dbg !2556
  %11 = load i8*, i8** %5, align 8, !dbg !2557, !tbaa !1675
  %12 = getelementptr inbounds %"class.std::exception", %"class.std::exception"* %7, i32 0, i32 1, !dbg !2559
  %13 = getelementptr inbounds %struct.__std_exception_data, %struct.__std_exception_data* %12, i32 0, i32 0, !dbg !2560
  store i8* %11, i8** %13, align 8, !dbg !2561, !tbaa !2541
  ret %"class.std::exception"* %7, !dbg !2562
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local i8* @"??_Gbad_alloc@std@@UEAAPEAXI@Z"(%"class.std::bad_alloc"* nonnull dereferenceable(24) %0, i32 %1) unnamed_addr #6 comdat align 2 !dbg !2563 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %"class.std::bad_alloc"*, align 8
  store i32 %1, i32* %4, align 4, !tbaa !1699
  call void @llvm.dbg.declare(metadata i32* %4, metadata !2566, metadata !DIExpression()), !dbg !2568
  store %"class.std::bad_alloc"* %0, %"class.std::bad_alloc"** %5, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::bad_alloc"** %5, metadata !2567, metadata !DIExpression()), !dbg !2568
  %6 = load %"class.std::bad_alloc"*, %"class.std::bad_alloc"** %5, align 8
  %7 = bitcast %"class.std::bad_alloc"* %6 to i8*
  store i8* %7, i8** %3, align 8
  %8 = load i32, i32* %4, align 4
  call void bitcast (void (%"class.std::exception"*)* @"??1exception@std@@UEAA@XZ" to void (%"class.std::bad_alloc"*)*)(%"class.std::bad_alloc"* nonnull dereferenceable(24) %6) #16, !dbg !2569
  %9 = icmp eq i32 %8, 0, !dbg !2569
  br i1 %9, label %12, label %10, !dbg !2569

10:                                               ; preds = %2
  %11 = bitcast %"class.std::bad_alloc"* %6 to i8*, !dbg !2569
  call void @"??3@YAXPEAX@Z"(i8* %11) #20, !dbg !2569
  br label %12, !dbg !2569

12:                                               ; preds = %10, %2
  %13 = load i8*, i8** %3, align 8, !dbg !2569
  ret i8* %13, !dbg !2569
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #10

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local i8* @"??_Gexception@std@@UEAAPEAXI@Z"(%"class.std::exception"* nonnull dereferenceable(24) %0, i32 %1) unnamed_addr #4 comdat align 2 !dbg !2570 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %"class.std::exception"*, align 8
  store i32 %1, i32* %4, align 4, !tbaa !1699
  call void @llvm.dbg.declare(metadata i32* %4, metadata !2572, metadata !DIExpression()), !dbg !2574
  store %"class.std::exception"* %0, %"class.std::exception"** %5, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::exception"** %5, metadata !2573, metadata !DIExpression()), !dbg !2574
  %6 = load %"class.std::exception"*, %"class.std::exception"** %5, align 8
  %7 = bitcast %"class.std::exception"* %6 to i8*
  store i8* %7, i8** %3, align 8
  %8 = load i32, i32* %4, align 4
  call void @"??1exception@std@@UEAA@XZ"(%"class.std::exception"* nonnull dereferenceable(24) %6) #16, !dbg !2575
  %9 = icmp eq i32 %8, 0, !dbg !2575
  br i1 %9, label %12, label %10, !dbg !2575

10:                                               ; preds = %2
  %11 = bitcast %"class.std::exception"* %6 to i8*, !dbg !2575
  call void @"??3@YAXPEAX@Z"(i8* %11) #20, !dbg !2575
  br label %12, !dbg !2575

12:                                               ; preds = %10, %2
  %13 = load i8*, i8** %3, align 8, !dbg !2576
  ret i8* %13, !dbg !2576
}

; Function Attrs: nobuiltin nounwind
declare dso_local void @"??3@YAXPEAX@Z"(i8*) #11

declare dso_local void @__std_exception_destroy(%struct.__std_exception_data*) #12

declare dso_local void @__std_terminate()

declare dso_local void @__std_exception_copy(%struct.__std_exception_data*, %struct.__std_exception_data*) #12

; Function Attrs: nobuiltin allocsize(0)
declare dso_local nonnull i8* @"??2@YAPEAX_K@Z"(i64) #13

; Function Attrs: inlinehint nounwind uwtable mustprogress
define linkonce_odr dso_local i8* @"?copy@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z"(i8* %0, i8* %1, i64 %2) #7 comdat align 2 !dbg !2577 {
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  store i64 %2, i64* %4, align 8, !tbaa !1832
  call void @llvm.dbg.declare(metadata i64* %4, metadata !2579, metadata !DIExpression()), !dbg !2582
  store i8* %1, i8** %5, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i8** %5, metadata !2580, metadata !DIExpression()), !dbg !2583
  store i8* %0, i8** %6, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i8** %6, metadata !2581, metadata !DIExpression()), !dbg !2584
  %7 = load i8*, i8** %6, align 8, !dbg !2585, !tbaa !1675
  %8 = load i8*, i8** %5, align 8, !dbg !2586, !tbaa !1675
  %9 = load i64, i64* %4, align 8, !dbg !2587, !tbaa !1832
  %10 = mul i64 %9, 1, !dbg !2588
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 %8, i64 %10, i1 false), !dbg !2589
  %11 = load i8*, i8** %6, align 8, !dbg !2590, !tbaa !1675
  ret i8* %11, !dbg !2591
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local void @"??$_Deallocate@$0BA@$0A@@std@@YAXPEAX_K@Z"(i8* %0, i64 %1) #2 comdat personality i8* bitcast (i32 (...)* @__CxxFrameHandler3 to i8*) !dbg !2592 {
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  store i64 %1, i64* %3, align 8, !tbaa !1832
  call void @llvm.dbg.declare(metadata i64* %3, metadata !2596, metadata !DIExpression()), !dbg !2599
  store i8* %0, i8** %4, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i8** %4, metadata !2597, metadata !DIExpression()), !dbg !2600
  %5 = load i64, i64* %3, align 8, !dbg !2601, !tbaa !1832
  %6 = icmp uge i64 %5, 4096, !dbg !2603
  br i1 %6, label %7, label %9, !dbg !2604

7:                                                ; preds = %2
  invoke void @"?_Adjust_manually_vector_aligned@std@@YAXAEAPEAXAEA_K@Z"(i8** nonnull align 8 dereferenceable(8) %4, i64* nonnull align 8 dereferenceable(8) %3)
          to label %8 unwind label %12, !dbg !2605

8:                                                ; preds = %7
  br label %9, !dbg !2607

9:                                                ; preds = %8, %2
  %10 = load i64, i64* %3, align 8, !dbg !2608, !tbaa !1832
  %11 = load i8*, i8** %4, align 8, !dbg !2609, !tbaa !1675
  call void @"??3@YAXPEAX_K@Z"(i8* %11, i64 %10) #16, !dbg !2610
  ret void, !dbg !2611

12:                                               ; preds = %7
  %13 = cleanuppad within none [], !dbg !2605
  call void @__std_terminate() #17 [ "funclet"(token %13) ], !dbg !2605
  unreachable, !dbg !2605
}

; Function Attrs: inlinehint uwtable mustprogress
define linkonce_odr dso_local void @"?_Adjust_manually_vector_aligned@std@@YAXAEAPEAXAEA_K@Z"(i8** nonnull align 8 dereferenceable(8) %0, i64* nonnull align 8 dereferenceable(8) %1) #14 comdat !dbg !2612 {
  %3 = alloca i64*, align 8
  %4 = alloca i8**, align 8
  %5 = alloca i64*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  store i64* %1, i64** %3, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i64** %3, metadata !2618, metadata !DIExpression()), !dbg !2626
  store i8** %0, i8*** %4, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i8*** %4, metadata !2619, metadata !DIExpression()), !dbg !2627
  %9 = load i64*, i64** %3, align 8, !dbg !2628, !tbaa !1675
  %10 = load i64, i64* %9, align 8, !dbg !2629, !tbaa !1832
  %11 = add i64 %10, 39, !dbg !2629
  store i64 %11, i64* %9, align 8, !dbg !2629, !tbaa !1832
  %12 = bitcast i64** %5 to i8*, !dbg !2630
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %12) #16, !dbg !2630
  call void @llvm.dbg.declare(metadata i64** %5, metadata !2620, metadata !DIExpression()), !dbg !2631
  %13 = load i8**, i8*** %4, align 8, !dbg !2632, !tbaa !1675
  %14 = load i8*, i8** %13, align 8, !dbg !2632, !tbaa !1675
  %15 = bitcast i8* %14 to i64*, !dbg !2633
  store i64* %15, i64** %5, align 8, !dbg !2631, !tbaa !1675
  %16 = bitcast i64* %6 to i8*, !dbg !2634
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %16) #16, !dbg !2634
  call void @llvm.dbg.declare(metadata i64* %6, metadata !2623, metadata !DIExpression()), !dbg !2635
  %17 = load i64*, i64** %5, align 8, !dbg !2636, !tbaa !1675
  %18 = getelementptr inbounds i64, i64* %17, i64 -1, !dbg !2636
  %19 = load i64, i64* %18, align 8, !dbg !2636, !tbaa !1832
  store i64 %19, i64* %6, align 8, !dbg !2635, !tbaa !1832
  %20 = bitcast i64* %7 to i8*, !dbg !2637
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %20) #16, !dbg !2637
  call void @llvm.dbg.declare(metadata i64* %7, metadata !2624, metadata !DIExpression()), !dbg !2638
  store i64 8, i64* %7, align 8, !dbg !2638, !tbaa !1832
  %21 = bitcast i64* %8 to i8*, !dbg !2639
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %21) #16, !dbg !2639
  call void @llvm.dbg.declare(metadata i64* %8, metadata !2625, metadata !DIExpression()), !dbg !2640
  %22 = load i8**, i8*** %4, align 8, !dbg !2641, !tbaa !1675
  %23 = load i8*, i8** %22, align 8, !dbg !2641, !tbaa !1675
  %24 = ptrtoint i8* %23 to i64, !dbg !2642
  %25 = load i64, i64* %6, align 8, !dbg !2643, !tbaa !1832
  %26 = sub i64 %24, %25, !dbg !2644
  store i64 %26, i64* %8, align 8, !dbg !2640, !tbaa !1832
  br label %27, !dbg !2645

27:                                               ; preds = %2
  %28 = load i64, i64* %8, align 8, !dbg !2646, !tbaa !1832
  %29 = icmp uge i64 %28, 8, !dbg !2646
  br i1 %29, label %30, label %34, !dbg !2646

30:                                               ; preds = %27
  %31 = load i64, i64* %8, align 8, !dbg !2646, !tbaa !1832
  %32 = icmp ule i64 %31, 39, !dbg !2646
  br i1 %32, label %33, label %34, !dbg !2649

33:                                               ; preds = %30
  br label %38, !dbg !2650

34:                                               ; preds = %30, %27
  br label %35, !dbg !2652

35:                                               ; preds = %34
  call void @_invalid_parameter_noinfo_noreturn() #18, !dbg !2654
  unreachable, !dbg !2654

36:                                               ; No predecessors!
  br label %37, !dbg !2654

37:                                               ; preds = %36
  br label %38

38:                                               ; preds = %37, %33
  br label %39, !dbg !2649

39:                                               ; preds = %38
  br label %40, !dbg !2649

40:                                               ; preds = %39
  %41 = load i64, i64* %6, align 8, !dbg !2656, !tbaa !1832
  %42 = inttoptr i64 %41 to i8*, !dbg !2657
  %43 = load i8**, i8*** %4, align 8, !dbg !2658, !tbaa !1675
  store i8* %42, i8** %43, align 8, !dbg !2659, !tbaa !1675
  %44 = bitcast i64* %8 to i8*, !dbg !2660
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %44) #16, !dbg !2660
  %45 = bitcast i64* %7 to i8*, !dbg !2660
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %45) #16, !dbg !2660
  %46 = bitcast i64* %6 to i8*, !dbg !2660
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %46) #16, !dbg !2660
  %47 = bitcast i64** %5 to i8*, !dbg !2660
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %47) #16, !dbg !2660
  ret void, !dbg !2660
}

; Function Attrs: nounwind
declare dso_local void @"??3@YAXPEAX_K@Z"(i8*, i64) #15

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i8* @"??$_Voidify_iter@PEAPEAD@std@@YAPEAXPEAPEAD@Z"(i8** %0) #2 comdat !dbg !2661 {
  %2 = alloca i8**, align 8
  store i8** %0, i8*** %2, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i8*** %2, metadata !2665, metadata !DIExpression()), !dbg !2668
  %3 = load i8**, i8*** %2, align 8, !dbg !2669, !tbaa !1675
  %4 = bitcast i8** %3 to i8*, !dbg !2669
  ret i8* %4, !dbg !2672
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local i8** @"??$addressof@PEAD@std@@YAPEAPEADAEAPEAD@Z"(i8** nonnull align 8 dereferenceable(8) %0) #2 comdat !dbg !2673 {
  %2 = alloca i8**, align 8
  store i8** %0, i8*** %2, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i8*** %2, metadata !2677, metadata !DIExpression()), !dbg !2679
  %3 = load i8**, i8*** %2, align 8, !dbg !2680, !tbaa !1675
  ret i8** %3, !dbg !2681
}

; Function Attrs: nounwind uwtable mustprogress
define linkonce_odr dso_local nonnull align 8 dereferenceable(8) i8** @"??$forward@AEBQEAD@std@@YAAEBQEADAEBQEAD@Z"(i8** nonnull align 8 dereferenceable(8) %0) #2 comdat !dbg !2682 {
  %2 = alloca i8**, align 8
  store i8** %0, i8*** %2, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata i8*** %2, metadata !2694, metadata !DIExpression()), !dbg !2695
  %3 = load i8**, i8*** %2, align 8, !dbg !2696, !tbaa !1675
  ret i8** %3, !dbg !2697
}

declare dso_local i64 @strlen(i8*) #12

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @"??1?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(%"class.std::_String_val"* nonnull dereferenceable(32) %0) unnamed_addr #6 comdat align 2 !dbg !2698 {
  %2 = alloca %"class.std::_String_val"*, align 8
  store %"class.std::_String_val"* %0, %"class.std::_String_val"** %2, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"class.std::_String_val"** %2, metadata !2701, metadata !DIExpression()), !dbg !2702
  %3 = load %"class.std::_String_val"*, %"class.std::_String_val"** %2, align 8
  %4 = getelementptr inbounds %"class.std::_String_val", %"class.std::_String_val"* %3, i32 0, i32 0, !dbg !2703
  call void @"??1_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(%"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* nonnull dereferenceable(16) %4) #16, !dbg !2703
  ret void, !dbg !2705
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @"??1_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(%"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* nonnull dereferenceable(16) %0) unnamed_addr #4 comdat align 2 !dbg !2706 {
  %2 = alloca %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"*, align 8
  store %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"* %0, %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"** %2, align 8, !tbaa !1675
  call void @llvm.dbg.declare(metadata %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"** %2, metadata !2708, metadata !DIExpression()), !dbg !2709
  %3 = load %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"*, %"union.std::_String_val<std::_Simple_types<char>>::_Bxty"** %2, align 8
  ret void, !dbg !2710
}

attributes #0 = { uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nofree nosync nounwind willreturn }
attributes #6 = { inlinehint nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { inlinehint nounwind uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { inlinehint noreturn uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noreturn "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #11 = { nobuiltin nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { nobuiltin allocsize(0) "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { inlinehint uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #16 = { nounwind }
attributes #17 = { noreturn nounwind }
attributes #18 = { noreturn }
attributes #19 = { allocsize(0) }
attributes #20 = { builtin nounwind }

!llvm.dbg.cu = !{!0}
!llvm.linker.options = !{!1616, !1617, !1618, !1619, !1620}
!llvm.module.flags = !{!1621, !1622, !1623, !1624}
!llvm.ident = !{!1625}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "clang version 12.0.0", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !18, globals: !815, imports: !822, nameTableKind: None)
!1 = !DIFile(filename: "func2.cpp", directory: "E:\\Documents\\Work Stuff\\Active Work Files\\Code Examples\\test_cpp01", checksumkind: CSK_MD5, checksum: "4c93a05a81493d4dd1c7139972113908")
!2 = !{!3, !11}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "float_denorm_style", scope: !5, file: !4, line: 27, baseType: !6, size: 32, elements: !7, identifier: ".?AW4float_denorm_style@std@@")
!4 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\limits", directory: "", checksumkind: CSK_MD5, checksum: "329a861f63dca90c90f2bc9239c81cf8")
!5 = !DINamespace(name: "std", scope: null)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{!8, !9, !10}
!8 = !DIEnumerator(name: "denorm_indeterminate", value: -1)
!9 = !DIEnumerator(name: "denorm_absent", value: 0)
!10 = !DIEnumerator(name: "denorm_present", value: 1)
!11 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "float_round_style", scope: !5, file: !4, line: 34, baseType: !6, size: 32, elements: !12, identifier: ".?AW4float_round_style@std@@")
!12 = !{!13, !14, !15, !16, !17}
!13 = !DIEnumerator(name: "round_indeterminate", value: -1)
!14 = !DIEnumerator(name: "round_toward_zero", value: 0)
!15 = !DIEnumerator(name: "round_to_nearest", value: 1)
!16 = !DIEnumerator(name: "round_toward_infinity", value: 2)
!17 = !DIEnumerator(name: "round_toward_neg_infinity", value: 3)
!18 = !{!19, !22, !24, !26, !27, !28, !31, !33, !177}
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !20, line: 46, baseType: !21)
!20 = !DIFile(filename: "C:\\Program Files\\LLVM\\lib\\clang\\12.0.0\\include\\stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!21 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !25, line: 61, baseType: !21)
!25 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\vadefs.h", directory: "", checksumkind: CSK_MD5, checksum: "a4b8f96637d0704c82f39ecb6bde2ab4")
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !30)
!30 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: null)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !23)
!33 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "basic_string<char,std::char_traits<char>,std::allocator<char> >", scope: !5, file: !34, line: 2279, size: 256, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !35, templateParams: !813, identifier: ".?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@")
!34 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\xstring", directory: "", checksumkind: CSK_MD5, checksum: "d9f7a6514110285461f0bcf993b7b1a2")
!35 = !{!36, !163, !176, !272, !384, !385, !386, !387, !388, !389, !390, !392, !395, !397, !399, !402, !404, !406, !407, !408, !409, !410, !411, !430, !436, !439, !442, !445, !449, !452, !455, !458, !461, !464, !467, !470, !483, !486, !490, !493, !497, !501, !505, !509, !513, !516, !517, !518, !521, !524, !525, !530, !533, !534, !535, !536, !541, !544, !545, !546, !549, !552, !555, !558, !561, !562, !563, !566, !567, !570, !573, !574, !577, !578, !579, !580, !581, !582, !585, !588, !591, !594, !597, !600, !603, !606, !609, !612, !615, !618, !619, !622, !625, !628, !631, !634, !637, !640, !643, !646, !649, !653, !654, !655, !658, !661, !662, !663, !666, !669, !670, !671, !672, !673, !674, !675, !676, !679, !682, !683, !684, !687, !688, !691, !694, !695, !696, !697, !698, !701, !702, !703, !704, !705, !708, !711, !714, !717, !718, !722, !723, !726, !729, !732, !735, !738, !739, !740, !741, !742, !743, !744, !745, !746, !749, !750, !751, !752, !753, !754, !757, !758, !759, !760, !761, !762, !765, !768, !771, !774, !777, !780, !783, !786, !789, !792, !795, !798, !799, !800, !801, !802, !803, !804, !808}
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Alty", scope: !33, file: !34, line: 2283, baseType: !37)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Rebind_alloc_t<std::allocator<char>,char>", scope: !5, file: !38, line: 733, baseType: !39)
!38 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\xmemory", directory: "", checksumkind: CSK_MD5, checksum: "9314632aeaac5efb25edb53449740be9")
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "rebind_alloc<char>", scope: !40, file: !38, line: 675, baseType: !43)
!40 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Default_allocator_traits<std::allocator<char> >", scope: !5, file: !38, line: 657, size: 8, flags: DIFlagTypePassByValue, elements: !41, templateParams: !161, identifier: ".?AU?$_Default_allocator_traits@V?$allocator@D@std@@@std@@")
!41 = !{!42, !112, !113, !115, !118, !119, !120, !121, !122, !138, !139, !140, !141, !147, !151, !155, !158}
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !40, file: !38, line: 658, baseType: !43)
!43 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "allocator<char>", scope: !5, file: !38, line: 763, size: 8, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !44, templateParams: !110, identifier: ".?AV?$allocator@D@std@@")
!44 = !{!45, !46, !47, !48, !49, !51, !53, !54, !57, !77, !78, !83, !86, !90, !94, !99, !102, !107}
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "_From_primary", scope: !43, file: !38, line: 768, baseType: !43)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !43, file: !38, line: 770, baseType: !23)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !43, file: !38, line: 772, baseType: !22)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !43, file: !38, line: 773, baseType: !31)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !43, file: !38, line: 775, baseType: !50)
!50 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !23, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !43, file: !38, line: 776, baseType: !52)
!52 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !32, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !43, file: !38, line: 778, baseType: !19)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !43, file: !38, line: 779, baseType: !55)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", file: !20, line: 35, baseType: !56)
!56 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "propagate_on_container_move_assignment", scope: !43, file: !38, line: 781, baseType: !58)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "true_type", scope: !5, file: !59, line: 41, baseType: !60)
!59 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\xtr1common", directory: "", checksumkind: CSK_MD5, checksum: "30144ce5d9b954ba3b99adea12ced09e")
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "bool_constant<true>", scope: !5, file: !59, line: 39, baseType: !61)
!61 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "integral_constant<bool,1>", scope: !5, file: !59, line: 22, size: 8, flags: DIFlagTypePassByValue, elements: !62, templateParams: !74, identifier: ".?AU?$integral_constant@_N$00@std@@")
!62 = !{!63, !66, !67, !68, !73}
!63 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !61, file: !59, line: 23, baseType: !64, flags: DIFlagStaticMember)
!64 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !65)
!65 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !61, file: !59, line: 25, baseType: !65)
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !61, file: !59, line: 26, baseType: !61)
!68 = !DISubprogram(name: "operator bool", linkageName: "??B?$integral_constant@_N$00@std@@QEBA_NXZ", scope: !61, file: !59, line: 28, type: !69, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!69 = !DISubroutineType(types: !70)
!70 = !{!66, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!72 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !61)
!73 = !DISubprogram(name: "operator()", linkageName: "??R?$integral_constant@_N$00@std@@QEBA_NXZ", scope: !61, file: !59, line: 32, type: !69, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!74 = !{!75, !76}
!75 = !DITemplateTypeParameter(name: "_Ty", type: !65)
!76 = !DITemplateValueParameter(name: "_Val", type: !65, value: i8 1)
!77 = !DIDerivedType(tag: DW_TAG_typedef, name: "is_always_equal", scope: !43, file: !38, line: 782, baseType: !58)
!78 = !DISubprogram(name: "address", linkageName: "?address@?$allocator@D@std@@QEBAPEADAEAD@Z", scope: !43, file: !38, line: 789, type: !79, scopeLine: 789, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!79 = !DISubroutineType(types: !80)
!80 = !{!22, !81, !50}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!82 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !43)
!83 = !DISubprogram(name: "address", linkageName: "?address@?$allocator@D@std@@QEBAPEBDAEBD@Z", scope: !43, file: !38, line: 793, type: !84, scopeLine: 793, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!84 = !DISubroutineType(types: !85)
!85 = !{!31, !81, !52}
!86 = !DISubprogram(name: "allocator", scope: !43, file: !38, line: 797, type: !87, scopeLine: 797, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!87 = !DISubroutineType(types: !88)
!88 = !{null, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!90 = !DISubprogram(name: "allocator", scope: !43, file: !38, line: 799, type: !91, scopeLine: 799, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!91 = !DISubroutineType(types: !92)
!92 = !{null, !89, !93}
!93 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !82, size: 64)
!94 = !DISubprogram(name: "deallocate", linkageName: "?deallocate@?$allocator@D@std@@QEAAXQEAD_K@Z", scope: !43, file: !38, line: 803, type: !95, scopeLine: 803, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!95 = !DISubroutineType(types: !96)
!96 = !{null, !89, !97, !98}
!97 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !22)
!98 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !19)
!99 = !DISubprogram(name: "allocate", linkageName: "?allocate@?$allocator@D@std@@QEAAPEAD_K@Z", scope: !43, file: !38, line: 808, type: !100, scopeLine: 808, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!100 = !DISubroutineType(types: !101)
!101 = !{!22, !89, !98}
!102 = !DISubprogram(name: "allocate", linkageName: "?allocate@?$allocator@D@std@@QEAAPEAD_KPEBX@Z", scope: !43, file: !38, line: 812, type: !103, scopeLine: 812, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!103 = !DISubroutineType(types: !104)
!104 = !{!22, !89, !98, !105}
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!107 = !DISubprogram(name: "max_size", linkageName: "?max_size@?$allocator@D@std@@QEBA_KXZ", scope: !43, file: !38, line: 827, type: !108, scopeLine: 827, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!108 = !DISubroutineType(types: !109)
!109 = !{!19, !81}
!110 = !{!111}
!111 = !DITemplateTypeParameter(name: "_Ty", type: !23)
!112 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !40, file: !38, line: 659, baseType: !46)
!113 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !40, file: !38, line: 661, baseType: !114)
!114 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 64)
!115 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !40, file: !38, line: 662, baseType: !116)
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !117, size: 64)
!117 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !112)
!118 = !DIDerivedType(tag: DW_TAG_typedef, name: "void_pointer", scope: !40, file: !38, line: 663, baseType: !26)
!119 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_void_pointer", scope: !40, file: !38, line: 664, baseType: !105)
!120 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !40, file: !38, line: 666, baseType: !19)
!121 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !40, file: !38, line: 667, baseType: !55)
!122 = !DIDerivedType(tag: DW_TAG_typedef, name: "propagate_on_container_copy_assignment", scope: !40, file: !38, line: 669, baseType: !123)
!123 = !DIDerivedType(tag: DW_TAG_typedef, name: "false_type", scope: !5, file: !59, line: 42, baseType: !124)
!124 = !DIDerivedType(tag: DW_TAG_typedef, name: "bool_constant<false>", scope: !5, file: !59, line: 39, baseType: !125)
!125 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "integral_constant<bool,0>", scope: !5, file: !59, line: 22, size: 8, flags: DIFlagTypePassByValue, elements: !126, templateParams: !136, identifier: ".?AU?$integral_constant@_N$0A@@std@@")
!126 = !{!127, !128, !129, !130, !135}
!127 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !125, file: !59, line: 23, baseType: !64, flags: DIFlagStaticMember)
!128 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !125, file: !59, line: 25, baseType: !65)
!129 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !125, file: !59, line: 26, baseType: !125)
!130 = !DISubprogram(name: "operator bool", linkageName: "??B?$integral_constant@_N$0A@@std@@QEBA_NXZ", scope: !125, file: !59, line: 28, type: !131, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!131 = !DISubroutineType(types: !132)
!132 = !{!128, !133}
!133 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !134, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!134 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !125)
!135 = !DISubprogram(name: "operator()", linkageName: "??R?$integral_constant@_N$0A@@std@@QEBA_NXZ", scope: !125, file: !59, line: 32, type: !131, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!136 = !{!75, !137}
!137 = !DITemplateValueParameter(name: "_Val", type: !65, value: i8 0)
!138 = !DIDerivedType(tag: DW_TAG_typedef, name: "propagate_on_container_move_assignment", scope: !40, file: !38, line: 670, baseType: !58)
!139 = !DIDerivedType(tag: DW_TAG_typedef, name: "propagate_on_container_swap", scope: !40, file: !38, line: 671, baseType: !123)
!140 = !DIDerivedType(tag: DW_TAG_typedef, name: "is_always_equal", scope: !40, file: !38, line: 672, baseType: !58)
!141 = !DISubprogram(name: "allocate", linkageName: "?allocate@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SAPEADAEAV?$allocator@D@2@_K@Z", scope: !40, file: !38, line: 680, type: !142, scopeLine: 680, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!142 = !DISubroutineType(types: !143)
!143 = !{!113, !144, !145}
!144 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !43, size: 64)
!145 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !146)
!146 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", file: !38, line: 666, baseType: !19)
!147 = !DISubprogram(name: "allocate", linkageName: "?allocate@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SAPEADAEAV?$allocator@D@2@_KPEBX@Z", scope: !40, file: !38, line: 685, type: !148, scopeLine: 685, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!148 = !DISubroutineType(types: !149)
!149 = !{!113, !144, !145, !150}
!150 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_void_pointer", file: !38, line: 664, baseType: !105)
!151 = !DISubprogram(name: "deallocate", linkageName: "?deallocate@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SAXAEAV?$allocator@D@2@QEAD_K@Z", scope: !40, file: !38, line: 689, type: !152, scopeLine: 689, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!152 = !DISubroutineType(types: !153)
!153 = !{null, !144, !154, !145}
!154 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !113)
!155 = !DISubprogram(name: "max_size", linkageName: "?max_size@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA_KAEBV?$allocator@D@2@@Z", scope: !40, file: !38, line: 704, type: !156, scopeLine: 704, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!156 = !DISubroutineType(types: !157)
!157 = !{!120, !93}
!158 = !DISubprogram(name: "select_on_container_copy_construction", linkageName: "?select_on_container_copy_construction@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA?AV?$allocator@D@2@AEBV32@@Z", scope: !40, file: !38, line: 708, type: !159, scopeLine: 708, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!159 = !DISubroutineType(types: !160)
!160 = !{!43, !93}
!161 = !{!162}
!162 = !DITemplateTypeParameter(name: "_Alloc", type: !43)
!163 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Alty_traits", scope: !33, file: !34, line: 2284, baseType: !164)
!164 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "allocator_traits<std::allocator<char> >", scope: !5, file: !38, line: 714, size: 8, flags: DIFlagTypePassByValue, elements: !165, templateParams: !161, identifier: ".?AU?$allocator_traits@V?$allocator@D@std@@@std@@")
!165 = !{!166}
!166 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !164, baseType: !167, extraData: i32 0)
!167 = !DIDerivedType(tag: DW_TAG_typedef, name: "conditional_t<_Is_default_allocator<allocator<char> >::value,_Default_allocator_traits<std::allocator<char> >,_Normal_allocator_traits<std::allocator<char> > >", scope: !5, file: !59, line: 68, baseType: !168)
!168 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !169, file: !59, line: 59, baseType: !40)
!169 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "conditional<1,std::_Default_allocator_traits<std::allocator<char> >,std::_Normal_allocator_traits<std::allocator<char> > >", scope: !5, file: !59, line: 58, size: 8, flags: DIFlagTypePassByValue, elements: !170, templateParams: !171, identifier: ".?AU?$conditional@$00U?$_Default_allocator_traits@V?$allocator@D@std@@@std@@U?$_Normal_allocator_traits@V?$allocator@D@std@@@2@@std@@")
!170 = !{!168}
!171 = !{!172, !173, !174}
!172 = !DITemplateValueParameter(name: "_Test", type: !65, value: i8 1)
!173 = !DITemplateTypeParameter(name: "_Ty1", type: !40)
!174 = !DITemplateTypeParameter(name: "_Ty2", type: !175)
!175 = !DICompositeType(tag: DW_TAG_structure_type, name: "_Normal_allocator_traits<std::allocator<char> >", scope: !5, file: !38, line: 499, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AU?$_Normal_allocator_traits@V?$allocator@D@std@@@std@@")
!176 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Scary_val", scope: !33, file: !34, line: 2286, baseType: !177)
!177 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "_String_val<std::_Simple_types<char> >", scope: !5, file: !34, line: 2188, size: 256, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !178, templateParams: !270, identifier: ".?AV?$_String_val@U?$_Simple_types@D@std@@@std@@")
!178 = !{!179, !201, !214, !215, !216, !217, !218, !220, !223, !225, !226, !240, !241, !242, !243, !247, !251, !257, !260, !263, !264, !267}
!179 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !177, baseType: !180, flags: DIFlagPublic, extraData: i32 0)
!180 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Container_base", scope: !5, file: !38, line: 1237, baseType: !181)
!181 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Container_base0", scope: !5, file: !38, line: 1063, size: 8, flags: DIFlagTypePassByValue, elements: !182, identifier: ".?AU_Container_base0@std@@")
!182 = !{!183, !187, !191, !198}
!183 = !DISubprogram(name: "_Orphan_all", linkageName: "?_Orphan_all@_Container_base0@std@@QEAAXXZ", scope: !181, file: !38, line: 1064, type: !184, scopeLine: 1064, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!184 = !DISubroutineType(types: !185)
!185 = !{null, !186}
!186 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !181, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!187 = !DISubprogram(name: "_Swap_proxy_and_iterators", linkageName: "?_Swap_proxy_and_iterators@_Container_base0@std@@QEAAXAEAU12@@Z", scope: !181, file: !38, line: 1065, type: !188, scopeLine: 1065, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!188 = !DISubroutineType(types: !189)
!189 = !{null, !186, !190}
!190 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !181, size: 64)
!191 = !DISubprogram(name: "_Alloc_proxy", linkageName: "?_Alloc_proxy@_Container_base0@std@@QEAAXAEBU_Fake_allocator@2@@Z", scope: !181, file: !38, line: 1066, type: !192, scopeLine: 1066, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!192 = !DISubroutineType(types: !193)
!193 = !{null, !186, !194}
!194 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !195, size: 64)
!195 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !196)
!196 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Fake_allocator", scope: !5, file: !38, line: 1061, size: 8, flags: DIFlagTypePassByValue, elements: !197, identifier: ".?AU_Fake_allocator@std@@")
!197 = !{}
!198 = !DISubprogram(name: "_Reload_proxy", linkageName: "?_Reload_proxy@_Container_base0@std@@QEAAXAEBU_Fake_allocator@2@0@Z", scope: !181, file: !38, line: 1067, type: !199, scopeLine: 1067, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!199 = !DISubroutineType(types: !200)
!200 = !{null, !186, !194, !194}
!201 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !177, file: !34, line: 2190, baseType: !202)
!202 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !203, file: !38, line: 754, baseType: !23)
!203 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Simple_types<char>", scope: !5, file: !38, line: 752, size: 8, flags: DIFlagTypePassByValue, elements: !204, templateParams: !212, identifier: ".?AU?$_Simple_types@D@std@@")
!204 = !{!202, !205, !206, !207, !209}
!205 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !203, file: !38, line: 755, baseType: !19)
!206 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !203, file: !38, line: 756, baseType: !55)
!207 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !203, file: !38, line: 757, baseType: !208)
!208 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !202, size: 64)
!209 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !203, file: !38, line: 758, baseType: !210)
!210 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !211, size: 64)
!211 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !202)
!212 = !{!213}
!213 = !DITemplateTypeParameter(name: "_Value_type", type: !23)
!214 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !177, file: !34, line: 2191, baseType: !205)
!215 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !177, file: !34, line: 2192, baseType: !206)
!216 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !177, file: !34, line: 2193, baseType: !207)
!217 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !177, file: !34, line: 2194, baseType: !209)
!218 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !177, file: !34, line: 2195, baseType: !219)
!219 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !201, size: 64)
!220 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !177, file: !34, line: 2196, baseType: !221)
!221 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !222, size: 64)
!222 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !201)
!223 = !DIDerivedType(tag: DW_TAG_member, name: "_BUF_SIZE", scope: !177, file: !34, line: 2201, baseType: !224, flags: DIFlagPublic | DIFlagStaticMember, extraData: i64 16)
!224 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !214)
!225 = !DIDerivedType(tag: DW_TAG_member, name: "_ALLOC_MASK", scope: !177, file: !34, line: 2203, baseType: !224, flags: DIFlagPublic | DIFlagStaticMember, extraData: i64 15)
!226 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "_Bxty", scope: !177, file: !34, line: 2251, size: 128, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !227, identifier: ".?AT_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@")
!227 = !{!228, !232, !233, !235, !239}
!228 = !DIDerivedType(tag: DW_TAG_member, name: "_Buf", scope: !226, file: !34, line: 2256, baseType: !229, size: 128)
!229 = !DICompositeType(tag: DW_TAG_array_type, baseType: !201, size: 128, elements: !230)
!230 = !{!231}
!231 = !DISubrange(count: 16)
!232 = !DIDerivedType(tag: DW_TAG_member, name: "_Ptr", scope: !226, file: !34, line: 2257, baseType: !216, size: 64)
!233 = !DIDerivedType(tag: DW_TAG_member, name: "_Alias", scope: !226, file: !34, line: 2258, baseType: !234, size: 128)
!234 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 128, elements: !230)
!235 = !DISubprogram(name: "_Bxty", scope: !226, file: !34, line: 2252, type: !236, scopeLine: 2252, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!236 = !DISubroutineType(types: !237)
!237 = !{null, !238}
!238 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !226, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!239 = !DISubprogram(name: "~_Bxty", scope: !226, file: !34, line: 2254, type: !236, scopeLine: 2254, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!240 = !DIDerivedType(tag: DW_TAG_member, name: "_Bx", scope: !177, file: !34, line: 2259, baseType: !226, size: 128, flags: DIFlagPublic)
!241 = !DIDerivedType(tag: DW_TAG_member, name: "_Mysize", scope: !177, file: !34, line: 2261, baseType: !214, size: 64, offset: 128, flags: DIFlagPublic)
!242 = !DIDerivedType(tag: DW_TAG_member, name: "_Myres", scope: !177, file: !34, line: 2262, baseType: !214, size: 64, offset: 192, flags: DIFlagPublic)
!243 = !DISubprogram(name: "_String_val", scope: !177, file: !34, line: 2198, type: !244, scopeLine: 2198, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!244 = !DISubroutineType(types: !245)
!245 = !{null, !246}
!246 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !177, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!247 = !DISubprogram(name: "_Myptr", linkageName: "?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAAPEADXZ", scope: !177, file: !34, line: 2208, type: !248, scopeLine: 2208, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!248 = !DISubroutineType(types: !249)
!249 = !{!250, !246}
!250 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !201, size: 64)
!251 = !DISubprogram(name: "_Myptr", linkageName: "?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBAPEBDXZ", scope: !177, file: !34, line: 2217, type: !252, scopeLine: 2217, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!252 = !DISubroutineType(types: !253)
!253 = !{!254, !255}
!254 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !222, size: 64)
!255 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !256, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!256 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !177)
!257 = !DISubprogram(name: "_Large_string_engaged", linkageName: "?_Large_string_engaged@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_NXZ", scope: !177, file: !34, line: 2226, type: !258, scopeLine: 2226, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!258 = !DISubroutineType(types: !259)
!259 = !{!65, !255}
!260 = !DISubprogram(name: "_Check_offset", linkageName: "?_Check_offset@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBAX_K@Z", scope: !177, file: !34, line: 2230, type: !261, scopeLine: 2230, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!261 = !DISubroutineType(types: !262)
!262 = !{null, !255, !224}
!263 = !DISubprogram(name: "_Check_offset_exclusive", linkageName: "?_Check_offset_exclusive@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBAX_K@Z", scope: !177, file: !34, line: 2236, type: !261, scopeLine: 2236, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!264 = !DISubprogram(name: "_Xran", linkageName: "?_Xran@?$_String_val@U?$_Simple_types@D@std@@@std@@SAXXZ", scope: !177, file: !34, line: 2242, type: !265, scopeLine: 2242, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!265 = !DISubroutineType(types: !266)
!266 = !{null}
!267 = !DISubprogram(name: "_Clamp_suffix_size", linkageName: "?_Clamp_suffix_size@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_K_K0@Z", scope: !177, file: !34, line: 2246, type: !268, scopeLine: 2246, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!268 = !DISubroutineType(types: !269)
!269 = !{!214, !255, !224, !224}
!270 = !{!271}
!271 = !DITemplateTypeParameter(name: "_Val_types", type: !203)
!272 = !DIDerivedType(tag: DW_TAG_typedef, name: "traits_type", scope: !33, file: !34, line: 2302, baseType: !273)
!273 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "char_traits<char>", scope: !5, file: !34, line: 465, size: 8, flags: DIFlagTypePassByValue, elements: !274, templateParams: !383, identifier: ".?AU?$char_traits@D@std@@")
!274 = !{!275}
!275 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !273, baseType: !276, extraData: i32 0)
!276 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Narrow_char_traits<char,int>", scope: !5, file: !34, line: 347, size: 8, flags: DIFlagTypePassByValue, elements: !277, templateParams: !343, identifier: ".?AU?$_Narrow_char_traits@DH@std@@")
!277 = !{!278, !346, !347, !348, !349, !350, !351, !353, !356, !359, !362, !363, !364, !365, !366, !371, !374, !377, !380}
!278 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !276, baseType: !279, flags: DIFlagPrivate, extraData: i32 0)
!279 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Char_traits<char,int>", scope: !5, file: !34, line: 36, size: 8, flags: DIFlagTypePassByValue, elements: !280, templateParams: !343, identifier: ".?AU?$_Char_traits@DH@std@@")
!280 = !{!281, !282, !283, !287, !289, !299, !303, !306, !307, !310, !313, !316, !319, !322, !325, !326, !331, !334, !337, !340}
!281 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !279, file: !34, line: 37, baseType: !23)
!282 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_type", scope: !279, file: !34, line: 38, baseType: !6)
!283 = !DIDerivedType(tag: DW_TAG_typedef, name: "pos_type", scope: !279, file: !34, line: 39, baseType: !284)
!284 = !DIDerivedType(tag: DW_TAG_typedef, name: "streampos", scope: !5, file: !285, line: 139, baseType: !286)
!285 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\iosfwd", directory: "", checksumkind: CSK_MD5, checksum: "71767b0a80f1b58a9074b3e91978653a")
!286 = !DICompositeType(tag: DW_TAG_class_type, name: "fpos<_Mbstatet>", scope: !5, file: !285, line: 53, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AV?$fpos@U_Mbstatet@@@std@@")
!287 = !DIDerivedType(tag: DW_TAG_typedef, name: "off_type", scope: !279, file: !34, line: 40, baseType: !288)
!288 = !DIDerivedType(tag: DW_TAG_typedef, name: "streamoff", scope: !5, file: !285, line: 48, baseType: !56)
!289 = !DIDerivedType(tag: DW_TAG_typedef, name: "state_type", scope: !279, file: !34, line: 41, baseType: !290)
!290 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Mbstatet", file: !291, line: 615, baseType: !292)
!291 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt.h", directory: "", checksumkind: CSK_MD5, checksum: "db0cd8b4d76ec84d3625032eaca2a3ca")
!292 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Mbstatet", file: !291, line: 611, size: 64, flags: DIFlagTypePassByValue, elements: !293, identifier: ".?AU_Mbstatet@@")
!293 = !{!294, !296, !298}
!294 = !DIDerivedType(tag: DW_TAG_member, name: "_Wchar", scope: !292, file: !291, line: 613, baseType: !295, size: 32)
!295 = !DIBasicType(name: "long unsigned int", size: 32, encoding: DW_ATE_unsigned)
!296 = !DIDerivedType(tag: DW_TAG_member, name: "_Byte", scope: !292, file: !291, line: 614, baseType: !297, size: 16, offset: 32)
!297 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!298 = !DIDerivedType(tag: DW_TAG_member, name: "_State", scope: !292, file: !291, line: 614, baseType: !297, size: 16, offset: 48)
!299 = !DISubprogram(name: "copy", linkageName: "?copy@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z", scope: !279, file: !34, line: 45, type: !300, scopeLine: 45, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!300 = !DISubroutineType(types: !301)
!301 = !{!22, !97, !302, !98}
!302 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !31)
!303 = !DISubprogram(name: "_Copy_s", linkageName: "?_Copy_s@?$_Char_traits@DH@std@@SAPEADQEAD_KQEBD1@Z", scope: !279, file: !34, line: 68, type: !304, scopeLine: 68, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!304 = !DISubroutineType(types: !305)
!305 = !{!22, !97, !98, !302, !98}
!306 = !DISubprogram(name: "move", linkageName: "?move@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z", scope: !279, file: !34, line: 76, type: !300, scopeLine: 76, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!307 = !DISubprogram(name: "compare", linkageName: "?compare@?$_Char_traits@DH@std@@SAHPEBD0_K@Z", scope: !279, file: !34, line: 128, type: !308, scopeLine: 128, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!308 = !DISubroutineType(types: !309)
!309 = !{!6, !31, !31, !19}
!310 = !DISubprogram(name: "length", linkageName: "?length@?$_Char_traits@DH@std@@SA_KPEBD@Z", scope: !279, file: !34, line: 140, type: !311, scopeLine: 140, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!311 = !DISubroutineType(types: !312)
!312 = !{!19, !31}
!313 = !DISubprogram(name: "find", linkageName: "?find@?$_Char_traits@DH@std@@SAPEBDPEBD_KAEBD@Z", scope: !279, file: !34, line: 151, type: !314, scopeLine: 151, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!314 = !DISubroutineType(types: !315)
!315 = !{!31, !31, !19, !52}
!316 = !DISubprogram(name: "assign", linkageName: "?assign@?$_Char_traits@DH@std@@SAPEADQEAD_KD@Z", scope: !279, file: !34, line: 163, type: !317, scopeLine: 163, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!317 = !DISubroutineType(types: !318)
!318 = !{!22, !97, !19, !32}
!319 = !DISubprogram(name: "assign", linkageName: "?assign@?$_Char_traits@DH@std@@SAXAEADAEBD@Z", scope: !279, file: !34, line: 174, type: !320, scopeLine: 174, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!320 = !DISubroutineType(types: !321)
!321 = !{null, !50, !52}
!322 = !DISubprogram(name: "eq", linkageName: "?eq@?$_Char_traits@DH@std@@SA_NAEBD0@Z", scope: !279, file: !34, line: 178, type: !323, scopeLine: 178, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!323 = !DISubroutineType(types: !324)
!324 = !{!65, !52, !52}
!325 = !DISubprogram(name: "lt", linkageName: "?lt@?$_Char_traits@DH@std@@SA_NAEBD0@Z", scope: !279, file: !34, line: 182, type: !323, scopeLine: 182, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!326 = !DISubprogram(name: "to_char_type", linkageName: "?to_char_type@?$_Char_traits@DH@std@@SADAEBH@Z", scope: !279, file: !34, line: 186, type: !327, scopeLine: 186, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!327 = !DISubroutineType(types: !328)
!328 = !{!23, !329}
!329 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !330, size: 64)
!330 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !282)
!331 = !DISubprogram(name: "to_int_type", linkageName: "?to_int_type@?$_Char_traits@DH@std@@SAHAEBD@Z", scope: !279, file: !34, line: 190, type: !332, scopeLine: 190, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!332 = !DISubroutineType(types: !333)
!333 = !{!282, !52}
!334 = !DISubprogram(name: "eq_int_type", linkageName: "?eq_int_type@?$_Char_traits@DH@std@@SA_NAEBH0@Z", scope: !279, file: !34, line: 194, type: !335, scopeLine: 194, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!335 = !DISubroutineType(types: !336)
!336 = !{!65, !329, !329}
!337 = !DISubprogram(name: "not_eof", linkageName: "?not_eof@?$_Char_traits@DH@std@@SAHAEBH@Z", scope: !279, file: !34, line: 198, type: !338, scopeLine: 198, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!338 = !DISubroutineType(types: !339)
!339 = !{!282, !329}
!340 = !DISubprogram(name: "eof", linkageName: "?eof@?$_Char_traits@DH@std@@SAHXZ", scope: !279, file: !34, line: 202, type: !341, scopeLine: 202, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!341 = !DISubroutineType(types: !342)
!342 = !{!282}
!343 = !{!344, !345}
!344 = !DITemplateTypeParameter(name: "_Elem", type: !23)
!345 = !DITemplateTypeParameter(name: "_Int_type", type: !6)
!346 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Primary_char_traits", scope: !276, file: !34, line: 350, baseType: !279)
!347 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !276, file: !34, line: 353, baseType: !23)
!348 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_type", scope: !276, file: !34, line: 354, baseType: !6)
!349 = !DIDerivedType(tag: DW_TAG_typedef, name: "pos_type", scope: !276, file: !34, line: 355, baseType: !284)
!350 = !DIDerivedType(tag: DW_TAG_typedef, name: "off_type", scope: !276, file: !34, line: 356, baseType: !288)
!351 = !DIDerivedType(tag: DW_TAG_typedef, name: "state_type", scope: !276, file: !34, line: 357, baseType: !352)
!352 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !291, line: 617, baseType: !290)
!353 = !DISubprogram(name: "compare", linkageName: "?compare@?$_Narrow_char_traits@DH@std@@SAHQEBD0_K@Z", scope: !276, file: !34, line: 363, type: !354, scopeLine: 363, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!354 = !DISubroutineType(types: !355)
!355 = !{!6, !302, !302, !98}
!356 = !DISubprogram(name: "length", linkageName: "?length@?$_Narrow_char_traits@DH@std@@SA_KQEBD@Z", scope: !276, file: !34, line: 373, type: !357, scopeLine: 373, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!357 = !DISubroutineType(types: !358)
!358 = !{!19, !302}
!359 = !DISubprogram(name: "find", linkageName: "?find@?$_Narrow_char_traits@DH@std@@SAPEBDQEBD_KAEBD@Z", scope: !276, file: !34, line: 393, type: !360, scopeLine: 393, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!360 = !DISubroutineType(types: !361)
!361 = !{!31, !302, !98, !52}
!362 = !DISubprogram(name: "assign", linkageName: "?assign@?$_Narrow_char_traits@DH@std@@SAPEADQEAD_KD@Z", scope: !276, file: !34, line: 414, type: !317, scopeLine: 414, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!363 = !DISubprogram(name: "assign", linkageName: "?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z", scope: !276, file: !34, line: 427, type: !320, scopeLine: 427, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!364 = !DISubprogram(name: "eq", linkageName: "?eq@?$_Narrow_char_traits@DH@std@@SA_NAEBD0@Z", scope: !276, file: !34, line: 431, type: !323, scopeLine: 431, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!365 = !DISubprogram(name: "lt", linkageName: "?lt@?$_Narrow_char_traits@DH@std@@SA_NAEBD0@Z", scope: !276, file: !34, line: 435, type: !323, scopeLine: 435, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!366 = !DISubprogram(name: "to_char_type", linkageName: "?to_char_type@?$_Narrow_char_traits@DH@std@@SADAEBH@Z", scope: !276, file: !34, line: 439, type: !367, scopeLine: 439, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!367 = !DISubroutineType(types: !368)
!368 = !{!23, !369}
!369 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !370, size: 64)
!370 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !348)
!371 = !DISubprogram(name: "to_int_type", linkageName: "?to_int_type@?$_Narrow_char_traits@DH@std@@SAHAEBD@Z", scope: !276, file: !34, line: 443, type: !372, scopeLine: 443, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!372 = !DISubroutineType(types: !373)
!373 = !{!348, !52}
!374 = !DISubprogram(name: "eq_int_type", linkageName: "?eq_int_type@?$_Narrow_char_traits@DH@std@@SA_NAEBH0@Z", scope: !276, file: !34, line: 447, type: !375, scopeLine: 447, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!375 = !DISubroutineType(types: !376)
!376 = !{!65, !369, !369}
!377 = !DISubprogram(name: "not_eof", linkageName: "?not_eof@?$_Narrow_char_traits@DH@std@@SAHAEBH@Z", scope: !276, file: !34, line: 451, type: !378, scopeLine: 451, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!378 = !DISubroutineType(types: !379)
!379 = !{!348, !369}
!380 = !DISubprogram(name: "eof", linkageName: "?eof@?$_Narrow_char_traits@DH@std@@SAHXZ", scope: !276, file: !34, line: 455, type: !381, scopeLine: 455, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!381 = !DISubroutineType(types: !382)
!382 = !{!348}
!383 = !{!344}
!384 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !33, file: !34, line: 2303, baseType: !43)
!385 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !33, file: !34, line: 2305, baseType: !23)
!386 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !33, file: !34, line: 2306, baseType: !120)
!387 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !33, file: !34, line: 2307, baseType: !121)
!388 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !33, file: !34, line: 2308, baseType: !113)
!389 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !33, file: !34, line: 2309, baseType: !115)
!390 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !33, file: !34, line: 2310, baseType: !391)
!391 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !385, size: 64)
!392 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !33, file: !34, line: 2311, baseType: !393)
!393 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !394, size: 64)
!394 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !385)
!395 = !DIDerivedType(tag: DW_TAG_typedef, name: "iterator", scope: !33, file: !34, line: 2313, baseType: !396)
!396 = !DICompositeType(tag: DW_TAG_class_type, name: "_String_iterator<std::_String_val<std::_Simple_types<char> > >", scope: !5, file: !34, line: 2060, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@")
!397 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_iterator", scope: !33, file: !34, line: 2314, baseType: !398)
!398 = !DICompositeType(tag: DW_TAG_class_type, name: "_String_const_iterator<std::_String_val<std::_Simple_types<char> > >", scope: !5, file: !34, line: 1833, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AV?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@")
!399 = !DIDerivedType(tag: DW_TAG_typedef, name: "reverse_iterator", scope: !33, file: !34, line: 2316, baseType: !400)
!400 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<std::_String_iterator<std::_String_val<std::_Simple_types<char> > > >", scope: !5, file: !401, line: 1886, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AV?$reverse_iterator@V?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@std@@")
!401 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\xutility", directory: "", checksumkind: CSK_MD5, checksum: "1e609a14c56e28a4cdafb768d9e4f58d")
!402 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reverse_iterator", scope: !33, file: !34, line: 2317, baseType: !403)
!403 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<std::_String_const_iterator<std::_String_val<std::_Simple_types<char> > > >", scope: !5, file: !401, line: 1886, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AV?$reverse_iterator@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@std@@")
!404 = !DIDerivedType(tag: DW_TAG_member, name: "_BUF_SIZE", scope: !33, file: !34, line: 2320, baseType: !405, flags: DIFlagStaticMember, extraData: i64 16)
!405 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !21)
!406 = !DIDerivedType(tag: DW_TAG_member, name: "_ALLOC_MASK", scope: !33, file: !34, line: 2321, baseType: !405, flags: DIFlagStaticMember, extraData: i64 15)
!407 = !DIDerivedType(tag: DW_TAG_member, name: "_Can_memcpy_val", scope: !33, file: !34, line: 2333, baseType: !64, flags: DIFlagStaticMember)
!408 = !DIDerivedType(tag: DW_TAG_member, name: "_Memcpy_val_offset", scope: !33, file: !34, line: 2335, baseType: !98, flags: DIFlagStaticMember)
!409 = !DIDerivedType(tag: DW_TAG_member, name: "_Memcpy_val_size", scope: !33, file: !34, line: 2336, baseType: !98, flags: DIFlagStaticMember)
!410 = !DIDerivedType(tag: DW_TAG_member, name: "npos", scope: !33, file: !34, line: 2810, baseType: !405, flags: DIFlagPublic | DIFlagStaticMember, extraData: i64 -1)
!411 = !DIDerivedType(tag: DW_TAG_member, name: "_Mypair", scope: !33, file: !34, line: 4416, baseType: !412, size: 256)
!412 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "_Compressed_pair<std::allocator<char>,std::_String_val<std::_Simple_types<char> >,1>", scope: !5, file: !38, line: 1324, size: 256, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !413, templateParams: !426, identifier: ".?AV?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@")
!413 = !{!414, !415, !416, !417, !421}
!414 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !412, baseType: !43, extraData: i32 0)
!415 = !DIDerivedType(tag: DW_TAG_member, name: "_Myval2", scope: !412, file: !38, line: 1326, baseType: !177, size: 256, flags: DIFlagPublic)
!416 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Mybase", scope: !412, file: !38, line: 1328, baseType: !43)
!417 = !DISubprogram(name: "_Get_first", linkageName: "?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAAAEAV?$allocator@D@2@XZ", scope: !412, file: !38, line: 1340, type: !418, scopeLine: 1340, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!418 = !DISubroutineType(types: !419)
!419 = !{!144, !420}
!420 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !412, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!421 = !DISubprogram(name: "_Get_first", linkageName: "?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEBAAEBV?$allocator@D@2@XZ", scope: !412, file: !38, line: 1344, type: !422, scopeLine: 1344, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!422 = !DISubroutineType(types: !423)
!423 = !{!93, !424}
!424 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !425, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!425 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !412)
!426 = !{!427, !428, !429}
!427 = !DITemplateTypeParameter(name: "_Ty1", type: !43)
!428 = !DITemplateTypeParameter(name: "_Ty2", type: !177)
!429 = !DITemplateValueParameter(type: !65, value: i8 1)
!430 = !DISubprogram(name: "basic_string", scope: !33, file: !34, line: 2350, type: !431, scopeLine: 2350, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!431 = !DISubroutineType(types: !432)
!432 = !{null, !433, !434}
!433 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!434 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !435, size: 64)
!435 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !33)
!436 = !DISubprogram(name: "basic_string", scope: !33, file: !34, line: 2358, type: !437, scopeLine: 2358, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!437 = !DISubroutineType(types: !438)
!438 = !{null, !433, !434, !93}
!439 = !DISubprogram(name: "basic_string", scope: !33, file: !34, line: 2365, type: !440, scopeLine: 2365, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!440 = !DISubroutineType(types: !441)
!441 = !{null, !433}
!442 = !DISubprogram(name: "basic_string", scope: !33, file: !34, line: 2370, type: !443, scopeLine: 2370, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!443 = !DISubroutineType(types: !444)
!444 = !{null, !433, !93}
!445 = !DISubprogram(name: "basic_string", scope: !33, file: !34, line: 2375, type: !446, scopeLine: 2375, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!446 = !DISubroutineType(types: !447)
!447 = !{null, !433, !434, !448, !93}
!448 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !386)
!449 = !DISubprogram(name: "basic_string", scope: !33, file: !34, line: 2384, type: !450, scopeLine: 2384, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!450 = !DISubroutineType(types: !451)
!451 = !{null, !433, !434, !448, !448, !93}
!452 = !DISubprogram(name: "basic_string", scope: !33, file: !34, line: 2394, type: !453, scopeLine: 2394, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!453 = !DISubroutineType(types: !454)
!454 = !{null, !433, !302, !448}
!455 = !DISubprogram(name: "basic_string", scope: !33, file: !34, line: 2403, type: !456, scopeLine: 2403, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!456 = !DISubroutineType(types: !457)
!457 = !{null, !433, !302, !448, !93}
!458 = !DISubprogram(name: "basic_string", scope: !33, file: !34, line: 2413, type: !459, scopeLine: 2413, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!459 = !DISubroutineType(types: !460)
!460 = !{null, !433, !302}
!461 = !DISubprogram(name: "basic_string", scope: !33, file: !34, line: 2424, type: !462, scopeLine: 2424, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!462 = !DISubroutineType(types: !463)
!463 = !{null, !433, !302, !93}
!464 = !DISubprogram(name: "basic_string", scope: !33, file: !34, line: 2432, type: !465, scopeLine: 2432, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!465 = !DISubroutineType(types: !466)
!466 = !{null, !433, !448, !32}
!467 = !DISubprogram(name: "basic_string", scope: !33, file: !34, line: 2444, type: !468, scopeLine: 2444, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!468 = !DISubroutineType(types: !469)
!469 = !{null, !433, !448, !32, !93}
!470 = !DISubprogram(name: "_Construct", linkageName: "?_Construct@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXQEAD0Urandom_access_iterator_tag@2@@Z", scope: !33, file: !34, line: 2482, type: !471, scopeLine: 2482, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!471 = !DISubroutineType(types: !472)
!472 = !{null, !433, !97, !97, !473}
!473 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "random_access_iterator_tag", scope: !5, file: !401, line: 273, size: 8, flags: DIFlagTypePassByValue, elements: !474, identifier: ".?AUrandom_access_iterator_tag@std@@")
!474 = !{!475}
!475 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !473, baseType: !476, extraData: i32 0)
!476 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bidirectional_iterator_tag", scope: !5, file: !401, line: 271, size: 8, flags: DIFlagTypePassByValue, elements: !477, identifier: ".?AUbidirectional_iterator_tag@std@@")
!477 = !{!478}
!478 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !476, baseType: !479, extraData: i32 0)
!479 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "forward_iterator_tag", scope: !5, file: !401, line: 269, size: 8, flags: DIFlagTypePassByValue, elements: !480, identifier: ".?AUforward_iterator_tag@std@@")
!480 = !{!481}
!481 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !479, baseType: !482, extraData: i32 0)
!482 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "input_iterator_tag", scope: !5, file: !401, line: 265, size: 8, flags: DIFlagTypePassByValue, elements: !197, identifier: ".?AUinput_iterator_tag@std@@")
!483 = !DISubprogram(name: "_Construct", linkageName: "?_Construct@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXQEBD0Urandom_access_iterator_tag@2@@Z", scope: !33, file: !34, line: 2489, type: !484, scopeLine: 2489, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!484 = !DISubroutineType(types: !485)
!485 = !{null, !433, !302, !302, !473}
!486 = !DISubprogram(name: "basic_string", scope: !33, file: !34, line: 2496, type: !487, scopeLine: 2496, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!487 = !DISubroutineType(types: !488)
!488 = !{null, !433, !489}
!489 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !33, size: 64)
!490 = !DISubprogram(name: "basic_string", scope: !33, file: !34, line: 2501, type: !491, scopeLine: 2501, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!491 = !DISubroutineType(types: !492)
!492 = !{null, !433, !489, !93}
!493 = !DISubprogram(name: "basic_string", scope: !33, file: !34, line: 2518, type: !494, scopeLine: 2518, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!494 = !DISubroutineType(types: !495)
!495 = !{null, !433, !496, !434, !302, !448, !302, !448}
!496 = !DICompositeType(tag: DW_TAG_structure_type, name: "_String_constructor_concat_tag", scope: !5, file: !34, line: 2269, size: 8, flags: DIFlagFwdDecl, identifier: ".?AU_String_constructor_concat_tag@std@@")
!497 = !DISubprogram(name: "basic_string", scope: !33, file: !34, line: 2546, type: !498, scopeLine: 2546, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!498 = !DISubroutineType(types: !499)
!499 = !{null, !433, !496, !500, !500}
!500 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !33, size: 64)
!501 = !DISubprogram(name: "_Move_assign", linkageName: "?_Move_assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEAV12@U_Equal_allocators@2@@Z", scope: !33, file: !34, line: 2636, type: !502, scopeLine: 2636, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!502 = !DISubroutineType(types: !503)
!503 = !{null, !433, !500, !504}
!504 = !DICompositeType(tag: DW_TAG_structure_type, name: "_Equal_allocators", scope: !5, file: !38, line: 723, size: 8, flags: DIFlagFwdDecl, identifier: ".?AU_Equal_allocators@std@@")
!505 = !DISubprogram(name: "_Move_assign", linkageName: "?_Move_assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEAV12@U?$integral_constant@_N$00@2@@Z", scope: !33, file: !34, line: 2642, type: !506, scopeLine: 2642, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!506 = !DISubroutineType(types: !507)
!507 = !{null, !433, !500, !508}
!508 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Propagate_allocators", scope: !5, file: !38, line: 724, baseType: !58)
!509 = !DISubprogram(name: "_Move_assign", linkageName: "?_Move_assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEAV12@U?$integral_constant@_N$0A@@2@@Z", scope: !33, file: !34, line: 2655, type: !510, scopeLine: 2655, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!510 = !DISubroutineType(types: !511)
!511 = !{null, !433, !500, !512}
!512 = !DIDerivedType(tag: DW_TAG_typedef, name: "_No_propagate_allocators", scope: !5, file: !38, line: 725, baseType: !123)
!513 = !DISubprogram(name: "operator=", linkageName: "??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@$$QEAV01@@Z", scope: !33, file: !34, line: 2664, type: !514, scopeLine: 2664, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!514 = !DISubroutineType(types: !515)
!515 = !{!500, !433, !489}
!516 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@$$QEAV12@@Z", scope: !33, file: !34, line: 2672, type: !514, scopeLine: 2672, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!517 = !DISubprogram(name: "_Memcpy_val_from", linkageName: "?_Memcpy_val_from@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@@Z", scope: !33, file: !34, line: 2678, type: !431, scopeLine: 2678, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!518 = !DISubprogram(name: "_Take_contents", linkageName: "?_Take_contents@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEAV12@U?$integral_constant@_N$00@2@@Z", scope: !33, file: !34, line: 2687, type: !519, scopeLine: 2687, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!519 = !DISubroutineType(types: !520)
!520 = !{null, !433, !500, !58}
!521 = !DISubprogram(name: "_Take_contents", linkageName: "?_Take_contents@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEAV12@U?$integral_constant@_N$0A@@2@@Z", scope: !33, file: !34, line: 2706, type: !522, scopeLine: 2706, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!522 = !DISubroutineType(types: !523)
!523 = !{null, !433, !500, !123}
!524 = !DISubprogram(name: "_Construct_lv_contents", linkageName: "?_Construct_lv_contents@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@@Z", scope: !33, file: !34, line: 2728, type: !431, scopeLine: 2728, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!525 = !DISubprogram(name: "basic_string", scope: !33, file: !34, line: 2754, type: !526, scopeLine: 2754, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!526 = !DISubroutineType(types: !527)
!527 = !{null, !433, !528, !93}
!528 = !DICompositeType(tag: DW_TAG_class_type, name: "initializer_list<char>", scope: !5, file: !529, line: 23, size: 128, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AV?$initializer_list@D@std@@")
!529 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\initializer_list", directory: "", checksumkind: CSK_MD5, checksum: "614c28410587cda93b19bfa2da486ff6")
!530 = !DISubprogram(name: "operator=", linkageName: "??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@V?$initializer_list@D@1@@Z", scope: !33, file: !34, line: 2763, type: !531, scopeLine: 2763, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!531 = !DISubroutineType(types: !532)
!532 = !{!500, !433, !528}
!533 = !DISubprogram(name: "operator+=", linkageName: "??Y?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@V?$initializer_list@D@1@@Z", scope: !33, file: !34, line: 2767, type: !531, scopeLine: 2767, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!534 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$initializer_list@D@2@@Z", scope: !33, file: !34, line: 2771, type: !531, scopeLine: 2771, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!535 = !DISubprogram(name: "append", linkageName: "?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$initializer_list@D@2@@Z", scope: !33, file: !34, line: 2775, type: !531, scopeLine: 2775, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!536 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$initializer_list@D@2@@Z", scope: !33, file: !34, line: 2779, type: !537, scopeLine: 2779, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!537 = !DISubroutineType(types: !538)
!538 = !{!395, !433, !539, !540}
!539 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !397)
!540 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !528)
!541 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0V?$initializer_list@D@2@@Z", scope: !33, file: !34, line: 2788, type: !542, scopeLine: 2788, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!542 = !DISubroutineType(types: !543)
!543 = !{!500, !433, !539, !539, !540}
!544 = !DISubprogram(name: "~basic_string", scope: !33, file: !34, line: 2800, type: !440, scopeLine: 2800, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!545 = !DISubprogram(name: "_Copy_assign_val_from_small", linkageName: "?_Copy_assign_val_from_small@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@@Z", scope: !33, file: !34, line: 2813, type: !431, scopeLine: 2813, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!546 = !DISubprogram(name: "_Copy_assign", linkageName: "?_Copy_assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@U?$integral_constant@_N$0A@@2@@Z", scope: !33, file: !34, line: 2826, type: !547, scopeLine: 2826, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!547 = !DISubroutineType(types: !548)
!548 = !{null, !433, !434, !123}
!549 = !DISubprogram(name: "_Copy_assign", linkageName: "?_Copy_assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@U?$integral_constant@_N$00@2@@Z", scope: !33, file: !34, line: 2831, type: !550, scopeLine: 2831, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!550 = !DISubroutineType(types: !551)
!551 = !{null, !433, !434, !58}
!552 = !DISubprogram(name: "operator=", linkageName: "??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@AEBV01@@Z", scope: !33, file: !34, line: 2862, type: !553, scopeLine: 2862, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!553 = !DISubroutineType(types: !554)
!554 = !{!500, !433, !434}
!555 = !DISubprogram(name: "operator=", linkageName: "??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@QEBD@Z", scope: !33, file: !34, line: 2877, type: !556, scopeLine: 2877, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!556 = !DISubroutineType(types: !557)
!557 = !{!500, !433, !302}
!558 = !DISubprogram(name: "operator=", linkageName: "??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@D@Z", scope: !33, file: !34, line: 2881, type: !559, scopeLine: 2881, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!559 = !DISubroutineType(types: !560)
!560 = !{!500, !433, !32}
!561 = !DISubprogram(name: "operator+=", linkageName: "??Y?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@AEBV01@@Z", scope: !33, file: !34, line: 2889, type: !553, scopeLine: 2889, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!562 = !DISubprogram(name: "operator+=", linkageName: "??Y?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@QEBD@Z", scope: !33, file: !34, line: 2900, type: !556, scopeLine: 2900, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!563 = !DISubprogram(name: "operator+=", linkageName: "??Y?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@D@Z", scope: !33, file: !34, line: 2904, type: !564, scopeLine: 2904, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!564 = !DISubroutineType(types: !565)
!565 = !{!500, !433, !23}
!566 = !DISubprogram(name: "append", linkageName: "?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@AEBV12@@Z", scope: !33, file: !34, line: 2909, type: !553, scopeLine: 2909, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!567 = !DISubprogram(name: "append", linkageName: "?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@AEBV12@_K_K@Z", scope: !33, file: !34, line: 2913, type: !568, scopeLine: 2913, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!568 = !DISubroutineType(types: !569)
!569 = !{!500, !433, !434, !448, !386}
!570 = !DISubprogram(name: "append", linkageName: "?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD_K@Z", scope: !33, file: !34, line: 2935, type: !571, scopeLine: 2935, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!571 = !DISubroutineType(types: !572)
!572 = !{!500, !433, !302, !448}
!573 = !DISubprogram(name: "append", linkageName: "?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD@Z", scope: !33, file: !34, line: 2957, type: !556, scopeLine: 2957, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!574 = !DISubprogram(name: "append", linkageName: "?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KD@Z", scope: !33, file: !34, line: 2961, type: !575, scopeLine: 2961, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!575 = !DISubroutineType(types: !576)
!576 = !{!500, !433, !448, !32}
!577 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@AEBV12@@Z", scope: !33, file: !34, line: 3015, type: !553, scopeLine: 3015, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!578 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@AEBV12@_K_K@Z", scope: !33, file: !34, line: 3020, type: !568, scopeLine: 3020, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!579 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD_K@Z", scope: !33, file: !34, line: 3042, type: !571, scopeLine: 3042, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!580 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD@Z", scope: !33, file: !34, line: 3061, type: !556, scopeLine: 3061, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!581 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KD@Z", scope: !33, file: !34, line: 3065, type: !575, scopeLine: 3065, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!582 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KAEBV12@@Z", scope: !33, file: !34, line: 3128, type: !583, scopeLine: 3128, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!583 = !DISubroutineType(types: !584)
!584 = !{!500, !433, !448, !434}
!585 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KAEBV12@0_K@Z", scope: !33, file: !34, line: 3132, type: !586, scopeLine: 3132, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!586 = !DISubroutineType(types: !587)
!587 = !{!500, !433, !448, !434, !448, !386}
!588 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KQEBD0@Z", scope: !33, file: !34, line: 3155, type: !589, scopeLine: 3155, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!589 = !DISubroutineType(types: !590)
!590 = !{!500, !433, !448, !302, !448}
!591 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KQEBD@Z", scope: !33, file: !34, line: 3194, type: !592, scopeLine: 3194, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!592 = !DISubroutineType(types: !593)
!593 = !{!500, !433, !448, !302}
!594 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K0D@Z", scope: !33, file: !34, line: 3198, type: !595, scopeLine: 3198, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!595 = !DISubroutineType(types: !596)
!596 = !{!500, !433, !448, !448, !32}
!597 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@D@Z", scope: !33, file: !34, line: 3222, type: !598, scopeLine: 3222, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!598 = !DISubroutineType(types: !599)
!599 = !{!395, !433, !539, !32}
!600 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@_KD@Z", scope: !33, file: !34, line: 3231, type: !601, scopeLine: 3231, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!601 = !DISubroutineType(types: !602)
!602 = !{!395, !433, !539, !448, !32}
!603 = !DISubprogram(name: "erase", linkageName: "?erase@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K@Z", scope: !33, file: !34, line: 3287, type: !604, scopeLine: 3287, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!604 = !DISubroutineType(types: !605)
!605 = !{!500, !433, !448}
!606 = !DISubprogram(name: "_Erase_noexcept", linkageName: "?_Erase_noexcept@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV12@_K_K@Z", scope: !33, file: !34, line: 3294, type: !607, scopeLine: 3294, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!607 = !DISubroutineType(types: !608)
!608 = !{!500, !433, !448, !386}
!609 = !DISubprogram(name: "erase", linkageName: "?erase@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K0@Z", scope: !33, file: !34, line: 3306, type: !610, scopeLine: 3306, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!610 = !DISubroutineType(types: !611)
!611 = !{!500, !433, !448, !448}
!612 = !DISubprogram(name: "erase", linkageName: "?erase@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@@Z", scope: !33, file: !34, line: 3311, type: !613, scopeLine: 3311, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!613 = !DISubroutineType(types: !614)
!614 = !{!395, !433, !539}
!615 = !DISubprogram(name: "erase", linkageName: "?erase@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0@Z", scope: !33, file: !34, line: 3320, type: !616, scopeLine: 3320, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!616 = !DISubroutineType(types: !617)
!617 = !{!395, !433, !539, !539}
!618 = !DISubprogram(name: "clear", linkageName: "?clear@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXXZ", scope: !33, file: !34, line: 3330, type: !440, scopeLine: 3330, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!619 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K0AEBV12@@Z", scope: !33, file: !34, line: 3334, type: !620, scopeLine: 3334, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!620 = !DISubroutineType(types: !621)
!621 = !{!500, !433, !448, !448, !434}
!622 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K_KAEBV12@01@Z", scope: !33, file: !34, line: 3339, type: !623, scopeLine: 3339, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!623 = !DISubroutineType(types: !624)
!624 = !{!500, !433, !448, !386, !434, !448, !386}
!625 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K_KQEBD0@Z", scope: !33, file: !34, line: 3364, type: !626, scopeLine: 3364, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!626 = !DISubroutineType(types: !627)
!627 = !{!500, !433, !448, !386, !302, !448}
!628 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K0QEBD@Z", scope: !33, file: !34, line: 3424, type: !629, scopeLine: 3424, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!629 = !DISubroutineType(types: !630)
!630 = !{!500, !433, !448, !448, !302}
!631 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K_K0D@Z", scope: !33, file: !34, line: 3429, type: !632, scopeLine: 3429, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!632 = !DISubroutineType(types: !633)
!633 = !{!500, !433, !448, !386, !448, !32}
!634 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0AEBV12@@Z", scope: !33, file: !34, line: 3461, type: !635, scopeLine: 3461, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!635 = !DISubroutineType(types: !636)
!636 = !{!500, !433, !539, !539, !434}
!637 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0QEBD_K@Z", scope: !33, file: !34, line: 3484, type: !638, scopeLine: 3484, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!638 = !DISubroutineType(types: !639)
!639 = !{!500, !433, !539, !539, !302, !448}
!640 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0QEBD@Z", scope: !33, file: !34, line: 3495, type: !641, scopeLine: 3495, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!641 = !DISubroutineType(types: !642)
!642 = !{!500, !433, !539, !539, !302}
!643 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0_KD@Z", scope: !33, file: !34, line: 3505, type: !644, scopeLine: 3505, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!644 = !DISubroutineType(types: !645)
!645 = !{!500, !433, !539, !539, !448, !32}
!646 = !DISubprogram(name: "begin", linkageName: "?begin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ", scope: !33, file: !34, line: 3569, type: !647, scopeLine: 3569, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!647 = !DISubroutineType(types: !648)
!648 = !{!395, !433}
!649 = !DISubprogram(name: "begin", linkageName: "?begin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ", scope: !33, file: !34, line: 3573, type: !650, scopeLine: 3573, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!650 = !DISubroutineType(types: !651)
!651 = !{!397, !652}
!652 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !435, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!653 = !DISubprogram(name: "end", linkageName: "?end@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ", scope: !33, file: !34, line: 3577, type: !647, scopeLine: 3577, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!654 = !DISubprogram(name: "end", linkageName: "?end@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ", scope: !33, file: !34, line: 3583, type: !650, scopeLine: 3583, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!655 = !DISubprogram(name: "_Unchecked_begin", linkageName: "?_Unchecked_begin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAPEADXZ", scope: !33, file: !34, line: 3589, type: !656, scopeLine: 3589, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!656 = !DISubroutineType(types: !657)
!657 = !{!22, !433}
!658 = !DISubprogram(name: "_Unchecked_begin", linkageName: "?_Unchecked_begin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAPEBDXZ", scope: !33, file: !34, line: 3593, type: !659, scopeLine: 3593, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!659 = !DISubroutineType(types: !660)
!660 = !{!31, !652}
!661 = !DISubprogram(name: "_Unchecked_end", linkageName: "?_Unchecked_end@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAPEADXZ", scope: !33, file: !34, line: 3597, type: !656, scopeLine: 3597, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!662 = !DISubprogram(name: "_Unchecked_end", linkageName: "?_Unchecked_end@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAPEBDXZ", scope: !33, file: !34, line: 3601, type: !659, scopeLine: 3601, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!663 = !DISubprogram(name: "rbegin", linkageName: "?rbegin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$reverse_iterator@V?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ", scope: !33, file: !34, line: 3605, type: !664, scopeLine: 3605, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!664 = !DISubroutineType(types: !665)
!665 = !{!399, !433}
!666 = !DISubprogram(name: "rbegin", linkageName: "?rbegin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$reverse_iterator@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ", scope: !33, file: !34, line: 3609, type: !667, scopeLine: 3609, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!667 = !DISubroutineType(types: !668)
!668 = !{!402, !652}
!669 = !DISubprogram(name: "rend", linkageName: "?rend@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$reverse_iterator@V?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ", scope: !33, file: !34, line: 3613, type: !664, scopeLine: 3613, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!670 = !DISubprogram(name: "rend", linkageName: "?rend@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$reverse_iterator@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ", scope: !33, file: !34, line: 3617, type: !667, scopeLine: 3617, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!671 = !DISubprogram(name: "cbegin", linkageName: "?cbegin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ", scope: !33, file: !34, line: 3621, type: !650, scopeLine: 3621, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!672 = !DISubprogram(name: "cend", linkageName: "?cend@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ", scope: !33, file: !34, line: 3625, type: !650, scopeLine: 3625, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!673 = !DISubprogram(name: "crbegin", linkageName: "?crbegin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$reverse_iterator@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ", scope: !33, file: !34, line: 3629, type: !667, scopeLine: 3629, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!674 = !DISubprogram(name: "crend", linkageName: "?crend@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$reverse_iterator@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ", scope: !33, file: !34, line: 3633, type: !667, scopeLine: 3633, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!675 = !DISubprogram(name: "shrink_to_fit", linkageName: "?shrink_to_fit@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXXZ", scope: !33, file: !34, line: 3637, type: !440, scopeLine: 3637, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!676 = !DISubprogram(name: "at", linkageName: "?at@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAD_K@Z", scope: !33, file: !34, line: 3660, type: !677, scopeLine: 3660, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!677 = !DISubroutineType(types: !678)
!678 = !{!390, !433, !448}
!679 = !DISubprogram(name: "at", linkageName: "?at@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAAEBD_K@Z", scope: !33, file: !34, line: 3665, type: !680, scopeLine: 3665, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!680 = !DISubroutineType(types: !681)
!681 = !{!392, !652, !448}
!682 = !DISubprogram(name: "operator[]", linkageName: "??A?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAD_K@Z", scope: !33, file: !34, line: 3670, type: !677, scopeLine: 3670, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!683 = !DISubprogram(name: "operator[]", linkageName: "??A?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAAEBD_K@Z", scope: !33, file: !34, line: 3677, type: !680, scopeLine: 3677, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!684 = !DISubprogram(name: "push_back", linkageName: "?push_back@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXD@Z", scope: !33, file: !34, line: 3691, type: !685, scopeLine: 3691, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!685 = !DISubroutineType(types: !686)
!686 = !{null, !433, !32}
!687 = !DISubprogram(name: "pop_back", linkageName: "?pop_back@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXXZ", scope: !33, file: !34, line: 3711, type: !440, scopeLine: 3711, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!688 = !DISubprogram(name: "front", linkageName: "?front@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEADXZ", scope: !33, file: !34, line: 3719, type: !689, scopeLine: 3719, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!689 = !DISubroutineType(types: !690)
!690 = !{!390, !433}
!691 = !DISubprogram(name: "front", linkageName: "?front@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAAEBDXZ", scope: !33, file: !34, line: 3727, type: !692, scopeLine: 3727, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!692 = !DISubroutineType(types: !693)
!693 = !{!392, !652}
!694 = !DISubprogram(name: "back", linkageName: "?back@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEADXZ", scope: !33, file: !34, line: 3735, type: !689, scopeLine: 3735, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!695 = !DISubprogram(name: "back", linkageName: "?back@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAAEBDXZ", scope: !33, file: !34, line: 3743, type: !692, scopeLine: 3743, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!696 = !DISubprogram(name: "c_str", linkageName: "?c_str@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAPEBDXZ", scope: !33, file: !34, line: 3751, type: !659, scopeLine: 3751, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!697 = !DISubprogram(name: "data", linkageName: "?data@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAPEBDXZ", scope: !33, file: !34, line: 3755, type: !659, scopeLine: 3755, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!698 = !DISubprogram(name: "length", linkageName: "?length@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ", scope: !33, file: !34, line: 3765, type: !699, scopeLine: 3765, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!699 = !DISubroutineType(types: !700)
!700 = !{!386, !652}
!701 = !DISubprogram(name: "size", linkageName: "?size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ", scope: !33, file: !34, line: 3769, type: !699, scopeLine: 3769, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!702 = !DISubprogram(name: "max_size", linkageName: "?max_size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ", scope: !33, file: !34, line: 3773, type: !699, scopeLine: 3773, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!703 = !DISubprogram(name: "resize", linkageName: "?resize@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAX_KD@Z", scope: !33, file: !34, line: 3782, type: !465, scopeLine: 3782, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!704 = !DISubprogram(name: "capacity", linkageName: "?capacity@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ", scope: !33, file: !34, line: 3792, type: !699, scopeLine: 3792, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!705 = !DISubprogram(name: "reserve", linkageName: "?reserve@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAX_K@Z", scope: !33, file: !34, line: 3817, type: !706, scopeLine: 3817, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!706 = !DISubroutineType(types: !707)
!707 = !{null, !433, !448}
!708 = !DISubprogram(name: "empty", linkageName: "?empty@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_NXZ", scope: !33, file: !34, line: 3847, type: !709, scopeLine: 3847, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!709 = !DISubroutineType(types: !710)
!710 = !{!65, !652}
!711 = !DISubprogram(name: "copy", linkageName: "?copy@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEAD_K_K@Z", scope: !33, file: !34, line: 3851, type: !712, scopeLine: 3851, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!712 = !DISubroutineType(types: !713)
!713 = !{!386, !652, !97, !386, !448}
!714 = !DISubprogram(name: "_Copy_s", linkageName: "?_Copy_s@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEAD_K_K1@Z", scope: !33, file: !34, line: 3859, type: !715, scopeLine: 3859, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!715 = !DISubroutineType(types: !716)
!716 = !{!386, !652, !97, !448, !386, !448}
!717 = !DISubprogram(name: "_Swap_data", linkageName: "?_Swap_data@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXAEAV12@U?$integral_constant@_N$00@2@@Z", scope: !33, file: !34, line: 3868, type: !519, scopeLine: 3868, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!718 = !DISubprogram(name: "_Swap_bx_large_with_small", linkageName: "?_Swap_bx_large_with_small@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXAEAV?$_String_val@U?$_Simple_types@D@std@@@2@0@Z", scope: !33, file: !34, line: 3880, type: !719, scopeLine: 3880, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!719 = !DISubroutineType(types: !720)
!720 = !{null, !433, !721, !721}
!721 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !176, size: 64)
!722 = !DISubprogram(name: "_Swap_data", linkageName: "?_Swap_data@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXAEAV12@U?$integral_constant@_N$0A@@2@@Z", scope: !33, file: !34, line: 3888, type: !522, scopeLine: 3888, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!723 = !DISubprogram(name: "swap", linkageName: "?swap@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXAEAV12@@Z", scope: !33, file: !34, line: 3915, type: !724, scopeLine: 3915, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!724 = !DISubroutineType(types: !725)
!725 = !{null, !433, !500}
!726 = !DISubprogram(name: "find", linkageName: "?find@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z", scope: !33, file: !34, line: 3949, type: !727, scopeLine: 3949, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!727 = !DISubroutineType(types: !728)
!728 = !{!386, !652, !434, !448}
!729 = !DISubprogram(name: "find", linkageName: "?find@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z", scope: !33, file: !34, line: 3955, type: !730, scopeLine: 3955, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!730 = !DISubroutineType(types: !731)
!731 = !{!386, !652, !302, !448, !448}
!732 = !DISubprogram(name: "find", linkageName: "?find@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z", scope: !33, file: !34, line: 3962, type: !733, scopeLine: 3962, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!733 = !DISubroutineType(types: !734)
!734 = !{!386, !652, !302, !448}
!735 = !DISubprogram(name: "find", linkageName: "?find@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z", scope: !33, file: !34, line: 3969, type: !736, scopeLine: 3969, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!736 = !DISubroutineType(types: !737)
!737 = !{!386, !652, !32, !448}
!738 = !DISubprogram(name: "rfind", linkageName: "?rfind@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z", scope: !33, file: !34, line: 3985, type: !727, scopeLine: 3985, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!739 = !DISubprogram(name: "rfind", linkageName: "?rfind@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z", scope: !33, file: !34, line: 3991, type: !730, scopeLine: 3991, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!740 = !DISubprogram(name: "rfind", linkageName: "?rfind@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z", scope: !33, file: !34, line: 3998, type: !733, scopeLine: 3998, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!741 = !DISubprogram(name: "rfind", linkageName: "?rfind@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z", scope: !33, file: !34, line: 4005, type: !736, scopeLine: 4005, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!742 = !DISubprogram(name: "find_first_of", linkageName: "?find_first_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z", scope: !33, file: !34, line: 4021, type: !727, scopeLine: 4021, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!743 = !DISubprogram(name: "find_first_of", linkageName: "?find_first_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z", scope: !33, file: !34, line: 4028, type: !730, scopeLine: 4028, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!744 = !DISubprogram(name: "find_first_of", linkageName: "?find_first_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z", scope: !33, file: !34, line: 4035, type: !733, scopeLine: 4035, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!745 = !DISubprogram(name: "find_first_of", linkageName: "?find_first_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z", scope: !33, file: !34, line: 4042, type: !736, scopeLine: 4042, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!746 = !DISubprogram(name: "find_last_of", linkageName: "?find_last_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z", scope: !33, file: !34, line: 4058, type: !747, scopeLine: 4058, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!747 = !DISubroutineType(types: !748)
!748 = !{!386, !652, !434, !386}
!749 = !DISubprogram(name: "find_last_of", linkageName: "?find_last_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z", scope: !33, file: !34, line: 4065, type: !730, scopeLine: 4065, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!750 = !DISubprogram(name: "find_last_of", linkageName: "?find_last_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z", scope: !33, file: !34, line: 4072, type: !733, scopeLine: 4072, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!751 = !DISubprogram(name: "find_last_of", linkageName: "?find_last_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z", scope: !33, file: !34, line: 4079, type: !736, scopeLine: 4079, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!752 = !DISubprogram(name: "find_first_not_of", linkageName: "?find_first_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z", scope: !33, file: !34, line: 4096, type: !727, scopeLine: 4096, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!753 = !DISubprogram(name: "find_first_not_of", linkageName: "?find_first_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z", scope: !33, file: !34, line: 4103, type: !730, scopeLine: 4103, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!754 = !DISubprogram(name: "find_first_not_of", linkageName: "?find_first_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z", scope: !33, file: !34, line: 4110, type: !755, scopeLine: 4110, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!755 = !DISubroutineType(types: !756)
!756 = !{!386, !652, !302, !386}
!757 = !DISubprogram(name: "find_first_not_of", linkageName: "?find_first_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z", scope: !33, file: !34, line: 4117, type: !736, scopeLine: 4117, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!758 = !DISubprogram(name: "find_last_not_of", linkageName: "?find_last_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z", scope: !33, file: !34, line: 4135, type: !727, scopeLine: 4135, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!759 = !DISubprogram(name: "find_last_not_of", linkageName: "?find_last_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z", scope: !33, file: !34, line: 4142, type: !730, scopeLine: 4142, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!760 = !DISubprogram(name: "find_last_not_of", linkageName: "?find_last_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z", scope: !33, file: !34, line: 4149, type: !733, scopeLine: 4149, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!761 = !DISubprogram(name: "find_last_not_of", linkageName: "?find_last_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z", scope: !33, file: !34, line: 4156, type: !736, scopeLine: 4156, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!762 = !DISubprogram(name: "substr", linkageName: "?substr@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV12@_K0@Z", scope: !33, file: !34, line: 4169, type: !763, scopeLine: 4169, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!763 = !DISubroutineType(types: !764)
!764 = !{!33, !652, !448, !448}
!765 = !DISubprogram(name: "_Equal", linkageName: "?_Equal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_NAEBV12@@Z", scope: !33, file: !34, line: 4174, type: !766, scopeLine: 4174, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!766 = !DISubroutineType(types: !767)
!767 = !{!65, !652, !434}
!768 = !DISubprogram(name: "_Equal", linkageName: "?_Equal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_NQEBD@Z", scope: !33, file: !34, line: 4179, type: !769, scopeLine: 4179, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!769 = !DISubroutineType(types: !770)
!770 = !{!65, !652, !302}
!771 = !DISubprogram(name: "compare", linkageName: "?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAHAEBV12@@Z", scope: !33, file: !34, line: 4212, type: !772, scopeLine: 4212, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!772 = !DISubroutineType(types: !773)
!773 = !{!6, !652, !434}
!774 = !DISubprogram(name: "compare", linkageName: "?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAH_K0AEBV12@@Z", scope: !33, file: !34, line: 4217, type: !775, scopeLine: 4217, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!775 = !DISubroutineType(types: !776)
!776 = !{!6, !652, !386, !386, !434}
!777 = !DISubprogram(name: "compare", linkageName: "?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAH_K0AEBV12@00@Z", scope: !33, file: !34, line: 4224, type: !778, scopeLine: 4224, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!778 = !DISubroutineType(types: !779)
!779 = !{!6, !652, !448, !448, !434, !448, !448}
!780 = !DISubprogram(name: "compare", linkageName: "?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAHQEBD@Z", scope: !33, file: !34, line: 4233, type: !781, scopeLine: 4233, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!781 = !DISubroutineType(types: !782)
!782 = !{!6, !652, !302}
!783 = !DISubprogram(name: "compare", linkageName: "?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAH_K0QEBD@Z", scope: !33, file: !34, line: 4238, type: !784, scopeLine: 4238, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!784 = !DISubroutineType(types: !785)
!785 = !{!6, !652, !448, !448, !302}
!786 = !DISubprogram(name: "compare", linkageName: "?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAH_K0QEBD0@Z", scope: !33, file: !34, line: 4245, type: !787, scopeLine: 4245, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!787 = !DISubroutineType(types: !788)
!788 = !{!6, !652, !448, !448, !302, !448}
!789 = !DISubprogram(name: "get_allocator", linkageName: "?get_allocator@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$allocator@D@2@XZ", scope: !33, file: !34, line: 4278, type: !790, scopeLine: 4278, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!790 = !DISubroutineType(types: !791)
!791 = !{!384, !652}
!792 = !DISubprogram(name: "_Calculate_growth", linkageName: "?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@CA_K_K00@Z", scope: !33, file: !34, line: 4283, type: !793, scopeLine: 4283, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!793 = !DISubroutineType(types: !794)
!794 = !{!386, !448, !448, !448}
!795 = !DISubprogram(name: "_Calculate_growth", linkageName: "?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBA_K_K@Z", scope: !33, file: !34, line: 4297, type: !796, scopeLine: 4297, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!796 = !DISubroutineType(types: !797)
!797 = !{!386, !652, !448}
!798 = !DISubprogram(name: "_Become_small", linkageName: "?_Become_small@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ", scope: !33, file: !34, line: 4359, type: !440, scopeLine: 4359, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!799 = !DISubprogram(name: "_Eos", linkageName: "?_Eos@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAX_K@Z", scope: !33, file: !34, line: 4372, type: !706, scopeLine: 4372, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!800 = !DISubprogram(name: "_Tidy_init", linkageName: "?_Tidy_init@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ", scope: !33, file: !34, line: 4376, type: !440, scopeLine: 4376, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!801 = !DISubprogram(name: "_Tidy_deallocate", linkageName: "?_Tidy_deallocate@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ", scope: !33, file: !34, line: 4383, type: !440, scopeLine: 4383, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!802 = !DISubprogram(name: "_Orphan_all", linkageName: "?_Orphan_all@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXXZ", scope: !33, file: !34, line: 4399, type: !440, scopeLine: 4399, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!803 = !DISubprogram(name: "_Swap_proxy_and_iterators", linkageName: "?_Swap_proxy_and_iterators@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEAV12@@Z", scope: !33, file: !34, line: 4404, type: !724, scopeLine: 4404, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!804 = !DISubprogram(name: "_Getal", linkageName: "?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV?$allocator@D@2@XZ", scope: !33, file: !34, line: 4408, type: !805, scopeLine: 4408, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!805 = !DISubroutineType(types: !806)
!806 = !{!807, !433}
!807 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !36, size: 64)
!808 = !DISubprogram(name: "_Getal", linkageName: "?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBAAEBV?$allocator@D@2@XZ", scope: !33, file: !34, line: 4412, type: !809, scopeLine: 4412, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!809 = !DISubroutineType(types: !810)
!810 = !{!811, !652}
!811 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !812, size: 64)
!812 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !36)
!813 = !{!344, !814, !162}
!814 = !DITemplateTypeParameter(name: "_Traits", type: !273)
!815 = !{!816, !818, !820}
!816 = !DIGlobalVariableExpression(var: !817, expr: !DIExpression(DW_OP_constu, 4096, DW_OP_stack_value))
!817 = distinct !DIGlobalVariable(name: "_Big_allocation_threshold", scope: !5, file: !38, line: 92, type: !98, isLocal: true, isDefinition: true)
!818 = !DIGlobalVariableExpression(var: !819, expr: !DIExpression(DW_OP_constu, 39, DW_OP_stack_value))
!819 = distinct !DIGlobalVariable(name: "_Non_user_size", scope: !5, file: !38, line: 102, type: !98, isLocal: true, isDefinition: true)
!820 = !DIGlobalVariableExpression(var: !821, expr: !DIExpression(DW_OP_constu, 32, DW_OP_stack_value))
!821 = distinct !DIGlobalVariable(name: "_Big_allocation_alignment", scope: !5, file: !38, line: 93, type: !98, isLocal: true, isDefinition: true)
!822 = !{!823, !828, !829, !832, !835, !836, !841, !845, !847, !849, !851, !853, !858, !862, !866, !871, !875, !879, !883, !887, !889, !894, !900, !904, !908, !910, !914, !918, !920, !924, !928, !932, !934, !938, !940, !942, !946, !950, !954, !958, !962, !966, !968, !973, !977, !981, !986, !990, !992, !994, !998, !1000, !1005, !1010, !1014, !1016, !1018, !1023, !1028, !1030, !1032, !1034, !1038, !1042, !1046, !1050, !1054, !1056, !1060, !1062, !1064, !1066, !1068, !1072, !1074, !1075, !1076, !1079, !1081, !1086, !1090, !1096, !1100, !1106, !1110, !1115, !1117, !1119, !1123, !1128, !1132, !1137, !1143, !1145, !1149, !1154, !1158, !1162, !1166, !1170, !1174, !1178, !1182, !1184, !1189, !1195, !1200, !1204, !1208, !1210, !1212, !1216, !1220, !1224, !1228, !1230, !1232, !1234, !1236, !1241, !1245, !1247, !1249, !1253, !1257, !1261, !1263, !1265, !1267, !1269, !1275, !1277, !1281, !1283, !1288, !1293, !1297, !1301, !1304, !1306, !1307, !1309, !1311, !1315, !1321, !1323, !1327, !1332, !1336, !1338, !1342, !1351, !1356, !1366, !1370, !1374, !1378, !1382, !1386, !1390, !1394, !1398, !1402, !1404, !1408, !1413, !1418, !1422, !1426, !1430, !1434, !1435, !1439, !1441, !1445, !1449, !1453, !1457, !1461, !1465, !1469, !1471, !1473, !1475, !1480, !1483, !1485, !1487, !1490, !1492, !1494, !1496, !1498, !1500, !1502, !1504, !1506, !1508, !1510, !1512, !1514, !1516, !1518, !1520, !1522, !1524, !1526, !1528, !1530, !1532, !1534, !1535, !1537, !1538, !1539, !1540, !1541, !1542, !1543, !1544, !1545, !1546, !1547, !1548, !1549, !1550, !1551, !1552, !1553, !1554, !1555, !1556, !1557, !1558, !1559, !1560, !1561, !1562, !1563, !1564, !1566, !1567, !1571, !1576, !1577, !1580, !1585, !1586, !1590, !1592, !1594, !1596, !1598, !1600, !1602, !1604, !1606, !1608, !1610, !1612, !1614}
!823 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !824, file: !827, line: 37)
!824 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !825, line: 31, baseType: !826)
!825 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_wstdio.h", directory: "", checksumkind: CSK_MD5, checksum: "bf50373b435d0afd0235dd3e05c4a277")
!826 = !DICompositeType(tag: DW_TAG_structure_type, name: "_iobuf", file: !825, line: 28, size: 64, flags: DIFlagFwdDecl, identifier: ".?AU_iobuf@@")
!827 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\cstdio", directory: "", checksumkind: CSK_MD5, checksum: "c450e3bb97b2af18a3a83f1f772c2644")
!828 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !290, file: !827, line: 38)
!829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !830, file: !827, line: 40)
!830 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !831, line: 193, baseType: !21)
!831 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\vcruntime.h", directory: "", checksumkind: CSK_MD5, checksum: "1147c94afb6f25c377433eef20bc3e8f")
!832 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !833, file: !827, line: 41)
!833 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !834, line: 73, baseType: !56)
!834 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "c1a1fbc43e7d45f0ea4ae539ddcffb19")
!835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !824, file: !827, line: 42)
!836 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !837, file: !827, line: 43)
!837 = !DISubprogram(name: "clearerr", scope: !834, file: !834, line: 146, type: !838, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!838 = !DISubroutineType(types: !839)
!839 = !{null, !840}
!840 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !824, size: 64)
!841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !842, file: !827, line: 44)
!842 = !DISubprogram(name: "fclose", scope: !834, file: !834, line: 152, type: !843, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!843 = !DISubroutineType(types: !844)
!844 = !{!6, !840}
!845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !846, file: !827, line: 45)
!846 = !DISubprogram(name: "feof", scope: !834, file: !834, line: 166, type: !843, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!847 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !848, file: !827, line: 46)
!848 = !DISubprogram(name: "ferror", scope: !834, file: !834, line: 171, type: !843, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !850, file: !827, line: 47)
!850 = !DISubprogram(name: "fflush", scope: !834, file: !834, line: 176, type: !843, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !852, file: !827, line: 48)
!852 = !DISubprogram(name: "fgetc", scope: !834, file: !834, line: 182, type: !843, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!853 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !854, file: !827, line: 49)
!854 = !DISubprogram(name: "fgetpos", scope: !834, file: !834, line: 191, type: !855, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!855 = !DISubroutineType(types: !856)
!856 = !{!6, !840, !857}
!857 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !833, size: 64)
!858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !859, file: !827, line: 50)
!859 = !DISubprogram(name: "fgets", scope: !834, file: !834, line: 198, type: !860, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!860 = !DISubroutineType(types: !861)
!861 = !{!22, !22, !6, !840}
!862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !863, file: !827, line: 51)
!863 = !DISubprogram(name: "fopen", scope: !834, file: !834, line: 213, type: !864, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!864 = !DISubroutineType(types: !865)
!865 = !{!840, !31, !31}
!866 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !867, file: !827, line: 52)
!867 = !DISubprogram(name: "fprintf", scope: !834, file: !834, line: 830, type: !868, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!868 = !DISubroutineType(types: !869)
!869 = !{!6, !870, !302, null}
!870 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !840)
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !872, file: !827, line: 53)
!872 = !DISubprogram(name: "fputc", scope: !834, file: !834, line: 221, type: !873, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!873 = !DISubroutineType(types: !874)
!874 = !{!6, !6, !840}
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !876, file: !827, line: 54)
!876 = !DISubprogram(name: "fputs", scope: !834, file: !834, line: 233, type: !877, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!877 = !DISubroutineType(types: !878)
!878 = !{!6, !31, !840}
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !880, file: !827, line: 55)
!880 = !DISubprogram(name: "fread", scope: !834, file: !834, line: 239, type: !881, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!881 = !DISubroutineType(types: !882)
!882 = !{!830, !26, !830, !830, !840}
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !884, file: !827, line: 56)
!884 = !DISubprogram(name: "freopen", scope: !834, file: !834, line: 248, type: !885, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!885 = !DISubroutineType(types: !886)
!886 = !{!840, !31, !31, !840}
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !888, file: !827, line: 57)
!888 = !DISubprogram(name: "fscanf", scope: !834, file: !834, line: 1199, type: !868, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !890, file: !827, line: 58)
!890 = !DISubprogram(name: "fseek", scope: !834, file: !834, line: 270, type: !891, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!891 = !DISubroutineType(types: !892)
!892 = !{!6, !840, !893, !6}
!893 = !DIBasicType(name: "long int", size: 32, encoding: DW_ATE_signed)
!894 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !895, file: !827, line: 59)
!895 = !DISubprogram(name: "fsetpos", scope: !834, file: !834, line: 263, type: !896, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!896 = !DISubroutineType(types: !897)
!897 = !{!6, !840, !898}
!898 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !899, size: 64)
!899 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !833)
!900 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !901, file: !827, line: 60)
!901 = !DISubprogram(name: "ftell", scope: !834, file: !834, line: 286, type: !902, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!902 = !DISubroutineType(types: !903)
!903 = !{!893, !840}
!904 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !905, file: !827, line: 61)
!905 = !DISubprogram(name: "fwrite", scope: !834, file: !834, line: 297, type: !906, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!906 = !DISubroutineType(types: !907)
!907 = !{!830, !105, !830, !830, !840}
!908 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !909, file: !827, line: 62)
!909 = !DISubprogram(name: "getc", scope: !834, file: !834, line: 306, type: !843, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!910 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !911, file: !827, line: 63)
!911 = !DISubprogram(name: "getchar", scope: !834, file: !834, line: 311, type: !912, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!912 = !DISubroutineType(types: !913)
!913 = !{!6}
!914 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !915, file: !827, line: 64)
!915 = !DISubprogram(name: "perror", scope: !834, file: !834, line: 325, type: !916, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!916 = !DISubroutineType(types: !917)
!917 = !{null, !31}
!918 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !919, file: !827, line: 65)
!919 = !DISubprogram(name: "putc", scope: !834, file: !834, line: 347, type: !873, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!920 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !921, file: !827, line: 66)
!921 = !DISubprogram(name: "putchar", scope: !834, file: !834, line: 353, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!922 = !DISubroutineType(types: !923)
!923 = !{!6, !6}
!924 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !925, file: !827, line: 67)
!925 = !DISubprogram(name: "printf", scope: !834, file: !834, line: 950, type: !926, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!926 = !DISubroutineType(types: !927)
!927 = !{!6, !302, null}
!928 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !929, file: !827, line: 68)
!929 = !DISubprogram(name: "puts", scope: !834, file: !834, line: 358, type: !930, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!930 = !DISubroutineType(types: !931)
!931 = !{!6, !31}
!932 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !933, file: !827, line: 69)
!933 = !DISubprogram(name: "remove", scope: !834, file: !834, line: 369, type: !930, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!934 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !935, file: !827, line: 70)
!935 = !DISubprogram(name: "rename", scope: !834, file: !834, line: 374, type: !936, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!936 = !DISubroutineType(types: !937)
!937 = !{!6, !31, !31}
!938 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !939, file: !827, line: 71)
!939 = !DISubprogram(name: "rewind", scope: !834, file: !834, line: 392, type: !838, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!940 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !941, file: !827, line: 72)
!941 = !DISubprogram(name: "scanf", scope: !834, file: !834, line: 1276, type: !926, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!942 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !943, file: !827, line: 73)
!943 = !DISubprogram(name: "setbuf", scope: !834, file: !834, line: 400, type: !944, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!944 = !DISubroutineType(types: !945)
!945 = !{null, !840, !22}
!946 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !947, file: !827, line: 74)
!947 = !DISubprogram(name: "setvbuf", scope: !834, file: !834, line: 412, type: !948, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!948 = !DISubroutineType(types: !949)
!949 = !{!6, !840, !22, !6, !830}
!950 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !951, file: !827, line: 75)
!951 = !DISubprogram(name: "sprintf", scope: !834, file: !834, line: 1783, type: !952, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!952 = !DISubroutineType(types: !953)
!953 = !{!6, !22, !31, null}
!954 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !955, file: !827, line: 76)
!955 = !DISubprogram(name: "sscanf", scope: !834, file: !834, line: 2240, type: !956, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!956 = !DISubroutineType(types: !957)
!957 = !{!6, !302, !302, null}
!958 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !959, file: !827, line: 77)
!959 = !DISubprogram(name: "tmpfile", scope: !834, file: !834, line: 435, type: !960, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!960 = !DISubroutineType(types: !961)
!961 = !{!840}
!962 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !963, file: !827, line: 78)
!963 = !DISubprogram(name: "tmpnam", scope: !834, file: !834, line: 443, type: !964, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!964 = !DISubroutineType(types: !965)
!965 = !{!22, !22}
!966 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !967, file: !827, line: 79)
!967 = !DISubprogram(name: "ungetc", scope: !834, file: !834, line: 451, type: !873, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!968 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !969, file: !827, line: 80)
!969 = !DISubprogram(name: "vfprintf", scope: !834, file: !834, line: 650, type: !970, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!970 = !DISubroutineType(types: !971)
!971 = !{!6, !870, !302, !972}
!972 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !25, line: 72, baseType: !22)
!973 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !974, file: !827, line: 81)
!974 = !DISubprogram(name: "vprintf", scope: !834, file: !834, line: 740, type: !975, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!975 = !DISubroutineType(types: !976)
!976 = !{!6, !302, !972}
!977 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !978, file: !827, line: 82)
!978 = !DISubprogram(name: "vsprintf", scope: !834, file: !834, line: 1783, type: !979, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!979 = !DISubroutineType(types: !980)
!980 = !{!6, !22, !31, !972}
!981 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !982, file: !827, line: 84)
!982 = !DISubprogram(name: "snprintf", scope: !834, file: !834, line: 1919, type: !983, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!983 = !DISubroutineType(types: !984)
!984 = !{!6, !97, !985, !302, null}
!985 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !830)
!986 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !987, file: !827, line: 85)
!987 = !DISubprogram(name: "vsnprintf", scope: !834, file: !834, line: 1429, type: !988, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!988 = !DISubroutineType(types: !989)
!989 = !{!6, !97, !985, !302, !972}
!990 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !991, file: !827, line: 86)
!991 = !DISubprogram(name: "vfscanf", scope: !834, file: !834, line: 1072, type: !970, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!992 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !993, file: !827, line: 87)
!993 = !DISubprogram(name: "vscanf", scope: !834, file: !834, line: 1136, type: !975, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!994 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !995, file: !827, line: 88)
!995 = !DISubprogram(name: "vsscanf", scope: !834, file: !834, line: 2160, type: !996, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!996 = !DISubroutineType(types: !997)
!997 = !{!6, !302, !302, !972}
!998 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !830, file: !999, line: 25)
!999 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\cstring", directory: "", checksumkind: CSK_MD5, checksum: "8836d22258dd0dcd58ea9d9763256c9c")
!1000 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1001, file: !999, line: 26)
!1001 = !DISubprogram(name: "memchr", linkageName: "?memchr@@YAPEAXPEAXH_K@Z", scope: !1002, file: !1002, line: 104, type: !1003, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1002 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_memory.h", directory: "", checksumkind: CSK_MD5, checksum: "0b971aeac8757ee8ec347a03047c3b4a")
!1003 = !DISubroutineType(types: !1004)
!1004 = !{!26, !26, !6, !830}
!1005 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1006, file: !999, line: 27)
!1006 = !DISubprogram(name: "memcmp", scope: !1007, file: !1007, line: 29, type: !1008, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1007 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\vcruntime_string.h", directory: "", checksumkind: CSK_MD5, checksum: "a54b085ffcc86a11803fd825bf8abeaa")
!1008 = !DISubroutineType(types: !1009)
!1009 = !{!6, !105, !105, !830}
!1010 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1011, file: !999, line: 28)
!1011 = !DISubprogram(name: "memcpy", scope: !1007, file: !1007, line: 43, type: !1012, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1012 = !DISubroutineType(types: !1013)
!1013 = !{!26, !26, !105, !830}
!1014 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1015, file: !999, line: 29)
!1015 = !DISubprogram(name: "memmove", scope: !1007, file: !1007, line: 50, type: !1012, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1016 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1017, file: !999, line: 30)
!1017 = !DISubprogram(name: "memset", scope: !1007, file: !1007, line: 63, type: !1003, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1018 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1019, file: !999, line: 31)
!1019 = !DISubprogram(name: "strcat", scope: !1020, file: !1020, line: 91, type: !1021, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1020 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\string.h", directory: "", checksumkind: CSK_MD5, checksum: "9f780e8d323a4f33b8c61853c3c9471c")
!1021 = !DISubroutineType(types: !1022)
!1022 = !{!22, !22, !31}
!1023 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1024, file: !999, line: 32)
!1024 = !DISubprogram(name: "strchr", linkageName: "?strchr@@YAPEADQEADH@Z", scope: !1020, file: !1020, line: 500, type: !1025, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1025 = !DISubroutineType(types: !1026)
!1026 = !{!22, !97, !1027}
!1027 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!1028 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1029, file: !999, line: 33)
!1029 = !DISubprogram(name: "strcmp", scope: !1020, file: !1020, line: 100, type: !936, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1030 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1031, file: !999, line: 34)
!1031 = !DISubprogram(name: "strcoll", scope: !1020, file: !1020, line: 112, type: !936, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1032 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1033, file: !999, line: 35)
!1033 = !DISubprogram(name: "strcpy", scope: !1020, file: !1020, line: 130, type: !1021, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1034 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1035, file: !999, line: 36)
!1035 = !DISubprogram(name: "strcspn", scope: !1020, file: !1020, line: 137, type: !1036, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1036 = !DISubroutineType(types: !1037)
!1037 = !{!830, !31, !31}
!1038 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1039, file: !999, line: 37)
!1039 = !DISubprogram(name: "strerror", scope: !1020, file: !1020, line: 178, type: !1040, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1040 = !DISubroutineType(types: !1041)
!1041 = !{!22, !6}
!1042 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1043, file: !999, line: 38)
!1043 = !DISubprogram(name: "strlen", scope: !1020, file: !1020, line: 215, type: !1044, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1044 = !DISubroutineType(types: !1045)
!1045 = !{!830, !31}
!1046 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1047, file: !999, line: 39)
!1047 = !DISubprogram(name: "strncat", scope: !1020, file: !1020, line: 262, type: !1048, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1048 = !DISubroutineType(types: !1049)
!1049 = !{!22, !22, !31, !830}
!1050 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1051, file: !999, line: 40)
!1051 = !DISubprogram(name: "strncmp", scope: !1020, file: !1020, line: 271, type: !1052, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1052 = !DISubroutineType(types: !1053)
!1053 = !{!6, !31, !31, !830}
!1054 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1055, file: !999, line: 41)
!1055 = !DISubprogram(name: "strncpy", scope: !1020, file: !1020, line: 334, type: !1048, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1056 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1057, file: !999, line: 42)
!1057 = !DISubprogram(name: "strpbrk", linkageName: "?strpbrk@@YAPEADQEADQEBD@Z", scope: !1020, file: !1020, line: 506, type: !1058, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1058 = !DISubroutineType(types: !1059)
!1059 = !{!22, !97, !302}
!1060 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1061, file: !999, line: 43)
!1061 = !DISubprogram(name: "strrchr", linkageName: "?strrchr@@YAPEADQEADH@Z", scope: !1020, file: !1020, line: 512, type: !1025, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1062 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1063, file: !999, line: 44)
!1063 = !DISubprogram(name: "strspn", scope: !1020, file: !1020, line: 430, type: !1036, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1064 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1065, file: !999, line: 45)
!1065 = !DISubprogram(name: "strstr", linkageName: "?strstr@@YAPEADQEADQEBD@Z", scope: !1020, file: !1020, line: 518, type: !1058, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1066 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1067, file: !999, line: 46)
!1067 = !DISubprogram(name: "strtok", scope: !1020, file: !1020, line: 436, type: !1021, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1068 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1069, file: !999, line: 47)
!1069 = !DISubprogram(name: "strxfrm", scope: !1020, file: !1020, line: 479, type: !1070, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1070 = !DISubroutineType(types: !1071)
!1071 = !{!830, !22, !31, !830}
!1072 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !290, file: !1073, line: 28)
!1073 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\cwchar", directory: "", checksumkind: CSK_MD5, checksum: "de41ecfa6d57874e2c7d1a30e0e4ad43")
!1074 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !352, file: !1073, line: 30)
!1075 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !830, file: !1073, line: 31)
!1076 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1077, file: !1073, line: 32)
!1077 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !1078, line: 26, size: 288, flags: DIFlagFwdDecl, identifier: ".?AUtm@@")
!1078 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_wtime.h", directory: "", checksumkind: CSK_MD5, checksum: "2492ba0e16e5eeaa8a93d311a7316d6b")
!1079 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1080, file: !1073, line: 33)
!1080 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !291, line: 591, baseType: !297)
!1081 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1082, file: !1073, line: 35)
!1082 = !DISubprogram(name: "btowc", scope: !1083, file: !1083, line: 62, type: !1084, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1083 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "50992c87c826ae29a05757af3914e0dd")
!1084 = !DISubroutineType(types: !1085)
!1085 = !{!1080, !6}
!1086 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1087, file: !1073, line: 36)
!1087 = !DISubprogram(name: "fgetwc", scope: !825, file: !825, line: 51, type: !1088, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1088 = !DISubroutineType(types: !1089)
!1089 = !{!1080, !840}
!1090 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1091, file: !1073, line: 37)
!1091 = !DISubprogram(name: "fgetws", scope: !825, file: !825, line: 79, type: !1092, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1092 = !DISubroutineType(types: !1093)
!1093 = !{!1094, !1094, !6, !840}
!1094 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1095, size: 64)
!1095 = !DIBasicType(name: "wchar_t", size: 16, encoding: DW_ATE_unsigned)
!1096 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1097, file: !1073, line: 38)
!1097 = !DISubprogram(name: "fputwc", scope: !825, file: !825, line: 59, type: !1098, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1098 = !DISubroutineType(types: !1099)
!1099 = !{!1080, !1095, !840}
!1100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1101, file: !1073, line: 39)
!1101 = !DISubprogram(name: "fputws", scope: !825, file: !825, line: 86, type: !1102, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1102 = !DISubroutineType(types: !1103)
!1103 = !{!6, !1104, !840}
!1104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1105, size: 64)
!1105 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1095)
!1106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1107, file: !1073, line: 40)
!1107 = !DISubprogram(name: "fwide", scope: !1083, file: !1083, line: 184, type: !1108, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1108 = !DISubroutineType(types: !1109)
!1109 = !{!6, !840, !6}
!1110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1111, file: !1073, line: 41)
!1111 = !DISubprogram(name: "fwprintf", scope: !825, file: !825, line: 494, type: !1112, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1112 = !DISubroutineType(types: !1113)
!1113 = !{!6, !870, !1114, null}
!1114 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1104)
!1115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1116, file: !1073, line: 42)
!1116 = !DISubprogram(name: "fwscanf", scope: !825, file: !825, line: 856, type: !1112, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1118, file: !1073, line: 43)
!1118 = !DISubprogram(name: "getwc", scope: !825, file: !825, line: 69, type: !1088, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1120, file: !1073, line: 44)
!1120 = !DISubprogram(name: "getwchar", scope: !825, file: !825, line: 74, type: !1121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1121 = !DISubroutineType(types: !1122)
!1122 = !{!1080}
!1123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1124, file: !1073, line: 45)
!1124 = !DISubprogram(name: "mbrlen", scope: !1083, file: !1083, line: 66, type: !1125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1125 = !DISubroutineType(types: !1126)
!1126 = !{!830, !31, !830, !1127}
!1127 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !352, size: 64)
!1128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1129, file: !1073, line: 46)
!1129 = !DISubprogram(name: "mbrtowc", scope: !1083, file: !1083, line: 72, type: !1130, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1130 = !DISubroutineType(types: !1131)
!1131 = !{!830, !1094, !31, !830, !1127}
!1132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1133, file: !1073, line: 47)
!1133 = !DISubprogram(name: "mbsrtowcs", scope: !1083, file: !1083, line: 99, type: !1134, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1134 = !DISubroutineType(types: !1135)
!1135 = !{!830, !1094, !1136, !830, !1127}
!1136 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!1137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1138, file: !1073, line: 48)
!1138 = !DISubprogram(name: "mbsinit", scope: !1083, file: !1083, line: 193, type: !1139, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1139 = !DISubroutineType(types: !1140)
!1140 = !{!6, !1141}
!1141 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1142, size: 64)
!1142 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !352)
!1143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1144, file: !1073, line: 49)
!1144 = !DISubprogram(name: "putwc", scope: !825, file: !825, line: 105, type: !1098, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1146, file: !1073, line: 50)
!1146 = !DISubprogram(name: "putwchar", scope: !825, file: !825, line: 111, type: !1147, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1147 = !DISubroutineType(types: !1148)
!1148 = !{!1080, !1095}
!1149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1150, file: !1073, line: 51)
!1150 = !DISubprogram(name: "swprintf", linkageName: "?swprintf@@YAHQEA_WQEB_WZZ", scope: !825, file: !825, line: 1803, type: !1151, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1151 = !DISubroutineType(types: !1152)
!1152 = !{!6, !1153, !1114, null}
!1153 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1094)
!1154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1155, file: !1073, line: 52)
!1155 = !DISubprogram(name: "swscanf", scope: !825, file: !825, line: 2018, type: !1156, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1156 = !DISubroutineType(types: !1157)
!1157 = !{!6, !1114, !1114, null}
!1158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1159, file: !1073, line: 53)
!1159 = !DISubprogram(name: "ungetwc", scope: !825, file: !825, line: 121, type: !1160, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1160 = !DISubroutineType(types: !1161)
!1161 = !{!1080, !1080, !840}
!1162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1163, file: !1073, line: 54)
!1163 = !DISubprogram(name: "vfwprintf", scope: !825, file: !825, line: 314, type: !1164, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1164 = !DISubroutineType(types: !1165)
!1165 = !{!6, !870, !1114, !972}
!1166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1167, file: !1073, line: 55)
!1167 = !DISubprogram(name: "vswprintf", linkageName: "?vswprintf@@YAHQEA_WQEB_WPEAD@Z", scope: !825, file: !825, line: 1817, type: !1168, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1168 = !DISubroutineType(types: !1169)
!1169 = !{!6, !1153, !1114, !972}
!1170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1171, file: !1073, line: 56)
!1171 = !DISubprogram(name: "vwprintf", scope: !825, file: !825, line: 404, type: !1172, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1172 = !DISubroutineType(types: !1173)
!1173 = !{!6, !1114, !972}
!1174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1175, file: !1073, line: 57)
!1175 = !DISubprogram(name: "wcrtomb", scope: !1083, file: !1083, line: 125, type: !1176, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1176 = !DISubroutineType(types: !1177)
!1177 = !{!830, !22, !1095, !1127}
!1178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1179, file: !1073, line: 58)
!1179 = !DISubprogram(name: "wprintf", scope: !825, file: !825, line: 608, type: !1180, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1180 = !DISubroutineType(types: !1181)
!1181 = !{!6, !1114, null}
!1182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1183, file: !1073, line: 59)
!1183 = !DISubprogram(name: "wscanf", scope: !825, file: !825, line: 933, type: !1180, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1185, file: !1073, line: 60)
!1185 = !DISubprogram(name: "wcsrtombs", scope: !1083, file: !1083, line: 152, type: !1186, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1186 = !DISubroutineType(types: !1187)
!1187 = !{!830, !22, !1188, !830, !1127}
!1188 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1104, size: 64)
!1189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1190, file: !1073, line: 61)
!1190 = !DISubprogram(name: "wcstol", scope: !1191, file: !1191, line: 134, type: !1192, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1191 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_wstdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "5b96d4421a65eb4a3e16dd6dc0574ba7")
!1192 = !DISubroutineType(types: !1193)
!1193 = !{!893, !1104, !1194, !6}
!1194 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1094, size: 64)
!1195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1196, file: !1073, line: 62)
!1196 = !DISubprogram(name: "wcscat", scope: !1197, file: !1197, line: 100, type: !1198, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1197 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_wstring.h", directory: "", checksumkind: CSK_MD5, checksum: "1e9764c381f45184fd3c47aaada60bf9")
!1198 = !DISubroutineType(types: !1199)
!1199 = !{!1094, !1094, !1104}
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1201, file: !1073, line: 63)
!1201 = !DISubprogram(name: "wcschr", linkageName: "?wcschr@@YAPEA_WPEA_W_W@Z", scope: !1197, file: !1197, line: 529, type: !1202, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1202 = !DISubroutineType(types: !1203)
!1203 = !{!1094, !1094, !1095}
!1204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1205, file: !1073, line: 64)
!1205 = !DISubprogram(name: "wcscmp", scope: !1197, file: !1197, line: 108, type: !1206, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1206 = !DISubroutineType(types: !1207)
!1207 = !{!6, !1104, !1104}
!1208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1209, file: !1073, line: 65)
!1209 = !DISubprogram(name: "wcscoll", scope: !1197, file: !1197, line: 462, type: !1206, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1211, file: !1073, line: 66)
!1211 = !DISubprogram(name: "wcscpy", scope: !1197, file: !1197, line: 119, type: !1198, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1213, file: !1073, line: 67)
!1213 = !DISubprogram(name: "wcscspn", scope: !1197, file: !1197, line: 126, type: !1214, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1214 = !DISubroutineType(types: !1215)
!1215 = !{!830, !1104, !1104}
!1216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1217, file: !1073, line: 68)
!1217 = !DISubprogram(name: "wcslen", scope: !1197, file: !1197, line: 132, type: !1218, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1218 = !DISubroutineType(types: !1219)
!1219 = !{!830, !1104}
!1220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1221, file: !1073, line: 69)
!1221 = !DISubprogram(name: "wcsncat", scope: !1197, file: !1197, line: 178, type: !1222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1222 = !DISubroutineType(types: !1223)
!1223 = !{!1094, !1094, !1104, !830}
!1224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1225, file: !1073, line: 70)
!1225 = !DISubprogram(name: "wcsncmp", scope: !1197, file: !1197, line: 187, type: !1226, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1226 = !DISubroutineType(types: !1227)
!1227 = !{!6, !1104, !1104, !830}
!1228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1229, file: !1073, line: 71)
!1229 = !DISubprogram(name: "wcsncpy", scope: !1197, file: !1197, line: 200, type: !1222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1231, file: !1073, line: 72)
!1231 = !DISubprogram(name: "wcspbrk", linkageName: "?wcspbrk@@YAPEA_WPEA_WPEB_W@Z", scope: !1197, file: !1197, line: 535, type: !1198, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1233, file: !1073, line: 73)
!1233 = !DISubprogram(name: "wcsrchr", linkageName: "?wcsrchr@@YAPEA_WPEA_W_W@Z", scope: !1197, file: !1197, line: 541, type: !1202, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1235, file: !1073, line: 74)
!1235 = !DISubprogram(name: "wcsspn", scope: !1197, file: !1197, line: 215, type: !1214, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1237, file: !1073, line: 75)
!1237 = !DISubprogram(name: "wcstod", scope: !1191, file: !1191, line: 121, type: !1238, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1238 = !DISubroutineType(types: !1239)
!1239 = !{!1240, !1104, !1194}
!1240 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!1241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1242, file: !1073, line: 76)
!1242 = !DISubprogram(name: "wcstoul", scope: !1191, file: !1191, line: 164, type: !1243, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1243 = !DISubroutineType(types: !1244)
!1244 = !{!295, !1104, !1194, !6}
!1245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1246, file: !1073, line: 77)
!1246 = !DISubprogram(name: "wcsstr", linkageName: "?wcsstr@@YAPEA_WPEA_WPEB_W@Z", scope: !1197, file: !1197, line: 548, type: !1198, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1248, file: !1073, line: 78)
!1248 = !DISubprogram(name: "wcstok", linkageName: "?wcstok@@YAPEA_WPEA_WPEB_W@Z", scope: !1197, file: !1197, line: 253, type: !1198, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1250, file: !1073, line: 79)
!1250 = !DISubprogram(name: "wcsxfrm", scope: !1197, file: !1197, line: 446, type: !1251, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1251 = !DISubroutineType(types: !1252)
!1252 = !{!830, !1094, !1104, !830}
!1253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1254, file: !1073, line: 80)
!1254 = !DISubprogram(name: "wctob", scope: !1083, file: !1083, line: 160, type: !1255, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1255 = !DISubroutineType(types: !1256)
!1256 = !{!6, !1080}
!1257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1258, file: !1073, line: 81)
!1258 = !DISubprogram(name: "wmemchr", linkageName: "?wmemchr@@YAPEA_WPEA_W_W_K@Z", scope: !1083, file: !1083, line: 268, type: !1259, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1259 = !DISubroutineType(types: !1260)
!1260 = !{!1094, !1094, !1095, !830}
!1261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1262, file: !1073, line: 82)
!1262 = !DISubprogram(name: "wmemcmp", scope: !1083, file: !1083, line: 213, type: !1226, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1264, file: !1073, line: 83)
!1264 = !DISubprogram(name: "wmemcpy", scope: !1083, file: !1083, line: 229, type: !1222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1266, file: !1073, line: 84)
!1266 = !DISubprogram(name: "wmemmove", scope: !1083, file: !1083, line: 240, type: !1222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1268, file: !1073, line: 85)
!1268 = !DISubprogram(name: "wmemset", scope: !1083, file: !1083, line: 252, type: !1259, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1270, file: !1073, line: 86)
!1270 = !DISubprogram(name: "wcsftime", scope: !1078, file: !1078, line: 69, type: !1271, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1271 = !DISubroutineType(types: !1272)
!1272 = !{!830, !1094, !830, !1104, !1273}
!1273 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1274, size: 64)
!1274 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1077)
!1275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1276, file: !1073, line: 88)
!1276 = !DISubprogram(name: "vfwscanf", scope: !825, file: !825, line: 731, type: !1164, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1278, file: !1073, line: 89)
!1278 = !DISubprogram(name: "vswscanf", scope: !825, file: !825, line: 1900, type: !1279, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1279 = !DISubroutineType(types: !1280)
!1280 = !{!6, !1104, !1104, !972}
!1281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1282, file: !1073, line: 90)
!1282 = !DISubprogram(name: "vwscanf", scope: !825, file: !825, line: 793, type: !1172, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1284, file: !1073, line: 91)
!1284 = !DISubprogram(name: "wcstof", scope: !1191, file: !1191, line: 207, type: !1285, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1285 = !DISubroutineType(types: !1286)
!1286 = !{!1287, !1104, !1194}
!1287 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!1288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1289, file: !1073, line: 92)
!1289 = !DISubprogram(name: "wcstold", scope: !1191, file: !1191, line: 194, type: !1290, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1290 = !DISubroutineType(types: !1291)
!1291 = !{!1292, !1104, !1194}
!1292 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!1293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1294, file: !1073, line: 93)
!1294 = !DISubprogram(name: "wcstoll", scope: !1191, file: !1191, line: 149, type: !1295, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1295 = !DISubroutineType(types: !1296)
!1296 = !{!56, !1104, !1194, !6}
!1297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1298, file: !1073, line: 94)
!1298 = !DISubprogram(name: "wcstoull", scope: !1191, file: !1191, line: 179, type: !1299, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1299 = !DISubroutineType(types: !1300)
!1300 = !{!21, !1104, !1194, !6}
!1301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !1302, file: !20, line: 94)
!1302 = !DIDerivedType(tag: DW_TAG_typedef, name: "nullptr_t", scope: !5, file: !20, line: 93, baseType: !1303)
!1303 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "decltype(nullptr)")
!1304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !55, file: !1305, line: 23)
!1305 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\cstddef", directory: "", checksumkind: CSK_MD5, checksum: "1479f3900768e26e8836fd19109e117d")
!1306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !19, file: !1305, line: 24)
!1307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !1308, file: !1305, line: 95)
!1308 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", scope: !5, file: !1305, line: 25, baseType: !1240)
!1309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !19, file: !1310, line: 36)
!1310 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\cstdlib", directory: "", checksumkind: CSK_MD5, checksum: "721d4b06441c95b75ef8fd32d75af028")
!1311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1312, file: !1310, line: 37)
!1312 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !1313, line: 279, baseType: !1314)
!1313 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "f957baaaf7f972e5b8d08c2855b49589")
!1314 = !DICompositeType(tag: DW_TAG_structure_type, name: "_div_t", file: !1313, line: 275, size: 64, flags: DIFlagFwdDecl, identifier: ".?AU_div_t@@")
!1315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1316, file: !1310, line: 38)
!1316 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !1313, line: 285, baseType: !1317)
!1317 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_ldiv_t", file: !1313, line: 281, size: 64, flags: DIFlagTypePassByValue, elements: !1318, identifier: ".?AU_ldiv_t@@")
!1318 = !{!1319, !1320}
!1319 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1317, file: !1313, line: 283, baseType: !893, size: 32)
!1320 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1317, file: !1313, line: 284, baseType: !893, size: 32, offset: 32)
!1321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1322, file: !1310, line: 39)
!1322 = !DISubprogram(name: "abort", scope: !1313, file: !1313, line: 60, type: !265, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1324, file: !1310, line: 40)
!1324 = !DISubprogram(name: "abs", linkageName: "?abs@@YAOO@Z", scope: !1310, file: !1310, line: 31, type: !1325, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1325 = !DISubroutineType(types: !1326)
!1326 = !{!1292, !1292}
!1327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1328, file: !1310, line: 41)
!1328 = !DISubprogram(name: "atexit", scope: !1313, file: !1313, line: 144, type: !1329, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1329 = !DISubroutineType(types: !1330)
!1330 = !{!6, !1331}
!1331 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !265, size: 64)
!1332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1333, file: !1310, line: 42)
!1333 = !DISubprogram(name: "atof", scope: !1313, file: !1313, line: 450, type: !1334, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1334 = !DISubroutineType(types: !1335)
!1335 = !{!1240, !31}
!1336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1337, file: !1310, line: 43)
!1337 = !DISubprogram(name: "atoi", scope: !1313, file: !1313, line: 451, type: !930, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1339, file: !1310, line: 44)
!1339 = !DISubprogram(name: "atol", scope: !1313, file: !1313, line: 452, type: !1340, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1340 = !DISubroutineType(types: !1341)
!1341 = !{!893, !31}
!1342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1343, file: !1310, line: 45)
!1343 = !DISubprogram(name: "bsearch", scope: !1344, file: !1344, line: 52, type: !1345, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1344 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_search.h", directory: "", checksumkind: CSK_MD5, checksum: "2a0a917cdb5d977c5fc7f09a83507d29")
!1345 = !DISubroutineType(types: !1346)
!1346 = !{!26, !105, !105, !19, !19, !1347}
!1347 = !DIDerivedType(tag: DW_TAG_typedef, name: "_CoreCrtNonSecureSearchSortCompareFunction", file: !1344, line: 24, baseType: !1348)
!1348 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1349, size: 64)
!1349 = !DISubroutineType(types: !1350)
!1350 = !{!6, !105, !105}
!1351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1352, file: !1310, line: 46)
!1352 = !DISubprogram(name: "calloc", scope: !1353, file: !1353, line: 66, type: !1354, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1353 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_malloc.h", directory: "", checksumkind: CSK_MD5, checksum: "e7cb4d2b08d978a19e592af472eb7bd0")
!1354 = !DISubroutineType(types: !1355)
!1355 = !{!26, !19, !19}
!1356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1357, file: !1310, line: 47)
!1357 = !DISubprogram(name: "div", linkageName: "?div@@YA?AU_lldiv_t@@_J0@Z", scope: !1313, file: !1313, line: 378, type: !1358, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1358 = !DISubroutineType(types: !1359)
!1359 = !{!1360, !1365, !1365}
!1360 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !1313, line: 291, baseType: !1361)
!1361 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_lldiv_t", file: !1313, line: 287, size: 128, flags: DIFlagTypePassByValue, elements: !1362, identifier: ".?AU_lldiv_t@@")
!1362 = !{!1363, !1364}
!1363 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1361, file: !1313, line: 289, baseType: !56, size: 64)
!1364 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1361, file: !1313, line: 290, baseType: !56, size: 64, offset: 64)
!1365 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !56)
!1366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1367, file: !1310, line: 48)
!1367 = !DISubprogram(name: "exit", scope: !1313, file: !1313, line: 56, type: !1368, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1368 = !DISubroutineType(types: !1369)
!1369 = !{null, !6}
!1370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1371, file: !1310, line: 49)
!1371 = !DISubprogram(name: "free", scope: !1353, file: !1353, line: 89, type: !1372, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1372 = !DISubroutineType(types: !1373)
!1373 = !{null, !26}
!1374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1375, file: !1310, line: 50)
!1375 = !DISubprogram(name: "labs", scope: !1313, file: !1313, line: 294, type: !1376, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1376 = !DISubroutineType(types: !1377)
!1377 = !{!893, !893}
!1378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1379, file: !1310, line: 51)
!1379 = !DISubprogram(name: "ldiv", scope: !1313, file: !1313, line: 303, type: !1380, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1380 = !DISubroutineType(types: !1381)
!1381 = !{!1316, !893, !893}
!1382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1383, file: !1310, line: 52)
!1383 = !DISubprogram(name: "malloc", scope: !1353, file: !1353, line: 101, type: !1384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1384 = !DISubroutineType(types: !1385)
!1385 = !{!26, !19}
!1386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1387, file: !1310, line: 53)
!1387 = !DISubprogram(name: "mblen", scope: !1313, file: !1313, line: 852, type: !1388, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1388 = !DISubroutineType(types: !1389)
!1389 = !{!6, !31, !19}
!1390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1391, file: !1310, line: 54)
!1391 = !DISubprogram(name: "mbstowcs", scope: !1313, file: !1313, line: 924, type: !1392, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1392 = !DISubroutineType(types: !1393)
!1393 = !{!19, !1094, !31, !19}
!1394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1395, file: !1310, line: 55)
!1395 = !DISubprogram(name: "mbtowc", scope: !1313, file: !1313, line: 893, type: !1396, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1396 = !DISubroutineType(types: !1397)
!1397 = !{!6, !1094, !31, !19}
!1398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1399, file: !1310, line: 56)
!1399 = !DISubprogram(name: "qsort", scope: !1344, file: !1344, line: 60, type: !1400, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1400 = !DISubroutineType(types: !1401)
!1401 = !{null, !26, !19, !19, !1347}
!1402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1403, file: !1310, line: 57)
!1403 = !DISubprogram(name: "rand", scope: !1313, file: !1313, line: 352, type: !912, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1405, file: !1310, line: 58)
!1405 = !DISubprogram(name: "realloc", scope: !1353, file: !1353, line: 126, type: !1406, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1406 = !DISubroutineType(types: !1407)
!1407 = !{!26, !26, !19}
!1408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1409, file: !1310, line: 59)
!1409 = !DISubprogram(name: "srand", scope: !1313, file: !1313, line: 350, type: !1410, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1410 = !DISubroutineType(types: !1411)
!1411 = !{null, !1412}
!1412 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!1413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1414, file: !1310, line: 60)
!1414 = !DISubprogram(name: "strtod", scope: !1313, file: !1313, line: 502, type: !1415, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1415 = !DISubroutineType(types: !1416)
!1416 = !{!1240, !31, !1417}
!1417 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!1418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1419, file: !1310, line: 61)
!1419 = !DISubprogram(name: "strtol", scope: !1313, file: !1313, line: 528, type: !1420, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1420 = !DISubroutineType(types: !1421)
!1421 = !{!893, !31, !1417, !6}
!1422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1423, file: !1310, line: 62)
!1423 = !DISubprogram(name: "strtoul", scope: !1313, file: !1313, line: 558, type: !1424, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1424 = !DISubroutineType(types: !1425)
!1425 = !{!295, !31, !1417, !6}
!1426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1427, file: !1310, line: 63)
!1427 = !DISubprogram(name: "wcstombs", scope: !1313, file: !1313, line: 1012, type: !1428, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1428 = !DISubroutineType(types: !1429)
!1429 = !{!19, !22, !1104, !19}
!1430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1431, file: !1310, line: 64)
!1431 = !DISubprogram(name: "wctomb", scope: !1313, file: !1313, line: 963, type: !1432, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1432 = !DISubroutineType(types: !1433)
!1433 = !{!6, !22, !1095}
!1434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1360, file: !1310, line: 66)
!1435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1436, file: !1310, line: 69)
!1436 = !DISubprogram(name: "getenv", scope: !1313, file: !1313, line: 1184, type: !1437, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1437 = !DISubroutineType(types: !1438)
!1438 = !{!22, !31}
!1439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1440, file: !1310, line: 70)
!1440 = !DISubprogram(name: "system", scope: !1313, file: !1313, line: 1211, type: !930, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1442, file: !1310, line: 73)
!1442 = !DISubprogram(name: "atoll", scope: !1313, file: !1313, line: 453, type: !1443, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1443 = !DISubroutineType(types: !1444)
!1444 = !{!56, !31}
!1445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1446, file: !1310, line: 74)
!1446 = !DISubprogram(name: "llabs", scope: !1313, file: !1313, line: 295, type: !1447, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1447 = !DISubroutineType(types: !1448)
!1448 = !{!56, !56}
!1449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1450, file: !1310, line: 75)
!1450 = !DISubprogram(name: "lldiv", scope: !1313, file: !1313, line: 304, type: !1451, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1451 = !DISubroutineType(types: !1452)
!1452 = !{!1360, !56, !56}
!1453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1454, file: !1310, line: 76)
!1454 = !DISubprogram(name: "strtof", scope: !1313, file: !1313, line: 489, type: !1455, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1455 = !DISubroutineType(types: !1456)
!1456 = !{!1287, !31, !1417}
!1457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1458, file: !1310, line: 77)
!1458 = !DISubprogram(name: "strtold", scope: !1313, file: !1313, line: 515, type: !1459, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1459 = !DISubroutineType(types: !1460)
!1460 = !{!1292, !31, !1417}
!1461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1462, file: !1310, line: 78)
!1462 = !DISubprogram(name: "strtoll", scope: !1313, file: !1313, line: 543, type: !1463, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1463 = !DISubroutineType(types: !1464)
!1464 = !{!56, !31, !1417, !6}
!1465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1466, file: !1310, line: 79)
!1466 = !DISubprogram(name: "strtoull", scope: !1313, file: !1313, line: 573, type: !1467, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1467 = !DISubroutineType(types: !1468)
!1468 = !{!21, !31, !1417, !6}
!1469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1470, file: !1310, line: 81)
!1470 = !DISubprogram(name: "_Exit", scope: !1313, file: !1313, line: 58, type: !1368, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1472, file: !1310, line: 82)
!1472 = !DISubprogram(name: "at_quick_exit", scope: !1313, file: !1313, line: 148, type: !1329, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1474, file: !1310, line: 83)
!1474 = !DISubprogram(name: "quick_exit", scope: !1313, file: !1313, line: 59, type: !1368, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1476, file: !1479, line: 22)
!1476 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !1477, line: 18, baseType: !1478)
!1477 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "56e2956fe219a08d408dc2fb7a857cfc")
!1478 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!1479 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\cstdint", directory: "", checksumkind: CSK_MD5, checksum: "a82d27cf0f774e165b06000e45047591")
!1480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1481, file: !1479, line: 23)
!1481 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !1477, line: 19, baseType: !1482)
!1482 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!1483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1484, file: !1479, line: 24)
!1484 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !1477, line: 20, baseType: !6)
!1485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1486, file: !1479, line: 25)
!1486 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !1477, line: 21, baseType: !56)
!1487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1488, file: !1479, line: 26)
!1488 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !1477, line: 22, baseType: !1489)
!1489 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!1490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1491, file: !1479, line: 27)
!1491 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !1477, line: 23, baseType: !297)
!1492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1493, file: !1479, line: 28)
!1493 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !1477, line: 24, baseType: !1412)
!1494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1495, file: !1479, line: 29)
!1495 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !1477, line: 25, baseType: !21)
!1496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1497, file: !1479, line: 31)
!1497 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !1477, line: 27, baseType: !1478)
!1498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1499, file: !1479, line: 32)
!1499 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !1477, line: 28, baseType: !1482)
!1500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1501, file: !1479, line: 33)
!1501 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !1477, line: 29, baseType: !6)
!1502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1503, file: !1479, line: 34)
!1503 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !1477, line: 30, baseType: !56)
!1504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1505, file: !1479, line: 35)
!1505 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !1477, line: 31, baseType: !1489)
!1506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1507, file: !1479, line: 36)
!1507 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !1477, line: 32, baseType: !297)
!1508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1509, file: !1479, line: 37)
!1509 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !1477, line: 33, baseType: !1412)
!1510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1511, file: !1479, line: 38)
!1511 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !1477, line: 34, baseType: !21)
!1512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1513, file: !1479, line: 40)
!1513 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !1477, line: 36, baseType: !1478)
!1514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1515, file: !1479, line: 41)
!1515 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !1477, line: 37, baseType: !6)
!1516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1517, file: !1479, line: 42)
!1517 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !1477, line: 38, baseType: !6)
!1518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1519, file: !1479, line: 43)
!1519 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !1477, line: 39, baseType: !56)
!1520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1521, file: !1479, line: 44)
!1521 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !1477, line: 40, baseType: !1489)
!1522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1523, file: !1479, line: 45)
!1523 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !1477, line: 41, baseType: !1412)
!1524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1525, file: !1479, line: 46)
!1525 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !1477, line: 42, baseType: !1412)
!1526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1527, file: !1479, line: 47)
!1527 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !1477, line: 43, baseType: !21)
!1528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1529, file: !1479, line: 49)
!1529 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !1477, line: 45, baseType: !56)
!1530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1531, file: !1479, line: 50)
!1531 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !831, line: 195, baseType: !56)
!1532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1533, file: !1479, line: 51)
!1533 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !1477, line: 46, baseType: !21)
!1534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !24, file: !1479, line: 52)
!1535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !1476, file: !1479, line: 56)
!1536 = !DINamespace(name: "tr1", scope: !5)
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
!1563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !24, file: !1479, line: 86)
!1564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !123, file: !1565, line: 2339)
!1565 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\type_traits", directory: "", checksumkind: CSK_MD5, checksum: "ecb5b30d3e7f60a1bc5b2141e5fc8ae3")
!1566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1536, entity: !58, file: !1565, line: 2381)
!1567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1568, file: !1570, line: 37)
!1568 = !DISubprogram(name: "terminate", scope: !1569, file: !1569, line: 33, type: !265, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1569 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\corecrt_terminate.h", directory: "", checksumkind: CSK_MD5, checksum: "2a539d6fe462a6cd4820acb34d25230b")
!1570 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\exception", directory: "", checksumkind: CSK_MD5, checksum: "502d5f1c44a13b98a4e0212cf4da2c8e")
!1571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1572, file: !1570, line: 40)
!1572 = !DISubprogram(name: "set_terminate", scope: !1569, file: !1569, line: 37, type: !1573, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1573 = !DISubroutineType(types: !1574)
!1574 = !{!1575, !1575}
!1575 = !DIDerivedType(tag: DW_TAG_typedef, name: "terminate_handler", file: !1569, line: 22, baseType: !1331)
!1576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1575, file: !1570, line: 41)
!1577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1578, file: !1570, line: 49)
!1578 = !DISubprogram(name: "unexpected", scope: !1579, file: !1579, line: 35, type: !265, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1579 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\eh.h", directory: "", checksumkind: CSK_MD5, checksum: "4a999be6308e84b5845d84cd2463ce9d")
!1580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1581, file: !1570, line: 52)
!1581 = !DISubprogram(name: "set_unexpected", scope: !1579, file: !1579, line: 39, type: !1582, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1582 = !DISubroutineType(types: !1583)
!1583 = !{!1584, !1584}
!1584 = !DIDerivedType(tag: DW_TAG_typedef, name: "unexpected_handler", file: !1579, line: 23, baseType: !1331)
!1585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1584, file: !1570, line: 53)
!1586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1587, file: !1589, line: 38)
!1587 = !DISubprogram(name: "isalnum", scope: !1588, file: !1588, line: 53, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1588 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.19041.0\\ucrt\\ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "637d97803cfc8841aa28027834c41330")
!1589 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\cctype", directory: "", checksumkind: CSK_MD5, checksum: "02efabf6237906f874632fa4f9f858e4")
!1590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1591, file: !1589, line: 39)
!1591 = !DISubprogram(name: "isalpha", scope: !1588, file: !1588, line: 31, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1593, file: !1589, line: 40)
!1593 = !DISubprogram(name: "iscntrl", scope: !1588, file: !1588, line: 59, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1595, file: !1589, line: 41)
!1595 = !DISubprogram(name: "isdigit", scope: !1588, file: !1588, line: 39, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1597, file: !1589, line: 42)
!1597 = !DISubprogram(name: "isgraph", scope: !1588, file: !1588, line: 57, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1599, file: !1589, line: 43)
!1599 = !DISubprogram(name: "islower", scope: !1588, file: !1588, line: 35, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1601, file: !1589, line: 44)
!1601 = !DISubprogram(name: "isprint", scope: !1588, file: !1588, line: 55, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1603, file: !1589, line: 45)
!1603 = !DISubprogram(name: "ispunct", scope: !1588, file: !1588, line: 49, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1605, file: !1589, line: 46)
!1605 = !DISubprogram(name: "isspace", scope: !1588, file: !1588, line: 46, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1607, file: !1589, line: 47)
!1607 = !DISubprogram(name: "isupper", scope: !1588, file: !1588, line: 33, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1609, file: !1589, line: 48)
!1609 = !DISubprogram(name: "isxdigit", scope: !1588, file: !1588, line: 42, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1611, file: !1589, line: 49)
!1611 = !DISubprogram(name: "tolower", scope: !1588, file: !1588, line: 66, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1613, file: !1589, line: 50)
!1613 = !DISubprogram(name: "toupper", scope: !1588, file: !1588, line: 63, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1615, file: !1589, line: 52)
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
!1626 = distinct !DISubprogram(name: "func2_hello", linkageName: "?func2_hello@@YA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@XZ", scope: !1, file: !1, line: 4, type: !1627, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !197)
!1627 = !DISubroutineType(types: !1628)
!1628 = !{!1629}
!1629 = !DIDerivedType(tag: DW_TAG_typedef, name: "string", scope: !5, file: !34, line: 4648, baseType: !33)
!1630 = !DILocation(line: 5, column: 10, scope: !1626)
!1631 = !DILocation(line: 5, column: 3, scope: !1626)
!1632 = distinct !DISubprogram(name: "basic_string", linkageName: "??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@QEBD@Z", scope: !33, file: !34, line: 2413, type: !459, scopeLine: 2413, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !458, retainedNodes: !1633)
!1633 = !{!1634, !1635, !1637, !1640}
!1634 = !DILocalVariable(name: "_Ptr", arg: 2, scope: !1632, file: !34, line: 2413, type: !302)
!1635 = !DILocalVariable(name: "this", arg: 1, scope: !1632, type: !1636, flags: DIFlagArtificial | DIFlagObjectPointer)
!1636 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!1637 = !DILocalVariable(name: "_Alproxy", scope: !1638, file: !34, line: 2414, type: !1639)
!1638 = distinct !DILexicalBlock(scope: !1632, file: !34, line: 2413, column: 90)
!1639 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !196, size: 64)
!1640 = !DILocalVariable(name: "_Proxy", scope: !1638, file: !34, line: 2415, type: !1641)
!1641 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Container_proxy_ptr<std::basic_string<char>::_Alty>", scope: !5, file: !38, line: 1307, baseType: !1642)
!1642 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Fake_proxy_ptr_impl", scope: !5, file: !38, line: 1249, size: 8, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !1643, identifier: ".?AU_Fake_proxy_ptr_impl@std@@")
!1643 = !{!1644, !1650, !1654, !1663, !1668, !1672}
!1644 = !DISubprogram(name: "_Fake_proxy_ptr_impl", scope: !1642, file: !38, line: 1250, type: !1645, scopeLine: 1250, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized | DISPFlagDeleted)
!1645 = !DISubroutineType(types: !1646)
!1646 = !{null, !1647, !1648}
!1647 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1642, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1648 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1649, size: 64)
!1649 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1642)
!1650 = !DISubprogram(name: "operator=", linkageName: "??4_Fake_proxy_ptr_impl@std@@QEAAAEAU01@AEBU01@@Z", scope: !1642, file: !38, line: 1251, type: !1651, scopeLine: 1251, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized | DISPFlagDeleted)
!1651 = !DISubroutineType(types: !1652)
!1652 = !{!1653, !1647, !1648}
!1653 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1642, size: 64)
!1654 = !DISubprogram(name: "_Fake_proxy_ptr_impl", scope: !1642, file: !38, line: 1252, type: !1655, scopeLine: 1252, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1655 = !DISubroutineType(types: !1656)
!1656 = !{null, !1647, !194, !1657}
!1657 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Leave_proxy_unbound", scope: !5, file: !38, line: 1245, size: 8, flags: DIFlagTypePassByValue, elements: !1658, identifier: ".?AU_Leave_proxy_unbound@std@@")
!1658 = !{!1659}
!1659 = !DISubprogram(name: "_Leave_proxy_unbound", scope: !1657, file: !38, line: 1246, type: !1660, scopeLine: 1246, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1660 = !DISubroutineType(types: !1661)
!1661 = !{null, !1662}
!1662 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1657, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1663 = !DISubprogram(name: "_Fake_proxy_ptr_impl", scope: !1642, file: !38, line: 1253, type: !1664, scopeLine: 1253, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1664 = !DISubroutineType(types: !1665)
!1665 = !{null, !1647, !194, !1666}
!1666 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1667, size: 64)
!1667 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !181)
!1668 = !DISubprogram(name: "_Bind", linkageName: "?_Bind@_Fake_proxy_ptr_impl@std@@QEAAXAEBU_Fake_allocator@2@PEAU_Container_base0@2@@Z", scope: !1642, file: !38, line: 1255, type: !1669, scopeLine: 1255, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1669 = !DISubroutineType(types: !1670)
!1670 = !{null, !1647, !194, !1671}
!1671 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !181, size: 64)
!1672 = !DISubprogram(name: "_Release", linkageName: "?_Release@_Fake_proxy_ptr_impl@std@@QEAAXXZ", scope: !1642, file: !38, line: 1256, type: !1673, scopeLine: 1256, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1673 = !DISubroutineType(types: !1674)
!1674 = !{null, !1647}
!1675 = !{!1676, !1676, i64 0}
!1676 = !{!"any pointer", !1677, i64 0}
!1677 = !{!"omnipotent char", !1678, i64 0}
!1678 = !{!"Simple C++ TBAA"}
!1679 = !DILocation(line: 2413, column: 44, scope: !1632)
!1680 = !DILocation(line: 0, scope: !1632)
!1681 = !DILocation(line: 2413, column: 52, scope: !1632)
!1682 = !DILocation(line: 2414, column: 9, scope: !1638)
!1683 = !DILocation(line: 2414, column: 16, scope: !1638)
!1684 = !DILocation(line: 2414, column: 27, scope: !1638)
!1685 = !DILocation(line: 2415, column: 9, scope: !1638)
!1686 = !DILocation(line: 2415, column: 37, scope: !1638)
!1687 = !DILocation(line: 2415, column: 54, scope: !1638)
!1688 = !DILocation(line: 2415, column: 62, scope: !1638)
!1689 = !DILocation(line: 2415, column: 44, scope: !1638)
!1690 = !DILocation(line: 2416, column: 9, scope: !1638)
!1691 = !DILocation(line: 2417, column: 16, scope: !1638)
!1692 = !DILocation(line: 2417, column: 9, scope: !1638)
!1693 = !DILocation(line: 2418, column: 16, scope: !1638)
!1694 = !DILocation(line: 2419, column: 5, scope: !1632)
!1695 = !DILocation(line: 2419, column: 5, scope: !1638)
!1696 = distinct !DISubprogram(name: "negate", linkageName: "?negate@@YAHH@Z", scope: !1, file: !1, line: 8, type: !922, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1697)
!1697 = !{!1698}
!1698 = !DILocalVariable(name: "z", arg: 1, scope: !1696, file: !1, line: 8, type: !6)
!1699 = !{!1700, !1700, i64 0}
!1700 = !{!"int", !1677, i64 0}
!1701 = !DILocation(line: 8, column: 16, scope: !1696)
!1702 = !DILocation(line: 9, column: 10, scope: !1696)
!1703 = !DILocation(line: 9, column: 9, scope: !1696)
!1704 = !DILocation(line: 9, column: 2, scope: !1696)
!1705 = distinct !DISubprogram(name: "_Compressed_pair<>", linkageName: "??$?0$$V@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@U_Zero_then_variadic_args_t@1@@Z", scope: !412, file: !38, line: 1331, type: !1706, scopeLine: 1333, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, templateParams: !1715, declaration: !1714, retainedNodes: !1717)
!1706 = !DISubroutineType(types: !1707)
!1707 = !{null, !420, !1708}
!1708 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Zero_then_variadic_args_t", scope: !5, file: !38, line: 1315, size: 8, flags: DIFlagTypePassByValue, elements: !1709, identifier: ".?AU_Zero_then_variadic_args_t@std@@")
!1709 = !{!1710}
!1710 = !DISubprogram(name: "_Zero_then_variadic_args_t", scope: !1708, file: !38, line: 1316, type: !1711, scopeLine: 1316, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1711 = !DISubroutineType(types: !1712)
!1712 = !{null, !1713}
!1713 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1708, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1714 = !DISubprogram(name: "_Compressed_pair<>", scope: !412, file: !38, line: 1331, type: !1706, scopeLine: 1331, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized, templateParams: !1715)
!1715 = !{!1716}
!1716 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Other2", value: !197)
!1717 = !{!1718, !1719}
!1718 = !DILocalVariable(arg: 2, scope: !1705, file: !38, line: 1331, type: !1708)
!1719 = !DILocalVariable(name: "this", arg: 1, scope: !1705, type: !1720, flags: DIFlagArtificial | DIFlagObjectPointer)
!1720 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !412, size: 64)
!1721 = !DILocation(line: 1331, column: 67, scope: !1705)
!1722 = !DILocation(line: 0, scope: !1705)
!1723 = !DILocation(line: 1333, column: 60, scope: !1705)
!1724 = !DILocation(line: 1333, column: 11, scope: !1705)
!1725 = !DILocation(line: 1333, column: 19, scope: !1705)
!1726 = !DILocation(line: 1333, column: 61, scope: !1705)
!1727 = distinct !DISubprogram(name: "_Fake_proxy_ptr_impl", linkageName: "??0_Fake_proxy_ptr_impl@std@@QEAA@AEBU_Fake_allocator@1@AEBU_Container_base0@1@@Z", scope: !1642, file: !38, line: 1253, type: !1664, scopeLine: 1253, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !1663, retainedNodes: !1728)
!1728 = !{!1729, !1730, !1731}
!1729 = !DILocalVariable(arg: 3, scope: !1727, file: !38, line: 1253, type: !1666)
!1730 = !DILocalVariable(arg: 2, scope: !1727, file: !38, line: 1253, type: !194)
!1731 = !DILocalVariable(name: "this", arg: 1, scope: !1727, type: !1732, flags: DIFlagArtificial | DIFlagObjectPointer)
!1732 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1642, size: 64)
!1733 = !DILocation(line: 1253, column: 73, scope: !1727)
!1734 = !DILocation(line: 1253, column: 48, scope: !1727)
!1735 = !DILocation(line: 0, scope: !1727)
!1736 = !DILocation(line: 1253, column: 85, scope: !1727)
!1737 = distinct !DISubprogram(name: "_Tidy_init", linkageName: "?_Tidy_init@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ", scope: !33, file: !34, line: 4376, type: !440, scopeLine: 4376, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !800, retainedNodes: !1738)
!1738 = !{!1739}
!1739 = !DILocalVariable(name: "this", arg: 1, scope: !1737, type: !1636, flags: DIFlagArtificial | DIFlagObjectPointer)
!1740 = !DILocation(line: 0, scope: !1737)
!1741 = !DILocation(line: 4377, column: 9, scope: !1737)
!1742 = !DILocation(line: 4377, column: 17, scope: !1737)
!1743 = !DILocation(line: 4377, column: 25, scope: !1737)
!1744 = !DILocation(line: 4377, column: 33, scope: !1737)
!1745 = !{!1746, !1749, i64 16}
!1746 = !{!"?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@", !1747, i64 0}
!1747 = !{!"?AV?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@", !1748, i64 0}
!1748 = !{!"?AV?$_String_val@U?$_Simple_types@D@std@@@std@@", !1677, i64 0, !1749, i64 16, !1749, i64 24}
!1749 = !{!"long long", !1677, i64 0}
!1750 = !DILocation(line: 4378, column: 9, scope: !1737)
!1751 = !DILocation(line: 4378, column: 17, scope: !1737)
!1752 = !DILocation(line: 4378, column: 25, scope: !1737)
!1753 = !DILocation(line: 4378, column: 33, scope: !1737)
!1754 = !{!1746, !1749, i64 24}
!1755 = !DILocation(line: 4380, column: 54, scope: !1737)
!1756 = !{!1677, !1677, i64 0}
!1757 = !DILocation(line: 4380, column: 25, scope: !1737)
!1758 = !DILocation(line: 4380, column: 33, scope: !1737)
!1759 = !DILocation(line: 4380, column: 41, scope: !1737)
!1760 = !DILocation(line: 4380, column: 45, scope: !1737)
!1761 = !DILocation(line: 4380, column: 9, scope: !1737)
!1762 = !DILocation(line: 4381, column: 5, scope: !1737)
!1763 = distinct !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD@Z", scope: !33, file: !34, line: 3061, type: !556, scopeLine: 3061, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !580, retainedNodes: !1764)
!1764 = !{!1765, !1766}
!1765 = !DILocalVariable(name: "_Ptr", arg: 2, scope: !1763, file: !34, line: 3061, type: !302)
!1766 = !DILocalVariable(name: "this", arg: 1, scope: !1763, type: !1636, flags: DIFlagArtificial | DIFlagObjectPointer)
!1767 = !DILocation(line: 3061, column: 52, scope: !1763)
!1768 = !DILocation(line: 0, scope: !1763)
!1769 = !DILocation(line: 3062, column: 70, scope: !1763)
!1770 = !DILocation(line: 3062, column: 54, scope: !1763)
!1771 = !DILocation(line: 3062, column: 29, scope: !1763)
!1772 = !DILocation(line: 3062, column: 23, scope: !1763)
!1773 = !DILocation(line: 3062, column: 16, scope: !1763)
!1774 = !DILocation(line: 3062, column: 9, scope: !1763)
!1775 = distinct !DISubprogram(name: "_Release", linkageName: "?_Release@_Fake_proxy_ptr_impl@std@@QEAAXXZ", scope: !1642, file: !38, line: 1256, type: !1673, scopeLine: 1256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !1672, retainedNodes: !1776)
!1776 = !{!1777}
!1777 = !DILocalVariable(name: "this", arg: 1, scope: !1775, type: !1732, flags: DIFlagArtificial | DIFlagObjectPointer)
!1778 = !DILocation(line: 0, scope: !1775)
!1779 = !DILocation(line: 1256, column: 31, scope: !1775)
!1780 = distinct !DISubprogram(name: "~_Compressed_pair", linkageName: "??1?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@XZ", scope: !412, file: !38, line: 1324, type: !1781, scopeLine: 1324, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !1783, retainedNodes: !1784)
!1781 = !DISubroutineType(types: !1782)
!1782 = !{null, !420}
!1783 = !DISubprogram(name: "~_Compressed_pair", scope: !412, type: !1781, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1784 = !{!1785}
!1785 = !DILocalVariable(name: "this", arg: 1, scope: !1780, type: !1720, flags: DIFlagArtificial | DIFlagObjectPointer)
!1786 = !DILocation(line: 0, scope: !1780)
!1787 = !DILocation(line: 1324, column: 7, scope: !1788)
!1788 = distinct !DILexicalBlock(scope: !1780, file: !38, line: 1324, column: 7)
!1789 = !DILocation(line: 1324, column: 7, scope: !1780)
!1790 = distinct !DISubprogram(name: "allocator", linkageName: "??0?$allocator@D@std@@QEAA@XZ", scope: !43, file: !38, line: 797, type: !87, scopeLine: 797, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !86, retainedNodes: !1791)
!1791 = !{!1792}
!1792 = !DILocalVariable(name: "this", arg: 1, scope: !1790, type: !1793, flags: DIFlagArtificial | DIFlagObjectPointer)
!1793 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!1794 = !DILocation(line: 0, scope: !1790)
!1795 = !DILocation(line: 797, column: 37, scope: !1790)
!1796 = distinct !DISubprogram(name: "_String_val", linkageName: "??0?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ", scope: !177, file: !34, line: 2198, type: !244, scopeLine: 2198, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !243, retainedNodes: !1797)
!1797 = !{!1798}
!1798 = !DILocalVariable(name: "this", arg: 1, scope: !1796, type: !1799, flags: DIFlagArtificial | DIFlagObjectPointer)
!1799 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !177, size: 64)
!1800 = !DILocation(line: 0, scope: !1796)
!1801 = !DILocation(line: 2198, column: 59, scope: !1796)
!1802 = !DILocation(line: 2198, column: 30, scope: !1796)
!1803 = !DILocation(line: 2198, column: 37, scope: !1796)
!1804 = !{!1748, !1749, i64 16}
!1805 = !DILocation(line: 2198, column: 49, scope: !1796)
!1806 = !{!1748, !1749, i64 24}
!1807 = !DILocation(line: 2198, column: 60, scope: !1796)
!1808 = distinct !DISubprogram(name: "_Bxty", linkageName: "??0_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ", scope: !226, file: !34, line: 2252, type: !236, scopeLine: 2252, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !235, retainedNodes: !1809)
!1809 = !{!1810}
!1810 = !DILocalVariable(name: "this", arg: 1, scope: !1808, type: !1811, flags: DIFlagArtificial | DIFlagObjectPointer)
!1811 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !226, size: 64)
!1812 = !DILocation(line: 0, scope: !1808)
!1813 = !DILocation(line: 2252, column: 27, scope: !1808)
!1814 = distinct !DISubprogram(name: "assign", linkageName: "?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z", scope: !276, file: !34, line: 427, type: !320, scopeLine: 427, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !363, retainedNodes: !1815)
!1815 = !{!1816, !1817}
!1816 = !DILocalVariable(name: "_Right", arg: 2, scope: !1814, file: !34, line: 427, type: !52)
!1817 = !DILocalVariable(name: "_Left", arg: 1, scope: !1814, file: !34, line: 427, type: !50)
!1818 = !DILocation(line: 427, column: 64, scope: !1814)
!1819 = !DILocation(line: 427, column: 44, scope: !1814)
!1820 = !DILocation(line: 428, column: 17, scope: !1814)
!1821 = !DILocation(line: 428, column: 9, scope: !1814)
!1822 = !DILocation(line: 428, column: 15, scope: !1814)
!1823 = !DILocation(line: 429, column: 5, scope: !1814)
!1824 = distinct !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD_K@Z", scope: !33, file: !34, line: 3042, type: !571, scopeLine: 3042, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !579, retainedNodes: !1825)
!1825 = !{!1826, !1827, !1828, !1829}
!1826 = !DILocalVariable(name: "_Count", arg: 3, scope: !1824, file: !34, line: 3042, type: !448)
!1827 = !DILocalVariable(name: "_Ptr", arg: 2, scope: !1824, file: !34, line: 3042, type: !302)
!1828 = !DILocalVariable(name: "this", arg: 1, scope: !1824, type: !1636, flags: DIFlagArtificial | DIFlagObjectPointer)
!1829 = !DILocalVariable(name: "_Old_ptr", scope: !1830, file: !34, line: 3045, type: !97)
!1830 = distinct !DILexicalBlock(scope: !1831, file: !34, line: 3044, column: 47)
!1831 = distinct !DILexicalBlock(scope: !1824, file: !34, line: 3044, column: 13)
!1832 = !{!1749, !1749, i64 0}
!1833 = !DILocation(line: 3042, column: 105, scope: !1824)
!1834 = !DILocation(line: 3042, column: 64, scope: !1824)
!1835 = !DILocation(line: 0, scope: !1824)
!1836 = !DILocation(line: 3044, column: 13, scope: !1831)
!1837 = !DILocation(line: 3044, column: 23, scope: !1831)
!1838 = !DILocation(line: 3044, column: 31, scope: !1831)
!1839 = !DILocation(line: 3044, column: 39, scope: !1831)
!1840 = !DILocation(line: 3044, column: 20, scope: !1831)
!1841 = !DILocation(line: 3044, column: 13, scope: !1824)
!1842 = !DILocation(line: 3045, column: 13, scope: !1830)
!1843 = !DILocation(line: 3045, column: 26, scope: !1830)
!1844 = !DILocation(line: 3045, column: 39, scope: !1830)
!1845 = !DILocation(line: 3045, column: 47, scope: !1830)
!1846 = !DILocation(line: 3045, column: 55, scope: !1830)
!1847 = !DILocation(line: 3046, column: 39, scope: !1830)
!1848 = !DILocation(line: 3046, column: 13, scope: !1830)
!1849 = !DILocation(line: 3046, column: 21, scope: !1830)
!1850 = !DILocation(line: 3046, column: 29, scope: !1830)
!1851 = !DILocation(line: 3046, column: 37, scope: !1830)
!1852 = !DILocation(line: 3047, column: 43, scope: !1830)
!1853 = !DILocation(line: 3047, column: 37, scope: !1830)
!1854 = !DILocation(line: 3047, column: 27, scope: !1830)
!1855 = !DILocation(line: 3047, column: 13, scope: !1830)
!1856 = !DILocation(line: 3048, column: 47, scope: !1830)
!1857 = !DILocation(line: 3048, column: 29, scope: !1830)
!1858 = !DILocation(line: 3048, column: 38, scope: !1830)
!1859 = !DILocation(line: 3048, column: 13, scope: !1830)
!1860 = !DILocation(line: 3049, column: 13, scope: !1830)
!1861 = !DILocation(line: 3050, column: 9, scope: !1831)
!1862 = !DILocation(line: 3058, column: 13, scope: !1824)
!1863 = !DILocation(line: 3053, column: 13, scope: !1824)
!1864 = !DILocation(line: 3052, column: 16, scope: !1824)
!1865 = !DILocation(line: 3052, column: 9, scope: !1824)
!1866 = !DILocation(line: 3059, column: 5, scope: !1824)
!1867 = distinct !DISubprogram(name: "_Convert_size<unsigned long long>", linkageName: "??$_Convert_size@_K@std@@YA_K_K@Z", scope: !5, file: !38, line: 989, type: !1868, scopeLine: 989, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, templateParams: !1872, retainedNodes: !1870)
!1868 = !DISubroutineType(types: !1869)
!1869 = !{!19, !98}
!1870 = !{!1871}
!1871 = !DILocalVariable(name: "_Len", arg: 1, scope: !1867, file: !38, line: 989, type: !98)
!1872 = !{!1873}
!1873 = !DITemplateTypeParameter(name: "_Size_type", type: !21)
!1874 = !DILocation(line: 989, column: 64, scope: !1867)
!1875 = !DILocation(line: 991, column: 12, scope: !1867)
!1876 = !DILocation(line: 991, column: 5, scope: !1867)
!1877 = distinct !DISubprogram(name: "length", linkageName: "?length@?$_Narrow_char_traits@DH@std@@SA_KQEBD@Z", scope: !276, file: !34, line: 373, type: !357, scopeLine: 373, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !356, retainedNodes: !1878)
!1878 = !{!1879}
!1879 = !DILocalVariable(name: "_First", arg: 1, scope: !1877, file: !34, line: 373, type: !302)
!1880 = !DILocation(line: 373, column: 76, scope: !1877)
!1881 = !DILocation(line: 389, column: 59, scope: !1877)
!1882 = !DILocation(line: 389, column: 16, scope: !1877)
!1883 = !DILocation(line: 389, column: 9, scope: !1877)
!1884 = distinct !DISubprogram(name: "_Myptr", linkageName: "?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAAPEADXZ", scope: !177, file: !34, line: 2208, type: !248, scopeLine: 2208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !247, retainedNodes: !1885)
!1885 = !{!1886, !1887}
!1886 = !DILocalVariable(name: "this", arg: 1, scope: !1884, type: !1799, flags: DIFlagArtificial | DIFlagObjectPointer)
!1887 = !DILocalVariable(name: "_Result", scope: !1884, file: !34, line: 2209, type: !250)
!1888 = !DILocation(line: 0, scope: !1884)
!1889 = !DILocation(line: 2209, column: 9, scope: !1884)
!1890 = !DILocation(line: 2209, column: 21, scope: !1884)
!1891 = !DILocation(line: 2209, column: 31, scope: !1884)
!1892 = !DILocation(line: 2209, column: 35, scope: !1884)
!1893 = !DILocation(line: 2210, column: 13, scope: !1894)
!1894 = distinct !DILexicalBlock(scope: !1884, file: !34, line: 2210, column: 13)
!1895 = !DILocation(line: 2210, column: 13, scope: !1884)
!1896 = !DILocation(line: 2211, column: 32, scope: !1897)
!1897 = distinct !DILexicalBlock(scope: !1894, file: !34, line: 2210, column: 38)
!1898 = !DILocation(line: 2211, column: 36, scope: !1897)
!1899 = !DILocation(line: 2211, column: 23, scope: !1897)
!1900 = !DILocation(line: 2211, column: 21, scope: !1897)
!1901 = !DILocation(line: 2212, column: 9, scope: !1897)
!1902 = !DILocation(line: 2214, column: 16, scope: !1884)
!1903 = !DILocation(line: 2215, column: 5, scope: !1884)
!1904 = !DILocation(line: 2214, column: 9, scope: !1884)
!1905 = distinct !DISubprogram(name: "move", linkageName: "?move@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z", scope: !279, file: !34, line: 76, type: !300, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !306, retainedNodes: !1906)
!1906 = !{!1907, !1908, !1909}
!1907 = !DILocalVariable(name: "_Count", arg: 3, scope: !1905, file: !34, line: 77, type: !98)
!1908 = !DILocalVariable(name: "_First2", arg: 2, scope: !1905, file: !34, line: 77, type: !302)
!1909 = !DILocalVariable(name: "_First1", arg: 1, scope: !1905, file: !34, line: 76, type: !97)
!1910 = !DILocation(line: 77, column: 69, scope: !1905)
!1911 = !DILocation(line: 77, column: 47, scope: !1905)
!1912 = !DILocation(line: 76, column: 75, scope: !1905)
!1913 = !DILocation(line: 80, column: 27, scope: !1905)
!1914 = !DILocation(line: 80, column: 36, scope: !1905)
!1915 = !DILocation(line: 80, column: 45, scope: !1905)
!1916 = !DILocation(line: 80, column: 52, scope: !1905)
!1917 = !DILocation(line: 80, column: 9, scope: !1905)
!1918 = !DILocation(line: 122, column: 16, scope: !1905)
!1919 = !DILocation(line: 122, column: 9, scope: !1905)
!1920 = distinct !DISubprogram(name: "_Reallocate_for<`lambda at C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\xstring:3054:13',const char *>", linkageName: "??$_Reallocate_for@V<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??assign@01@QEAAAEAV01@QEBD0@Z@PEBD@Z", scope: !33, file: !34, line: 4302, type: !1921, scopeLine: 4302, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, templateParams: !1925, declaration: !1924, retainedNodes: !1930)
!1921 = !DISubroutineType(types: !1922)
!1922 = !{!500, !433, !448, !1923, !31}
!1923 = distinct !DICompositeType(tag: DW_TAG_class_type, scope: !1824, file: !34, line: 3054, size: 8, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !197, identifier: ".?AV<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV23@QEBD_K@Z@")
!1924 = !DISubprogram(name: "_Reallocate_for<`lambda at C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\xstring:3054:13',const char *>", linkageName: "??$_Reallocate_for@V<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??assign@01@QEAAAEAV01@QEBD0@Z@PEBD@Z", scope: !33, file: !34, line: 4302, type: !1921, scopeLine: 4302, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, templateParams: !1925)
!1925 = !{!1926, !1927}
!1926 = !DITemplateTypeParameter(name: "_Fty", type: !1923)
!1927 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_ArgTys", value: !1928)
!1928 = !{!1929}
!1929 = !DITemplateTypeParameter(type: !31)
!1930 = !{!1931, !1932, !1933, !1934, !1935, !1936, !1937, !1938}
!1931 = !DILocalVariable(name: "_Args", arg: 4, scope: !1920, file: !34, line: 4302, type: !31)
!1932 = !DILocalVariable(name: "_Fn", arg: 3, scope: !1920, file: !34, line: 4302, type: !1923)
!1933 = !DILocalVariable(name: "_New_size", arg: 2, scope: !1920, file: !34, line: 4302, type: !448)
!1934 = !DILocalVariable(name: "this", arg: 1, scope: !1920, type: !1636, flags: DIFlagArtificial | DIFlagObjectPointer)
!1935 = !DILocalVariable(name: "_Old_capacity", scope: !1920, file: !34, line: 4309, type: !448)
!1936 = !DILocalVariable(name: "_New_capacity", scope: !1920, file: !34, line: 4310, type: !448)
!1937 = !DILocalVariable(name: "_Al", scope: !1920, file: !34, line: 4311, type: !144)
!1938 = !DILocalVariable(name: "_New_ptr", scope: !1920, file: !34, line: 4312, type: !1939)
!1939 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !388)
!1940 = !DILocation(line: 4302, column: 83, scope: !1920)
!1941 = !DILocation(line: 4302, column: 67, scope: !1920)
!1942 = !DILocation(line: 4302, column: 51, scope: !1920)
!1943 = !DILocation(line: 0, scope: !1920)
!1944 = !DILocation(line: 4305, column: 13, scope: !1945)
!1945 = distinct !DILexicalBlock(scope: !1920, file: !34, line: 4305, column: 13)
!1946 = !DILocation(line: 4305, column: 25, scope: !1945)
!1947 = !DILocation(line: 4305, column: 23, scope: !1945)
!1948 = !DILocation(line: 4305, column: 13, scope: !1920)
!1949 = !DILocation(line: 4306, column: 13, scope: !1950)
!1950 = distinct !DILexicalBlock(scope: !1945, file: !34, line: 4305, column: 37)
!1951 = !DILocation(line: 4309, column: 9, scope: !1920)
!1952 = !DILocation(line: 4309, column: 25, scope: !1920)
!1953 = !DILocation(line: 4309, column: 41, scope: !1920)
!1954 = !DILocation(line: 4309, column: 49, scope: !1920)
!1955 = !DILocation(line: 4309, column: 57, scope: !1920)
!1956 = !DILocation(line: 4310, column: 9, scope: !1920)
!1957 = !DILocation(line: 4310, column: 25, scope: !1920)
!1958 = !DILocation(line: 4310, column: 59, scope: !1920)
!1959 = !DILocation(line: 4310, column: 41, scope: !1920)
!1960 = !DILocation(line: 4311, column: 9, scope: !1920)
!1961 = !DILocation(line: 4311, column: 15, scope: !1920)
!1962 = !DILocation(line: 4311, column: 41, scope: !1920)
!1963 = !DILocation(line: 4312, column: 9, scope: !1920)
!1964 = !DILocation(line: 4312, column: 23, scope: !1920)
!1965 = !DILocation(line: 4312, column: 41, scope: !1920)
!1966 = !DILocation(line: 4312, column: 54, scope: !1920)
!1967 = !DILocation(line: 4312, column: 68, scope: !1920)
!1968 = !DILocation(line: 4312, column: 45, scope: !1920)
!1969 = !DILocation(line: 4313, column: 9, scope: !1920)
!1970 = !DILocation(line: 4313, column: 17, scope: !1920)
!1971 = !DILocation(line: 4313, column: 25, scope: !1920)
!1972 = !DILocation(line: 4314, column: 35, scope: !1920)
!1973 = !DILocation(line: 4314, column: 9, scope: !1920)
!1974 = !DILocation(line: 4314, column: 17, scope: !1920)
!1975 = !DILocation(line: 4314, column: 25, scope: !1920)
!1976 = !DILocation(line: 4314, column: 33, scope: !1920)
!1977 = !DILocation(line: 4315, column: 35, scope: !1920)
!1978 = !DILocation(line: 4315, column: 9, scope: !1920)
!1979 = !DILocation(line: 4315, column: 17, scope: !1920)
!1980 = !DILocation(line: 4315, column: 25, scope: !1920)
!1981 = !DILocation(line: 4315, column: 33, scope: !1920)
!1982 = !DILocation(line: 4316, column: 44, scope: !1920)
!1983 = !DILocation(line: 4316, column: 33, scope: !1920)
!1984 = !DILocation(line: 4316, column: 22, scope: !1920)
!1985 = !DILocation(line: 4316, column: 13, scope: !1920)
!1986 = !DILocation(line: 4316, column: 9, scope: !1920)
!1987 = !DILocation(line: 4317, column: 26, scope: !1988)
!1988 = distinct !DILexicalBlock(scope: !1920, file: !34, line: 4317, column: 13)
!1989 = !DILocation(line: 4317, column: 23, scope: !1988)
!1990 = !DILocation(line: 4317, column: 13, scope: !1920)
!1991 = !DILocation(line: 4318, column: 13, scope: !1992)
!1992 = distinct !DILexicalBlock(scope: !1988, file: !34, line: 4317, column: 41)
!1993 = !DILocation(line: 4318, column: 54, scope: !1992)
!1994 = !DILocation(line: 4318, column: 68, scope: !1992)
!1995 = !DILocation(line: 4318, column: 28, scope: !1992)
!1996 = !DILocation(line: 4318, column: 36, scope: !1992)
!1997 = !DILocation(line: 4318, column: 44, scope: !1992)
!1998 = !DILocation(line: 4318, column: 48, scope: !1992)
!1999 = !DILocation(line: 4318, column: 17, scope: !1992)
!2000 = !DILocation(line: 4319, column: 40, scope: !1992)
!2001 = !DILocation(line: 4319, column: 13, scope: !1992)
!2002 = !DILocation(line: 4319, column: 21, scope: !1992)
!2003 = !DILocation(line: 4319, column: 29, scope: !1992)
!2004 = !DILocation(line: 4319, column: 33, scope: !1992)
!2005 = !DILocation(line: 4319, column: 38, scope: !1992)
!2006 = !DILocation(line: 4320, column: 9, scope: !1992)
!2007 = !DILocation(line: 4321, column: 33, scope: !2008)
!2008 = distinct !DILexicalBlock(scope: !1988, file: !34, line: 4320, column: 16)
!2009 = !DILocation(line: 4321, column: 41, scope: !2008)
!2010 = !DILocation(line: 4321, column: 49, scope: !2008)
!2011 = !DILocation(line: 4321, column: 53, scope: !2008)
!2012 = !DILocation(line: 4321, column: 13, scope: !2008)
!2013 = !DILocation(line: 4325, column: 5, scope: !1920)
!2014 = !DILocation(line: 4324, column: 9, scope: !1920)
!2015 = distinct !DISubprogram(name: "_Large_string_engaged", linkageName: "?_Large_string_engaged@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_NXZ", scope: !177, file: !34, line: 2226, type: !258, scopeLine: 2226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !257, retainedNodes: !2016)
!2016 = !{!2017}
!2017 = !DILocalVariable(name: "this", arg: 1, scope: !2015, type: !2018, flags: DIFlagArtificial | DIFlagObjectPointer)
!2018 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !256, size: 64)
!2019 = !DILocation(line: 0, scope: !2015)
!2020 = !DILocation(line: 2227, column: 29, scope: !2015)
!2021 = !DILocation(line: 2227, column: 26, scope: !2015)
!2022 = !DILocation(line: 2227, column: 9, scope: !2015)
!2023 = distinct !DISubprogram(name: "_Unfancy<char>", linkageName: "??$_Unfancy@D@std@@YAPEADPEAD@Z", scope: !5, file: !2024, line: 288, type: !964, scopeLine: 288, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, templateParams: !110, retainedNodes: !2025)
!2024 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\xstddef", directory: "", checksumkind: CSK_MD5, checksum: "9f716b3ccbb87fef0387470dd4655d4e")
!2025 = !{!2026}
!2026 = !DILocalVariable(name: "_Ptr", arg: 1, scope: !2023, file: !2024, line: 288, type: !22)
!2027 = !DILocation(line: 288, column: 41, scope: !2023)
!2028 = !DILocation(line: 289, column: 12, scope: !2023)
!2029 = !DILocation(line: 289, column: 5, scope: !2023)
!2030 = distinct !DISubprogram(name: "max_size", linkageName: "?max_size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ", scope: !33, file: !34, line: 3773, type: !699, scopeLine: 3773, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !702, retainedNodes: !2031)
!2031 = !{!2032, !2034, !2035}
!2032 = !DILocalVariable(name: "this", arg: 1, scope: !2030, type: !2033, flags: DIFlagArtificial | DIFlagObjectPointer)
!2033 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !435, size: 64)
!2034 = !DILocalVariable(name: "_Alloc_max", scope: !2030, file: !34, line: 3774, type: !448)
!2035 = !DILocalVariable(name: "_Storage_max", scope: !2030, file: !34, line: 3775, type: !448)
!2036 = !DILocation(line: 0, scope: !2030)
!2037 = !DILocation(line: 3774, column: 9, scope: !2030)
!2038 = !DILocation(line: 3774, column: 25, scope: !2030)
!2039 = !DILocation(line: 3774, column: 63, scope: !2030)
!2040 = !DILocation(line: 3774, column: 40, scope: !2030)
!2041 = !DILocation(line: 3775, column: 9, scope: !2030)
!2042 = !DILocation(line: 3775, column: 25, scope: !2030)
!2043 = !DILocation(line: 3776, column: 36, scope: !2030)
!2044 = !DILocation(line: 3776, column: 13, scope: !2030)
!2045 = !DILocation(line: 3778, column: 13, scope: !2030)
!2046 = !DILocation(line: 3778, column: 26, scope: !2030)
!2047 = !DILocation(line: 3777, column: 27, scope: !2030)
!2048 = !DILocation(line: 3777, column: 50, scope: !2030)
!2049 = !DILocation(line: 3777, column: 16, scope: !2030)
!2050 = !DILocation(line: 3777, column: 9, scope: !2030)
!2051 = !DILocation(line: 3780, column: 5, scope: !2030)
!2052 = distinct !DISubprogram(name: "_Xlen_string", linkageName: "?_Xlen_string@std@@YAXXZ", scope: !5, file: !34, line: 2274, type: !265, scopeLine: 2274, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !197)
!2053 = !DILocation(line: 2275, column: 5, scope: !2052)
!2054 = distinct !DISubprogram(name: "_Calculate_growth", linkageName: "?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBA_K_K@Z", scope: !33, file: !34, line: 4297, type: !796, scopeLine: 4297, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !795, retainedNodes: !2055)
!2055 = !{!2056, !2057}
!2056 = !DILocalVariable(name: "_Requested", arg: 2, scope: !2054, file: !34, line: 4297, type: !448)
!2057 = !DILocalVariable(name: "this", arg: 1, scope: !2054, type: !2033, flags: DIFlagArtificial | DIFlagObjectPointer)
!2058 = !DILocation(line: 4297, column: 60, scope: !2054)
!2059 = !DILocation(line: 0, scope: !2054)
!2060 = !DILocation(line: 4298, column: 70, scope: !2054)
!2061 = !DILocation(line: 4298, column: 46, scope: !2054)
!2062 = !DILocation(line: 4298, column: 54, scope: !2054)
!2063 = !DILocation(line: 4298, column: 62, scope: !2054)
!2064 = !DILocation(line: 4298, column: 34, scope: !2054)
!2065 = !DILocation(line: 4298, column: 16, scope: !2054)
!2066 = !DILocation(line: 4298, column: 9, scope: !2054)
!2067 = distinct !DISubprogram(name: "_Getal", linkageName: "?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV?$allocator@D@2@XZ", scope: !33, file: !34, line: 4408, type: !805, scopeLine: 4408, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !804, retainedNodes: !2068)
!2068 = !{!2069}
!2069 = !DILocalVariable(name: "this", arg: 1, scope: !2067, type: !1636, flags: DIFlagArtificial | DIFlagObjectPointer)
!2070 = !DILocation(line: 0, scope: !2067)
!2071 = !DILocation(line: 4409, column: 16, scope: !2067)
!2072 = !DILocation(line: 4409, column: 24, scope: !2067)
!2073 = !DILocation(line: 4409, column: 9, scope: !2067)
!2074 = distinct !DISubprogram(name: "allocate", linkageName: "?allocate@?$allocator@D@std@@QEAAPEAD_K@Z", scope: !43, file: !38, line: 808, type: !100, scopeLine: 808, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !99, retainedNodes: !2075)
!2075 = !{!2076, !2077}
!2076 = !DILocalVariable(name: "_Count", arg: 2, scope: !2074, file: !38, line: 808, type: !98)
!2077 = !DILocalVariable(name: "this", arg: 1, scope: !2074, type: !1793, flags: DIFlagArtificial | DIFlagObjectPointer)
!2078 = !DILocation(line: 808, column: 84, scope: !2074)
!2079 = !DILocation(line: 0, scope: !2074)
!2080 = !DILocation(line: 809, column: 91, scope: !2074)
!2081 = !DILocation(line: 809, column: 63, scope: !2074)
!2082 = !DILocation(line: 809, column: 34, scope: !2074)
!2083 = !DILocation(line: 809, column: 9, scope: !2074)
!2084 = distinct !DISubprogram(name: "_Orphan_all", linkageName: "?_Orphan_all@_Container_base0@std@@QEAAXXZ", scope: !181, file: !38, line: 1064, type: !184, scopeLine: 1064, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !183, retainedNodes: !2085)
!2085 = !{!2086}
!2086 = !DILocalVariable(name: "this", arg: 1, scope: !2084, type: !1671, flags: DIFlagArtificial | DIFlagObjectPointer)
!2087 = !DILocation(line: 0, scope: !2084)
!2088 = !DILocation(line: 1064, column: 34, scope: !2084)
!2089 = distinct !DISubprogram(name: "operator()", linkageName: "??R<lambda_1>@?0??assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV23@QEBD_K@Z@QEBA?A?<auto>@@QEAD10@Z", scope: !1923, file: !34, line: 3054, type: !2090, scopeLine: 3054, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !2094, retainedNodes: !2098)
!2090 = !DISubroutineType(types: !2091)
!2091 = !{null, !2092, !97, !448, !302}
!2092 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2093, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2093 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1923)
!2094 = !DISubprogram(name: "operator()", scope: !1923, file: !34, line: 3054, type: !2095, scopeLine: 3054, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2095 = !DISubroutineType(types: !2096)
!2096 = !{!2097, !2092, !97, !448, !302}
!2097 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "auto")
!2098 = !{!2099, !2100, !2101, !2102}
!2099 = !DILocalVariable(name: "_Ptr", arg: 4, scope: !2089, file: !34, line: 3054, type: !302)
!2100 = !DILocalVariable(name: "_Count", arg: 3, scope: !2089, file: !34, line: 3054, type: !448)
!2101 = !DILocalVariable(name: "_New_ptr", arg: 2, scope: !2089, file: !34, line: 3054, type: !97)
!2102 = !DILocalVariable(name: "this", arg: 1, scope: !2089, type: !2103, flags: DIFlagArtificial | DIFlagObjectPointer)
!2103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2093, size: 64)
!2104 = !DILocation(line: 3054, column: 82, scope: !2089)
!2105 = !DILocation(line: 3054, column: 55, scope: !2089)
!2106 = !DILocation(line: 3054, column: 29, scope: !2089)
!2107 = !DILocation(line: 0, scope: !2089)
!2108 = !DILocation(line: 3055, column: 47, scope: !2089)
!2109 = !DILocation(line: 3055, column: 41, scope: !2089)
!2110 = !DILocation(line: 3055, column: 31, scope: !2089)
!2111 = !DILocation(line: 3055, column: 17, scope: !2089)
!2112 = !DILocation(line: 3056, column: 51, scope: !2089)
!2113 = !DILocation(line: 3056, column: 33, scope: !2089)
!2114 = !DILocation(line: 3056, column: 42, scope: !2089)
!2115 = !DILocation(line: 3056, column: 17, scope: !2089)
!2116 = !DILocation(line: 3057, column: 13, scope: !2089)
!2117 = distinct !DISubprogram(name: "deallocate", linkageName: "?deallocate@?$allocator@D@std@@QEAAXQEAD_K@Z", scope: !43, file: !38, line: 803, type: !95, scopeLine: 803, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !94, retainedNodes: !2118)
!2118 = !{!2119, !2120, !2121}
!2119 = !DILocalVariable(name: "_Count", arg: 3, scope: !2117, file: !38, line: 803, type: !98)
!2120 = !DILocalVariable(name: "_Ptr", arg: 2, scope: !2117, file: !38, line: 803, type: !97)
!2121 = !DILocalVariable(name: "this", arg: 1, scope: !2117, type: !1793, flags: DIFlagArtificial | DIFlagObjectPointer)
!2122 = !DILocation(line: 803, column: 51, scope: !2117)
!2123 = !DILocation(line: 803, column: 32, scope: !2117)
!2124 = !DILocation(line: 0, scope: !2117)
!2125 = !DILocation(line: 805, column: 60, scope: !2117)
!2126 = !DILocation(line: 805, column: 58, scope: !2117)
!2127 = !DILocation(line: 805, column: 40, scope: !2117)
!2128 = !DILocation(line: 805, column: 9, scope: !2117)
!2129 = !DILocation(line: 806, column: 5, scope: !2117)
!2130 = distinct !DISubprogram(name: "_Construct_in_place<char *,char *const &>", linkageName: "??$_Construct_in_place@PEADAEBQEAD@std@@YAXAEAPEADAEBQEAD@Z", scope: !5, file: !401, line: 137, type: !2131, scopeLine: 137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, templateParams: !2138, retainedNodes: !2135)
!2131 = !DISubroutineType(types: !2132)
!2132 = !{null, !2133, !2134}
!2133 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !22, size: 64)
!2134 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !97, size: 64)
!2135 = !{!2136, !2137}
!2136 = !DILocalVariable(name: "_Args", arg: 2, scope: !2130, file: !401, line: 137, type: !2134)
!2137 = !DILocalVariable(name: "_Obj", arg: 1, scope: !2130, file: !401, line: 137, type: !2133)
!2138 = !{!2139, !2140}
!2139 = !DITemplateTypeParameter(name: "_Ty", type: !22)
!2140 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Types", value: !2141)
!2141 = !{!2142}
!2142 = !DITemplateTypeParameter(type: !2134)
!2143 = !DILocation(line: 137, column: 49, scope: !2130)
!2144 = !DILocation(line: 137, column: 31, scope: !2130)
!2145 = !DILocation(line: 138, column: 41, scope: !2130)
!2146 = !DILocation(line: 138, column: 26, scope: !2130)
!2147 = !DILocation(line: 138, column: 12, scope: !2130)
!2148 = !DILocation(line: 138, column: 5, scope: !2130)
!2149 = !DILocation(line: 138, column: 74, scope: !2130)
!2150 = !DILocation(line: 138, column: 53, scope: !2130)
!2151 = !DILocation(line: 139, column: 1, scope: !2130)
!2152 = distinct !DISubprogram(name: "max_size", linkageName: "?max_size@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA_KAEBV?$allocator@D@2@@Z", scope: !40, file: !38, line: 704, type: !156, scopeLine: 704, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !155, retainedNodes: !2153)
!2153 = !{!2154}
!2154 = !DILocalVariable(arg: 1, scope: !2152, file: !38, line: 704, type: !93)
!2155 = !DILocation(line: 704, column: 55, scope: !2152)
!2156 = !DILocation(line: 705, column: 9, scope: !2152)
!2157 = distinct !DISubprogram(name: "_Getal", linkageName: "?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBAAEBV?$allocator@D@2@XZ", scope: !33, file: !34, line: 4412, type: !809, scopeLine: 4412, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !808, retainedNodes: !2158)
!2158 = !{!2159}
!2159 = !DILocalVariable(name: "this", arg: 1, scope: !2157, type: !2033, flags: DIFlagArtificial | DIFlagObjectPointer)
!2160 = !DILocation(line: 0, scope: !2157)
!2161 = !DILocation(line: 4413, column: 16, scope: !2157)
!2162 = !DILocation(line: 4413, column: 24, scope: !2157)
!2163 = !DILocation(line: 4413, column: 9, scope: !2157)
!2164 = distinct !DISubprogram(name: "max<unsigned long long>", linkageName: "??$max@_K@std@@YAAEB_KAEB_K0@Z", scope: !5, file: !2165, line: 41, type: !2166, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, templateParams: !2172, retainedNodes: !2169)
!2165 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\utility", directory: "", checksumkind: CSK_MD5, checksum: "9eb487abd765074c0a8014a5ba7d58ba")
!2166 = !DISubroutineType(types: !2167)
!2167 = !{!2168, !2168, !2168}
!2168 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !405, size: 64)
!2169 = !{!2170, !2171}
!2170 = !DILocalVariable(name: "_Right", arg: 2, scope: !2164, file: !2165, line: 42, type: !2168)
!2171 = !DILocalVariable(name: "_Left", arg: 1, scope: !2164, file: !2165, line: 42, type: !2168)
!2172 = !{!2173}
!2173 = !DITemplateTypeParameter(name: "_Ty", type: !21)
!2174 = !DILocation(line: 42, column: 34, scope: !2164)
!2175 = !DILocation(line: 42, column: 16, scope: !2164)
!2176 = !DILocation(line: 44, column: 12, scope: !2164)
!2177 = !DILocation(line: 44, column: 20, scope: !2164)
!2178 = !DILocation(line: 44, column: 18, scope: !2164)
!2179 = !DILocation(line: 44, column: 29, scope: !2164)
!2180 = !DILocation(line: 44, column: 38, scope: !2164)
!2181 = !DILocation(line: 44, column: 5, scope: !2164)
!2182 = distinct !DISubprogram(name: "min<unsigned long long>", linkageName: "??$min@_K@std@@YAAEB_KAEB_K0@Z", scope: !5, file: !2165, line: 65, type: !2166, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, templateParams: !2172, retainedNodes: !2183)
!2183 = !{!2184, !2185}
!2184 = !DILocalVariable(name: "_Right", arg: 2, scope: !2182, file: !2165, line: 66, type: !2168)
!2185 = !DILocalVariable(name: "_Left", arg: 1, scope: !2182, file: !2165, line: 66, type: !2168)
!2186 = !DILocation(line: 66, column: 34, scope: !2182)
!2187 = !DILocation(line: 66, column: 16, scope: !2182)
!2188 = !DILocation(line: 68, column: 12, scope: !2182)
!2189 = !DILocation(line: 68, column: 21, scope: !2182)
!2190 = !DILocation(line: 68, column: 19, scope: !2182)
!2191 = !DILocation(line: 68, column: 29, scope: !2182)
!2192 = !DILocation(line: 68, column: 38, scope: !2182)
!2193 = !DILocation(line: 68, column: 5, scope: !2182)
!2194 = distinct !DISubprogram(name: "max", linkageName: "?max@?$numeric_limits@_J@std@@SA_JXZ", scope: !2195, file: !4, line: 647, type: !2237, scopeLine: 647, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !2239, retainedNodes: !197)
!2195 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "numeric_limits<long long>", scope: !5, file: !4, line: 641, size: 8, flags: DIFlagTypePassByValue, elements: !2196, templateParams: !2247, identifier: ".?AV?$numeric_limits@_J@std@@")
!2196 = !{!2197, !2233, !2234, !2235, !2236, !2239, !2240, !2241, !2242, !2243, !2244, !2245, !2246}
!2197 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2195, baseType: !2198, flags: DIFlagPublic, extraData: i32 0)
!2198 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Num_int_base", scope: !5, file: !4, line: 120, size: 8, flags: DIFlagTypePassByValue, elements: !2199, identifier: ".?AU_Num_int_base@std@@")
!2199 = !{!2200, !2228, !2229, !2230, !2231, !2232}
!2200 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2198, baseType: !2201, extraData: i32 0)
!2201 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Num_base", scope: !5, file: !4, line: 43, size: 8, flags: DIFlagTypePassByValue, elements: !2202, identifier: ".?AU_Num_base@std@@")
!2202 = !{!2203, !2205, !2206, !2207, !2208, !2209, !2210, !2211, !2212, !2213, !2214, !2215, !2216, !2217, !2218, !2220, !2221, !2222, !2223, !2224, !2225, !2226, !2227}
!2203 = !DIDerivedType(tag: DW_TAG_member, name: "has_denorm", scope: !2201, file: !4, line: 44, baseType: !2204, flags: DIFlagStaticMember, extraData: i32 0)
!2204 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !3)
!2205 = !DIDerivedType(tag: DW_TAG_member, name: "has_denorm_loss", scope: !2201, file: !4, line: 45, baseType: !64, flags: DIFlagStaticMember, extraData: i1 false)
!2206 = !DIDerivedType(tag: DW_TAG_member, name: "has_infinity", scope: !2201, file: !4, line: 46, baseType: !64, flags: DIFlagStaticMember, extraData: i1 false)
!2207 = !DIDerivedType(tag: DW_TAG_member, name: "has_quiet_NaN", scope: !2201, file: !4, line: 47, baseType: !64, flags: DIFlagStaticMember, extraData: i1 false)
!2208 = !DIDerivedType(tag: DW_TAG_member, name: "has_signaling_NaN", scope: !2201, file: !4, line: 48, baseType: !64, flags: DIFlagStaticMember, extraData: i1 false)
!2209 = !DIDerivedType(tag: DW_TAG_member, name: "is_bounded", scope: !2201, file: !4, line: 49, baseType: !64, flags: DIFlagStaticMember, extraData: i1 false)
!2210 = !DIDerivedType(tag: DW_TAG_member, name: "is_exact", scope: !2201, file: !4, line: 50, baseType: !64, flags: DIFlagStaticMember, extraData: i1 false)
!2211 = !DIDerivedType(tag: DW_TAG_member, name: "is_iec559", scope: !2201, file: !4, line: 51, baseType: !64, flags: DIFlagStaticMember, extraData: i1 false)
!2212 = !DIDerivedType(tag: DW_TAG_member, name: "is_integer", scope: !2201, file: !4, line: 52, baseType: !64, flags: DIFlagStaticMember, extraData: i1 false)
!2213 = !DIDerivedType(tag: DW_TAG_member, name: "is_modulo", scope: !2201, file: !4, line: 53, baseType: !64, flags: DIFlagStaticMember, extraData: i1 false)
!2214 = !DIDerivedType(tag: DW_TAG_member, name: "is_signed", scope: !2201, file: !4, line: 54, baseType: !64, flags: DIFlagStaticMember, extraData: i1 false)
!2215 = !DIDerivedType(tag: DW_TAG_member, name: "is_specialized", scope: !2201, file: !4, line: 55, baseType: !64, flags: DIFlagStaticMember, extraData: i1 false)
!2216 = !DIDerivedType(tag: DW_TAG_member, name: "tinyness_before", scope: !2201, file: !4, line: 56, baseType: !64, flags: DIFlagStaticMember, extraData: i1 false)
!2217 = !DIDerivedType(tag: DW_TAG_member, name: "traps", scope: !2201, file: !4, line: 57, baseType: !64, flags: DIFlagStaticMember, extraData: i1 false)
!2218 = !DIDerivedType(tag: DW_TAG_member, name: "round_style", scope: !2201, file: !4, line: 58, baseType: !2219, flags: DIFlagStaticMember, extraData: i32 0)
!2219 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!2220 = !DIDerivedType(tag: DW_TAG_member, name: "digits", scope: !2201, file: !4, line: 59, baseType: !1027, flags: DIFlagStaticMember, extraData: i32 0)
!2221 = !DIDerivedType(tag: DW_TAG_member, name: "digits10", scope: !2201, file: !4, line: 60, baseType: !1027, flags: DIFlagStaticMember, extraData: i32 0)
!2222 = !DIDerivedType(tag: DW_TAG_member, name: "max_digits10", scope: !2201, file: !4, line: 61, baseType: !1027, flags: DIFlagStaticMember, extraData: i32 0)
!2223 = !DIDerivedType(tag: DW_TAG_member, name: "max_exponent", scope: !2201, file: !4, line: 62, baseType: !1027, flags: DIFlagStaticMember, extraData: i32 0)
!2224 = !DIDerivedType(tag: DW_TAG_member, name: "max_exponent10", scope: !2201, file: !4, line: 63, baseType: !1027, flags: DIFlagStaticMember, extraData: i32 0)
!2225 = !DIDerivedType(tag: DW_TAG_member, name: "min_exponent", scope: !2201, file: !4, line: 64, baseType: !1027, flags: DIFlagStaticMember, extraData: i32 0)
!2226 = !DIDerivedType(tag: DW_TAG_member, name: "min_exponent10", scope: !2201, file: !4, line: 65, baseType: !1027, flags: DIFlagStaticMember, extraData: i32 0)
!2227 = !DIDerivedType(tag: DW_TAG_member, name: "radix", scope: !2201, file: !4, line: 66, baseType: !1027, flags: DIFlagStaticMember, extraData: i32 0)
!2228 = !DIDerivedType(tag: DW_TAG_member, name: "is_bounded", scope: !2198, file: !4, line: 121, baseType: !64, flags: DIFlagStaticMember, extraData: i1 true)
!2229 = !DIDerivedType(tag: DW_TAG_member, name: "is_exact", scope: !2198, file: !4, line: 122, baseType: !64, flags: DIFlagStaticMember, extraData: i1 true)
!2230 = !DIDerivedType(tag: DW_TAG_member, name: "is_integer", scope: !2198, file: !4, line: 123, baseType: !64, flags: DIFlagStaticMember, extraData: i1 true)
!2231 = !DIDerivedType(tag: DW_TAG_member, name: "is_specialized", scope: !2198, file: !4, line: 124, baseType: !64, flags: DIFlagStaticMember, extraData: i1 true)
!2232 = !DIDerivedType(tag: DW_TAG_member, name: "radix", scope: !2198, file: !4, line: 125, baseType: !1027, flags: DIFlagStaticMember, extraData: i32 2)
!2233 = !DIDerivedType(tag: DW_TAG_member, name: "is_signed", scope: !2195, file: !4, line: 679, baseType: !64, flags: DIFlagPublic | DIFlagStaticMember, extraData: i1 true)
!2234 = !DIDerivedType(tag: DW_TAG_member, name: "digits", scope: !2195, file: !4, line: 680, baseType: !1027, flags: DIFlagPublic | DIFlagStaticMember, extraData: i32 63)
!2235 = !DIDerivedType(tag: DW_TAG_member, name: "digits10", scope: !2195, file: !4, line: 681, baseType: !1027, flags: DIFlagPublic | DIFlagStaticMember, extraData: i32 18)
!2236 = !DISubprogram(name: "min", linkageName: "?min@?$numeric_limits@_J@std@@SA_JXZ", scope: !2195, file: !4, line: 643, type: !2237, scopeLine: 643, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2237 = !DISubroutineType(types: !2238)
!2238 = !{!56}
!2239 = !DISubprogram(name: "max", linkageName: "?max@?$numeric_limits@_J@std@@SA_JXZ", scope: !2195, file: !4, line: 647, type: !2237, scopeLine: 647, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2240 = !DISubprogram(name: "lowest", linkageName: "?lowest@?$numeric_limits@_J@std@@SA_JXZ", scope: !2195, file: !4, line: 651, type: !2237, scopeLine: 651, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2241 = !DISubprogram(name: "epsilon", linkageName: "?epsilon@?$numeric_limits@_J@std@@SA_JXZ", scope: !2195, file: !4, line: 655, type: !2237, scopeLine: 655, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2242 = !DISubprogram(name: "round_error", linkageName: "?round_error@?$numeric_limits@_J@std@@SA_JXZ", scope: !2195, file: !4, line: 659, type: !2237, scopeLine: 659, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2243 = !DISubprogram(name: "denorm_min", linkageName: "?denorm_min@?$numeric_limits@_J@std@@SA_JXZ", scope: !2195, file: !4, line: 663, type: !2237, scopeLine: 663, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2244 = !DISubprogram(name: "infinity", linkageName: "?infinity@?$numeric_limits@_J@std@@SA_JXZ", scope: !2195, file: !4, line: 667, type: !2237, scopeLine: 667, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2245 = !DISubprogram(name: "quiet_NaN", linkageName: "?quiet_NaN@?$numeric_limits@_J@std@@SA_JXZ", scope: !2195, file: !4, line: 671, type: !2237, scopeLine: 671, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2246 = !DISubprogram(name: "signaling_NaN", linkageName: "?signaling_NaN@?$numeric_limits@_J@std@@SA_JXZ", scope: !2195, file: !4, line: 675, type: !2237, scopeLine: 675, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2247 = !{!2248}
!2248 = !DITemplateTypeParameter(name: "_Ty", type: !56)
!2249 = !DILocation(line: 648, column: 9, scope: !2194)
!2250 = distinct !DISubprogram(name: "_Get_first", linkageName: "?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEBAAEBV?$allocator@D@2@XZ", scope: !412, file: !38, line: 1344, type: !422, scopeLine: 1344, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !421, retainedNodes: !2251)
!2251 = !{!2252}
!2252 = !DILocalVariable(name: "this", arg: 1, scope: !2250, type: !2253, flags: DIFlagArtificial | DIFlagObjectPointer)
!2253 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !425, size: 64)
!2254 = !DILocation(line: 0, scope: !2250)
!2255 = !DILocation(line: 1345, column: 16, scope: !2250)
!2256 = !DILocation(line: 1345, column: 9, scope: !2250)
!2257 = distinct !DISubprogram(name: "_Calculate_growth", linkageName: "?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@CA_K_K00@Z", scope: !33, file: !34, line: 4283, type: !793, scopeLine: 4284, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !792, retainedNodes: !2258)
!2258 = !{!2259, !2260, !2261, !2262}
!2259 = !DILocalVariable(name: "_Max", arg: 3, scope: !2257, file: !34, line: 4284, type: !448)
!2260 = !DILocalVariable(name: "_Old", arg: 2, scope: !2257, file: !34, line: 4284, type: !448)
!2261 = !DILocalVariable(name: "_Requested", arg: 1, scope: !2257, file: !34, line: 4284, type: !448)
!2262 = !DILocalVariable(name: "_Masked", scope: !2257, file: !34, line: 4285, type: !448)
!2263 = !DILocation(line: 4284, column: 75, scope: !2257)
!2264 = !DILocation(line: 4284, column: 53, scope: !2257)
!2265 = !DILocation(line: 4284, column: 25, scope: !2257)
!2266 = !DILocation(line: 4285, column: 9, scope: !2257)
!2267 = !DILocation(line: 4285, column: 25, scope: !2257)
!2268 = !DILocation(line: 4285, column: 35, scope: !2257)
!2269 = !DILocation(line: 4285, column: 46, scope: !2257)
!2270 = !DILocation(line: 4286, column: 13, scope: !2271)
!2271 = distinct !DILexicalBlock(scope: !2257, file: !34, line: 4286, column: 13)
!2272 = !DILocation(line: 4286, column: 23, scope: !2271)
!2273 = !DILocation(line: 4286, column: 21, scope: !2271)
!2274 = !DILocation(line: 4286, column: 13, scope: !2257)
!2275 = !DILocation(line: 4287, column: 20, scope: !2276)
!2276 = distinct !DILexicalBlock(scope: !2271, file: !34, line: 4286, column: 29)
!2277 = !DILocation(line: 4287, column: 13, scope: !2276)
!2278 = !DILocation(line: 4290, column: 13, scope: !2279)
!2279 = distinct !DILexicalBlock(scope: !2257, file: !34, line: 4290, column: 13)
!2280 = !DILocation(line: 4290, column: 20, scope: !2279)
!2281 = !DILocation(line: 4290, column: 27, scope: !2279)
!2282 = !DILocation(line: 4290, column: 32, scope: !2279)
!2283 = !DILocation(line: 4290, column: 25, scope: !2279)
!2284 = !DILocation(line: 4290, column: 18, scope: !2279)
!2285 = !DILocation(line: 4290, column: 13, scope: !2257)
!2286 = !DILocation(line: 4291, column: 20, scope: !2287)
!2287 = distinct !DILexicalBlock(scope: !2279, file: !34, line: 4290, column: 37)
!2288 = !DILocation(line: 4291, column: 13, scope: !2287)
!2289 = !DILocation(line: 4294, column: 36, scope: !2257)
!2290 = !DILocation(line: 4294, column: 43, scope: !2257)
!2291 = !DILocation(line: 4294, column: 48, scope: !2257)
!2292 = !DILocation(line: 4294, column: 41, scope: !2257)
!2293 = !DILocation(line: 4294, column: 16, scope: !2257)
!2294 = !DILocation(line: 4294, column: 9, scope: !2257)
!2295 = !DILocation(line: 4295, column: 5, scope: !2257)
!2296 = distinct !DISubprogram(name: "_Get_first", linkageName: "?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAAAEAV?$allocator@D@2@XZ", scope: !412, file: !38, line: 1340, type: !418, scopeLine: 1340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !417, retainedNodes: !2297)
!2297 = !{!2298}
!2298 = !DILocalVariable(name: "this", arg: 1, scope: !2296, type: !1720, flags: DIFlagArtificial | DIFlagObjectPointer)
!2299 = !DILocation(line: 0, scope: !2296)
!2300 = !DILocation(line: 1341, column: 16, scope: !2296)
!2301 = !DILocation(line: 1341, column: 9, scope: !2296)
!2302 = distinct !DISubprogram(name: "_Allocate<16,std::_Default_allocate_traits,0>", linkageName: "??$_Allocate@$0BA@U_Default_allocate_traits@std@@$0A@@std@@YAPEAX_K@Z", scope: !5, file: !38, line: 197, type: !2303, scopeLine: 197, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, templateParams: !2307, retainedNodes: !2305)
!2303 = !DISubroutineType(types: !2304)
!2304 = !{!26, !98}
!2305 = !{!2306}
!2306 = !DILocalVariable(name: "_Bytes", arg: 1, scope: !2302, file: !38, line: 197, type: !98)
!2307 = !{!2308, !2309, !2313}
!2308 = !DITemplateValueParameter(name: "_Align", type: !21, value: i64 16)
!2309 = !DITemplateTypeParameter(name: "_Traits", type: !2310, defaulted: true)
!2310 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Default_allocate_traits", scope: !5, file: !38, line: 75, size: 8, flags: DIFlagTypePassByValue, elements: !2311, identifier: ".?AU_Default_allocate_traits@std@@")
!2311 = !{!2312}
!2312 = !DISubprogram(name: "_Allocate", linkageName: "?_Allocate@_Default_allocate_traits@std@@SAPEAX_K@Z", scope: !2310, file: !38, line: 76, type: !2303, scopeLine: 76, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2313 = !DITemplateValueParameter(type: !6, value: i32 0)
!2314 = !DILocation(line: 197, column: 52, scope: !2302)
!2315 = !DILocation(line: 200, column: 9, scope: !2316)
!2316 = distinct !DILexicalBlock(scope: !2302, file: !38, line: 200, column: 9)
!2317 = !DILocation(line: 200, column: 16, scope: !2316)
!2318 = !DILocation(line: 200, column: 9, scope: !2302)
!2319 = !DILocation(line: 201, column: 59, scope: !2320)
!2320 = distinct !DILexicalBlock(scope: !2316, file: !38, line: 200, column: 46)
!2321 = !DILocation(line: 201, column: 16, scope: !2320)
!2322 = !DILocation(line: 201, column: 9, scope: !2320)
!2323 = !DILocation(line: 205, column: 9, scope: !2324)
!2324 = distinct !DILexicalBlock(scope: !2302, file: !38, line: 205, column: 9)
!2325 = !DILocation(line: 205, column: 16, scope: !2324)
!2326 = !DILocation(line: 205, column: 9, scope: !2302)
!2327 = !DILocation(line: 206, column: 35, scope: !2328)
!2328 = distinct !DILexicalBlock(scope: !2324, file: !38, line: 205, column: 22)
!2329 = !DILocation(line: 206, column: 16, scope: !2328)
!2330 = !DILocation(line: 206, column: 9, scope: !2328)
!2331 = !DILocation(line: 209, column: 5, scope: !2302)
!2332 = !DILocation(line: 210, column: 1, scope: !2302)
!2333 = distinct !DISubprogram(name: "_Get_size_of_n<1>", linkageName: "??$_Get_size_of_n@$00@std@@YA_K_K@Z", scope: !5, file: !38, line: 55, type: !1868, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, templateParams: !2337, retainedNodes: !2334)
!2334 = !{!2335, !2336}
!2335 = !DILocalVariable(name: "_Count", arg: 1, scope: !2333, file: !38, line: 55, type: !98)
!2336 = !DILocalVariable(name: "_Overflow_is_possible", scope: !2333, file: !38, line: 56, type: !64)
!2337 = !{!2338}
!2338 = !DITemplateValueParameter(name: "_Ty_size", type: !21, value: i64 1)
!2339 = !DILocation(line: 55, column: 57, scope: !2333)
!2340 = !DILocation(line: 56, column: 5, scope: !2333)
!2341 = !DILocation(line: 56, column: 20, scope: !2333)
!2342 = !{!2343, !2343, i64 0}
!2343 = !{!"bool", !1677, i64 0}
!2344 = !DILocation(line: 65, column: 12, scope: !2333)
!2345 = !DILocation(line: 65, column: 19, scope: !2333)
!2346 = !DILocation(line: 66, column: 1, scope: !2333)
!2347 = !DILocation(line: 65, column: 5, scope: !2333)
!2348 = distinct !DISubprogram(name: "_Allocate_manually_vector_aligned<std::_Default_allocate_traits>", linkageName: "??$_Allocate_manually_vector_aligned@U_Default_allocate_traits@std@@@std@@YAPEAX_K@Z", scope: !5, file: !38, line: 113, type: !2303, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, templateParams: !2356, retainedNodes: !2349)
!2349 = !{!2350, !2351, !2352, !2354}
!2350 = !DILocalVariable(name: "_Bytes", arg: 1, scope: !2348, file: !38, line: 113, type: !98)
!2351 = !DILocalVariable(name: "_Block_size", scope: !2348, file: !38, line: 115, type: !98)
!2352 = !DILocalVariable(name: "_Ptr_container", scope: !2348, file: !38, line: 120, type: !2353)
!2353 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !24)
!2354 = !DILocalVariable(name: "_Ptr", scope: !2348, file: !38, line: 122, type: !2355)
!2355 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !26)
!2356 = !{!2357}
!2357 = !DITemplateTypeParameter(name: "_Traits", type: !2310)
!2358 = !DILocation(line: 113, column: 76, scope: !2348)
!2359 = !DILocation(line: 115, column: 5, scope: !2348)
!2360 = !DILocation(line: 115, column: 18, scope: !2348)
!2361 = !DILocation(line: 115, column: 49, scope: !2348)
!2362 = !DILocation(line: 115, column: 47, scope: !2348)
!2363 = !DILocation(line: 116, column: 9, scope: !2364)
!2364 = distinct !DILexicalBlock(scope: !2348, file: !38, line: 116, column: 9)
!2365 = !DILocation(line: 116, column: 24, scope: !2364)
!2366 = !DILocation(line: 116, column: 21, scope: !2364)
!2367 = !DILocation(line: 116, column: 9, scope: !2348)
!2368 = !DILocation(line: 117, column: 9, scope: !2369)
!2369 = distinct !DILexicalBlock(scope: !2364, file: !38, line: 116, column: 32)
!2370 = !DILocation(line: 120, column: 5, scope: !2348)
!2371 = !DILocation(line: 120, column: 21, scope: !2348)
!2372 = !DILocation(line: 120, column: 85, scope: !2348)
!2373 = !DILocation(line: 120, column: 66, scope: !2348)
!2374 = !DILocation(line: 120, column: 38, scope: !2348)
!2375 = !DILocation(line: 121, column: 5, scope: !2348)
!2376 = !DILocation(line: 121, column: 5, scope: !2377)
!2377 = distinct !DILexicalBlock(scope: !2378, file: !38, line: 121, column: 5)
!2378 = distinct !DILexicalBlock(scope: !2348, file: !38, line: 121, column: 5)
!2379 = !DILocation(line: 121, column: 5, scope: !2378)
!2380 = !DILocation(line: 121, column: 5, scope: !2381)
!2381 = distinct !DILexicalBlock(scope: !2377, file: !38, line: 121, column: 5)
!2382 = !DILocation(line: 121, column: 5, scope: !2383)
!2383 = distinct !DILexicalBlock(scope: !2377, file: !38, line: 121, column: 5)
!2384 = !DILocation(line: 121, column: 5, scope: !2385)
!2385 = distinct !DILexicalBlock(scope: !2383, file: !38, line: 121, column: 5)
!2386 = !DILocation(line: 122, column: 5, scope: !2348)
!2387 = !DILocation(line: 122, column: 17, scope: !2348)
!2388 = !DILocation(line: 122, column: 49, scope: !2348)
!2389 = !DILocation(line: 122, column: 64, scope: !2348)
!2390 = !DILocation(line: 122, column: 82, scope: !2348)
!2391 = !DILocation(line: 122, column: 24, scope: !2348)
!2392 = !DILocation(line: 123, column: 41, scope: !2348)
!2393 = !DILocation(line: 123, column: 29, scope: !2348)
!2394 = !DILocation(line: 123, column: 5, scope: !2348)
!2395 = !DILocation(line: 123, column: 39, scope: !2348)
!2396 = !DILocation(line: 128, column: 12, scope: !2348)
!2397 = !DILocation(line: 129, column: 1, scope: !2348)
!2398 = !DILocation(line: 128, column: 5, scope: !2348)
!2399 = distinct !DISubprogram(name: "_Allocate", linkageName: "?_Allocate@_Default_allocate_traits@std@@SAPEAX_K@Z", scope: !2310, file: !38, line: 76, type: !2303, scopeLine: 76, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !2312, retainedNodes: !2400)
!2400 = !{!2401}
!2401 = !DILocalVariable(name: "_Bytes", arg: 1, scope: !2399, file: !38, line: 76, type: !98)
!2402 = !DILocation(line: 76, column: 63, scope: !2399)
!2403 = !DILocation(line: 77, column: 31, scope: !2399)
!2404 = !DILocation(line: 77, column: 16, scope: !2399)
!2405 = !DILocation(line: 77, column: 9, scope: !2399)
!2406 = distinct !DISubprogram(name: "_Throw_bad_array_new_length", linkageName: "?_Throw_bad_array_new_length@std@@YAXXZ", scope: !5, file: !1570, line: 320, type: !265, scopeLine: 320, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !197)
!2407 = !DILocation(line: 321, column: 5, scope: !2406)
!2408 = distinct !DISubprogram(name: "bad_array_new_length", linkageName: "??0bad_array_new_length@std@@QEAA@XZ", scope: !2410, file: !2409, line: 139, type: !2458, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !2457, retainedNodes: !2461)
!2409 = !DIFile(filename: "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.28.29910\\include\\vcruntime_exception.h", directory: "", checksumkind: CSK_MD5, checksum: "aa62b99a88eea7594b2d8954526d3841")
!2410 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "bad_array_new_length", scope: !5, file: !2409, line: 134, size: 192, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !2411, vtableHolder: !2416, identifier: ".?AVbad_array_new_length@std@@")
!2411 = !{!2412, !2418, !2457}
!2412 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2410, baseType: !2413, flags: DIFlagPublic, extraData: i32 0)
!2413 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "bad_alloc", scope: !5, file: !2409, line: 114, size: 192, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !2414, vtableHolder: !2416, identifier: ".?AVbad_alloc@std@@")
!2414 = !{!2415, !2418, !2450, !2454}
!2415 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2413, baseType: !2416, flags: DIFlagPublic, extraData: i32 0)
!2416 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "exception", scope: !5, file: !2409, line: 48, size: 192, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !2417, vtableHolder: !2416, identifier: ".?AVexception@std@@")
!2417 = !{!2418, !2419, !2421, !2426, !2430, !2433, !2436, !2441, !2445, !2446}
!2418 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "__vtbl_ptr_type", baseType: null, size: 128)
!2419 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$exception", scope: !2409, file: !2409, baseType: !2420, size: 64, flags: DIFlagArtificial)
!2420 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2418, size: 64)
!2421 = !DIDerivedType(tag: DW_TAG_member, name: "_Data", scope: !2416, file: !2409, line: 100, baseType: !2422, size: 128, offset: 64)
!2422 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__std_exception_data", file: !2409, line: 25, size: 128, flags: DIFlagTypePassByValue, elements: !2423, identifier: ".?AU__std_exception_data@@")
!2423 = !{!2424, !2425}
!2424 = !DIDerivedType(tag: DW_TAG_member, name: "_What", scope: !2422, file: !2409, line: 27, baseType: !31, size: 64)
!2425 = !DIDerivedType(tag: DW_TAG_member, name: "_DoFree", scope: !2422, file: !2409, line: 28, baseType: !65, size: 8, offset: 64)
!2426 = !DISubprogram(name: "exception", scope: !2416, file: !2409, line: 52, type: !2427, scopeLine: 52, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2427 = !DISubroutineType(types: !2428)
!2428 = !{null, !2429}
!2429 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2416, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2430 = !DISubprogram(name: "exception", scope: !2416, file: !2409, line: 57, type: !2431, scopeLine: 57, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2431 = !DISubroutineType(types: !2432)
!2432 = !{null, !2429, !302}
!2433 = !DISubprogram(name: "exception", scope: !2416, file: !2409, line: 64, type: !2434, scopeLine: 64, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2434 = !DISubroutineType(types: !2435)
!2435 = !{null, !2429, !302, !6}
!2436 = !DISubprogram(name: "exception", scope: !2416, file: !2409, line: 70, type: !2437, scopeLine: 70, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2437 = !DISubroutineType(types: !2438)
!2438 = !{null, !2429, !2439}
!2439 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2440, size: 64)
!2440 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2416)
!2441 = !DISubprogram(name: "operator=", linkageName: "??4exception@std@@QEAAAEAV01@AEBV01@@Z", scope: !2416, file: !2409, line: 76, type: !2442, scopeLine: 76, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2442 = !DISubroutineType(types: !2443)
!2443 = !{!2444, !2429, !2439}
!2444 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2416, size: 64)
!2445 = !DISubprogram(name: "~exception", scope: !2416, file: !2409, line: 88, type: !2427, scopeLine: 88, containingType: !2416, virtualIndex: 0, flags: DIFlagPublic | DIFlagPrototyped | DIFlagIntroducedVirtual, spFlags: DISPFlagVirtual | DISPFlagOptimized)
!2446 = !DISubprogram(name: "what", linkageName: "?what@exception@std@@UEBAPEBDXZ", scope: !2416, file: !2409, line: 93, type: !2447, scopeLine: 93, containingType: !2416, virtualIndex: 1, flags: DIFlagPublic | DIFlagPrototyped | DIFlagIntroducedVirtual, spFlags: DISPFlagVirtual | DISPFlagOptimized)
!2447 = !DISubroutineType(types: !2448)
!2448 = !{!31, !2449}
!2449 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2440, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2450 = !DISubprogram(name: "bad_alloc", scope: !2413, file: !2409, line: 119, type: !2451, scopeLine: 119, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2451 = !DISubroutineType(types: !2452)
!2452 = !{null, !2453}
!2453 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2413, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2454 = !DISubprogram(name: "bad_alloc", scope: !2413, file: !2409, line: 128, type: !2455, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2455 = !DISubroutineType(types: !2456)
!2456 = !{null, !2453, !302}
!2457 = !DISubprogram(name: "bad_array_new_length", scope: !2410, file: !2409, line: 139, type: !2458, scopeLine: 139, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2458 = !DISubroutineType(types: !2459)
!2459 = !{null, !2460}
!2460 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2410, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2461 = !{!2462}
!2462 = !DILocalVariable(name: "this", arg: 1, scope: !2408, type: !2463, flags: DIFlagArtificial | DIFlagObjectPointer)
!2463 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2410, size: 64)
!2464 = !DILocation(line: 0, scope: !2408)
!2465 = !DILocation(line: 141, column: 5, scope: !2408)
!2466 = !DILocation(line: 140, column: 11, scope: !2408)
!2467 = !{!2468, !2468, i64 0}
!2468 = !{!"vtable pointer", !1678, i64 0}
!2469 = !DILocation(line: 142, column: 5, scope: !2408)
!2470 = distinct !DISubprogram(name: "bad_array_new_length", linkageName: "??0bad_array_new_length@std@@QEAA@AEBV01@@Z", scope: !2410, file: !2409, line: 134, type: !2471, scopeLine: 134, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !2475, retainedNodes: !2476)
!2471 = !DISubroutineType(types: !2472)
!2472 = !{null, !2460, !2473}
!2473 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2474, size: 64)
!2474 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2410)
!2475 = !DISubprogram(name: "bad_array_new_length", scope: !2410, type: !2471, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2476 = !{!2477, !2478}
!2477 = !DILocalVariable(arg: 2, scope: !2470, type: !2473)
!2478 = !DILocalVariable(name: "this", arg: 1, scope: !2470, type: !2463, flags: DIFlagArtificial | DIFlagObjectPointer)
!2479 = !DILocation(line: 0, scope: !2470)
!2480 = !DILocation(line: 134, column: 7, scope: !2470)
!2481 = distinct !DISubprogram(name: "bad_alloc", linkageName: "??0bad_alloc@std@@QEAA@AEBV01@@Z", scope: !2413, file: !2409, line: 114, type: !2482, scopeLine: 114, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !2486, retainedNodes: !2487)
!2482 = !DISubroutineType(types: !2483)
!2483 = !{null, !2453, !2484}
!2484 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2485, size: 64)
!2485 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2413)
!2486 = !DISubprogram(name: "bad_alloc", scope: !2413, type: !2482, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2487 = !{!2488, !2489}
!2488 = !DILocalVariable(arg: 2, scope: !2481, type: !2484)
!2489 = !DILocalVariable(name: "this", arg: 1, scope: !2481, type: !2490, flags: DIFlagArtificial | DIFlagObjectPointer)
!2490 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2413, size: 64)
!2491 = !DILocation(line: 0, scope: !2481)
!2492 = !DILocation(line: 114, column: 7, scope: !2481)
!2493 = distinct !DISubprogram(name: "exception", linkageName: "??0exception@std@@QEAA@AEBV01@@Z", scope: !2416, file: !2409, line: 70, type: !2437, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !2436, retainedNodes: !2494)
!2494 = !{!2495, !2496}
!2495 = !DILocalVariable(name: "_Other", arg: 2, scope: !2493, file: !2409, line: 70, type: !2439)
!2496 = !DILocalVariable(name: "this", arg: 1, scope: !2493, type: !2497, flags: DIFlagArtificial | DIFlagObjectPointer)
!2497 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2416, size: 64)
!2498 = !DILocation(line: 70, column: 32, scope: !2493)
!2499 = !DILocation(line: 0, scope: !2493)
!2500 = !DILocation(line: 72, column: 5, scope: !2493)
!2501 = !DILocation(line: 71, column: 11, scope: !2493)
!2502 = !DILocation(line: 73, column: 46, scope: !2503)
!2503 = distinct !DILexicalBlock(scope: !2493, file: !2409, line: 72, column: 5)
!2504 = !DILocation(line: 73, column: 31, scope: !2503)
!2505 = !DILocation(line: 73, column: 38, scope: !2503)
!2506 = !DILocation(line: 73, column: 9, scope: !2503)
!2507 = !DILocation(line: 74, column: 5, scope: !2493)
!2508 = distinct !DISubprogram(name: "~exception", linkageName: "??1exception@std@@UEAA@XZ", scope: !2416, file: !2409, line: 88, type: !2427, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !2445, retainedNodes: !2509)
!2509 = !{!2510}
!2510 = !DILocalVariable(name: "this", arg: 1, scope: !2508, type: !2497, flags: DIFlagArtificial | DIFlagObjectPointer)
!2511 = !DILocation(line: 0, scope: !2508)
!2512 = !DILocation(line: 89, column: 5, scope: !2508)
!2513 = !DILocation(line: 90, column: 34, scope: !2514)
!2514 = distinct !DILexicalBlock(scope: !2508, file: !2409, line: 89, column: 5)
!2515 = !DILocation(line: 90, column: 9, scope: !2514)
!2516 = !DILocation(line: 91, column: 5, scope: !2508)
!2517 = distinct !DISubprogram(name: "bad_alloc", linkageName: "??0bad_alloc@std@@AEAA@QEBD@Z", scope: !2413, file: !2409, line: 128, type: !2455, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !2454, retainedNodes: !2518)
!2518 = !{!2519, !2520}
!2519 = !DILocalVariable(name: "_Message", arg: 2, scope: !2517, file: !2409, line: 128, type: !302)
!2520 = !DILocalVariable(name: "this", arg: 1, scope: !2517, type: !2490, flags: DIFlagArtificial | DIFlagObjectPointer)
!2521 = !DILocation(line: 128, column: 33, scope: !2517)
!2522 = !DILocation(line: 0, scope: !2517)
!2523 = !DILocation(line: 130, column: 5, scope: !2517)
!2524 = !DILocation(line: 129, column: 21, scope: !2517)
!2525 = !DILocation(line: 129, column: 11, scope: !2517)
!2526 = !DILocation(line: 131, column: 5, scope: !2517)
!2527 = distinct !DISubprogram(name: "~bad_array_new_length", linkageName: "??_Gbad_array_new_length@std@@UEAAPEAXI@Z", scope: !2410, file: !2409, line: 134, type: !2458, scopeLine: 134, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !2528, retainedNodes: !2529)
!2528 = !DISubprogram(name: "~bad_array_new_length", scope: !2410, type: !2458, containingType: !2410, virtualIndex: 0, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagVirtual | DISPFlagOptimized)
!2529 = !{!2530, !2531}
!2530 = !DILocalVariable(name: "should_call_delete", arg: 2, scope: !2527, type: !6, flags: DIFlagArtificial)
!2531 = !DILocalVariable(name: "this", arg: 1, scope: !2527, type: !2463, flags: DIFlagArtificial | DIFlagObjectPointer)
!2532 = !DILocation(line: 0, scope: !2527)
!2533 = !DILocation(line: 134, column: 7, scope: !2527)
!2534 = distinct !DISubprogram(name: "what", linkageName: "?what@exception@std@@UEBAPEBDXZ", scope: !2416, file: !2409, line: 93, type: !2447, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !2446, retainedNodes: !2535)
!2535 = !{!2536}
!2536 = !DILocalVariable(name: "this", arg: 1, scope: !2534, type: !2537, flags: DIFlagArtificial | DIFlagObjectPointer)
!2537 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2440, size: 64)
!2538 = !DILocation(line: 0, scope: !2534)
!2539 = !DILocation(line: 95, column: 16, scope: !2534)
!2540 = !DILocation(line: 95, column: 22, scope: !2534)
!2541 = !{!2542, !1676, i64 8}
!2542 = !{!"?AVexception@std@@", !2543, i64 8}
!2543 = !{!"?AU__std_exception_data@@", !1676, i64 0, !2343, i64 8}
!2544 = !DILocation(line: 95, column: 30, scope: !2534)
!2545 = !DILocation(line: 95, column: 36, scope: !2534)
!2546 = !DILocation(line: 95, column: 9, scope: !2534)
!2547 = distinct !DISubprogram(name: "exception", linkageName: "??0exception@std@@QEAA@QEBDH@Z", scope: !2416, file: !2409, line: 64, type: !2434, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !2433, retainedNodes: !2548)
!2548 = !{!2549, !2550, !2551}
!2549 = !DILocalVariable(arg: 3, scope: !2547, file: !2409, line: 64, type: !6)
!2550 = !DILocalVariable(name: "_Message", arg: 2, scope: !2547, file: !2409, line: 64, type: !302)
!2551 = !DILocalVariable(name: "this", arg: 1, scope: !2547, type: !2497, flags: DIFlagArtificial | DIFlagObjectPointer)
!2552 = !DILocation(line: 64, column: 46, scope: !2547)
!2553 = !DILocation(line: 64, column: 33, scope: !2547)
!2554 = !DILocation(line: 0, scope: !2547)
!2555 = !DILocation(line: 66, column: 5, scope: !2547)
!2556 = !DILocation(line: 65, column: 11, scope: !2547)
!2557 = !DILocation(line: 67, column: 23, scope: !2558)
!2558 = distinct !DILexicalBlock(scope: !2547, file: !2409, line: 66, column: 5)
!2559 = !DILocation(line: 67, column: 9, scope: !2558)
!2560 = !DILocation(line: 67, column: 15, scope: !2558)
!2561 = !DILocation(line: 67, column: 21, scope: !2558)
!2562 = !DILocation(line: 68, column: 5, scope: !2547)
!2563 = distinct !DISubprogram(name: "~bad_alloc", linkageName: "??_Gbad_alloc@std@@UEAAPEAXI@Z", scope: !2413, file: !2409, line: 114, type: !2451, scopeLine: 114, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !2564, retainedNodes: !2565)
!2564 = !DISubprogram(name: "~bad_alloc", scope: !2413, type: !2451, containingType: !2413, virtualIndex: 0, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagVirtual | DISPFlagOptimized)
!2565 = !{!2566, !2567}
!2566 = !DILocalVariable(name: "should_call_delete", arg: 2, scope: !2563, type: !6, flags: DIFlagArtificial)
!2567 = !DILocalVariable(name: "this", arg: 1, scope: !2563, type: !2490, flags: DIFlagArtificial | DIFlagObjectPointer)
!2568 = !DILocation(line: 0, scope: !2563)
!2569 = !DILocation(line: 114, column: 7, scope: !2563)
!2570 = distinct !DISubprogram(name: "~exception", linkageName: "??_Gexception@std@@UEAAPEAXI@Z", scope: !2416, file: !2409, line: 88, type: !2427, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !2445, retainedNodes: !2571)
!2571 = !{!2572, !2573}
!2572 = !DILocalVariable(name: "should_call_delete", arg: 2, scope: !2570, type: !6, flags: DIFlagArtificial)
!2573 = !DILocalVariable(name: "this", arg: 1, scope: !2570, type: !2497, flags: DIFlagArtificial | DIFlagObjectPointer)
!2574 = !DILocation(line: 0, scope: !2570)
!2575 = !DILocation(line: 89, column: 5, scope: !2570)
!2576 = !DILocation(line: 91, column: 5, scope: !2570)
!2577 = distinct !DISubprogram(name: "copy", linkageName: "?copy@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z", scope: !279, file: !34, line: 45, type: !300, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !299, retainedNodes: !2578)
!2578 = !{!2579, !2580, !2581}
!2579 = !DILocalVariable(name: "_Count", arg: 3, scope: !2577, file: !34, line: 46, type: !98)
!2580 = !DILocalVariable(name: "_First2", arg: 2, scope: !2577, file: !34, line: 46, type: !302)
!2581 = !DILocalVariable(name: "_First1", arg: 1, scope: !2577, file: !34, line: 45, type: !97)
!2582 = !DILocation(line: 46, column: 69, scope: !2577)
!2583 = !DILocation(line: 46, column: 47, scope: !2577)
!2584 = !DILocation(line: 45, column: 75, scope: !2577)
!2585 = !DILocation(line: 49, column: 26, scope: !2577)
!2586 = !DILocation(line: 49, column: 35, scope: !2577)
!2587 = !DILocation(line: 49, column: 44, scope: !2577)
!2588 = !DILocation(line: 49, column: 51, scope: !2577)
!2589 = !DILocation(line: 49, column: 9, scope: !2577)
!2590 = !DILocation(line: 65, column: 16, scope: !2577)
!2591 = !DILocation(line: 65, column: 9, scope: !2577)
!2592 = distinct !DISubprogram(name: "_Deallocate<16,0>", linkageName: "??$_Deallocate@$0BA@$0A@@std@@YAXPEAX_K@Z", scope: !5, file: !38, line: 213, type: !2593, scopeLine: 213, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, templateParams: !2598, retainedNodes: !2595)
!2593 = !DISubroutineType(types: !2594)
!2594 = !{null, !26, !19}
!2595 = !{!2596, !2597}
!2596 = !DILocalVariable(name: "_Bytes", arg: 2, scope: !2592, file: !38, line: 213, type: !19)
!2597 = !DILocalVariable(name: "_Ptr", arg: 1, scope: !2592, file: !38, line: 213, type: !26)
!2598 = !{!2308, !2313}
!2599 = !DILocation(line: 213, column: 37, scope: !2592)
!2600 = !DILocation(line: 213, column: 24, scope: !2592)
!2601 = !DILocation(line: 216, column: 9, scope: !2602)
!2602 = distinct !DILexicalBlock(scope: !2592, file: !38, line: 216, column: 9)
!2603 = !DILocation(line: 216, column: 16, scope: !2602)
!2604 = !DILocation(line: 216, column: 9, scope: !2592)
!2605 = !DILocation(line: 217, column: 9, scope: !2606)
!2606 = distinct !DILexicalBlock(scope: !2602, file: !38, line: 216, column: 46)
!2607 = !DILocation(line: 218, column: 5, scope: !2606)
!2608 = !DILocation(line: 221, column: 29, scope: !2592)
!2609 = !DILocation(line: 221, column: 23, scope: !2592)
!2610 = !DILocation(line: 221, column: 5, scope: !2592)
!2611 = !DILocation(line: 222, column: 1, scope: !2592)
!2612 = distinct !DISubprogram(name: "_Adjust_manually_vector_aligned", linkageName: "?_Adjust_manually_vector_aligned@std@@YAXAEAPEAXAEA_K@Z", scope: !5, file: !38, line: 132, type: !2613, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2617)
!2613 = !DISubroutineType(types: !2614)
!2614 = !{null, !2615, !2616}
!2615 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !26, size: 64)
!2616 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !19, size: 64)
!2617 = !{!2618, !2619, !2620, !2623, !2624, !2625}
!2618 = !DILocalVariable(name: "_Bytes", arg: 2, scope: !2612, file: !38, line: 132, type: !2616)
!2619 = !DILocalVariable(name: "_Ptr", arg: 1, scope: !2612, file: !38, line: 132, type: !2615)
!2620 = !DILocalVariable(name: "_Ptr_user", scope: !2612, file: !38, line: 136, type: !2621)
!2621 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2622)
!2622 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2353, size: 64)
!2623 = !DILocalVariable(name: "_Ptr_container", scope: !2612, file: !38, line: 137, type: !2353)
!2624 = !DILocalVariable(name: "_Min_back_shift", scope: !2612, file: !38, line: 148, type: !2353)
!2625 = !DILocalVariable(name: "_Back_shift", scope: !2612, file: !38, line: 150, type: !2353)
!2626 = !DILocation(line: 132, column: 66, scope: !2612)
!2627 = !DILocation(line: 132, column: 52, scope: !2612)
!2628 = !DILocation(line: 134, column: 5, scope: !2612)
!2629 = !DILocation(line: 134, column: 12, scope: !2612)
!2630 = !DILocation(line: 136, column: 5, scope: !2612)
!2631 = !DILocation(line: 136, column: 28, scope: !2612)
!2632 = !DILocation(line: 136, column: 69, scope: !2612)
!2633 = !DILocation(line: 136, column: 40, scope: !2612)
!2634 = !DILocation(line: 137, column: 5, scope: !2612)
!2635 = !DILocation(line: 137, column: 21, scope: !2612)
!2636 = !DILocation(line: 137, column: 40, scope: !2612)
!2637 = !DILocation(line: 148, column: 5, scope: !2612)
!2638 = !DILocation(line: 148, column: 25, scope: !2612)
!2639 = !DILocation(line: 150, column: 5, scope: !2612)
!2640 = !DILocation(line: 150, column: 21, scope: !2612)
!2641 = !DILocation(line: 150, column: 63, scope: !2612)
!2642 = !DILocation(line: 150, column: 35, scope: !2612)
!2643 = !DILocation(line: 150, column: 71, scope: !2612)
!2644 = !DILocation(line: 150, column: 69, scope: !2612)
!2645 = !DILocation(line: 151, column: 5, scope: !2612)
!2646 = !DILocation(line: 151, column: 5, scope: !2647)
!2647 = distinct !DILexicalBlock(scope: !2648, file: !38, line: 151, column: 5)
!2648 = distinct !DILexicalBlock(scope: !2612, file: !38, line: 151, column: 5)
!2649 = !DILocation(line: 151, column: 5, scope: !2648)
!2650 = !DILocation(line: 151, column: 5, scope: !2651)
!2651 = distinct !DILexicalBlock(scope: !2647, file: !38, line: 151, column: 5)
!2652 = !DILocation(line: 151, column: 5, scope: !2653)
!2653 = distinct !DILexicalBlock(scope: !2647, file: !38, line: 151, column: 5)
!2654 = !DILocation(line: 151, column: 5, scope: !2655)
!2655 = distinct !DILexicalBlock(scope: !2653, file: !38, line: 151, column: 5)
!2656 = !DILocation(line: 152, column: 36, scope: !2612)
!2657 = !DILocation(line: 152, column: 12, scope: !2612)
!2658 = !DILocation(line: 152, column: 5, scope: !2612)
!2659 = !DILocation(line: 152, column: 10, scope: !2612)
!2660 = !DILocation(line: 153, column: 1, scope: !2612)
!2661 = distinct !DISubprogram(name: "_Voidify_iter<char **>", linkageName: "??$_Voidify_iter@PEAPEAD@std@@YAPEAXPEAPEAD@Z", scope: !5, file: !401, line: 124, type: !2662, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, templateParams: !2666, retainedNodes: !2664)
!2662 = !DISubroutineType(types: !2663)
!2663 = !{!26, !1417}
!2664 = !{!2665}
!2665 = !DILocalVariable(name: "_It", arg: 1, scope: !2661, file: !401, line: 124, type: !1417)
!2666 = !{!2667}
!2667 = !DITemplateTypeParameter(name: "_Iter", type: !1417)
!2668 = !DILocation(line: 124, column: 38, scope: !2661)
!2669 = !DILocation(line: 127, column: 68, scope: !2670)
!2670 = distinct !DILexicalBlock(scope: !2671, file: !401, line: 126, column: 40)
!2671 = distinct !DILexicalBlock(scope: !2661, file: !401, line: 126, column: 19)
!2672 = !DILocation(line: 127, column: 9, scope: !2670)
!2673 = distinct !DISubprogram(name: "addressof<char *>", linkageName: "??$addressof@PEAD@std@@YAPEAPEADAEAPEAD@Z", scope: !5, file: !2024, line: 274, type: !2674, scopeLine: 274, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, templateParams: !2678, retainedNodes: !2676)
!2674 = !DISubroutineType(types: !2675)
!2675 = !{!1417, !2133}
!2676 = !{!2677}
!2677 = !DILocalVariable(name: "_Val", arg: 1, scope: !2673, file: !2024, line: 274, type: !2133)
!2678 = !{!2139}
!2679 = !DILocation(line: 274, column: 42, scope: !2673)
!2680 = !DILocation(line: 275, column: 32, scope: !2673)
!2681 = !DILocation(line: 275, column: 5, scope: !2673)
!2682 = distinct !DISubprogram(name: "forward<char *const &>", linkageName: "??$forward@AEBQEAD@std@@YAAEBQEADAEBQEAD@Z", scope: !5, file: !1565, line: 1442, type: !2683, scopeLine: 1443, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, templateParams: !2691, retainedNodes: !2693)
!2683 = !DISubroutineType(types: !2684)
!2684 = !{!2134, !2685}
!2685 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2686, size: 64)
!2686 = !DIDerivedType(tag: DW_TAG_typedef, name: "remove_reference_t<char *const &>", scope: !5, file: !59, line: 232, baseType: !2687)
!2687 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !2688, file: !59, line: 221, baseType: !97)
!2688 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "remove_reference<char *const &>", scope: !5, file: !59, line: 220, size: 8, flags: DIFlagTypePassByValue, elements: !2689, templateParams: !2691, identifier: ".?AU?$remove_reference@AEBQEAD@std@@")
!2689 = !{!2687, !2690}
!2690 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Const_thru_ref_type", scope: !2688, file: !59, line: 222, baseType: !2134)
!2691 = !{!2692}
!2692 = !DITemplateTypeParameter(name: "_Ty", type: !2134)
!2693 = !{!2694}
!2694 = !DILocalVariable(name: "_Arg", arg: 1, scope: !2682, file: !1565, line: 1443, type: !2685)
!2695 = !DILocation(line: 1443, column: 30, scope: !2682)
!2696 = !DILocation(line: 1444, column: 31, scope: !2682)
!2697 = !DILocation(line: 1444, column: 5, scope: !2682)
!2698 = distinct !DISubprogram(name: "~_String_val", linkageName: "??1?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ", scope: !177, file: !34, line: 2188, type: !244, scopeLine: 2188, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !2699, retainedNodes: !2700)
!2699 = !DISubprogram(name: "~_String_val", scope: !177, type: !244, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2700 = !{!2701}
!2701 = !DILocalVariable(name: "this", arg: 1, scope: !2698, type: !1799, flags: DIFlagArtificial | DIFlagObjectPointer)
!2702 = !DILocation(line: 0, scope: !2698)
!2703 = !DILocation(line: 2188, column: 7, scope: !2704)
!2704 = distinct !DILexicalBlock(scope: !2698, file: !34, line: 2188, column: 7)
!2705 = !DILocation(line: 2188, column: 7, scope: !2698)
!2706 = distinct !DISubprogram(name: "~_Bxty", linkageName: "??1_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ", scope: !226, file: !34, line: 2254, type: !236, scopeLine: 2254, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !239, retainedNodes: !2707)
!2707 = !{!2708}
!2708 = !DILocalVariable(name: "this", arg: 1, scope: !2706, type: !1811, flags: DIFlagArtificial | DIFlagObjectPointer)
!2709 = !DILocation(line: 0, scope: !2706)
!2710 = !DILocation(line: 2254, column: 28, scope: !2706)

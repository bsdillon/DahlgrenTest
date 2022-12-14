using namespace std;

// int main()
// {
//     // __align
//     __align(8) char buffer[128];    
//     __align(16) int i; 
    
//     // __alignof__
//     return __alignof__(int);
    
//     // // __int64
//     // __int64 test1;
//     // long long test2;

//     // __ALIGNOF
//     typedef struct s_foo { int i; short j; } foo;
//     typedef __packed struct s_bar { int i; short j; } bar;
//     return __ALIGNOF(struct s_foo); // returns 4
//     return __ALIGNOF(foo);          // returns 4
//     return __ALIGNOF(bar);          // returns 1
// }

// // // __asm
// int qadd(int i, int j)
// {
//     __asm__("" : "=x" (reg) : "0" (x));
//     int count __asm__("count_v1"); // export count_v1, not count
//     register int foo __asm("r0");
//     __asm { QADD   res, i, j }
// }

// __asm void my_strcpy(const char *src, char *dst);
// int count __asm__("count_v1"); // export count_v1, not count
// register int foo __asm("r0");

// // // __forceinline
// // __forceinline static int max(int x, int y)
// // {
// //     return x > y ? x : y; // always inline if possible
// // }

// // // __global_reg
// __global_reg(2) int x; // r5 is reserved for x 
// __global_reg(1) int x=1; // error in C, OK in C++

// // // __inline
// __inline int f(int x)
// {
//     return x*5+1;
// }
// int g(int x, int y)
// {
//     return f(x) + f(y);
// }

// // // __INTADDR__
// struct S {
//   int a, b;
// };
// int d = __INTADDR__(struct S, b); // usually 4

// // __irq
// // typedef void (*const vect_t)(void) __irq;

// // vect_t vector_table[]
// // __attribute__ ((section("vectors"))) = {
// //   (vect_t) (RAM_BASE + RAM_SIZE),
// //   (vect_t) Reset_Handler,
// // };

// // packed
// // typedef __packed struct
// // {
// //     char x;                   // all fields inherit the __packed qualifier
// //     int y;
// // } X;                          // 5 byte structure, natural alignment = 1
// // int f(X *p)
// // {
// //     return p->y;              // does an unaligned read
// // }
// // typedef struct
// // {
// //     short x;
// //     char y;
// //     __packed int z;           // only pack this field
// //     char a;
// // } Y;                          // 8 byte structure, natural alignment = 2
// // int g(Y *p)
// // {
// //     return p->z + p->x;       // only unaligned read for z
// // }

// // __pure
// int factr(int n) __pure
// {
//     int f = 1;
//     while (n > 0)
//         f *= n--;
//     return f;
// }

// // __smc
// // __smc(5) void mycall(void); /* declare a name by which SMC #5 can be called */
// // mycall();                   /* invoke the function */

// // // __softfp
// // __softfp float test1()
// // {
// //     return;
// // }

// // // __svc
// __svc(42) void terminate_1(int procnum); // terminate_1 returns no results
// __svc(42) int terminate_2(int procnum);  // terminate_2 returns one result
// typedef struct res_type
// {
//     int res_1;
//     int res_2;
//     int res_3;
//     int res_4;
// } res_type;
// __svc(42) __value_in_regs res_type terminate_3(int procnum);
//                                          // terminate_3 returns more than
//                                          // one result

// // // __svc_indirect
// int __svc_indirect(0) ioctl(int svcino, int fn, void *argp);

// // // __svc_indirect_r7
// long __svc_indirect_r7(0) \
//         SVC_write(unsigned, int fd, const char * buf, size_t count);
// #define write(fd, buf, count) SVC_write(4, (fd), (buf), (count))

// // __value_in_regs
// typedef struct int64_struct
// {
//     unsigned int lo;
//     unsigned int hi;
// } int64_struct;
// __value_in_regs extern 
//     int64_struct mul64(unsigned a, unsigned b);

// // __weak
// __weak const int c;                // assume 'c' is not present in final link
// const int *f1() { return &c; } // '&c' returns non-NULL if
//                                    // compiled and linked /ropi
// __weak int i;                      // assume 'i' is not present in final link
// int *f2() { return &i; }       // '&i' returns non-NULL if 
//                                    // compiled and linked /rwpi
// __weak void f(void);               // assume 'f' is not present in final link
// typedef void (*FP)(void);
// FP g() { return f; }               // 'g' returns non-NULL if 
//                                    // compiled and linked /ropi

// // __writeonly
// void foo(__writeonly int *ptr)
// {
//     *ptr = 0;                         // allowed
//     // printf("ptr value = %d\n", *ptr); // error
// }

// __declspec(noinline)
// /* Prevent y being used for optimization */
// __declspec(noinline) const int y = 5;
// // /* Suppress inlining of foo() wherever foo() is called */
// __declspec(noinline) int foo(void);

// // // __declspec(noreturn)
// __declspec(noreturn) void overflow(void); // called on overflow
        
// // int negate(int x) 
// // {
// //     if (x == 0x80000000) overflow();
// //     return -x;
// // }

// // void overflow(void)
// // {
// //     __asm { SVC 0x123; }
// // }

// // // __declspec(nothrow)
// // struct S
// // {
// //     ~S();
// // };
// __declspec(nothrow) extern void f(void);
// void g(void)
// {
//     S s;
//     f();
// }

// // __declspec(notshared)
// struct __declspec(notshared) X
// {
//     virtual int f();
// };                             // do not export this
// int X::f()
// {
//     return 1;
// }
// struct Y : X
// {
//     virtual int g();
// };                             // do export this
// int Y::g()
// {
//     return 1;
// }

// // __declspec(thread)
// __declspec(thread) int i;
// __thread int j;           // same as __decspec(thread) int j;

// #pragma arm
// #pragma arm section
// #pragma hdrstop

// // __breakpoint
// void func(void)
// {
//     __breakpoint(0xF02C);

// }

// // __cdp
// void copro_example()
// {
//     const unsigned int ops = 0xA3; // opcode1 = 0xA, opcode2 = 0x3 
//     const unsigned int regs = 0xCDE; // CRd = 0xC (12), CRn = 0xD (13), CRm = 0xE (14)
//     __cdp(4,ops,regs); // coprocessor number 4
//     // This intrinsic produces the instruction CDP p4,#0xa,c12,c13,c14,#3
// }

// void func2(void)
// {
//     // __clrex
//     __clrex();
//     // __clz
//     unsigned char test1 = __clz(4);
//     // __current_pc
//     unsigned int test2 = __current_pc();
//     // __current_sp 
//     unsigned int test3 = __current_sp();
//     // __disable_fiq
//     int test4 = __disable_fiq();
//     __disable_fiq();
//     // __disable_irq
//     int test5 = __disable_irq();
//     __disable_irq();
//     // __dmb
//     __dmb(0x4F56);
//     // __dsb
//     __dsb(0x4F56);
//     // __enable_fiq
//     __enable_fiq();
//     // __enable_irq
//     __enable_irq();
//     // __fabs
//     double test6 = __fabs(1.3);
//     // __fabsf
//     float test7 = __fabsf(0.3f);
//     // __force_loads
//     __force_loads();
//     // __force_stores
//     __force_stores();
//     // __isb
//     __isb(4);
//     // __ldrex
//     int loc = 0xff;
//     unsigned int test8 = __ldrex((volatile char *)loc);
//     // __ldrexd
//     unsigned long long test9 = __ldrexd((volatile void *)loc);
//     // __ldrt
//     unsigned int test10 = __ldrt((const volatile int *)loc);
//     // __memory_changed
//     __memory_changed();
//     // __nop
//     __nop();
//     // __pld(...)
//     __pld(3, (int *)loc);
//     // __pli(...)
//     __pli(3, (int *)loc);
//     // __qadd - saturating add compiler instruction?
//     int test11 = __qadd(5, 6);
//     // __qdbl - saturating addition of an integer with itself
//     int test12 = __qdbl(5);
//     // __qsub - saturaing subtraction of two integers
//     int test13 = __qsub(6, 5);
//     // __rbit
//     unsigned int test14 = __rbit(5);
//     // __rev
//     unsigned int test15 = __rev(5);
//     // __return_address
//     unsigned int test16 = __return_address();
//     // __ror (value to be shifted right, constant shift 1-31)
//     unsigned int test17 = __ror(5, 6);
//     // __schedule_barrier
//     __schedule_barrier();
//     // __semihost
//     char buffer[100];
//     int test18 = __semihost(0x01, (const void *)buffer);
//     // __sev
//     __sev();
//     // __sqrt
//     double test19 = __sqrt(5.6);
//     // __sqrtf
//     float test20 = __sqrtf(5.6f);
//     // __ssat (int val, unsigned int sat) - saturate a signed value 1-32
//     int test21 = __ssat(5, 6);
//     // __strex
//     int test22 = __strex(5, (volatile void *)loc);
//     // __strexd (unsigned long long val, volaile pointer)
//     int test23 = __strexd(5, (volatile void *)loc);
//     // __strt
//     __strt(0x20, (volatile char *)loc);
//     // __swp (unsigned int, volatile pointer)
//     unsigned int test24 = __swp(0x20, (volatile int *)loc);
//     // __usat (unsigned int, unsinged int sat 0-31)
//     int test24 = __usat(4, 4);
//     // __wfe 
//     __wfe();
//     // __wfi
//     __wfi();
//     // __yield
//     __yield();
//     unsigned int test25 = __vfp_status(5, 4);
// }

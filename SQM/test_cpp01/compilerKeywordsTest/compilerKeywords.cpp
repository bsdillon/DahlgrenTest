// using namespace std;

// int main()
// {
//     // __align
//     __align(8) char buffer[128];    
//     __align(16) int i; 
    
//     // __alignof__
//     return __alignof__(int);
    
//     // __int64
//     __int64 test1;
//     long long test 2;
// }

// // __ALIGNOF
// typedef struct s_foo { int i; short j; } foo;
// typedef __packed struct s_bar { int i; short j; } bar;
// return __ALIGNOF(struct s_foo); // returns 4
// return __ALIGNOF(foo);          // returns 4
// return __ALIGNOF(bar);          // returns 1

// // __asm
// int qadd(int i, int j)
// {
//     int res;
//     __asm
//     {
//         QADD   res, i, j
//     }
//     return res;
// }
// __asm void my_strcpy(const char *src, char *dst);
// int count __asm__("count_v1"); // export count_v1, not count
// register int foo __asm("r0");

// // __forceinline
// __forceinline static int max(int x, int y)
// {
//     return x > y ? x : y; // always inline if possible
// }

// // __global_reg
// __global_reg(2) int x; // r5 is reserved for x 
// __global_reg(1) int x=1; // error in C, OK in C++

// // __inline
// __inline int f(int x)
// {
//     return x*5+1;
// }
// int g(int x, int y)
// {
//     return f(x) + f(y);
// }

// // __INTADDR__
// struct S {
//   int a, b;
// };
// int d = __INTADDR__(struct S, b); // usually 4

// // __irq
// typedef void (*const vect_t)(void) __irq;

// vect_t vector_table[]
// __attribute__ ((section("vectors"))) = {
//   (vect_t) (RAM_BASE + RAM_SIZE),
//   (vect_t) Reset_Handler,
// };

// // packed
// typedef __packed struct
// {
//     char x;                   // all fields inherit the __packed qualifier
//     int y;
// } X;                          // 5 byte structure, natural alignment = 1
// int f(X *p)
// {
//     return p->y;              // does an unaligned read
// }
// typedef struct
// {
//     short x;
//     char y;
//     __packed int z;           // only pack this field
//     char a;
// } Y;                          // 8 byte structure, natural alignment = 2
// int g(Y *p)
// {
//     return p->z + p->x;       // only unaligned read for z
// }

// // __pure
// int factr(int n) __pure
// {
//     int f = 1;
//     while (n > 0)
//         f *= n--;
//     return f;
// }

// // __smc
// __smc(5) void mycall(void); /* declare a name by which SMC #5 can be called */
// mycall();                   /* invoke the function */

// // __softfp
// __softfp float test1()
// {
//     return;
// }

// // __svc
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

// // __svc_indirect
// int __svc_indirect(0) ioctl(int svcino, int fn, void *argp);

// // __svc_indirect_r7
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
//     printf("ptr value = %d\n", *ptr); // error
// }

// // __declspec(noinline)
// /* Prevent y being used for optimization */
// __declspec(noinline) const int y = 5;
// /* Suppress inlining of foo() wherever foo() is called */
// __declspec(noinline) int foo(void);

// // __declspec(noreturn)
// __declspec(noreturn) void overflow(void); // called on overflow
        
// int negate(int x) 
// {
//     if (x == 0x80000000) overflow();
//     return -x;
// }

// void overflow(void)
// {
//     __asm {
//         SVC 0x123; // hypothetical exception-throwing system service
//     }
//     while (1);
// }

// // __declspec(nothrow)
// struct S
// {
//     ~S();
// };
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


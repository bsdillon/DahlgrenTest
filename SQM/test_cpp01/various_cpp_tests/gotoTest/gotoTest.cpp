#include <iostream>
 
struct Object {
    // non-trivial destructor
    ~Object() { std::cout << "d"; }
};

struct Object2 {
    int m_i;
    int m_j;
    int m_k;

    Object2(int i, int j, int k) 
    {
        m_i = i;
        m_j = j;
        m_k = k;
    }
    void Something() {  }
    int getI() { return m_i; }
    int getJ() { return m_j; }
    int getK() { return m_k; }
};
 
//struct Trivial {
//    double d1;
//    double d2;
//}; // trivial ctor and dtor
 
int main()
{

    /*
    int a = 10;
 
    // loop using goto
label:
    Object obj;
    std::cout << a << " ";
    a = a - 2;
 
    if (a != 0) {
        goto label;  // jumps out of scope of obj, calls obj destructor
    }
    std::cout << '\n';
 
    // goto can be used to leave a multi-level loop easily
    for (int x = 0; x < 3; x++) {
        for (int y = 0; y < 3; y++) {
            std::cout << "(" << x << ";" << y << ") " << '\n';
            if (x + y >= 3) {
                goto endloop;
            }
        }
    }
endloop:
    std::cout << '\n';
 
    goto label2; // jumps into the scope of n and t
    int n; // no initializer
    Trivial t; // trivial ctor/dtor, no initializer
//  int x = 1; // error: has initializer
//  Object obj2; // error: non-trivial dtor
label2:
 
    {
        Object obj3;
        goto label3; // jumps forward, out of scope of obj3
    }
label3: ;

    */
   return 0;
 
}
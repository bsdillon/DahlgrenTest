#include <iostream>

int main()
{
    int b = 1;
    int a;

    a = b;
    a += b;
    a -= b;
    a *= b;
    a /= b;
    a %= b;
    a &= b;
    a |= b;
    a ^= b;
    a <<= b;
    a >>= b;

    ++a;
    --a;
    a++;
    a--;

    +a;
    -a;
    a + b;
    a - b;
    a * b;
    a / b;
    a % b;
    ~a;
    a & b;
    a | b;
    a ^ b;
    a << b;
    a >> b;

    !a;
    a && b;
    a || b;

    a == b;
    a != b;
    a < b;
    a > b;
    a >= b;
    a <= b;

    return 0;
}

template <class T>
T GetMax (T a, T b) {
  T result;
  result = (a>b)? a : b;
  return (result);
}

int main()
{
    short x1 = 1, y1=1;
    short int x2 = 2, y2 = 2;
    signed short x3 = 3, y3=3;
    signed short int x4 = 4, y4=4;

    unsigned short x5 = 5, y5=5;
    unsigned short int x6 = 6, y6=6;

    int x7 = 7, y7=7;
    signed x8 = 8, y8=8;
    signed int x9 = 9, y9=9;

    unsigned x10 = 10, y10=10;
    unsigned int x11 = 11, y11=11;

    long x12 = 12, y12=12;
    long int x13 = 13, y13=13;
    signed long x14 = 14, y14=14;
    signed long int x15 = 15, y15=15;

    unsigned long x16 = 16, y16=16;
    unsigned long int x17 = 17, y17=17;

    long long x18 = 18, y18=18;
    long long int x19 = 19, y19=19;
    signed long long x20 = 20, y20=20;
    signed long long int x21 = 21, y21=21;

    unsigned long long x22 = 22, y22=22;
    unsigned long long int x23 = 23, y23=23;

    short z1=GetMax<short>(x1, y1);
    short int z2=GetMax<short int>(x2, y2);
    signed short z3=GetMax<signed short>(x3, y3);
    signed short int z4=GetMax<signed short int>(x4, y4);

    unsigned short z5=GetMax<unsigned short>(x5, y5);
    unsigned short int z6=GetMax<unsigned short int>(x6, y6);

    int z7=GetMax<int>(x7, y7);
    signed z8=GetMax<signed>(x8, y8);
    signed int z9=GetMax<signed int>(x9, y9);

    unsigned z10=GetMax<unsigned>(x10, y10);
    unsigned intz11=GetMax<unsigned int>(x11, y11);

    long z12=GetMax<long>(x12, y12);
    long int z13=GetMax<long int>(x13, y13);
    signed long z14=GetMax<signed long>(x14, y14);
    signed long int z15=GetMax<signed long int>(x15, y15);

    unsigned long z16=GetMax<unsigned long>(x16, y16);
    unsigned long int z17=GetMax<unsigned long int>(x17, y17);

    long long z18=GetMax<long long>(x18, y18);
    long long int z19=GetMax<long long int>(x19, y19);
    signed long long z20=GetMax<signed long long>(x20, y20);
    signed long long int z21=GetMax<signed long long int>(x21, y21);

    unsigned long long z22=GetMax<unsigned long long>(x22, y22);
    unsigned long long int z23=GetMax<unsigned long long int>(x23, y23);

    return 0;
}
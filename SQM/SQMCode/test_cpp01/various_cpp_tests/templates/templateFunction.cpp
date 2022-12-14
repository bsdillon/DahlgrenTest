// function template
#include <iostream>
using namespace std;


template <class T>
T GetMax (T a, T b) {
  T result;
  result = (a>b)? a : b;
  return (result);
}


int main () {

  
  signed int x1 = 1;
  unsigned int x2 = 2;
  short int x3 = 3;
  long int x4 = 4;

  signed short int x5 = 5;
  unsigned short int x6 = 6;
  signed long int x7 = 7;
  unsigned long int x8 = 8;

  signed long long x9 = 9;
  unsigned long long x10 = 10;

  long signed long x11 = 11;
  

  
  int a=1, b=2;
  long c=3, d=4;
  long long e=5, f=6;
  long int g = 7, h = 8;

  x1=GetMax<int>(a,b);
  x2=GetMax<long>(c,d);
  x3=GetMax<long long>(e, f);
  x4=GetMax<long int>(g, h);
  x5=GetMax<long signed int>(1, 2);
  x6=GetMax<long signed long>(3, 4);
  x7=GetMax<signed long long>(5, 6);

  n=GetMax(l,m);
  cout << k << endl;
  cout << n << endl;
  return 0;
}
// Use of scope resolution class inside another class.
#include<iostream>
using namespace std;

class outside
{
public:
      int x;
	  static int y;
      class inside
      {
      public:
            int x;
            static int y; 
            static int getY(){return y;}
			class deeperInside
			{
			public:
				int x;
				static int y;
			};
      };
};
int outside::inside::y = 5; 
int outside::inside::deeperInside::y = 10; 
  
int main(){
    outside A;
    outside::inside B;
	outside::inside::deeperInside C;
	int thisY = outside::inside::getY();
	outside::inside::y += 12;
}
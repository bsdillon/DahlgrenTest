#include <iostream>

using namespace std;

int main() {
	
  int brace{10};
  
  cout<<brace<<endl;
    
  int uniform[]{0,1,2};
  
  for (int i : uniform) {
      cout<<i<<endl;
  }
	
  return 0;
}
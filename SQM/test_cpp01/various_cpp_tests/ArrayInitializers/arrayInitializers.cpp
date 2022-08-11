#include <iostream>

using namespace std;

int main() {
	
  int nix [5];	
  int nothing [5] = {};
  int five [5] = {0,1,2,3,4};
  int unknown [] = {0,1,2,3,4,5,6,7,8,9};
  int uniform[]{0,1,2};
  int multi [3][2] = {{0,1}, {2,3}, {4,5}};
  
  int multiUnknown [][2] = {{0,1}, {0,1}, {2,3}, {4,5}};
  
  std::pair<int, int> *arrPos = new std::pair<int, int>[2];

  for (int i : uniform) {
      cout<<i<<endl;
  }
	
  return 0;
}
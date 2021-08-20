#include <vector>
#include <iostream>

int main() {
	
  // ArrayInvoke node check
  int array[3]{0,1,2};
  // For3Loop node check
  for(int i = 0; i <= 2; i++) {
	  std::cout << array[i] << std::endl;
  }
  
  int m, w;
  w = 2;
  
  for(m = 0; m <= w; ++m)
	  std::cout << array[m] << std::endl;
  
  // ForEachLoop
  for (int p : array) {
	  std::cout << p << std::endl;
  }
  
  std::vector<std::string> stringVec = {"yes","no","maybe","sometimes","often","perhaps"};
  
  for (std::string q : stringVec){
	  std::cout << q << std::endl;
  }
  
  int strCount = 0;
  
  for (std::string r : stringVec){
	  strCount+=1;
  }
  
  std::cout << strCount << std::endl;
  
  for (std::string s : stringVec){
	  for (std::string t : stringVec){
		  std::cout << s << ", well, " << t << std::endl;
	  }
  }
	
  return 0;
}
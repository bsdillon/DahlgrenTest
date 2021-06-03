
// g++ -o /tmp/main test_cpp01/main.cpp test_cpp01/func2.cpp && /tmp/main

#include <iostream>

#include "func2.hpp"

int main(int argc, char** argv) {
	
  int x = 0;
  int full = 9;
  
  std::cout << "Hello world!" << std::endl;

  std::cout << "Hello func2.cpp: " << func2_hello() << std::endl;

  ExampleClass ec;
  ec.setA(5);
  ec.setB(6);

  std::cout << "ec.a = " << ec.a << std::endl;
  std::cout << "ec.b = " << ec.b << std::endl;
  
  // While node check
  while(x <= full) {
  	x++;
  	std::cout << x << std::endl;
  }
  
  // ArrayInvoke node check
  int array[3]{0,1,2};
  // For3Loop node check
  for(int i = 0; i <= 2; i++) {
  	std::cout << array[i] << std::endl;
  }
  // ForEachLoop
  for (int i : array) {
	  std::cout << i << std::endl;
  }
  
  int value = 0;
  // Then, Else node check
  if (value == 0) {
	std::cout << "Value is 0" << std::endl;
  } else if (value == 1) {
	std::cout << "Value is 1" << std::endl;
  } else {
	std::cout << "Value is large or negative!" << std::endl;
  }
  // Switch node check
  switch(value) {
	case 0 :
		std::cout << "Value is 0" << std::endl;
		break;
	case 1 :
		std::cout << "Value is 1" << std::endl;
		break;
	default :
		std::cout << "Value is large or negative!" << std::endl;
  }
  // Trinary node check
  std::string result = (value == 0) ? "Value is 0" : "Value isn't 0?!";
  std::cout << result << std::endl;
  
  void * vPtr;
  vPtr = &x;
  std::cout << "vPtr = " << *(int *)vPtr << std::endl;
  std::cout << "vPtr = " << *(double *)vPtr << std::endl;
  vPtr = &full;
  std::cout << "vPtr = " << *(double *)vPtr << std::endl;

  return 0;
}



// g++ -o /tmp/main test_cpp01/main.cpp test_cpp01/func2.cpp && /tmp/main

#include <iostream>

#include "func2.hpp"

int main(int argc, char** argv) {
  
  std::cout << "Hello world!" << std::endl;

  std::cout << "Hello func2.cpp: " << func2_hello() << std::endl;

  ExampleClass ec;
  ec.setA(5);
  ec.setB(6);

  std::cout << "ec.a = " << ec.a << std::endl;
  std::cout << "ec.b = " << ec.b << std::endl;

  return 0;
}


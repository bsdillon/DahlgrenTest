#include <functional>
#include <iostream>
#include <vector>



void PrintValue(int value)
{
  std::cout << "Value: " << value << std::endl;
}

void ForEach (const std::vector<int>& values, void(*func)(int))
{
  for (int value : values)
  {
    func(value);
  }
}

void HelloWorld(int a, double b, char c)
{
  std::cout << "Hello world! " << a << b << c <<std::endl;
}


double (*addNumbers1)(double, double)
{
  [](double a, double b) {
    return (a + b);
  }
};

double addNumbers2 (double a, double b)
{
  return a + b;
}

// Using auto. Stores the lambda with its real type.
auto addNumbers3
{
  [](double a, double b) {
    return (a + b);
  }
};


int main()
{
  void(*function)(int, double, char) = HelloWorld;
  function(1, 2, 'c');

  std::vector<int> values = {1, 5, 4, 2, 3};
  ForEach(values, PrintValue);
  // Using std::function.
  
  std::function<double(double, double)> addNumbers4{ // 
    [](double a, double b) {
      return (a + b);
    }
  };

  std::cout << addNumbers1(1, 2) << std::endl;
  std::cout << addNumbers2(3, 4) << std::endl;
  std::cout << addNumbers3(5, 6) << std::endl;
  std::cout << addNumbers4(7, 8) << std::endl;
  
  return 0;
}
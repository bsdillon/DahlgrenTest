//#include <functional>
#include <iostream>
#include <vector>


/*
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
*/
void HelloWorld(int a)
{
  std::cout << "Hello world! " << a << std::endl;
}

int main()
{
  void(*function)(int) = HelloWorld;
  function(1);

  int x = 5;
  int* y = &x;
  std::cout << *y << std::endl;

  //std::vector<int> values = {1, 5, 4, 2, 3};
  //ForEach(values, PrintValue);

  /*
  // A regular function pointer. Only works with an empty capture clause (empty []).
  double (*addNumbers1)(double, double){
    [](double a, double b) {
      return (a + b);
    }
  };

  addNumbers1(1, 2);

  // Using std::function.
  std::function<double(double, double)> addNumbers2{ // 
    [](double a, double b) {
      return (a + b);
    }
  };

  addNumbers2(3, 4);

  // Using auto. Stores the lambda with its real type.
  auto addNumbers3{
    [](double a, double b) {
      return (a + b);
    }
  };

  addNumbers3(5, 6);
  */
  return 0;
}
#include <iostream>

class foo
{
    int i; 
public:
    void setData(int i)
    {
        this->i = i;
    }
    void print()
    {
        std::cout << "Value for i : " << this->i << std::endl;
    }
};

// Anonymous Class : Class is not having any name
class
{
    int i; 
public:
    void setData(int i)
    {
        this->i = i;
    }
    void print()
    {
        std::cout << "Value for i : " << this->i << std::endl;
    }
      
} obj1, obj2;    // multiple objects for anonymous class
  


// Driver function
int main()
{
    foo goo;
    obj1.setData(10);
    obj1.print();
  
    obj2.setData(20);
    obj2.print();
    return 0;
}
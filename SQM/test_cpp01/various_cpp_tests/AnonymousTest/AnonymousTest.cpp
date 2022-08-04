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
}foo1, foo2;

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
      
} Anon1, Anon2;    // multiple objects for anonymous class
  


// Driver function
int main()
{
    foo goo;
    Anon1.setData(10);
    Anon1.print();
  
    Anon2.setData(20);
    Anon2.print();
    return 0;
}
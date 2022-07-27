#include <iostream>
 
// Declare Base Class
class Base {
public:
    int a;
    virtual void Print() const;
    Base(int l) : a(l) {}
};

void Base::Print() const
{
    std::cout << "a = " << a << std::endl;
}

// Declare Derived Class
class Derived : public Base {
public:
    int a;
    
    Derived(int l) : Base(l), a(l) {}
};
 
// Driver Code
int main()
{
    // Initialise a Derived class goo
    Derived goo(1);
 
    // Assign value to Base class variable
    // via derived class
    goo.a = 4;
 
    std::cout << "Value from base class: "
         << goo.a << std::endl;
 
    return 0;
}
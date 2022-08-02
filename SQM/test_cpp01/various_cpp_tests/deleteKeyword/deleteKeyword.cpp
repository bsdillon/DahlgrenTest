#include <iostream>

class Test
{
public:
    Test()
    {
        std::cout << "Constructor executed" << std::endl;
    }
    ~Test()
    {
        std::cout << "Destructor executed";
    }
};

int main()
{
    // Allocating Heap memory
    Test* t = new Test();

    //Deallocate Heap memory
    delete t;

    return 0;
}
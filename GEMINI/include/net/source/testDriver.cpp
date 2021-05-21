#include <iostream>
#include "AllFieldsDriver_Test.h"
#include "abstractTest.h"
using namespace std;


int main()
{
    std::cout << "Testing AllFieldsDriver\n";
    AllFieldsDriver_Test test;
    test.testAllFieldsDriver();
    std::cout << "\nTesting AbstractDriver\n";
    AbstractDriverTest test2;
    test2.testAbstractDriver();
    std::cout << "\nDone!\n";
    return 0;
}


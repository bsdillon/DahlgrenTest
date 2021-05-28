#include <iostream>
#include "AllFieldsDriver_Test.h"
#include "abstractTest.h"
#include "AbstractDriverFactory.h"
#include "UserClass.h"
using namespace std;

// Set to  GEMINI/include/net/source for testing
#include <cassert>
#include <string>

int main()
{
    // AllFieldsDriver Test
    std::cout << "Testing AllFieldsDriver\n";
    AllFieldsDriver_Test test;
    test.testAllFieldsDriver();
    std::cout << "\nTesting AbstractDriver\n";
    AbstractDriverTest test2;
    test2.testAbstractDriver();

    // Factory Interface Impl Test
    std::cout << "\nTesting FactoryInterfaceImpl\n";
    FactoryInterfaceImpl impl;
    assert(impl.GetTopicCount() == 3);
    assert(impl.GetTopicList().at(0).compare("tmp") == 0);
    assert(impl.GetTopicFactories().size() == 3);

    // AbstractDriverFactory Test
    std::cout << "Done!\nTesting AbstractDriverFactory\n";
    AbstractDriverFactory ab(0);
    ab.TopicList;
    ab.AppendTopic(impl);
    assert(ab.GetTopicCount() == 3);
    assert(ab.Factories.size() == 3);

    assert(ab.TopicList.size() == 3);
    assert(ab.GetTopicAtIndex(0).compare("tmp") == 0);

    //assert(ab.GetFactoryAtIndex(0).getMethodName(0).compare("myDouble") == 0);

    // UserClass Test
    /*
    std::cout << "Done!\nTesting UserClass\n";
    UserClass user;
    user.aFactory = ab;

    assert(user.GetTopicCount() == 3);
    assert(user.Factories.size() == 3);
    assert(user.TopicList.size() == 3);
    assert(user.GetTopicAt(0).compare("tmp") == 0);
    */
    std::cout << "Done!\n";

    return 0;
}


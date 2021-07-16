#include <stdio.h>
#include "AllFieldsDriver_Test.h"
#include "abstractTest.h"
#include "AbstractDriverFactory.h"

using namespace std;

// Set to  GEMINI/include/net/source for testing
#include <cassert>
#include <string>

int main()
{

    // AllFieldsDriver Test
    printf("Testing AllFieldsDriver\n");
    AllFieldsDriver_Test test;
    test.testAllFieldsDriver();
    printf("\nTesting AbstractDriver\n");
    AbstractDriverTest test2;
    test2.testAbstractDriver();

    // Factory Interface Impl Test
    printf("\nTesting FactoryInterfaceImpl\n");
    FactoryInterfaceImpl impl;
    assert(impl.GetTopicCount() == 3);
    assert(impl.GetTopicList().at(0).compare("tmp") == 0);
    assert(impl.GetTopicFactories().size() == 3);

    // AbstractDriverFactory Test
    printf("Done!\nTesting AbstractDriverFactory\n");
    AbstractDriverFactory ab(0);
    ab.TopicList;
    ab.AppendTopic(impl);
    assert(ab.GetTopicCount() == 3);
    assert(ab.Factories.size() == 3);

    assert(ab.TopicList.size() == 3);
    assert(ab.GetTopicAtIndex(0).compare("tmp") == 0);


    printf("Done!\nAll testing is finished!\n");

    return 0;
}

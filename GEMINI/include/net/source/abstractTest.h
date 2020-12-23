#ifndef MAIN_H
#define MAIN_H

#include "AllFields.h"
#include <cassert>
#include <iostream>
// #include "AllFields_Driver"


class AbstractDriverTest() {

public:
  void testAbstractDriver() {
    auto description = getTypeDescription(STD_STRING);
    assert(description == "STRING");

    auto description2 = getTypeDescription(DOUBLE);
    assert(description2 == "DOUBLE");

    bool exceptionThrown = false;
    try {
      getMethodName(0);
    }
    catch (ExceptionType&) {
      exceptionThrown = true;
    }
    assert(exceptionThrown);

    bool boolThrown = false;
    try {
      getBOOLMethod(1);
    }
    catch (ExceptionType&) {
      boolThrown = true;
    }
    assert(boolThrown);

    std::cout << "Done Testing! AbstractDriver is all good!\n";
  }

}

#endif

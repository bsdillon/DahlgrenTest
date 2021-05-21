#ifndef MAIN_H
#define MAIN_H

#include "AllFields.h"
#include <cassert>
#include <iostream>
#include <string>
// #include "AllFields_Driver"


class AbstractDriverTest {

public:
  void testAbstractDriver() {
    AbstractDriver ab;

    assert(ab.getTypeDescription(ab.BOOL).compare("BOOL") == 0);
    assert(ab.getTypeDescription(ab.INT8_T).compare("SIGNED 8 INT") == 0);

    bool boolThrown = false;
    try {
      ab.getBOOLMethod(1);
    }
    catch (DriverException &e) {
      boolThrown = true;
    }
    assert(boolThrown);

    std::cout << "Done Testing! AbstractDriver is all good!\n";
  }

};

#endif

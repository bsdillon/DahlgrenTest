#ifndef ALLFIELDSDRIVER_TEST_H
#define ALLFIELDSDRIVER_TEST_H

#include "AllFields.h"
#include "../drivers/AllFields_Driver.h"

#include <cassert>
#include <iostream>
#include <string>

using namespace std;

class AllFieldsDriver_Test {

    public:
      void testAllFieldsDriver() {
          // AllFields Test
          AllFields all;
          all.myDouble = 0.0;
          all.myBool = true;
          all.myLong = 123456;
          all.myShort = 12345;
          all.myChar = 'K';

          // AllFields_Driver test (factor)
          AllFields_Driver driver2;
          driver2.CreateDriver(all);

          // Test with AllFields (no factory)
          AllFields_Driver driver (all);

          // test get *Type* methods
          assert(driver.getDOUBLEMethod(0) == 0.0);
          assert(driver.getBOOLMethod(1));
          assert(driver.getSHORTMethod(2) == 12345);
          assert(driver.getLONGMethod(3) == 123456);
          assert(driver.getCHARMethod(4) == 'K');

          std::cout << "Get type methods returns expected results!\n";

          // test throws
          bool exceptionThrown = false;
          try
          {
            driver.getCHARMethod(0);
          }
          catch(DriverException &e)
          {
            exceptionThrown = true;
          }
          assert(exceptionThrown);
          std::cout << "Test throws a success!\n";
          // test getMethodName
          assert(driver.getMethodName(0).compare("myDouble") == 0);
          assert(driver.getMethodName(1).compare("myBool") == 0);
          assert(driver.getMethodName(2).compare("myShort") == 0);
          assert(driver.getMethodName(3).compare("myLong") == 0);
          assert(driver.getMethodName(4).compare("myChar") == 0);

          std::cout << "Finished testing! Passed!\n";
      }

};

#endif

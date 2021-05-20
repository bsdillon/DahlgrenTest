#ifndef ALLFIELDSDRIVER_TEST_H
#define ALLFIELDSDRIVER_TEST_H

#include "AllFields.h"
#include "../drivers/AllFields_Driver.h"

#include <cassert>
#include <iostream>
#include <string>

class AllFieldsDriver_Test() {
    public:
      void testAllFieldsDriver() {
          // AllFields Test
          AllFields all;
          all.myDouble = 0.0;
          all.myBool = true;
          all.myLong = 123456;
          all.myShort = 12345;
          all.myChar = 'K';
          all.myInt = 0;

          // AllFields_Driver test
          AllFields_Driver driver;
          driver.source = all;

          assert(driver.get_myDouble == 0.0);
          assert(driver.get_myBool);
          assert(driver.get_myShort == 12345);
          assert(driver.get_myLong == 123456);
          assert(driver.get_myChar == 'K');
          assert(driver.get_myInt == 0);

          assert(driver.getMethodName(0).compare("myDouble") == 0);
          assert(driver.getMethodName(1).compare("myBool") == 0);
          assert(driver.getMethodName(2).compare("myShort") == 0);
          assert(driver.getMethodName(3).compare("myLong") == 0);
          assert(driver.getMethodName(4).compare("myChar") == 0);
          assert(driver.getMethodName(5).compare("myInt") == 0);
          
          std::cout << "Finished testing!\n";
      }
}

#endif

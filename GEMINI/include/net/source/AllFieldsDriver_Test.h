#ifndef ALLFIELDSDRIVER_TEST_H
#define ALLFIELDSDRIVER_TEST_H

#include "AllFields.h"
#include "../drivers/AllFields_Driver.h"

class AllFieldsDriver_Test() {
    public:
        void test() {
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

            std::cout << "my double: " << driver.get_myDouble << " " << getMethodName(0) << "\n";
            std::cout << "my bool: " << driver.get_myBool << " " << getMethodName(1) << "\n";
            std::cout << "my short: " << driver.get_myShort << " " << getMethodName(2) << "\n";
            std::cout << "my long: " << driver.get_myLong << " " << getMethodName(3) << "\n";
            std::cout << "my char: " << driver.get_myChar << " " << getMethodName(4) << "\n";
            std::cout << "my int: " << driver.get_myInt << " " << getMethodName(5) << "\n";
        }

}

#endif
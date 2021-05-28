#ifndef TestFields_Driver_H
#define TestFields_Driver_H

#include <cstdio>
#include <memory>
#include <string>
#include "AbstractEnum.h"
#include "../source/abstractdriver.h"
#include "DriverException.h"
#include "../source/TestField.h"

class TestFields_Driver: public virtual AbstractDriver
{
  private:
    bool factory;

    TestFields source;

    double get_myDouble() {
      return (double)source.myDouble;
    }

    char get_myChar() {
      return (char)source.myChar;
    }

  public:
    TestFields_Driver() {factory = true;}

    std::unique_ptr<AbstractDriver> CreateDriver(TestFields p) {
      if (!factory) {
        throw DriverException("CreateDriver() is only valid from factory instances of TestFields_Driver", DriverException::Level::UnstableProgram);
      }
      return std::move(std::unique_ptr<AbstractDriver>(new TestFields_Driver(p)));
    }

    std::unique_ptr<AbstractDriver> CreateDriver(const Message* p) {
      if (!factory) {
        throw DriverException("CreateDriver() is only valid from factory instances of TestFields_Driver", DriverException::Level::UnstableProgram);
      }
      TestFields* tmp = (TestFields*)p;
      auto answer = this->CreateDriver(*tmp);
      return std::move(answer);
    }

    TestFields_Driver(TestFields s) {
      factory = false;
      source = s;
      signatures = std::vector<AbstractDriver::ReturnTypes>(2);
      signatures[0] = DOUBLE;
      signatures[1] = CHAR;

      methodCount = 2;
    }

    ~TestFields_Driver() { }

    TestFields* CreateRandom() {
      if (!factory) {
        throw DriverException("CreateDriver() is only valid from factory instances of TestFields_Driver", DriverException::Level::UnstableProgram);
      }

      return new TestFields();
    }

    int getMethodArrayCount(int index) {
      switch (index) {
      }
      std::string msg = "TestFields_Driver has no array method at index ";
      msg.append(std::to_string(index));
      throw DriverException(msg, DriverException::Level::DataLoss);
    }

    double getDOUBLEMethod(int index) {
      switch (index) {
        case 0:
          return get_myDouble();
      }
      std::string msg = "TestFields_Driver has no DOUBLE method at index ";
      msg.append(std::to_string(index));
      throw DriverException(msg, DriverException::Level::DataLoss);
    }

    char getCHARMethod(int index) {
      switch (index) {
        case 1:
          return get_myChar();
      }
      std::string msg = "TestFields_Driver has no CHAR method at index ";
      msg.append(std::to_string(index));
      throw DriverException(msg, DriverException::Level::DataLoss);
    }

    std::string getMethodName(int index) {
      switch (index) {
        case 0:
          return "myDouble";
        case 1:
          return "myChar";
      }
      std::string msg = "TestFields_Driver has no member at index ";
      msg.append(std::to_string(index));
      throw DriverException(msg, DriverException::Level::DataLoss);
    }
};
#endif

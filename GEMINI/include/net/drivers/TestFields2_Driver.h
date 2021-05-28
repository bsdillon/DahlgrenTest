#ifndef TestFields2_Driver_H
#define TestFields2_Driver_H

#include <cstdio>
#include <memory>
#include <string>
#include "AbstractEnum.h"
#include "../source/abstractdriver.h"
#include "DriverException.h"
#include "../source/TestFields2.h"

class TestFields2_Driver: public virtual AbstractDriver
{
  private:
    bool factory;

    TestFields2 source;

    short get_myShort() {
      return (short)source.myShort;
    }

    long get_myLong() {
      return (long)source.myLong;
    }

  public:
    TestFields2_Driver() {factory = true;}

    std::unique_ptr<AbstractDriver> CreateDriver(TestFields2 p) {
      if (!factory) {
        throw DriverException("CreateDriver() is only valid from factory instances of TestFields2_Driver", DriverException::Level::UnstableProgram);
      }
      return std::move(std::unique_ptr<AbstractDriver>(new TestFields2_Driver(p)));
    }

    std::unique_ptr<AbstractDriver> CreateDriver(const Message* p) {
      if (!factory) {
        throw DriverException("CreateDriver() is only valid from factory instances of TestFields2_Driver", DriverException::Level::UnstableProgram);
      }
      TestFields2* tmp = (TestFields2*)p;
      auto answer = this->CreateDriver(*tmp);
      return std::move(answer);
    }

    TestFields2_Driver(TestFields2 s) {
      factory = false;
      source = s;
      signatures = std::vector<AbstractDriver::ReturnTypes>(2);
      signatures[0] = SHORT;
      signatures[1] = LONG;

      methodCount = 2;
    }

    ~TestFields2_Driver() { }

    TestFields2* CreateRandom() {
      if (!factory) {
        throw DriverException("CreateDriver() is only valid from factory instances of TestFields2_Driver", DriverException::Level::UnstableProgram);
      }

      return new TestFields2();
    }

    int getMethodArrayCount(int index) {
      switch (index) {
      }
      std::string msg = "TestFields2_Driver has no array method at index ";
      msg.append(std::to_string(index));
      throw DriverException(msg, DriverException::Level::DataLoss);
    }

    short getSHORTMethod(int index) {
      switch (index) {
        case 0:
          return get_myShort();
      }
      std::string msg = "TestFields2_Driver has no SHORT method at index ";
      msg.append(std::to_string(index));
      throw DriverException(msg, DriverException::Level::DataLoss);
    }

    long getLONGMethod(int index) {
      switch (index) {
        case 1:
          return get_myLong();
      }
      std::string msg = "TestFields2_Driver has no LONG method at index ";
      msg.append(std::to_string(index));
      throw DriverException(msg, DriverException::Level::DataLoss);
    }

    std::string getMethodName(int index) {
      switch (index) {
        case 0:
          return "myShort";
        case 1:
          return "myLong";
      }
      std::string msg = "TestFields2_Driver has no member at index ";
      msg.append(std::to_string(index));
      throw DriverException(msg, DriverException::Level::DataLoss);
    }
};
#endif

#ifndef AllFields_Driver_H
#define AllFields_Driver_H

#include <cstdio>
#include <memory>
#include <string>
#include "AbstractEnum.h"
#include "../source/abstractdriver.h"
#include "DriverException.h"
#include "../source/AllFields.h"

class AllFields_Driver: public virtual AbstractDriver
{
  private:
    bool factory;

    AllFields source;

    double get_myDouble() {
      return (double)source.myDouble;
    }

    bool get_myBool() {
      return (bool)source.myBool;
    }

    short get_myShort() {
      return (short)source.myShort;
    }

    long get_myLong() {
      return (long)source.myLong;
    }

    char get_myChar() {
      return (char)source.myChar;
    }

  public:
    AllFields_Driver() {factory = true;}

    std::unique_ptr<AbstractDriver> CreateDriver(AllFields p) {
      if (!factory) {
        throw DriverException("CreateDriver() is only valid from factory instances of AllFields_Driver", DriverException::Level::UnstableProgram);
      }
      return std::move(std::unique_ptr<AbstractDriver>(new AllFields_Driver(p)));
    }

    std::unique_ptr<AbstractDriver> CreateDriver(const Message* p) {
      if (!factory) {
        throw DriverException("CreateDriver() is only valid from factory instances of AllFields_Driver", DriverException::Level::UnstableProgram);
      }
      AllFields* tmp = (AllFields*)p;
      auto answer = this->CreateDriver(*tmp);
      return std::move(answer);
    }

    AllFields_Driver(AllFields s) {
      factory = false;
      source = s;
      signatures = std::vector<AbstractDriver::ReturnTypes>(5);
      signatures[0] = DOUBLE;
      signatures[1] = BOOL;
      signatures[2] = SHORT;
      signatures[3] = LONG;
      signatures[4] = CHAR;

      methodCount = 5;
    }

    ~AllFields_Driver() { }

    AllFields* CreateRandom() {
      if (!factory) {
        throw DriverException("CreateDriver() is only valid from factory instances of AllFields_Driver", DriverException::Level::UnstableProgram);
      }

      return new AllFields();
    }

    int getMethodArrayCount(int index) {
      switch (index) {
      }
      std::string msg = "AllFields_Driver has no array method at index ";
      msg.append(std::to_string(index));
      throw DriverException(msg, DriverException::Level::DataLoss);
    }

    double getDOUBLEMethod(int index) {
      switch (index) {
        case 0:
          return get_myDouble();
      }
      std::string msg = "AllFields_Driver has no DOUBLE method at index ";
      msg.append(std::to_string(index));
      throw DriverException(msg, DriverException::Level::DataLoss);
    }

    bool getBOOLMethod(int index) {
      switch (index) {
        case 1:
          return get_myBool();
      }
      std::string msg = "AllFields_Driver has no BOOL method at index ";
      msg.append(std::to_string(index));
      throw DriverException(msg, DriverException::Level::DataLoss);
    }

    short getSHORTMethod(int index) {
      switch (index) {
        case 2:
          return get_myShort();
      }
      std::string msg = "AllFields_Driver has no SHORT method at index ";
      msg.append(std::to_string(index));
      throw DriverException(msg, DriverException::Level::DataLoss);
    }

    long getLONGMethod(int index) {
      switch (index) {
        case 3:
          return get_myLong();
      }
      std::string msg = "AllFields_Driver has no LONG method at index ";
      msg.append(std::to_string(index));
      throw DriverException(msg, DriverException::Level::DataLoss);
    }

    char getCHARMethod(int index) {
      switch (index) {
        case 4:
          return get_myChar();
      }
      std::string msg = "AllFields_Driver has no CHAR method at index ";
      msg.append(std::to_string(index));
      throw DriverException(msg, DriverException::Level::DataLoss);
    }

    std::string getMethodName(int index) {
      switch (index) {
        case 0:
          return "myDouble";
        case 1:
          return "myBool";
        case 2:
          return "myShort";
        case 3:
          return "myLong";
        case 4:
          return "myChar";
      }
      std::string msg = "AllFields_Driver has no member at index ";
      msg.append(std::to_string(index));
      throw DriverException(msg, DriverException::Level::DataLoss);
    }
};
#endif

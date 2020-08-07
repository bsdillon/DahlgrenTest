#ifndef ABSTRACTDRIVER_H
#define ABSTRACTDRIVER_H

#include "qstring.h"
#include "net/driverexception.h"
#include "memory"

#import "vector"
#import "net/message.h"

class AbstractEnum
{
public:
    std::string MapEnum();
};

class AbstractDriver
{
protected:
  int myID = 0;

public:
  virtual ~AbstractDriver() { }
  int getID() {return myID;}

    enum ReturnTypes
    {
        UNSIGNED_SHORT,
        UNSIGNED_CHAR,
        BOOL,
        FLOAT,
        CHAR,
        LONG,
        SHORT,
        LONG_LONG,
        UNSIGNED_LONG,
        SIGNED_CHAR,
        DOUBLE,
        STD_STRING,
        SHORTPOINTER,
        CHARPOINTER,
        ABSTRACTENUMPOINTER,
        ABSTRACTDRIVERPOINTER,
        ABSTRACTDRIVERDOUBLEPOINTER,
        ABSTRACTENUMDOUBLEPOINTER
    };

protected:
  std::vector<ReturnTypes> signatures;
  int methodCount;

public:
  const std::vector<ReturnTypes>& getMethodTypes() {return signatures;}

  int getMethodCount() {return methodCount;}

  std::infrastructureservices::common::Message_T* CreateRandom() {
    throw DriverException("AbstractDriver has no valid use for CreateRandom()",
      DriverException:Level::UnstableProgram);
  }
  std::unique_ptr<AbstractDriver> CreateDriver(const Message*)
  {
    throw DriverException("AbstractDriver has no valid use for CreateDriver()",
            DriverException::Level::UnstableProgram);
  }
  long getMessageArrival();
  int getMethodCount();
  ReturnTypes* getMethodTypes();
  std::string getTypeDescription(ReturnTypes r)
  {
    switch ((int)r) {
      case ABSTRACTDRIVERPOINTER:
        return "";
      case ABSTRACTENUMPOINTER:
        return "ENUM";
      case ABSTRACTDRIVERDOUBLEPOINTER:
        return "[]";
      case BOOL:
        return "BOOL";
      case LONG:
        return "LONG";
      case UNSIGNED_SHORT:
        return "UNSIGNED SHORT";
      case UNSIGNED_CHAR:
        return "UNSIGNED CHAR";
      case FLOAT:
        return "FLOAT";
      case CHAR:
        return "CHAR";
      case CHARPOINTER:
        return "CHAR";
      case SHORT:
        return "SHORT";
      case DOUBLE:
        return "DOUBLE";
      case UNSIGNED_LONG:
        return "UNSIGNED LONG";
      case LONG_LONG:
        return "LONG LONG";
      case SIGNED_CHAR:
        return "SIGNED CHAR";
      case STD_STRING:
        return "STRING";
      case SHORTPOINTER:
        return "SHORT";
      case ABSTRACTENUMDOUBLEPOINTER:
        return "ENUM[]";
    }
    std::string msg = "No type description found for";
    msg.append(std::to_string(r));
    throw DriverException(msg, DriverException::Level::UnstableProgram);
  }
  std::string getMethodName(int index)
  {
    std::string msg = "AbstractDriver has no member at inded ";
    msg.append(std::to_string(index));
    throw DriverException(msg, DriverException::Level::UnstableProgram);
  }
  unsigned short getUNSIGNED_SHORTMethod(int);
  unsigned char getUNSIGNED_CHARMethod(int);
  bool getBOOLMethod(int index) {
    std::string msg = "AbstractDriver has no BOOL method at index ";
    msg.append(std::to_string(index));

  }
  float getFLOATMethod(int);
  char getCHARMethod(int);
  long getLONGMethod(int);
  short getSHORTMethod(int);
  long long getLONG_LONGMethod(int);
  unsigned long getUNSIGNED_LONGMethod(int);
  signed char getSIGNED_CHARMethod(int);
  double getDOUBLEMethod(int);
  std::string getSTD_STRINGMethod(int);
  std::unique_ptr<short[]> getSHORTPOINTERMethod(int);
  std::unique_ptr<char[]> getCHARPOINTERMethod(int);
  AbstractEnum* getABSTRACTENUMPOINTERMethod(int index)
  {
    std::string msg = "AbstractDriver has no ABSTRACTENUMPOINTER method at index ";
    msg.append(std::to_string(index));
    throw DriverException(msg, DriverException::Level::UnstableProgram);
  }
  AbstractDriver* getABSTRACTDRIVERPOINTERMethod(int index)
  {
    std::string msg = "AbstractDriver has no ABSTRACTDRIVERPOINTER method at index ";
    msg.append(std::to_string(index));
    throw DriverException(msg, DriverException::Level::UnstableProgram);
  }
  AbstractDriver** getABSTRACTDRIVERDOUBLEPOINTERMethod(int index) {
    std::string msg = "AbstractDriver has no ABSTRACTDRIVERDOUBLEPOINTER method at index ";
    msg.append(std::to_string(index));
    throw DriverException(msg, DriverException::Level::UnstableProgram);
  }
  AbstractEnum** getABSTRACTENUMDOUBLEPOINTERMethod(int);
  int getMethodArrayCount(int) {
    throw DriverException("AbstractDriver has no array counts",
      DriverException::Level::UnstableProgram);
  }

};

#endif // ABSTRACTDRIVER_H

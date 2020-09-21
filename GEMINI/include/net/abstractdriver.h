#ifndef ABSTRACTDRIVER_H
#define ABSTRACTDRIVER_H

#include "qstring.h"
#include "net/driverexception.h"
#include "memory"

#include "vector"
#include "net/message.h"

class AbstractEnum
{
public:
    std::string MapEnum(){}
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
        ABSTRACTENUMDOUBLEPOINTER,
        INT8_T,
        INT16_T,
        INT32_T,
        INT64_T,
        UINT8_T,
        UINT16_T,
        UINT32_T,
        UINT64_T,
        LONG_DOUBLE,
        SIGNED_LONG
    };

protected:
 // std::vector<ReturnTypes> signatures;
  int methodCount;
  ReturnTypes* signatures;

public:
 // const std::vector<ReturnTypes>& getMethodTypes() {return signatures;}

  int getMethodCount() {return methodCount;}

  /*std::infrastructureservices::common::Message_T* CreateRandom() {
    throw DriverException("AbstractDriver has no valid use for CreateRandom()",
      DriverException::Level::UnstableProgram);
  }*/

  std::unique_ptr<AbstractDriver> CreateDriver(const Message*)
  {
    throw DriverException("AbstractDriver has no valid use for CreateDriver()",
            DriverException::Level::UnstableProgram);
  }
  long getMessageArrival(){}
  ReturnTypes* getMethodTypes() {return signatures;}

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
      case INT8_T:
        return "SIGNED 8 INT";
      case INT16_T:
        return "SIGNED 16 INT";
      case INT32_T:
        return "SIGNED 32 INT";
      case INT64_T:
        return "SIGNED 64 INT";
      case UINT8_T:
        return "UNSIGNED 8 INT";
      case UINT16_T:
        return "UNSIGNED 16 INT";
      case UINT32_T:
        return "UNSIGNED 32 INT";
      case UINT64_T:
        return "UNSIGNED 64 INT";
      case LONG_DOUBLE:
        return "LONG DOUBLE";
      case SIGNED_LONG:
        return "SIGNED LONG";
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
  unsigned short getUNSIGNED_SHORTMethod(int){}
  unsigned char getUNSIGNED_CHARMethod(int){}
  bool getBOOLMethod(int index) {
    std::string msg = "AbstractDriver has no BOOL method at index ";
    msg.append(std::to_string(index));
  }
  float getFLOATMethod(int index)
  {
    std::string msg = "AbstractDriver has no FLOAT method at index ";
    msg.append(std::to_string(index));
    throw DriverException(msg, DriverException::Level::UnstableProgram);
  }
  char getCHARMethod(int index)
  {
    std::string msg = "AbstractDriver has no CHAR method at index ";
    msg.append(std::to_string(index));
    throw DriverException(msg, DriverException::Level::UnstableProgram);
  }
  long getLONGMethod(int index)
  {
    std::string msg = "AbstractDriver has no LONG method at index ";
    msg.append(std::to_string(index));
    throw DriverException(msg, DriverException::Level::UnstableProgram);
  }
  short getSHORTMethod(int index)
  {
    std::string msg = "AbstractDriver has no SHORT method at index ";
    msg.append(std::to_string(index));
    throw DriverException(msg, DriverException::Level::UnstableProgram);
  }
  long long getLONG_LONGMethod(int index)
  {
    std::string msg = "AbstractDriver has no LONG LONG method at index ";
    msg.append(std::to_string(index));
    throw DriverException(msg, DriverException::Level::UnstableProgram);
  }
  unsigned long getUNSIGNED_LONGMethod(int index)
  {
    std::string msg = "AbstractDriver has no UNSIGNED LONG method at index ";
    msg.append(std::to_string(index));
    throw DriverException(msg, DriverException::Level::UnstableProgram);
  }
  signed char getSIGNED_CHARMethod(int index)
  {
    std::string msg = "AbstractDriver has no SIGNED CHAR method at index ";
    msg.append(std::to_string(index));
    throw DriverException(msg, DriverException::Level::UnstableProgram);
  }
  double getDOUBLEMethod(int index)
  {
    std::string msg = "AbstractDriver has no DOUBLE method at index ";
    msg.append(std::to_string(index));
    throw DriverException(msg, DriverException::Level::UnstableProgram);
  }
  std::string getSTD_STRINGMethod(int index)
  {
    std::string msg = "AbstractDriver has no STD STRING method at index ";
    msg.append(std::to_string(index));
    throw DriverException(msg, DriverException::Level::UnstableProgram);
  }
  std::unique_ptr<short[]> getSHORTPOINTERMethod(int){}
  std::unique_ptr<char[]> getCHARPOINTERMethod(int){}
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
  AbstractEnum** getABSTRACTENUMDOUBLEPOINTERMethod(int index)
  {
    std::string msg = "AbstractDriver has no ABSTRACTENUMDOUBLEPOINTER method at index ";
    msg.append(std::to_string(index));
    throw DriverException(msg, DriverException::Level::UnstableProgram);
  }
  int getMethodArrayCount(int) {
    throw DriverException("AbstractDriver has no array counts",
      DriverException::Level::UnstableProgram);
  }

  // New enums getters Kurt added
  signed long getSIGNED_LONGMethod(int index) {
    std::string msg = "AbstractDriver has no SIGNED LONG method at index ";
    msg.append(std::to_string(index));
    throw DriverException(msg, DriverException::Level::UnstableProgram);
  }
  int8_t getINT_8Method(int index) {
    std::string msg = "AbstractDriver has no 8 SIGNED INT at index ";
    msg.append(std::to_string(index));
    throw DriverException(msg, DriverException::Level::UnstableProgram);
  }

  int16_t getINT_16Method(int index) {
    std::string msg = "AbstractDriver has no 16 SIGNED INT at index ";
    msg.append(std::to_string(index));
    throw DriverException(msg, DriverException::Level::UnstableProgram);
  }

  int32_t getINT_32Method(int index) {
    std::string msg = "AbstractDriver has no 32 SIGNED INT at index ";
    msg.append(std::to_string(index));
    throw DriverException(msg, DriverException::Level::UnstableProgram);
  }

  int64_t getINT_64Method(int index) {
    std::string msg = "AbstractDriver has no 64 SIGNED INT at index ";
    msg.append(std::to_string(index));
    throw DriverException(msg, DriverException::Level::UnstableProgram);
  }

  uint8_t getUINT_8Method(int index) {
    std::string msg = "AbstractDriver has no 8 UNSIGNED INT at index ";
    msg.append(std::to_string(index));
    throw DriverException(msg, DriverException::Level::UnstableProgram);
  }

  uint16_t getUINT_16Method(int index) {
    std::string msg = "AbstractDriver has no 16 UNSIGNED INT at index ";
    msg.append(std::to_string(index));
    throw DriverException(msg, DriverException::Level::UnstableProgram);
  }

  uint32_t getUINT_32Method(int index) {
    std::string msg = "AbstractDriver has no 32 UNSIGNED INT at index ";
    msg.append(std::to_string(index));
    throw DriverException(msg, DriverException::Level::UnstableProgram);
  }

  uint64_t getUINT_64Method(int index) {
    std::string msg = "AbstractDriver has no 64 UNSIGNED INT at index ";
    msg.append(std::to_string(index));
    throw DriverException(msg, DriverException::Level::UnstableProgram);
  }



};

#endif // ABSTRACTDRIVER_H

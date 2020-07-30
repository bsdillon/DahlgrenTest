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
public:
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

    std::unique_ptr<AbstractDriver> CreateDriver(const Message*);
    long getMessageArrival();
    int getMethodCount();
    ReturnTypes* getMethodTypes();
    std::string getTypeDescription(ReturnTypes);
    std::string getMethodName(int);
    unsigned short getUNSIGNED_SHORTMethod(int);
    unsigned char getUNSIGNED_CHARMethod(int);
    bool getBOOLMethod(int);
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
    AbstractEnum* getABSTRACTENUMPOINTERMethod(int);
    AbstractDriver* getABSTRACTDRIVERPOINTERMethod(int);
    AbstractDriver** getABSTRACTDRIVERDOUBLEPOINTERMethod(int);
    AbstractEnum** getABSTRACTENUMDOUBLEPOINTERMethod(int);
    int getMethodArrayCount(int);
};

#endif // ABSTRACTDRIVER_H

#ifndef DRIVEREXCEPTION_H
#define DRIVEREXCEPTION_H

#import "exception"
#import "qstring.h"

class DriverException : public std::exception
{
public:
  std::string InterpretLevel() const;
  std::string getMessage() const;
};

#endif // DRIVEREXCEPTION_H

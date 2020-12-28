#ifndef EMPTYDRIVER_H
#define EMPTYDRIVER_H

#include "AbstractDriver.h"

class EmptyDriver: public AbstractDriver
{
  public:
    EmptyDriver() {
      signatures = std::vector<AbstractDriver::ReturnTypes>(0);
      methodCount = 0;
    }
};
#endif

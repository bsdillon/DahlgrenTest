#ifndef ABSTRACTENUM_H
#define ABSTRACTENUM_H

#include <string>

class AbstractEnum
{
  public:
    virtual std::string MapEnum()
    {
      return "UNKNOWN_VALUE";
    }
};
#endif
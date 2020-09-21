#ifndef DRIVERFACTORY_H
#define DRIVERFACTORY_H

#include "qstring.h"
#include "net/abstractdriver.h"

class DriverFactory
{
public:
  static std::vector<std::string> GetTopicList() {}
  static std::unique_ptr<AbstractDriver> GetTopicFactory(int) {}
};

#endif // DRIVERFACTORY_H

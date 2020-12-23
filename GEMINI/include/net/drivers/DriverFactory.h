#ifndef DRIVERFACTORY_H
#define DRIVERFACTORY_H

#include <memory>
#include <vector>

#include "AbstractDriver.h"
#include "DriverException.h"

class DriverFactory
{
  public:
    static int GetTopicCount() {return 0;}

    static std::vector<std::string> GetTopicList() {
      auto answer = std::vector<std::string>(0);

      return answer;
    }

    static std::unique_ptr<AbstractDriver> GetTopicFactory(int index) {
      std::unique_ptr<AbstractDriver> answer;
      switch (index) {
      }

      return std::move(answer);
    }
};
#endif

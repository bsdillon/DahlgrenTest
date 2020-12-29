#ifndef DRIVERFACTORY_H
#define DRIVERFACTORY_H

#include <memory>
#include <vector>

#include "AbstractDriver.h"
#include "DriverException.h"
#include "AllFields_Driver.h"

class DriverFactory
{
  public:
    static int GetTopicCount() {return 2;}

    static std::vector<std::string> GetTopicList() {
      auto answer = std::vector<std::string>(2);
      answer[0] = "tmp";
      answer[1] = "tmp";

      return answer;
    }

    static std::unique_ptr<AbstractDriver> GetTopicFactory(int index) {
      std::unique_ptr<AbstractDriver> answer;
      switch (index) {
        case 0:
          answer = std::unique_ptr<AbstractDriver>(new AllFields_Driver());
          break;
        case 1:
          answer = std::unique_ptr<AbstractDriver>(new AllFields_Driver());
          break;
      }

      return std::move(answer);
    }
};
#endif

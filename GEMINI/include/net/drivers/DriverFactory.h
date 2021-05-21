#ifndef DRIVERFACTORY_H
#define DRIVERFACTORY_H

#include "../source/abstractdriver.h"
#include "DriverException.h"
#include "FactoryInterface.h"
#include "AllFields_Driver.h"

class DriverFactory: public virtual FactoryInterface
{
  public:
    static int GetTopicCount() {return 1;}

    static std::vector<std::string> GetTopicList() {
      auto answer = std::vector<std::string>(1);
      answer[0] = "tmp";

      return answer;
    }

    static std::unique_ptr<AbstractDriver> GetTopicFactory(int index) {
      std::unique_ptr<AbstractDriver> answer;
      switch (index) {
        case 0:
          answer = std::unique_ptr<AbstractDriver>(new AllFields_Driver());
          break;
      }

      return std::move(answer);
    }
};
#endif

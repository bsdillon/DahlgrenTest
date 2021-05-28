#ifndef DRIVERFACTORY_H
#define DRIVERFACTORY_H

#include "../source/abstractdriver.h"
#include "DriverException.h"
#include "AllFields_Driver.h"
#include "TestFields_Driver.h"
#include "TestFields2_Driver.h"

class DriverFactory
{
  public:
    static int GetTopicCount() {return 3;}

    static std::vector<std::string> GetTopicList() {
      auto answer = std::vector<std::string>(3);
      answer[0] = "tmp";
      answer[1] = "tmp2";
      answer[2] = "tmp3";

      return answer;
    }

    static std::unique_ptr<AbstractDriver> GetTopicFactory(int index) {
      std::unique_ptr<AbstractDriver> answer;
      switch (index) {
        case 0:
          answer = std::unique_ptr<AbstractDriver>(new AllFields_Driver());
          break;
        case 1:
          answer = std::unique_ptr<AbstractDriver>(new TestFields_Driver());
          break;
        case 2:
          answer = std::unique_ptr<AbstractDriver>(new TestFields2_Driver());
          break;
      }

      return std::move(answer);
    }
};
#endif

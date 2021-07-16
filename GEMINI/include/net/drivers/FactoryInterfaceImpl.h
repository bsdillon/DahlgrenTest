#ifndef FACTORYINTERFACEIMPL_H
#define FACTORYINTERFACEIMPL_H

#include "../source/abstractdriver.h"
#include "DriverException.h"
#include "../source/FactoryInterface.h"
#include "AllFields_Driver.h"
#include "TestFields_Driver.h"
#include "TestFields2_Driver.h"
#include <fstream>

class FactoryInterfaceImpl: public virtual FactoryInterface
{
  public:
    virtual int GetTopicCount() {return 3;}

    virtual std::vector<std::string> GetTopicList() {
      auto answer = std::vector<std::string>(3);
      answer[0] = "tmp";
      answer[1] = "tmp2";
      answer[2] = "tmp3";

      return answer;
    }

    virtual std::vector<std::unique_ptr<AbstractDriver>> GetTopicFactories() {
      auto factories = std::vector<std::unique_ptr<AbstractDriver>>(3);
      factories[0] = std::move(std::unique_ptr<AbstractDriver>(new AllFields_Driver()));
      factories[1] = std::move(std::unique_ptr<AbstractDriver>(new TestFields_Driver()));
      factories[2] = std::move(std::unique_ptr<AbstractDriver>(new TestFields2_Driver()));

      return factories;
    }
    
    virtual std::string toString() {
      auto string = "";
      ofstream out;
      out.open("FactoryInterfaceImpl.txt");
      string += "AllFields_Driver : tmp1\n";
      string += "TestFields_Driver : tmp2\n";
      string += "TestFields_Driver2 : tmp3\n";
      out << string;
      out.close();
      return string;
    }
};
#endif

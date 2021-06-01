
#include "../source/abstractdriver.h"
#include "DriverException.h"
#include "../source/FactoryInterface.h"
#include "AllFields_Driver.h"
#include "TestFields_Driver.h"
#include "TestFields2_Driver.h"

#include <unordered_map>

class TopicHash
{
    public:
        int GetTopicCount() {return 3;}
        std::unordered_map<std::string, std::unique_ptr<AbstractDriver>> GetDriverMap() {
            std::unordered_map<std::string, std::unique_ptr<AbstractDriver>> DriverMap;
            DriverMap["tmp1"] = std::move(std::unique_ptr<AbstractDriver>(new AllFields_Driver()));
            DriverMap["tmp2"] = std::move(std::unique_ptr<AbstractDriver>(new TestFields_Driver()));
            DriverMap["tmp3"] = std::move(std::unique_ptr<AbstractDriver>(new TestFields2_Driver()));

            return DriverMap;
        }

}
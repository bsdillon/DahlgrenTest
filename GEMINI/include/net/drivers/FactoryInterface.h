#ifndef FACTORYINTERFACE_H
#define FACTORYINTERFACE_H

#include <memory>
#include <vector>

#include "AbstractDriver.h"
#include "DriverException.h"
#include "AllFields_Driver.h"

class FactoryInterface
{
    public:
        static int GetTopicCount();
        static std::vector<std::string> GetTopicList();
        static std::unique_ptr<AbstractDriver> GetTopicFactory(int index);

};
#endif
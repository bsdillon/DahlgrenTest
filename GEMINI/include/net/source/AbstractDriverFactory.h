#ifndef ABSTRACTDRIVERFACTORY_H
#define ABSTRACTDRIVERFACTORY_H

#include <memory>
#include <vector>
#include <string>
#include <stdio.h>

#include "../drivers/FactoryInterfaceImpl.h"
#include "../../plugin.h"

// gets factory interface impl, updates topic count, topic factory,
class AbstractDriverFactory
{
    private:
        int TopicCount;

    public:
        AbstractDriverFactory(int start) {TopicCount = start;}
        std::vector<std::unique_ptr<AbstractDriver>> Factories;
        std::vector<std::string> TopicList;
        void AppendTopic(FactoryInterfaceImpl plugin)
        {
            for (int i = 0; i < plugin.GetTopicCount(); i++) {
                TopicList.push_back(plugin.GetTopicList().at(i));
                Factories.push_back(std::move(plugin.GetTopicFactories().at(i)));
                TopicCount++;
            }
        }
        int GetTopicCount() {return TopicCount;}
        std::unique_ptr<AbstractDriver> GetFactoryAtIndex(int index) {return std::move(Factories.at(index));}
        std::string GetTopicAtIndex(int index) {return TopicList.at(index);}

        bool loadPlugin(Plugin plugin)
        {
             // test throws
            try
            {
                printf("Num of Factories: %lu\n", plugin.impl.GetTopicFactories().size());
                printf("Num of Topics: %lu\n", plugin.impl.GetTopicList().size());
            }
            catch(DriverException &e)
            {
                return false;
            }
            return true;
        }

};

#endif
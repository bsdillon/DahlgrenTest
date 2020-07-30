#include "rtitester.h"

RTITester::RTITester()
{

}

void RTITester::StartPublication(infrastructureservices::pubsub::PubSubService_I* p)
{
    pss = p;
}

void RTITester::ReceiveNewTopics()
{
    //turn off topics
    publications[topicName]->disablePublication();
    pss->destroyPublication(*publications[topicName]);

    //clear list of topics
    publications.clear();

    //create new topics
    publications[topicName] = pss->createPublication(*(pss->createTopic(topicName.toStdString())), *newStatusListener.get(), infrastructureservices::common::commontypes::BLOCKING_MODE_NON_BLOCKING);
    publications[topicName]->enablePublication();

}

void RTITester::publishMessages(std::pair<std::string, AbstractDriver *> topicFactory, int frequency, int multiplier)
{
    //publish message on network
    publications[topic]->publishIssue(*msg);

}

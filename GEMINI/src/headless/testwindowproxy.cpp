#include "headless/testwindowproxy.h"

TestWindowProxy::TestWindowProxy()
{
    testProxy = new I_Test(this);
    testProxy->setRecieveExperimentRunStatus(std::bind(&TestWindowProxy::receiveExperimentRunStatus, this, std::placeholder::_1));
    testProxy->setStopPublishingMessages(std::bind(&TestWindowProxy::stopPublishingMessages, this, std::placeholder::_1));
    testProxy->setReceiveNewTopics(std::bind(&TestWindowProxy::ReceiveNewTopics, this, std::_placeholder::_1));
    //Signal Forwarding
    connect(this, &TestWindowProxy::Message, testProxy, &I_Test::Message);
}

void TestWindowProxy::receiveExperimentRunStatus(bool status)
{

}

void TestWindowProxy::stopPublishingMessages(bool experimentRunning)
{

}

void TestWindowProxy::ReceiveNewTopics(std::map<std::string, AbstractDriver *> factories)
{

}

#include "headless/testwindowproxy.h"

TestWindowProxy::TestWindowProxy()
{
    testProxy = new I_Test(this);
    testProxy->setReceiveExperimentRunStatus(std::bind(&TestWindowProxy::receiveExperimentRunStatus, this, std::placeholders::_1));
    testProxy->setStopPublishingMessages(std::bind(&TestWindowProxy::stopPublishingMessages, this, std::placeholders::_1));
    testProxy->setReceiveNewTopics(std::bind(&TestWindowProxy::ReceiveNewTopics, this, std::placeholders::_1));
    //Signal Forwarding
    connect(this, &TestWindowProxy::MessagePassing, testProxy, &I_Test::MessagePassing);
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

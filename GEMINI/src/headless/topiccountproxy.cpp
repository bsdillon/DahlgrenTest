#include "headless/topiccountproxy.h"

TopicCountProxy::TopicCountProxy()
{
    countPanel = new I_CountPanel(this);
    countPanel->setReceiveNewTopicsCallback(std::bind(&TopicCountProxy::ReceiveNewTopics, this, std::placeholder::_1));
    //Signal Forwarding
    connect(this, &TopicCountProxy::toggleSubscription, countPanel, &I_CountPanel::toggleSubscription);
    connect(this, &TopicCountProxy::UpdateStatus, countPanel, &I_CountPanel::UpdateStatus);
    connect(this, &TopicCountProxy::experimentRunning, countPanel, &I_CountPanel::experimentRunning);
}

void TopicCountProxy::ReceiveNewTopics(std::map<std::string, AbstractDriver *> factories)
{

}

#include "headless/topiccountproxy.h"

TopicCountProxy::TopicCountProxy()
{
    countPanel = new I_CountPanel(this);
    countPanel->setReceiveNewTopicsCallback(std::bind(&TopicCountProxy::ReceiveNewTopics, this, std::placeholder::_1));
}

void TopicCountProxy::ReceiveNewTopics(std::map<std::string, AbstractDriver *> factories)
{

}

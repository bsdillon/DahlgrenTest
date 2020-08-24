#include "headless/topicdetailsproxy.h"

TopicDetailsProxy::TopicDetailsProxy()
{

    detailpanelProxy = new I_DetailPanel(this);
    detailpanelProxy->setClearMessageCallback(std::bind(&TopicDetailsProxy::ClearMessage, this, std::placeholders::_1));
}

void TopicDetailsProxy::ClearMessages()
{

}

#include "headless/topicdetailsproxy.h"

TopicDetailsProxy::TopicDetailsProxy()
{

    detailPanelProxy = new I_DetailPanel(this);
    detailPanelProxy->setClearMessageCallback(std::bind(&TopicDetailsProxy::ClearMessages, this));
    //Signal Forwarding
    connect(this, &TopicDetailsProxy::UpdateStatus, detailPanelProxy, &I_DetailPanel::UpdateStatus);
}

void TopicDetailsProxy::ClearMessages()
{

}

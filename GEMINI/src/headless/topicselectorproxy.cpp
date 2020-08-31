#include "headless/topicselectorproxy.h"

TopicSelectorProxy::TopicSelectorProxy()
{
    topicPanelProxy = new I_TopicPanel(this);
    topicPanelProxy->setReadSettingsCallback(std::bind(&TopicSelectorProxy::readSettings, this, std::placeholder::_1)););
    //signal Forwarding
    connect(this, &TopicSelectorProxy::UpdateStatus, topicPanelProxy, &I_TopicPanel::UpdateStatus);
    connect(this, &TopicSelectorProxy::TopicSelectionChanged, topicPanelProxy, &I_TopicPanel::TopicSelectionChanged);
}

TopicSelectorProxy::readSettings()
{

}

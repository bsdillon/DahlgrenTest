#include "headless/topicselectorproxy.h"
#include "../../include/qtgui/topicselector.h"

TopicSelectorProxy::TopicSelectorProxy()
{
    topicPanelProxy = new I_TopicPanel(this);
    topicPanelProxy->setReadSettingsCallback(std::bind(&TopicSelectorProxy::readSettings, this));
    //signal Forwarding
    connect(this, &TopicSelectorProxy::UpdateStatus, topicPanelProxy, &I_TopicPanel::UpdateStatus);
    connect(this, &TopicSelectorProxy::TopicSelectionChanged, topicPanelProxy, &I_TopicPanel::TopicSelectionChanged);
}

void TopicSelectorProxy::readSettings()
{

}

void TopicSelectorProxy::onMessage(){
    TopicSelector* topicSelect = new TopicSelector();
    topicSelect->loadTopicsFromFile();
}

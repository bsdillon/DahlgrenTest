#ifndef TOPICSELECTORPROXY_H
#define TOPICSELECTORPROXY_H

#include "proxies/AbstractProxy.h"
#include "uiinterface/i_topicpanel.h"
#include "../qtgui/topicselector.h"

class TopicSelectorProxy : public QObject
{
    Q_OBJECT
public:
    TopicSelectorProxy();

public slots:
    void onMessage();

signals:
    void UpdateStatus(std::string);
    void TopicSelectionChanged(std::vector<std::string>);
    //void messageReceived();

private:
    I_TopicPanel* topicPanelProxy;
    TopicSelector topicSelect;
    void readSettings();
};

#endif // TOPICSELECTORPROXY_H

#ifndef TOPICSELECTORPROXY_H
#define TOPICSELECTORPROXY_H

#include "proxies/AbstractProxy.h"
#include "uiinterface/i_topicpanel.h"

class TopicSelectorProxy : public QObject
{
    Q_OBJECT
public:
    TopicSelectorProxy();

signals:
    void UpdateStatus(std::string);
    void TopicSelectionChanged(std::vector<std::string>);

private:
    I_TopicPanel* topicPanelProxy;
    void readSettings();
};

#endif // TOPICSELECTORPROXY_H

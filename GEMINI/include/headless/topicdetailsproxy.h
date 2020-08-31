#ifndef TOPICDETAILSPROXY_H
#define TOPICDETAILSPROXY_H

#include "uiinterface/i_detailpanel.h"
#include "proxies/AbstractProxy.h"

class TopicDetailsProxy : public QObject
{
    Q_OBJECT
public:
    TopicDetailsProxy();

signals:
    void UpdateStatus(std::string);

private:
    I_DetailPanel* detailPanelProxy;
    void ClearMessages();
};

#endif // TOPICDETAILSPROXY_H

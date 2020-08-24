#ifndef TOPICDETAILSPROXY_H
#define TOPICDETAILSPROXY_H

#include "uiinterface/i_detailpanel.h"
#include "proxies/AbstractProxy.h"

class TopicDetailsProxy : public QObject
{
    Q_OBJECT
public:
    TopicDetailsProxy();

private:
    I_DetailPanel* detailpanelProxy;
    void ClearMessages();
};

#endif // TOPICDETAILSPROXY_H

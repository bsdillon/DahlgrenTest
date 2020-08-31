#ifndef TOPICCOUNTPROXY_H
#define TOPICCOUNTPROXY_H

#include "proxies/AbstractProxy.h"
#include "uiinterface/i_countpanel.h"

class TopicCountProxy : public QObject
{
    Q_OBJECT
public:
    TopicCountProxy();

signals:
    void StopAll();
    void toggleSubscription(QString topic, bool enable);
    void UpdateStatus(std::string);
    void experimentRunning(bool);

private:
    I_CountPanel* countPanel;
    void ReceiveNewTopics(std::map<std::string, AbstractDriver *> factories);
};

#endif // TOPICCOUNTPROXY_H

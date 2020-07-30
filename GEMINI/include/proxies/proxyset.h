#ifndef PROXYSET_H
#define PROXYSET_H

#include "filequeue.h"
#include "subscriptionmanager.h"
#include "proxies/AbstractProxy.h"

class ProxySet : public QObject
{
    Q_OBJECT
public:
    enum ProxyTypes
    {
        Experiment,
        DataLoader,
        Main,
        TCounts,
        TSelector,
        TDetails,
        Test
    };

    ProxySet();
    void setUpConnections(std::unique_ptr<FileQueue>& fq, std::unique_ptr<SubscriptionManager>& sm);
    void add(AbstractProxy*, ProxyTypes type);
    void configureMessageListeners(std::vector<MessageListener*>& set);
    void LoadUI();

private:
    std::map<ProxyTypes, AbstractProxy*> proxies;
};

#endif // PROXYSET_H

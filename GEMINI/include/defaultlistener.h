#ifndef DEFAULTLISTENER_H
#define DEFAULTLISTENER_H

#include <string>

#include "net/topics/message.h"
#include "net/topics/Subscription_I.h"
//#include "SubscriptionIssueListener_I.h"
//TODO setup interfaces for network listener

class AbstractDriver;
class DataManager;

class DefaultListener //: public infrastructureservices::pubsub::SubscriptionIssueListener_I
{
private:
    DataManager* _dataManager; // Non-owning
    AbstractDriver* _factory; // Non-owning
    std::string _topic;

public:
    DefaultListener(DataManager* dataSink, std::string topic, AbstractDriver* factory);
    void onIssueReceived(const Message * issue, Subscription_I &) throw();
    void TestReceived(const Message * issue);
};

#endif // DEFAULTLISTENER_H

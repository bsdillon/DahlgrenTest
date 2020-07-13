#ifndef DEFAULTLISTENER_H
#define DEFAULTLISTENER_H

#include <string>

#include "Message_T.h"
#include "Subscription_I.h"
#include "SubscriptionIssueListener_I.h"

class AbstractDriver;
class DataManager;

class DefaultListener : public infrastructureservices::pubsub::SubscriptionIssueListener_I
{
private:
    DataManager* _dataManager; // Non-owning
    AbstractDriver* _factory; // Non-owning
    std::string _topic;

public:
    DefaultListener(DataManager* dataSink, std::string topic, AbstractDriver* factory);
    void onIssueReceived(const infrastructureservices::common::Message_T *, infrastructureservices::pubsub::Subscription_I &) throw();
    void TestReceived(const infrastructureservices::common::Message_T * issue);
};

#endif // DEFAULTLISTENER_H

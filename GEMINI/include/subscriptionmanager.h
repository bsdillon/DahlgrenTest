#ifndef SUBSCRIPTIONMANAGER_H
#define SUBSCRIPTIONMANAGER_H

#include <QObject>
#include <QString>
#include <unordered_map>

#include "net/source/abstractdriver.h"
#include "datamanager.h"
#include "defaultlistener.h"
#include "threadworker.h"
#include "net/topics/message.h"
#include "net/topics/Subscription_I.h"
#include "net/topics/Topic_I.h"

class MessageListener;

class SubscriptionManager : public ThreadWorker
{
        Q_OBJECT
    public:
        explicit SubscriptionManager();
        void addMessageListeners(std::vector<MessageListener*> listeners);

    signals:
        void UpdateStatus(std::string);
        void TopicFactoriesCreated(std::map<std::string, AbstractDriver*>);
        void ClearData();
        void DataReceived();
        void loadDataFrom(QString fileName);

    public slots:
        void receiveTopicList(std::vector<std::string> topics);
        void toggleSubscription(QString, bool enable);
        virtual void run() override {} // From ThreadWorker
        void testMessageInDebug(QString topic, Message* message);

    private:
        //TODO setup topic data structures
        //infrastructureservices::pubsub::PubSubService_I* _pss; // Non-owning
        //std::unordered_map<std::string, infrastructureservices::pubsub::Subscription_I*> _subscriptionMap; // Track subscriptions by name
        //std::map<std::string, infrastructureservices::pubsub::Topic_I*> _topicMap; // Track topic interface by topic name
        std::unordered_map<std::string, Subscription_I*> _subscriptionMap; // Track subscriptions by name
        std::map<std::string, Topic_I*> _topicMap; // Track topic interface by topic name

        std::unique_ptr<DataManager> _dataManager;
        std::map<std::string, int> _topicIndexMappings; // Map index to DriverFactory topic factories
        std::map<std::string, std::unique_ptr<AbstractDriver>> _topicFactories; // Track topic factories by name
        std::map<std::string, std::unique_ptr<DefaultListener>> _listenerMap; // Track DefaultListener by topic name

        void cleanUp();
};

#endif // SUBSCRIPTIONMANAGER_H

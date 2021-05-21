#include "subscriptionmanager.h"

#include "common.h"
#include "net/drivers/DriverFactory.h"
#include "messagelistener.h"

SubscriptionManager::SubscriptionManager()
    : _dataManager(nullptr)
{
    // Set up topic-index map that permits requesting factory instances using
    // topic name
    auto topics = DriverFactory::GetTopicList();
    for (size_t i = 0; i < topics.size(); ++i)
    {
        _topicIndexMappings[topics.at(i)] = static_cast<int>(i);
    }
    _dataManager = std::unique_ptr<DataManager>(new DataManager);
    connect(this, &SubscriptionManager::ClearData, _dataManager.get(), &DataManager::clearData);
    connect(_dataManager.get(), &DataManager::dataReceived, this, &SubscriptionManager::DataReceived);
    connect(this, &SubscriptionManager::loadDataFrom, _dataManager.get(), &DataManager::loadDataFrom);
}

void SubscriptionManager::addMessageListeners(std::vector<MessageListener *> listeners)
{
    for (const auto& listener : listeners) {
        _dataManager->addMessageListener(listener);
    }
}


void SubscriptionManager::receiveTopicList(std::vector<std::string> topics)
{
    cleanUp();

    // Create factories, claim ownership, and set up raw, non-owning pointers
    // to send to others
    auto rawFactoryPointers = std::map<std::string, AbstractDriver*>{};
    for (const auto& topic : topics) {
        auto factory = DriverFactory::GetTopicFactory(_topicIndexMappings[topic]);
        rawFactoryPointers[topic] = factory.get();
        _topicFactories[topic] = std::move(factory);
    }

    emit TopicFactoriesCreated(rawFactoryPointers);

    int createdSoFar = 0;
    int total = topics.size();
    for (const auto& topic : topics) {
        ++createdSoFar;
        emit UpdateStatus("Creating topic " + std::to_string(createdSoFar) + "/" + std::to_string(total));
        _listenerMap[topic] = std::unique_ptr<DefaultListener>(new DefaultListener(_dataManager.get(), topic, _topicFactories[topic].get()));
        if (!Common::IsDebug()) {
            //TODO Subscript to topic in Network
            //_topicMap[topic] = _pss->createTopic(topic);
            //_subscriptionMap[topic] = _pss->createSubscription(*_topicMap[topic], *_listenerMap[topic].get());
        }
    }
    //TODO turn on subscriptions
    //_pss->enableAllSubscriptions();
}

void SubscriptionManager::toggleSubscription(QString topic, bool enable)
{
    auto subscription = _subscriptionMap[topic.toStdString()];
    if (enable) {
       // subscription->enableSubscription();
    } else {
       // subscription->disableSubscription(false);
    }
}

void SubscriptionManager::testMessageInDebug(QString topic, Message *message)
{
    _listenerMap[topic.toStdString()]->TestReceived(message);
}

void SubscriptionManager::cleanUp()
{
     for (const auto& subscription : _subscriptionMap) {
        auto& subscriptionInterface = subscription.second;
        //TODO Unsubscribe and remove subscriptions from network
        //subscriptionInterface->disableSubscription(true);
        //_pss->destroySubscription(*subscriptionInterface);
    }
    _subscriptionMap.clear();
    _topicFactories.clear();
    _listenerMap.clear();
    _topicMap.clear();
    _dataManager->clearData();
}


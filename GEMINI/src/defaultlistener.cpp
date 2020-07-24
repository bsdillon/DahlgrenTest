#include "defaultlistener.h"

#include <memory>

#include "AbstractDriver.h"
#include "datamanager.h"

DefaultListener::DefaultListener(DataManager* dataSink, std::string topic, AbstractDriver* factory)
  : _dataManager(dataSink),
    _factory(factory),
    _topic(topic)
{}

void DefaultListener::onIssueReceived(const infrastructureservices::common::Message_T * issue, infrastructureservices::pubsub::Subscription_I &) throw()
{
    _dataManager->addMessage(_topic, std::move(_factory->CreateDriver(issue)));
}

void DefaultListener::TestReceived(const infrastructureservices::common::Message_T * issue)
{
    _dataManager->addMessage(_topic, std::move(_factory->CreateDriver(issue)));
}

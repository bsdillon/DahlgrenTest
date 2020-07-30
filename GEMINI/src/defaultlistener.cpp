#include "defaultlistener.h"
#include <memory>
#include "net/abstractdriver.h"
#include "datamanager.h"

DefaultListener::DefaultListener(DataManager* dataSink, std::string topic, AbstractDriver* factory)
  : _dataManager(dataSink),
    _factory(factory),
    _topic(topic)
{}

void DefaultListener::onIssueReceived(const Message * issue, Subscription_I &) throw()
{
    _dataManager->addMessage(_topic, std::move(_factory->CreateDriver(issue)));
}

void DefaultListener::TestReceived(const Message * issue)
{
    _dataManager->addMessage(_topic, std::move(_factory->CreateDriver(issue)));
}

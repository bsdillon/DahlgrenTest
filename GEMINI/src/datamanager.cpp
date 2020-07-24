#include "datamanager.h"

#include "binaryfilehandler.h"
#include "messagelistener.h"
#include "readmessage.h"

DataManager::DataManager()
{}

void DataManager::addMessage(std::string topic, std::unique_ptr<AbstractDriver> message)
{
    if (_messages.empty()) {
        emit dataReceived();
    }
    auto messageContents = std::vector<MessageField>{};
    ReadMessage::RecursiveLoadMessage(message.get(), messageContents);
    _messages.emplace_back(QString::fromStdString(topic), message->getMessageArrival(), messageContents);
    const auto& m = _messages.back();
    emit messageReceived(m);
}

void DataManager::addMessageListener(MessageListener *listener)
{
    connect(this, &DataManager::messageReceived, listener, &MessageListener::Message);
    connect(this, &DataManager::clearListenerData, listener, &MessageListener::ClearData);
    _listeners.push_back(listener);
}

void DataManager::clearData()
{
    emit clearListenerData();
    _messages.clear();
}

void DataManager::loadDataFrom(QString fileName)
{
    binaryFileHandler reader(fileName, FileMode::READ);
    reader.read(_messages);
    for (const auto& message : _messages)
    {
        emit messageReceived(message);
    }
    emit dataReceived();
}

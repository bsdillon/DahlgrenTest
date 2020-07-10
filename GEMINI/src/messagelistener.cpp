#include "messagelistener.h"

MessageListener::MessageListener(QObject *parent)
    : QObject(parent),
      _messageCallback([](const PLAMessage&){}),
      _loggingCallback([](QString){}),
      _clearDataCallback([](){})
{}

MessageListener* MessageListener::setMessageCallback(std::function<void (const PLAMessage &)> messageCallback)
{
    _messageCallback = messageCallback;
    return this;
}

MessageListener* MessageListener::setLoggingCallback(std::function<void (QString)> loggingCallback)
{
    _loggingCallback = loggingCallback;
    return this;
}

MessageListener *MessageListener::setClearDataCallback(std::function<void ()> clearDataCallback)
{
    _clearDataCallback = clearDataCallback;
    return this;
}

void MessageListener::Message(const PLAMessage &m) const
{
    _messageCallback(m);
}


void MessageListener::Log(QString logMessage) const
{
    _loggingCallback(logMessage);
}

void MessageListener::ClearData() const
{
    _clearDataCallback();
}

#include "uiinterface/i_countpanel.h"

I_CountPanel::I_CountPanel(QObject *parent)
    :QObject(parent),
      _receiveNewTopicsCallback([](std::map<std::string, AbstractDriver *>){})
{
    i_countId = i_countCount ++;
    _messageListener = (new MessageListener(this));
}

//Slot Callback
void I_CountPanel::setReceiveNewTopicsCallback(std::function<void(std::map<std::string, AbstractDriver *>)> receiveNewTopics)
{
    _receiveNewTopicsCallback = receiveNewTopics;
}

//Slot
void I_CountPanel::ReceiveNewTopics(std::map<std::string, AbstractDriver *> factories)
{
    _receiveNewTopicsCallback(factories);
}

//Signals

void I_CountPanel::signalToggleSubscription(QString topic, bool enable)
{
    emit toggleSubscription(topic, enable);
}

void I_CountPanel::signalUpdateStatus(std::string status)
{
    emit UpdateStatus(status);
}

void I_CountPanel::signalExperimentRunning(bool run)
{
    emit experimentRunning(run);
}

MessageListener *I_CountPanel::listener()
{
    return _messageListener;
}

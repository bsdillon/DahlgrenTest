#include "i_test.h"

//Constructor
I_Test::I_Test(QObject *parent)
    :QObject(parent),
      _statusCallback([](bool){}),
      _experimentRunningCallback([](bool){}),
      _receiveNewTopicsCallback([](std::map<std::string, AbstractDriver*>){})
{}

//Signals
void I_Test::signalMessage(QString s, Message *m)
{
    emit Message(s, m);
}

//Slots Callbacks
void I_Test::setRecieveExperimentRunStatus(bool status)
{
    _statusCallback = status;
}

void I_Test::setStopPublishingMessages(bool experimentRunning)
{
    _experimentRunningCallback = experimentRunning;
}

void I_Test::setReceiveNewTopics(std::map<std::string, AbstractDriver*> factories)
{
    _receiveNewTopicsCallback = factories;
}

//Slots
void I_Test::receiveExperimentRunStatus(bool status)
{
    _statusCallback(status);
}

void I_Test::stopPublishingMessages(bool experimentRunning)
{
    _experimentRunningCallback(experimentRunning);
}

void I_Test::ReceiveNewTopics(std::map<std::string, AbstractDriver*> factories)
{
    _receiveNewTopicsCallback(factories);
}

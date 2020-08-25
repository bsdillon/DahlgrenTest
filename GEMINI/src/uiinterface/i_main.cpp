#include "i_main.h"

I_Main::I_Main(QObject *parent)
    : QObject(parent),
      statusCallBack([](QString){}),
      _enabled([](bool){}),
      _logedEventClicked([](){})
{}


void I_Main::setStatusCallback(std::function<void(QString)> cb)
{
    statusCallback=cb;
}

void I_Main::Status(std::string s){
    statusCallback(s);
}

void I_Main::signalLogMessage(QString message)
{
    emit LogMessage(message);
}

void I_Main::switchingEnabled(std::function<void (bool)> enabled){
    _enabled = enabled;
}

void I_Main ::modeSwitchingEnabled(bool enabled){
    _enabled(enabled);
}

void I_Main::setLogEvent(std::fucntion<void ()> logEvent)
{
    _logEventClicked = logEvent;
}

void I_Main::logEventClicked()
{
    _logEventClicked();
}




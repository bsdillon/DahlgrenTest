#include "headless/experimentproxy.h"
#include "headless/mainproxy.h"

MainProxy::MainProxy()
{
    mainProxy = new I_Main(this);
    mainProxy->setStatusCallback(std::bind(&MainProxy::Status, this, std::placeholders::_1));
    mainProxy->setLogEvent(std::bind(&MainProxy::logEventClicked, this));
    mainProxy->switchingEnabled(std::bind(&MainProxy::modeSwitchingEnabled, this, std::placeholders::_1));

    connect(this, &MainProxy::LogMessage, mainProxy, &I_Main::LogMessage);
}

void MainProxy::Status(std::string s){

}

void MainProxy::logEventClicked()
{

}

void MainProxy::modeSwitchingEnabled(bool enabled)
{

}

#include "headless/experimentproxy.h"
#include "headless/mainproxy.h"

ExperimentProxy::ExperimentProxy()
{

}

MainProxy::MainProxy()
{
    mainProxy = new I_Main(this);
    mainProxy->setStatusCallback(std::bind(&MainProxy::Status, this, std::placeholder::_1));
    mainProxy->setLogEvent(std::bind(&MainProxy::logEventClicked, this, std::placeholder::_1));
    mainProxy->switchingEnabled(std::bind(&MainProxy::modeSwitchingEnabled, this, std::_placeholder::_1));
}

void MainProxy::Status(std::string s){

}

void MainProxy::logEventClicked()
{

}

void MainProxy::modeSwitchingEnabled(bool enabled)
{

}

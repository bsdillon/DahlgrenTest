#include "headless/experimentproxy.h"

ExperimentProxy::ExperimentProxy()
{
    experimentProxy = new I_Experiment(this);
    experimentProxy->setTopicsChangedCallback(std::bind(&ExperimentProxy::TopicsChanged, this, std::placeholders::_1));
    experimentProxy->setFinishedPressedCallback(std::bind(&ExperimentProxy::FinishedPressed, this, std::placeholders::_1));
    experimentProxy->setReceivedFileNameStatusCallback(std::bind(&ExperimentProxy::ReceiveFileNameStatus, this, std::placeholders::_1));
    experimentProxy->setDataReceived(std::bind(&ExperimentProxy::DataReceived, this, std::placeholder::_1));
}

void ExperimentProxy::TopicsChanged(std::vector<std::string> s)
{

}

void ExperimentProxy::FinishPressed()
{

}

void ExperimentProxy::ReceiveFileNameStatus(FileStatus fs){

}

void ExperimentProxy::DataReceived()
{

}

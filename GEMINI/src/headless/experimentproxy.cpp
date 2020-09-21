#include "headless/experimentproxy.h"

ExperimentProxy::ExperimentProxy()
{
    experimentProxy = new I_Experiment(this);

    experimentProxy->setTopicsChangedCallback(std::bind(&ExperimentProxy::TopicsChanged, this, std::placeholders::_1));
    experimentProxy->setFinishedPressedCallback(std::bind(&ExperimentProxy::FinishPressed, this));
    experimentProxy->setReceivedFileNameStatusCallback(std::bind(&ExperimentProxy::ReceiveFileNameStatus, this, std::placeholders::_1));
    experimentProxy->setDataReceived(std::bind(&ExperimentProxy::DataReceived, this));
    //Signal Forwarding
    connect(this, &ExperimentProxy::ExperimentRunning, experimentProxy, &I_Experiment::ExperimentRunning);
    connect(this, &ExperimentProxy::ExperimentDone, experimentProxy, &I_Experiment::ExperimentDone);
    connect(this, &ExperimentProxy::FileNameTextChanged, experimentProxy, &I_Experiment::FileNameTextChanged);
    connect(this, &ExperimentProxy::TopicsUpdated, experimentProxy, &I_Experiment::TopicsUpdated);
    connect(this, &ExperimentProxy::ClearData, experimentProxy, &I_Experiment::ClearData);
    connect(this, &ExperimentProxy::LogEventClicked, experimentProxy, &I_Experiment::LogEventClicked);
    connect(this, &ExperimentProxy::inCleanState, experimentProxy, &I_Experiment::inCleanState);
    connect(this, &ExperimentProxy::UpdateStatus, experimentProxy, &I_Experiment::UpdateStatus);
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

#include "headless/experimentproxy.h"
#include<QDebug>

ExperimentProxy::ExperimentProxy()
{
    experimentProxy = new I_Experiment(this);

    experimentProxy->setTopicsChangedCallback(std::bind(&ExperimentProxy::TopicsChanged, this, std::placeholders::_1));
    experimentProxy->setFinishedPressedCallback(std::bind(&ExperimentProxy::finishPressed, this));
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

void ExperimentProxy::ReceiveFileNameStatus(FileStatus fs){
    QString test;
}

void ExperimentProxy::DataReceived()
{

}

void ExperimentProxy::updateTopicsPressed(){
    qDebug() << "updateTopicsPressed() called!";
}

void ExperimentProxy::recordPressed(){
    qDebug() << "recordPressed() called!";
}

void ExperimentProxy::pausePressed(){
    qDebug() << "pausePressed() called!";
}

void ExperimentProxy::stopPressed(){
    qDebug() << "stopPressed() called!";
}

void ExperimentProxy::errorPressed(){
    qDebug() << "errorPressed() called!";
}

void ExperimentProxy::finishPressed(){
    qDebug() << "finishPressed() called!";
}

void ExperimentProxy::clearDataPressed(){
    qDebug() << "clearDataPressed() called!";
}

void ExperimentProxy::logEventPressed(){
    qDebug() << "logEventPressed() called!";
}

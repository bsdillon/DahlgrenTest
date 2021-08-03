#include "headless/experimentproxy.h"
#include<QDebug>

ExperimentProxy::ExperimentProxy() :
    topicsSent(false),
    dataReceived(false)
{
    experimentProxy = new I_Experiment(this);

    //experimentProxy->setTopicsChangedCallback(std::bind(&ExperimentProxy::TopicsChanged, this, std::placeholders::_1));
    experimentProxy->setFinishedPressedCallback(std::bind(&ExperimentProxy::finishPressed, this));
    experimentProxy->setReceivedFileNameStatusCallback(std::bind(&ExperimentProxy::ReceiveFileNameStatus, this, std::placeholders::_1));
    experimentProxy->setDataReceived(std::bind(&ExperimentProxy::DataReceived, this));

    //Signal Forwarding
    //Moved to Logic
    connect(this, &ExperimentProxy::ExperimentRunning, experimentProxy, &I_Experiment::ExperimentRunning);
    //Moved to Logic
    connect(this, &ExperimentProxy::ExperimentDone, experimentProxy, &I_Experiment::ExperimentDone);
    connect(this, &ExperimentProxy::FileNameTextChanged, experimentProxy, &I_Experiment::FileNameTextChanged);
    connect(this, &ExperimentProxy::TopicsUpdated, experimentProxy, &I_Experiment::TopicsUpdated);
    connect(this, &ExperimentProxy::ClearData, experimentProxy, &I_Experiment::ClearData);
    connect(this, &ExperimentProxy::LogEventClicked, experimentProxy, &I_Experiment::LogEventClicked);
    //Moved to Logic
    connect(this, &ExperimentProxy::inCleanState, experimentProxy, &I_Experiment::inCleanState);
    connect(this, &ExperimentProxy::UpdateStatus, experimentProxy, &I_Experiment::UpdateStatus);

    experimentLogic = new ExperimentLogic();
    connect(this, &ExperimentProxy::disableButtons, experimentLogic, &ExperimentLogic::disableButtons);
    connect(this, &ExperimentProxy::enableButtons, experimentLogic, &ExperimentLogic::enableButtons);

    proxyid = proxycount++;
}

void ExperimentProxy::ReceiveFileNameStatus(FileStatus fs){
    QString test;
}

void ExperimentProxy::DataReceived()
{

}

void ExperimentProxy::TopicsChanged(std::vector<std::string> s){
    topicsSent = false;
    topicNames = s;
    buttonReady = experimentLogic->checkState(topicsSent, topicNames, fileNameValid);
}

void ExperimentProxy::updateTopicsPressed(){
    //qDebug() << "updateTopicsPressed() called!";
    disableButtons("updateTopics");
    //emits topicsUpdated(topicNames)
    //calls updateLastExperimentFile()
    topicsSent = true;
    buttonReady = experimentLogic->checkState(topicsSent, topicNames, fileNameValid);
}

void ExperimentProxy::recordPressed(){
    //qDebug() << "recordPressed() called!";
    dataReceived = experimentLogic->applyState(buttonReady, topicsSent, topicNames, dataReceived);
}

void ExperimentProxy::pausePressed(){
    //qDebug() << "pausePressed() called!";
}

void ExperimentProxy::stopPressed(){
    //qDebug() << "stopPressed() called!";
}

void ExperimentProxy::errorPressed(){
    //qDebug() << "errorPressed() called!";
}

void ExperimentProxy::finishPressed(){
    //qDebug() << "finishPressed() called!";
}

void ExperimentProxy::clearDataPressed(){
    //qDebug() << "clearDataPressed() called!";
}

void ExperimentProxy::logEventPressed(){
    //qDebug() << "logEventPressed() called!";
}

void ExperimentProxy::disableButtons(QString btnNames){
    emit sendingMessage("disable:" + btnNames);
}

void ExperimentProxy::enableButtons(QString btnNames){
    emit sendingMessage("enable:" + btnNames);
}

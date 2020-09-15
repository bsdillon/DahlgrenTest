#include "uiinterface/i_experiment.h"

I_Experiment::I_Experiment(QObject *parent)
    :QObject(parent),
     _topicsChangedCallBack([](std::vector<std::string>){}),
     _finishedPressedCallBack([](){}),
     _receiveFileNameStatusCallback([](FileStatus){}),
     _dataReceivedCallback([](){})
{}

 //Signals
void I_Experiment::signalExperimentRunning(bool run)
{
   emit ExperimentRunning(run);
}

void I_Experiment::signalExperimentDone()
{
    emit ExperimentDone();
}

void I_Experiment::signalFileNameTextChange(Qstring filename)
{
    emit FileNameTextChanged(filename);
}

void I_Experiment::signalTopicsUpdated(std::vector<std::string> update)
{
    emit TopicsUpdated(update);
}

void I_Experiment::signalClearData()
{
    emit ClearData();
}

void I_Experiment::signalLogEventClicked()
{
    emit LogEventClicked();
}

void I_Experiment::signalInCleanState(bool state)
{
    emit inCleanState(state);
}

void I_Experiment::signalUpdateStatus(std::string status)
{
    emit UpdateStatus(status);
}

//Slot Callback Setters
void I_Experiment::setTopicsChangedCallback(std::function<void(std::vector<std::string)> topicsChangedCallback)
{
    _topicsChangedCallback = topicsChangedCallback;
}
void I_Experiment::setFinishedPressedCallback(std::fucntion<void()> finishedPressedCallBack)
{
    _finishedPressedCallBack = finishedPressedCallBack;
}

void I_Experiment::setReceivedFileNameStatusCallback(std::function<void(FileStatus)> receiveFileNameStatusCallback)
{
    _receiveFileNameStatusCallback = receiveFileNameStatusCallback;
}

void I_Experiment::setDataReceived(std::function<void()> dataReceivedCallback)
{
    _dataReceivedCallback = dataReceivedCallback;
}

//Slots
void I_Experiment::TopicsChanged(std::vector<std::string> s) //Need variable names
{
    _topicsChangedCallback(s);
}

void I_Experiment::FinishPressed()
{
    _finishedPressedCallBack();
}

void I_Experiment::ReceiveFileNameStatus(FileStatus fs)
{
    _receiveFileNameStatusCallback(fs);
}

void I_Experiment::DataReceived()
{
    _dataReceivedCallback();
}


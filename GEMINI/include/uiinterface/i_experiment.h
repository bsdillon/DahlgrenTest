#ifndef I_EXPERIMENT_H
#define I_EXPERIMENT_H

#include "qobject.h"
#include "filestatus.h"

class I_Experiment : public QObject
{
    Q_OBJECT

public:
    //Constructor
    I_Experiment(QObject *parent=0);
    //Signals
    void signalExperimentRunning(bool run);
    void signalExperimentDone();
    void signalFileNameTextChange(Qstring filename);
    void signalTopicsUpdated(std::vector<std::string> update);
    void signalClearData();
    void signalLogEventClicked();
    void signalInCleanState(bool state);
    void signalUpdateStatus(std::string status);
    //Slot Callback Setters
    void setTopicsChangedCallback(std::function<void(std::vector<std::string)> topicsChangedCallback);
    void setFinishedPressedCallback(std::fucntion<void()> finishedPressedCallBack);
    void setReceivedFileNameStatusCallback(std::function<void(FileStatus)> receiveFileNameStatusCallback);
    void setDataReceived(std::function<void()> dataReceivedCallback);


signals:
    void ExperimentRunning(bool);
    void ExperimentDone();
    void FileNameTextChanged(QString);
    void TopicsUpdated(std::vector<std::string>);
    void ClearData();
    void LogEventClicked();
    void inCleanState(bool);
    void UpdateStatus(std::string);

public slots:
    void TopicsChanged(std::vector<std::string> s); //Need variable names
    void FinishPressed();
    void ReceiveFileNameStatus(FileStatus fs);
    void DataReceived();

private:
    std::function<void(std::vector<std::string)> _topicsChangedCallback;
    std::fucntion<void()> _finishedPressedCallBack;
    std::function<void(FileStatus)> _receiveFileNameStatusCallback;
    std::function<void()> _dataReceivedCallback;

};

#endif // I_EXPERIMENT_H

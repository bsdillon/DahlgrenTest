#ifndef EXPERIMENTPROXY_H
#define EXPERIMENTPROXY_H

#include "proxies/AbstractProxy.h"
#include "uiinterface/i_experiment.h"

class ExperimentProxy : public QObject
{
    Q_OBJECT
public:
    ExperimentProxy();
    void updateTopicsPressed();
    void recordPressed();
    void pausePressed();
    void stopPressed();
    void errorPressed();
    void finishPressed();
    void clearDataPressed();
    void logEventPressed();

signals:
    void FileSelected(QString);
    void StopAll();

    void ExperimentRunning(bool);
    void ExperimentDone();
    void FileNameTextChanged(QString);
    void TopicsUpdated(std::vector<std::string>);
    void ClearData();
    void LogEventClicked();
    void inCleanState(bool);
    void UpdateStatus(std::string);
private:
    I_Experiment* experimentProxy;

    void TopicsChanged(std::vector<std::string> s); //Need variable names
    void ReceiveFileNameStatus(FileStatus fs);
    void DataReceived();
};

#endif // EXPERIMENTPROXY_H

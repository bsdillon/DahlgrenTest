#ifndef EXPERIMENTPROXY_H
#define EXPERIMENTPROXY_H

#include "proxies/AbstractProxy.h"
#include "uiinterface/i_experiment.h"
#include "experimentlogic.h"

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
    void disableButtons(QString btnNames);
    void enableButtons(QString btnNames);

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

    void sendingMessage(const QString &message);

private:
    I_Experiment* experimentProxy;
    ExperimentLogic* experimentLogic;
    bool topicsSent;
    bool dataReceived;
    bool fileNameValid;
    bool buttonReady;
    std::vector<std::string> topicNames;

    void TopicsChanged(std::vector<std::string> s); //Need variable names
    void ReceiveFileNameStatus(FileStatus fs);
    void DataReceived();

    int proxyid;
};
static int proxycount = 0;

#endif // EXPERIMENTPROXY_H

#ifndef I_EXPERIMENT_H
#define I_EXPERIMENT_H

#include "qobject.h"
#include "filestatus.h"

class I_Experiment : public QObject
{
    Q_OBJECT

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
    void TopicsChanged(std::vector<std::string>);
    void FinishPressed();
    void ReceiveFileNameStatus(FileStatus);
    void DataReceived();

};

#endif // I_EXPERIMENT_H

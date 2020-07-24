#ifndef EXPERIMENTPANEL_H
#define EXPERIMENTPANEL_H

#include <map>
#include <memory>
#include <QString>
#include <QWidget>
#include <string>
#include <vector>

#include "filestatus.h"

class AbstractDriver;

namespace Ui {
  class ExperimentPanel;
}

class ExperimentPanel : public QWidget
{
    Q_OBJECT

public:
    explicit ExperimentPanel(QWidget *parent = 0);
    void CloseDown();
    ~ExperimentPanel();

public slots:
    void TopicsChanged(std::vector<std::string>);
    void FinishPressed();
    void ReceiveFileNameStatus(FileStatus);
    void DataReceived();
    void UpdateTopicsPressed();

signals:
    void UpdateStatus(std::string);
    void FileSelected(QString);
    void StopAll();
    void ExperimentRunning(bool);
    void ExperimentDone();
    void FileNameTextChanged(QString);
    void LogEventClicked();
    void TopicsUpdated(std::vector<std::string>);
    void ClearData();
    void inCleanState(bool);

private:
    enum ButtonState
    {
        Invalid,
        Ready,
        Running,
        Paused,
        Error,
        ClearingData,
        Finalizing
    };

    Ui::ExperimentPanel *ui;
    std::vector<std::string> topicNames;
    bool fileNameValid;
    bool buttonReady;
    bool topicsSent;
    bool dataReceived;
    ButtonState state;

    void ApplyState();
    void CheckState();
    void UpdateLastExperimentFile();

private slots:
    void RecordPressed();
    void PausePressed();
    void StopPressed();
    void ErrorPressed();
    void ClearDataPressed();
};

#endif // EXPERIMENTPANEL_H

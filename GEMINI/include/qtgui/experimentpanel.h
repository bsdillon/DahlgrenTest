#ifndef EXPERIMENTPANEL_H
#define EXPERIMENTPANEL_H

#include <map>
#include <memory>
#include <QString>
#include <QWidget>
#include <string>
#include <vector>

#include "filestatus.h"
#include "uiinterface/i_experiment.h"

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
    void UpdateTopicsPressed();

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

    I_Experiment* experimentProxy;

private slots:
    void RecordPressed();
    void PausePressed();
    void StopPressed();
    void ErrorPressed();
    void ClearDataPressed();
};

#endif // EXPERIMENTPANEL_H

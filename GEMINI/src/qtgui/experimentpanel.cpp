#include "qtgui/experimentpanel.h"
#include "ui_experimentpanel.h"
#include <exception>
#include <QDebug>
#include "common.h"

ExperimentPanel::ExperimentPanel(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::ExperimentPanel),
    topicsSent(false),
    dataReceived(false),
    state(Invalid)
{
    ui->setupUi(this);


    connect(ui->recordButton, &QPushButton::clicked, this, &ExperimentPanel::RecordPressed);
    connect(ui->pauseButton, &QPushButton::clicked, this, &ExperimentPanel::PausePressed);
    connect(ui->stopButton, &QPushButton::clicked, this, &ExperimentPanel::StopPressed);
    connect(ui->errorButton, &QPushButton::clicked, this, &ExperimentPanel::ErrorPressed);
    connect(ui->finishButton, &QPushButton::clicked, this, &ExperimentPanel::FinishPressed);
    //FinishedPressed is a slot
    connect(ui->updateTopicsButton, &QPushButton::clicked, this, &ExperimentPanel::UpdateTopicsPressed);
    connect(ui->logButton, &QPushButton::clicked, this, &ExperimentPanel::LogEventClicked);
    connect(ui->clearDataButton, &QPushButton::clicked, this, &ExperimentPanel::ClearDataPressed);

    if (!Common::IsTest())
    {
        ui->errorButton->hide();
        ui->finishButton->hide();
        ui->label_testButtons->hide();
    }

    ReceiveFileNameStatus({false, ""});
    //RecievedFileNameStatus is a slot

    experimentProxy = new I_Experiment(this);

    experimentProxy->setTopicsChangedCallback(std::bind(&ExperimentPanel::TopicsChanged, this, std::placeholders::_1));
    //experimentProxy->setFinishedPressedCallback(std::bind(&ExperimentPanel::FinishedPressed, this, std::placeholders::_1));
    experimentProxy->setFinishedPressedCallback(std::bind(&ExperimentPanel::FinishedPressed, this));
    experimentProxy->setReceivedFileNameStatusCallback(std::bind(&ExperimentPanel::ReceiveFileNameStatus, this, std::placeholders::_1));
    //experimentProxy->setDataReceived(std::bind(&ExperimentPanel::DataReceived, this, std::placeholders::_1));
    experimentProxy->setDataReceived(std::bind(&ExperimentPanel::DataReceived, this));

    //Signal Forwarding
    connect(this, &ExperimentPanel::ExperimentRunning, experimentProxy, &I_Experiment::ExperimentRunning);
    connect(this, &ExperimentPanel::ExperimentDone, experimentProxy, &I_Experiment::ExperimentDone);

    connect(ui->nameInput, &QLineEdit::textChanged, experimentProxy, &I_Experiment::FileNameTextChanged);
    connect(this, &ExperimentPanel::TopicsUpdated, experimentProxy, &I_Experiment::TopicsUpdated);
    connect(this, &ExperimentPanel::ClearData, experimentProxy, &I_Experiment::ClearData);
    connect(this, &ExperimentPanel::LogEventClicked, experimentProxy, &I_Experiment::LogEventClicked);
    connect(this, &ExperimentPanel::inCleanState, experimentProxy, &I_Experiment::inCleanState);
    connect(this, &ExperimentPanel::UpdateStatus, experimentProxy, &I_Experiment::UpdateStatus);

}

ExperimentPanel::~ExperimentPanel()
{
    delete ui;
}

//----------------------------------------------//
//          Topic update state machine          //
//----------------------------------------------//
void ExperimentPanel::TopicsChanged(std::vector<std::string> newTopicNames)
{
    topicNames = newTopicNames;
    topicsSent = false;
    CheckState();
}

void ExperimentPanel::UpdateTopicsPressed()
{
    ui->updateTopicsButton->setEnabled(false); // Disable during update
    emit TopicsUpdated(topicNames);

    UpdateLastExperimentFile();
    topicsSent = true;
    CheckState();
}


//----------------------------------------------//
//          Topic update state machine          //
//----------------------------------------------//

//----------------------------------------------//
//      Experiement button state machine        //
//----------------------------------------------//
void ExperimentPanel::ReceiveFileNameStatus(FileStatus fileStatus)
{
    fileNameValid = fileStatus.valid;
    QString output = fileStatus.infoMessage;
    ui->nameOutput->setText(output);
    CheckState();
}

void ExperimentPanel::DataReceived()
{
    dataReceived = true;
}

void ExperimentPanel::RecordPressed()
{
    state = Running;
    ApplyState();
}

void ExperimentPanel::PausePressed()
{
    state = Paused;
    ApplyState();
}

void ExperimentPanel::StopPressed()
{
    if (dataReceived) {
        state = ClearingData;
    } else {
        state = Finalizing;
    }
    ApplyState();
}

void ExperimentPanel::ErrorPressed()
{
    state = Error;
    ApplyState();
}

void ExperimentPanel::FinishPressed()
{
    try
    {
        state = Ready;
        ApplyState();
        ui->nameInput->setText(QString());
    }
    catch (const std::exception& e)
    {
        qDebug() << "Error in ExperimentPanel during tes (finish not successful): " << e.what();
    }
}

void ExperimentPanel::ClearDataPressed()
{
    emit ClearData();
    state = Finalizing;
    ApplyState();
}

void ExperimentPanel::CheckState()
{
    //buttons become operational when at least one button has been selected and sent, and the file name meets requirements.
    buttonReady = topicsSent && topicNames.size() > 0 && fileNameValid;
    ApplyState();
}

void ExperimentPanel::ApplyState()
{
    //this if-else goes back and forth from valid to invalid BEFORE the experiment starts.
    if (buttonReady && state == Invalid)
    {
        state = Ready;
    }
    else if (!buttonReady && state == Ready)
    {
        state = Invalid;
    }

    //enable or disable test buttons based on current state
    if (Common::IsTest())
    {
        ui->errorButton->setEnabled(state == Running);
        ui->finishButton->setEnabled(state == Error || state == Finalizing);
    }

    switch(state)
    {
        case Invalid:
            // this state allows you to fully edit the scenario, but not run it
            ui->updateTopicsButton->setEnabled(!topicsSent && topicNames.size()>0);
            ui->nameInput->setEnabled(true);
            ui->stopButton->setEnabled(false);
            ui->recordButton->setEnabled(false);
            ui->pauseButton->setEnabled(false);
            ui->logButton->setEnabled(false);
            ui->clearDataButton->setEnabled(false);
            ui->statusOutput->setText("Please complete scenario");
            emit inCleanState(true);
            dataReceived = false;
            break;
        case Ready:
            // this state allows you to fully edit the scenario OR run it
            ui->updateTopicsButton->setEnabled(false);//if we are ready we should never send the update
            ui->nameInput->setEnabled(true);
            ui->stopButton->setEnabled(false);
            ui->recordButton->setEnabled(true);
            ui->pauseButton->setEnabled(false);
            ui->logButton->setEnabled(false);
            ui->clearDataButton->setEnabled(false);
            ui->statusOutput->setText("Scenario ready");
            emit inCleanState(true);
            dataReceived = false;
            break;
        case Running:
            // this state allows you to stop/pause the scenario, but not to edit it on the fly
            ui->updateTopicsButton->setEnabled(false);
            ui->nameInput->setEnabled(false);
            ui->stopButton->setEnabled(true);
            ui->recordButton->setEnabled(false);
            ui->pauseButton->setEnabled(true);
            ui->logButton->setEnabled(true);
            ui->clearDataButton->setEnabled(false);
            ui->statusOutput->setText("Recording data");
            emit ExperimentRunning(true);
            emit inCleanState(false);
            break;
        case Paused:
            // this state allows you to start/stop the scenario, but not to edit it on the fly
            ui->updateTopicsButton->setEnabled(false);
            ui->nameInput->setEnabled(false);
            ui->stopButton->setEnabled(false);
            ui->recordButton->setEnabled(true);
            ui->pauseButton->setEnabled(false);
            ui->logButton->setEnabled(false);
            ui->clearDataButton->setEnabled(false);
            ui->statusOutput->setText("Recording paused");
            emit ExperimentRunning(false);
            emit inCleanState(false);
            break;
        case Error:
            // this state stops all operations and forces the system to complete an emergency file dump
            ui->updateTopicsButton->setEnabled(false);
            ui->nameInput->setEnabled(false);
            ui->stopButton->setEnabled(false);
            ui->recordButton->setEnabled(false);
            ui->pauseButton->setEnabled(false);
            ui->logButton->setEnabled(false);
            ui->clearDataButton->setEnabled(false);
            ui->statusOutput->setText("Error state - recovering");
            emit ExperimentRunning(false);
            emit inCleanState(false);
            break;
        case ClearingData:
            ui->updateTopicsButton->setEnabled(false);
            ui->nameInput->setEnabled(false);
            ui->stopButton->setEnabled(false);
            ui->recordButton->setEnabled(false);
            ui->pauseButton->setEnabled(false);
            ui->pauseButton->setEnabled(false);
            ui->logButton->setEnabled(false);
            ui->clearDataButton->setEnabled(true);
            ui->statusOutput->setText("Clear data to continue");
            emit ExperimentRunning(false);
            emit inCleanState(false);
            dataReceived = false;
            break;
        case Finalizing:
            // this state stops all operations while the file is being finalized
            ui->updateTopicsButton->setEnabled(false);
            ui->nameInput->setEnabled(false);
            ui->stopButton->setEnabled(false);
            ui->recordButton->setEnabled(false);
            ui->pauseButton->setEnabled(false);
            ui->pauseButton->setEnabled(false);
            ui->logButton->setEnabled(false);
            ui->clearDataButton->setEnabled(false);
            ui->statusOutput->setText("Recording completed - finalizing log");
            emit ExperimentRunning(false);
            emit ExperimentDone();
            emit inCleanState(false);
            break;
    }
}
//----------------------------------------------//
//      Experiment button state machine        //
//----------------------------------------------//

void ExperimentPanel::UpdateLastExperimentFile()
{
    return;
}

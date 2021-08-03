#include "experimentlogic.h"
#include "../include/headless/experimentproxy.h"

ExperimentLogic::ExperimentLogic()
{
    experimentProxy = new I_Experiment(this);
    connect(this, &ExperimentLogic::ExperimentRunning, experimentProxy, &I_Experiment::ExperimentRunning);
    connect(this, &ExperimentLogic::ExperimentDone, experimentProxy, &I_Experiment::ExperimentDone);
    connect(this, &ExperimentLogic::inCleanState, experimentProxy, &I_Experiment::inCleanState);
}

bool ExperimentLogic::checkState(bool topicsSent, std::vector<std::string> topicNames, bool fileNameValid){
    bool buttonReady = topicsSent && topicNames.size() > 0 && fileNameValid;
    return buttonReady;
}

bool ExperimentLogic::applyState(bool buttonReady, bool topicsSent, std::vector<std::string> topicNames, bool dr){
    //this if-else goes back and forth from valid to invalid BEFORE the experiment starts.
    if (buttonReady && state == Invalid)
    {
        state = Ready;
    }
    else if (!buttonReady && state == Ready)
    {
        state = Invalid;
    }

    bool dataReceived = dr;
    switch(state)
    {
        case Invalid:
            // this state allows you to fully edit the scenario, but not run it

            /*ui->updateTopicsButton->setEnabled(!topicsSent && topicNames.size()>0);
            /ui->nameInput->setEnabled(true);
            /ui->stopButton->setEnabled(false);
            /ui->recordButton->setEnabled(false);
            /ui->pauseButton->setEnabled(false);
            /ui->logButton->setEnabled(false);
            /ui->clearDataButton->setEnabled(false);
            ui->statusOutput->setText("Please complete scenario");*/
            if(!topicsSent && topicNames.size() > 0){
                emit enableButtons("updateTopicsButton");
            }
            emit enableText("nameInput");
            emit disableButtons("stopButton");
            emit disableButtons("recordButton");
            emit disableButtons("pauseButton");
            emit disableButtons("logButton");
            emit disableButtons("clearDataButton");
            emit setStatusOutputText("statusOutput");
            emit inCleanState(true);
            dataReceived = false;
            break;
        case Ready:
            // this state allows you to fully edit the scenario OR run it

            /*ui->updateTopicsButton->setEnabled(false);//if we are ready we should never send the update
            /ui->nameInput->setEnabled(true);
            /ui->stopButton->setEnabled(false);
            /ui->recordButton->setEnabled(true);
            /ui->pauseButton->setEnabled(false);
            /ui->logButton->setEnabled(false);
            ui->clearDataButton->setEnabled(false);
            ui->statusOutput->setText("Scenario ready");*/
            emit enableText("nameInput");
            emit disableButtons("stopButton");
            emit enableButtons("recordButton");
            emit disableButtons("pauseButton");
            emit disableButtons("logButton");
            emit disableButtons("clearDataButton");
            emit setStatusOutputText("Scenario ready");
            emit inCleanState(true);
            dataReceived = false;
            break;
        case Running:
            // this state allows you to stop/pause the scenario, but not to edit it on the fly
            /*ui->updateTopicsButton->setEnabled(false);
            ui->nameInput->setEnabled(false);
            ui->stopButton->setEnabled(true);
            ui->recordButton->setEnabled(false);
            ui->pauseButton->setEnabled(true);
            ui->logButton->setEnabled(true);
            ui->clearDataButton->setEnabled(false);
            ui->statusOutput->setText("Recording data");*/
            emit ExperimentRunning(true);
            emit inCleanState(false);
            break;
        case Paused:
            // this state allows you to start/stop the scenario, but not to edit it on the fly
            /*ui->updateTopicsButton->setEnabled(false);
            ui->nameInput->setEnabled(false);
            ui->stopButton->setEnabled(false);
            ui->recordButton->setEnabled(true);
            ui->pauseButton->setEnabled(false);
            ui->logButton->setEnabled(false);
            ui->clearDataButton->setEnabled(false);
            ui->statusOutput->setText("Recording paused");*/
            emit ExperimentRunning(false);
            emit inCleanState(false);
            break;
        case Error:
            // this state stops all operations and forces the system to complete an emergency file dump
            /*ui->updateTopicsButton->setEnabled(false);
            ui->nameInput->setEnabled(false);
            ui->stopButton->setEnabled(false);
            ui->recordButton->setEnabled(false);
            ui->pauseButton->setEnabled(false);
            ui->logButton->setEnabled(false);
            ui->clearDataButton->setEnabled(false);
            ui->statusOutput->setText("Error state - recovering");*/
            emit ExperimentRunning(false);
            emit inCleanState(false);
            break;
        case ClearingData:
            /*ui->updateTopicsButton->setEnabled(false);
            ui->nameInput->setEnabled(false);
            ui->stopButton->setEnabled(false);
            ui->recordButton->setEnabled(false);
            ui->pauseButton->setEnabled(false);
            ui->pauseButton->setEnabled(false);
            ui->logButton->setEnabled(false);
            ui->clearDataButton->setEnabled(true);
            ui->statusOutput->setText("Clear data to continue");*/
            emit ExperimentRunning(false);
            emit inCleanState(false);
            dataReceived = false;
            break;
        case Finalizing:
            // this state stops all operations while the file is being finalized
            /*ui->updateTopicsButton->setEnabled(false);
            ui->nameInput->setEnabled(false);
            ui->stopButton->setEnabled(false);
            ui->recordButton->setEnabled(false);
            ui->pauseButton->setEnabled(false);
            ui->pauseButton->setEnabled(false);
            ui->logButton->setEnabled(false);
            ui->clearDataButton->setEnabled(false);
            ui->statusOutput->setText("Recording completed - finalizing log");*/
            emit ExperimentRunning(false);
            emit ExperimentDone();
            emit inCleanState(false);
            break;
    }
    return dataReceived;
}

void ExperimentLogic::setButtonState(ButtonState bs){
    state = bs;
}

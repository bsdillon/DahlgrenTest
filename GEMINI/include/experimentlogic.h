#ifndef EXPERIMENTLOGIC_H
#define EXPERIMENTLOGIC_H

#include <QObject>
#include "uiinterface/i_experiment.h"

class ExperimentLogic : public QObject
{
    Q_OBJECT
public:
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

    ButtonState state;

    ExperimentLogic();
    bool checkState(bool topicsSent, std::vector<std::string> topicNames, bool fileNameValid);
    bool applyState(bool buttonReady, bool topicsSent, std::vector<std::string> topicNames, bool dr);
    void setButtonState(ButtonState bs);

signals:
    void ExperimentRunning(bool);
    void ExperimentDone();
    void inCleanState(bool);
    void disableButtons(QString);
    void enableButtons(QString);
    void disableText(QString);
    void enableText(QString);
    void setStatusOutputText(QString);

private:
    I_Experiment* experimentProxy;

};

#endif // EXPERIMENTLOGIC_H

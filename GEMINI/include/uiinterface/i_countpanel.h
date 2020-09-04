#ifndef I_COUNTPANEL_H
#define I_COUNTPANEL_H

#include "qobject.h"
#include "messagelistener.h"

class I_CountPanel : public QObject
{
    Q_OBJECT
public:    
    MessageListener* listener() const;

    //Constructor
    I_CountPanel(QObject *parent=0);
    //Slot callback setter
    I_CountPanel setReceiveNewTopicsCallback(std::function<void(std::map<std::string, AbstractDriver *>)> receiveNewTopicsCallback);

    //Signals
    void signalToggleSubscription(QString topic, bool enable);
    void signalUpdateStatus(std::string status);
    void signalExperimentRunning(bool run);

public slots:
    void ReceiveNewTopics(std::map<std::string, AbstractDriver *> factories);
signals:
    void toggleSubscription(QString topic, bool enable);
    void UpdateStatus(std::string);
    void experimentRunning(bool);

private:
    std::function<void(std::map<std::string, AbstractDriver *>)> _receiveNewTopicsCallback;
};

#endif // I_COUNTPANEL_H

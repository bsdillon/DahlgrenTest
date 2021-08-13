#ifndef I_COUNTPANEL_H
#define I_COUNTPANEL_H

#include "qobject.h"
#include "messagelistener.h"

class I_CountPanel : public QObject
{
    Q_OBJECT
public:    
    MessageListener* listener();

    //Constructor
    I_CountPanel(QObject *parent=0);
    //Slot callback setter
    void setReceiveNewTopicsCallback(std::function<void(std::map<std::string, AbstractDriver *>)> receiveNewTopicsCallback);

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
    int i_countId;
    MessageListener* _messageListener;
};
static int i_countCount = 0;

#endif // I_COUNTPANEL_H

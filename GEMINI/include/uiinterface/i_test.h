#ifndef I_TEST_H
#define I_TEST_H

#include "net/topics/message.h"
#include "qobject.h"
#include "net/source/abstractdriver.h"


class I_Test : public QObject
{
    Q_OBJECT

public:
    void show() { }
    I_Test(QObject *parent=0);
    //Signals
    void signalMessage(QString s, Message* m);
    //Slot Callbacks
    void setReceiveExperimentRunStatus(std::function<void(bool)> status);
    void setStopPublishingMessages(std::function<void(bool)> experimentRunning);
    void setReceiveNewTopics(std::function<void(std::map<std::string, AbstractDriver*>)> factories);

signals:
    void MessagePassing(QString, Message*);

public slots:
    void receiveExperimentRunStatus(bool status);
    void stopPublishingMessages(bool experimentRunning);
    void ReceiveNewTopics(std::map<std::string, AbstractDriver*> factories);

private:
    std::function<void(bool)> _statusCallback;
    std::function<void(bool)> _experimentRunningCallback;
    std::function<void(std::map<std::string, AbstractDriver*>)> _receiveNewTopicsCallback;
};

#endif // I_TEST_H

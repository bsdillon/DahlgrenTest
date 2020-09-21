#ifndef TESTWINDOWPROXY_H
#define TESTWINDOWPROXY_H

#include "proxies/AbstractProxy.h"
#include "uiinterface/i_test.h"

class TestWindowProxy : public QObject
{
    Q_OBJECT
public:
    TestWindowProxy();
    void show();

signals:
    void MessagePassing(QString, Message*);

public slots:
    void receiveExperimentRunStatus(bool status);
    void stopPublishingMessages(bool experimentRunning);
    void ReceiveNewTopics(std::map<std::string, AbstractDriver*> factories);

private:
    I_Test* testProxy;
    //void receiveExperimentRunStatus(bool status);
    //void stopPublishingMessages(bool experimentRunning);
    //void ReceiveNewTopics(std::map<std::string, AbstractDriver*> factories);
};

#endif // TESTWINDOWPROXY_H

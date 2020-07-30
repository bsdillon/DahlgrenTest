#ifndef I_TEST_H
#define I_TEST_H

#include "qobject.h"
#include "net/abstractdriver.h"

class I_Test : public QObject
{
    Q_OBJECT

public:
    void show();

signals:
    void Message(QString, Message*);

public slots:
    void receiveExperimentRunStatus(bool status);
    void stopPublishingMessages(bool experimentRunning);
    void ReceiveNewTopics(std::map<std::string, AbstractDriver*> factories);

};

#endif // I_TEST_H

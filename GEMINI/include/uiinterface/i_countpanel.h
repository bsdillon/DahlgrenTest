#ifndef I_COUNTPANEL_H
#define I_COUNTPANEL_H

#include "qobject.h"
#include "messagelistener.h"

class I_CountPanel : public QObject
{
    Q_OBJECT
public:
    MessageListener* listener() const;
public slots:
    void ReceiveNewTopics(std::map<std::string, AbstractDriver *> factories);
signals:
    void toggleSubscription(QString topic, bool enable);
    void UpdateStatus(std::string);
    void experimentRunning(bool);

};

#endif // I_COUNTPANEL_H

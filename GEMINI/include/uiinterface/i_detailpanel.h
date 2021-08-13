#ifndef I_DETAILPANEL_H
#define I_DETAILPANEL_H

#include "qobject.h"
#include "messagelistener.h"

class I_DetailPanel : public QObject
{
    Q_OBJECT
public:
    MessageListener* listener();

    //Constructors
    I_DetailPanel(QObject *parent=0);

    //Signals
    void signalUpdateStatus(std::string status);

    //Slot Callback
    void setClearMessageCallback(std::function<void()> clearMessage);


signals:
    void UpdateStatus(std::string);
public slots:
    void ClearMessages();

private:
    std::function<void()> _clearMessageCallback;
    int i_detailId;
    MessageListener* _messageListener;

};
static int i_detailCount = 0;
#endif // I_DETAILPANEL_H

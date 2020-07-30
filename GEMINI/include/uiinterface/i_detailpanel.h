#ifndef I_DETAILPANEL_H
#define I_DETAILPANEL_H

#include "qobject.h"
#include "messagelistener.h"

class I_DetailPanel : public QObject
{
    Q_OBJECT
public:
    MessageListener* listener() const;
signals:
    void UpdateStatus(std::string);
public slots:
    void ClearMessages();

};
#endif // I_DETAILPANEL_H

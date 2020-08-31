#ifndef MAINPROXY_H
#define MAINPROXY_H

#include "proxies/AbstractProxy.h"
#include "uiinterface/i_main.h"

class MainProxy : public QObject
{
    Q_OBJECT
public:
    MainProxy();

signals:
    void LogMessage(QString);

private:
    I_Main* mainProxy;
    void Status(std::string s);
    void modeSwitchingEnabled(bool enabled);
    void logEventClicked();
};

#endif // MAINPROXY_H

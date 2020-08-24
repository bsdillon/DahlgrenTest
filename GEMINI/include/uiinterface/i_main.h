#ifndef I_MAIN_H
#define I_MAIN_H

#include "qobject.h"

class I_Main : public QObject
{
    Q_OBJECT

public:
    I_Main(QObject *parent=0);
    void show();

    //Public functions to set callbacks
    void setStatusCallback(std::function<void(QString)> cb);

    void setLogEvent(std::fucntion<void()> logEvent);

    void switchingEnabled(std::function<void(bool)> enabled);

    //public signal function
    void signalLogMessage(QString message);

public slots:
    void Status(std::string s);
    void modeSwitchingEnabled(bool enabled);
    void logEventClicked();

signals:
    void LogMessage(QString);

private:
    std::function<void(QString)> statusCallback;
    std::function<void(bool)> _enabled;
    std::function<void()> _logEventClicked;

};

#endif // I_MAIN_H

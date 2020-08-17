#ifndef I_MAIN_H
#define I_MAIN_H

#include "qobject.h"

//TODO edit to compare with MessageListener for slot/signal functionality

class I_Main : public QObject
{
    Q_OBJECT

public:
    void show();
    //public functions to set the callbacks
void setLogEventCallback (std::function<void(const ???)> cb);

   //public signal function
   void SignalLogMessage(QString s) { emit LogMessage(s);}

public slots:
    void Status(std::string s);
    void modeSwitchingEnabled(bool enabled);
    void logEventClicked();

signals:
    void LogMessage(QString);

//private functions for callbacks
    std::function<?????//> myprivateLogEventCallback;
};

//On CPP side

//set each callback from the public function

void setLogEventCallback (std::function<void(const ???)> cb)
{
    myprivateLogEventCallback = cb;
}


#endif // I_MAIN_H

#ifndef I_MAIN_H
#define I_MAIN_H

#include "qobject.h"

//TODO edit to compare with MessageListener for slot/signal functionality

class I_Main : public QObject
{
    Q_OBJECT

public:
    I_Main(QObject *parent=0);
    void show();
<<<<<<< HEAD

    //Public functions to set callbacks
    void setStatusCallback(std::function<void(QString)> cb);

    void setLogEvent(std::fucntion<void()> logEvent);

    void switchingEnabled(std::function<void(bool)> enabled);

    //public signal function
    void signalLogMessage(QString message);
=======
    //public functions to set the callbacks
void setLogEventCallback (std::function<void(const ???)> cb);

   //public signal function
   void SignalLogMessage(QString s) { emit LogMessage(s);}
>>>>>>> 916c9e03c01e148d90c7c55ab37eb07f4e4d2312

public slots:
    void Status(std::string s);
    void modeSwitchingEnabled(bool enabled);
    void logEventClicked();

signals:
    void LogMessage(QString);

<<<<<<< HEAD
private:
    std::function<void(QString)> statusCallback;
    std::function<void(bool)> _enabled;
    std::function<void()> _logEventClicked;

=======
//private functions for callbacks
    std::function<?????//> myprivateLogEventCallback;
>>>>>>> 916c9e03c01e148d90c7c55ab37eb07f4e4d2312
};

//On CPP side

//set each callback from the public function

void setLogEventCallback (std::function<void(const ???)> cb)
{
    myprivateLogEventCallback = cb;
}


#endif // I_MAIN_H

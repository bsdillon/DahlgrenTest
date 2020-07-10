#ifndef MESSAGECONSUMER
#define MESSAGECONSUMER

#include "AbstractDriver.h"
#include <QString>

class MessageConsumer
{
public slots:
    void NewMessage(QString topic, AbstractDriver*);
};

#endif // MESSAGECONSUMER


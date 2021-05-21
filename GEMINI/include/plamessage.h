#ifndef PLAMESSAGE_H
#define PLAMESSAGE_H

#include <memory>
#include <QString>

#include "net/source/abstractdriver.h"
#include "messagefield.h"

struct PLAMessage
{
    QString topic;
    long long time;
    std::vector<MessageField> msg;

    PLAMessage()
        : topic("UNINITIALIZED"), time(0)
    {
        msg = std::vector<MessageField>{};
    }

    PLAMessage(QString newTopic, long long newTime, std::vector<MessageField> newMsg)
        : topic(newTopic), time(newTime), msg(newMsg)
    {}
};

#endif

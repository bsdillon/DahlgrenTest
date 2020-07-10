#ifndef DATAMANAGER_H
#define DATAMANAGER_H

#include <list>
#include <memory>
#include <QObject>
#include <string>
#include <vector>

#include "AbstractDriver.h"
#include "plamessage.h"

class MessageListener;

class DataManager : public QObject
{
        Q_OBJECT
    public:
        explicit DataManager();
        void addMessage(std::string topic, std::unique_ptr<AbstractDriver> message);
        void addMessageListener(MessageListener* listener);

    signals:
        void messageReceived(const PLAMessage&);
        void clearListenerData();
        void dataReceived();

    public slots:
        void clearData();
        void loadDataFrom(QString fileName);

    private:
        std::list<PLAMessage> _messages;
        std::vector<MessageListener*> _listeners;
};

#endif // DATAMANAGER_H

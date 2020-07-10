#ifndef MESSAGELISTENER
#define MESSAGELISTENER

#include <functional>
#include <QObject>
#include <QString>

#include "plamessage.h"

class MessageListener : public QObject
{
    Q_OBJECT

    public:
        MessageListener(QObject *parent = 0);
        MessageListener* setMessageCallback(std::function<void(const PLAMessage&)> messageCallback);
        MessageListener* setLoggingCallback(std::function<void(QString)> loggingCallback);
        MessageListener* setClearDataCallback(std::function<void()> clearDataCallback);

    public slots:
        void Message(const PLAMessage& m) const;
        void Log(QString logMessage) const;
        void ClearData() const;

    private:
        std::function<void(const PLAMessage&)> _messageCallback;
        std::function<void(QString)> _loggingCallback;
        std::function<void()> _clearDataCallback;
};

#endif // MESSAGELISTENER


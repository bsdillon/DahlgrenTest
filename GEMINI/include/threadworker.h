#ifndef THREADWORKER_H
#define THREADWORKER_H

#include <QObject>
#include <QTimer>

class ThreadWorker : public QObject
{
        Q_OBJECT

    public:
        explicit ThreadWorker(QObject *parent = 0);
        virtual ~ThreadWorker();

    signals:

    public slots:
        void start(int msec);
        virtual void run() = 0;
        void stop();

    protected:
        QTimer *timer = nullptr; // Deleted by ThreadWorker parent
};

#endif // THREADWORKER_H

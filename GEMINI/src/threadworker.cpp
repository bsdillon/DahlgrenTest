#include "threadworker.h"

ThreadWorker::ThreadWorker(QObject *parent)
    : QObject(parent)
{}

ThreadWorker::~ThreadWorker()
{}

void ThreadWorker::start(int msec)
{
    if (timer == nullptr)
    {
        timer = new QTimer(this);
        connect(timer, &QTimer::timeout, this, &ThreadWorker::run);
    }
    // If already running, start() stops timer and restarts it
    timer->start(msec);
}

void ThreadWorker::stop()
{
    timer->stop();
}

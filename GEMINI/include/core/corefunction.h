#ifndef COREFUNCTION_H
#define COREFUNCTION_H

#include <memory>
#include "filequeue.h"
#include <QThread>
#include <QCloseEvent>
#include <QSplashScreen>
#include "subscriptionmanager.h"
#include "qtgui/mainwindow.h"
#include "proxies/proxyset.h"
#include "headless/headlessapp.h"

class CoreFunction : public QObject
{
    Q_OBJECT
public:
    CoreFunction();
    void CompleteStartup();
    void closeEvent(QCloseEvent *);

private slots:
    void setDataMode(bool savedDataMode);

signals:
    void startFileQueueThread(int msec);
    void stopFileQueueThread();

private:
    QSplashScreen* qss;
    MainWindow* main;
    HeadlessApp* headless;
    std::unique_ptr<ProxySet> proxies;
    QThread* messageProcessingThread;
    QThread* fileQueueThread;
    std::unique_ptr<SubscriptionManager> _subscriptionManager;
    std::unique_ptr<FileQueue> fileQueue;
    std::vector<MessageListener*> _listeners;
    void setUpSubscriptionManager();
    void setUpFileQueue();

};

#endif // COREFUNCTION_H

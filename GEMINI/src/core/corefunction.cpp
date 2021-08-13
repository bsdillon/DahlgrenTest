#include "core/corefunction.h"
#include "common.h"

CoreFunction::CoreFunction()
{
    if(!Common::isHeadless())
    {
        qss = new QSplashScreen(QPixmap(":/SplashScreen.bmp"));
        qss->setWindowFlags(qss->windowFlags() | Qt::WindowStaysOnTopHint);
        qss->show();
    }
    else
    {
        //TODO setup feedback equivalent to splash screen
    }
}

void CoreFunction::CompleteStartup()
{

    setUpFileQueue();
    _listeners.push_back(fileQueue->listener());
    setUpSubscriptionManager();
    this->proxies = std::unique_ptr<ProxySet>(new ProxySet());

    if(!Common::isHeadless())
    {
        main = new MainWindow();
        main->setupProxies(proxies);
        qss->finish(main);
    }
    else
    {
        headless = new HeadlessApp(1337);
        headless->setupProxies(proxies);
        //TODO setup feedback equivalent to splash screen
    }

    proxies->setUpConnections(fileQueue, _subscriptionManager);
    proxies->configureMessageListeners(_listeners);
    _subscriptionManager->addMessageListeners(_listeners);

    proxies->LoadUI();

    if(!(Common::isHeadless()))
    {
        main->show();
    }
}

void CoreFunction::setUpFileQueue()
{
    // Spawn new thread for FileQueue, then start it and FileQueue
    fileQueue = std::unique_ptr<FileQueue>(new FileQueue);
    connect(this, &CoreFunction::startFileQueueThread, fileQueue.get(), &FileQueue::start);
    connect(this, &CoreFunction::stopFileQueueThread, fileQueue.get(), &FileQueue::stop);

    fileQueueThread = new QThread(this);
    fileQueue->moveToThread(fileQueueThread);
    fileQueueThread->start();
    emit startFileQueueThread(50);
}

void CoreFunction::setUpSubscriptionManager()
{
    _subscriptionManager = std::unique_ptr<SubscriptionManager>(new SubscriptionManager());
    messageProcessingThread = new QThread(this);
    _subscriptionManager->moveToThread(messageProcessingThread);
    messageProcessingThread->start();
}

void CoreFunction::setDataMode(bool savedDataMode)
{
    if (savedDataMode)
    {
        fileQueue->setEnabled(false);
    }
    else
    {
        fileQueue->setEnabled(true);
    }
}

void CoreFunction::closeEvent(QCloseEvent * e)
{
    if (Common::IsTest())
    {
        //TODO relace with signal to approppriate class
        //testWindow->stopPublishingMessages(false);
    }

    emit stopFileQueueThread();
    fileQueueThread->quit();
    messageProcessingThread->quit();
    fileQueueThread->wait();
    messageProcessingThread->wait();
    e->accept();
}

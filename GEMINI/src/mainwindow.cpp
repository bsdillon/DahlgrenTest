#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <iostream>
#include <QFuture>
#include <QInputDialog>
#include <QLabel>
#include <QtConcurrent/QtConcurrent>

#include "common.h"
#include "dataloaderpanel.h"
#include "DriverFactory.h"
#include "filequeue.h"
#include "messagelistener.h"
#include "stylemanager.h"
#include "subscriptionmanager.h"
#include "testwindow.h"
#include "toggleswitch.h"

#include "ComponentIdentificationServiceFactory_T.h"
#include "PubSubServiceFactory_T.h"

using namespace infrastructureservices::pubsub;
using namespace infrastructureservices::componentidentification;

short MainWindow::logMessageCount = 1;

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->splitter->setChildrenCollapsible(true);
    setStyleSheet(StyleManager::Instance()->requestStyleSheet());
    if(Common::IsDebug())
    {
        setDebugColoring();
    }

    id = ComponentIdentificationServiceFactory_T::getInstance()->createServiceInstance()->getComponentID();
    pss = PubSubServiceFactory_T::getInstance()->createServiceInstance(*id);

    setUpFileQueue();
    setUpMessageProcessing();
    setUpConnections();
    configureMessageListeners();

    dataLoader = new dataLoaderPanel;
    ui->verticalLayout->insertWidget(0, dataLoader);
    dataLoader->hide();
    connect(dataLoader, &dataLoaderPanel::loadDataFrom, _subscriptionManager.get(), &SubscriptionManager::loadDataFrom);
    connect(dataLoader, &dataLoaderPanel::requestToClearData, _subscriptionManager.get(), &SubscriptionManager::ClearData);

    if(Common::IsTest())
    {
        testWindow = new TestWindow(this);
        connect(_subscriptionManager.get(), &SubscriptionManager::TopicFactoriesCreated, testWindow, &TestWindow::ReceiveNewTopics);
        connect(ui->experimentPanel, &ExperimentPanel::ExperimentRunning, testWindow, &TestWindow::receiveExperimentRunStatus);
        connect(ui->experimentPanel, &ExperimentPanel::ExperimentRunning, testWindow, &TestWindow::stopPublishingMessages);
        testWindow->StartPublication(pss);
    }

    // Set up mode toggle switch and labels (live vs load data modes)
    QLabel* _liveMode = new QLabel("Live Data Mode", this);
    QLabel* _loadMode = new QLabel("Saved Data Mode", this);
    QFont boldFont = _liveMode->font();
    boldFont.setBold(true);
    _liveMode->setFont(boldFont);
    _loadMode->setFont(boldFont);
    _modeToggle = new ToggleSwitch(StyleManager::Instance()->requestColor(("@light")),
                                   StyleManager::Instance()->requestColor(("@dark")));
    connect(_modeToggle, &ToggleSwitch::switchedLeft, this, &MainWindow::setDataMode);
    connect(dataLoader, &dataLoaderPanel::inCleanState, this, &MainWindow::modeSwitchingEnabled);
    ui->horizontalLayout->insertWidget(0, _loadMode);
    ui->horizontalLayout->insertWidget(0, _modeToggle);
    ui->horizontalLayout->insertWidget(0, _liveMode);
}

void MainWindow::Status(std::string s)
{
    std::string x = "System status: " + s;
    std::cout << x << std::endl;
    ui->statusBar->showMessage(QString::fromStdString(x));
}

void MainWindow::logEventClicked()
{
    bool textCaptured = false;
    QString logMessage = QInputDialog::getText(this, QString("Log Event"), QString("Enter log message"),
                                               QLineEdit::Normal, QString("Log Event " + QString::number(logMessageCount)),
                                               &textCaptured);
    if (!logMessage.isEmpty())
    {
        ++logMessageCount;
        emit LogMessage(logMessage);
    }
}

void MainWindow::setDataMode(bool savedDataMode)
{
    if (savedDataMode)
    {
        ui->frame_experimentPanel->hide();
        ui->frame_topicPanel->hide();
        dataLoader->show();
        fileQueue->setEnabled(false);
    }
    else
    {
        dataLoader->hide();
        ui->frame_experimentPanel->show();
        ui->frame_topicPanel->show();
        ui->topicPanel->selectionChanged();
        dataLoader->clearData();
        fileQueue->setEnabled(true);
    }
    ui->detailPanel->ClearMessages();
    ui->countPanel->DeleteTopics();
}

void MainWindow::modeSwitchingEnabled(bool enabled)
{
    enabled ? _modeToggle->setEnabled(true) : _modeToggle->setEnabled(false);
}

MainWindow::~MainWindow()
{
    PubSubServiceFactory_T::getInstance()->destroyAllServiceInstances(*id);
    delete ui;
}

void MainWindow::closeEvent(QCloseEvent * e)
{
    if (Common::IsTest())
    {
        testWindow->stopPublishingMessages(false);
    }

    emit stopFileQueueThread();
    fileQueueThread->quit();
    messageProcessingThread->quit();
    fileQueueThread->wait();
    messageProcessingThread->wait();
    e->accept();
}

void MainWindow::Load()
{
    if(Common::IsDebug())
    {
        // Bypass pub/sub by injecting messages directly from TestWindow into DefaultListeners
        connect(testWindow, &TestWindow::Message, _subscriptionManager.get(), &SubscriptionManager::testMessageInDebug);
    }
    else
    {
        //test or normal conditions requires a genuine connection
        pss->createTopic(DriverFactory::GetTopicList()[0]);
    }

    if (Common::IsTest() || Common::IsDebug())
    {
        testWindow->show();
    }
    ui->topicPanel->readSettings();
}

void MainWindow::setDebugColoring()
{
    QPalette myPalette = palette();
    myPalette.setColor(QPalette::Background, QColor(255,128,128));
    ui->experimentPanel->setAutoFillBackground(true);
    ui->experimentPanel->setPalette(myPalette);
    ui->experimentPanel->show();

    myPalette.setColor(QPalette::Background, QColor(255,255,128));
    //ui->eventPanel->setAutoFillBackground(true);
    //ui->eventPanel->setPalette(myPalette);
    //ui->eventPanel->show();

    myPalette.setColor(QPalette::Background, QColor(128,255,128));
    ui->topicPanel->setAutoFillBackground(true);
    ui->topicPanel->setPalette(myPalette);
    ui->topicPanel->show();

    myPalette.setColor(QPalette::Background, QColor(128,128,255));
    ui->countPanel->setAutoFillBackground(true);
    ui->countPanel->setPalette(myPalette);
    ui->countPanel->show();

    myPalette.setColor(QPalette::Background, QColor(255,128,255));
    ui->detailPanel->setAutoFillBackground(true);
    ui->detailPanel->setPalette(myPalette);
    ui->detailPanel->show();

    ui->statusBar->showMessage(tr("System status: None"));
}

void MainWindow::setUpFileQueue()
{
    // Spawn new thread for FileQueue, then start it and FileQueue
    fileQueue = std::unique_ptr<FileQueue>(new FileQueue);
    connect(this, &MainWindow::startFileQueueThread, fileQueue.get(), &FileQueue::start);
    connect(this, &MainWindow::stopFileQueueThread, fileQueue.get(), &FileQueue::stop);

    fileQueueThread = new QThread(this);
    fileQueue->moveToThread(fileQueueThread);
    fileQueueThread->start();
    emit startFileQueueThread(50);
}

void MainWindow::setUpMessageProcessing()
{
    _subscriptionManager = std::unique_ptr<SubscriptionManager>(new SubscriptionManager(pss));
    messageProcessingThread = new QThread(this);
    _subscriptionManager->moveToThread(messageProcessingThread);
    messageProcessingThread->start();
}

void MainWindow::setUpConnections()
{
    connect(ui->experimentPanel, &ExperimentPanel::TopicsUpdated, _subscriptionManager.get(), &SubscriptionManager::receiveTopicList);
    connect(fileQueue.get(), &FileQueue::FileClosed, ui->experimentPanel, &ExperimentPanel::FinishPressed);
    connect(fileQueue.get(), &FileQueue::FileNameChecked, ui->experimentPanel, &ExperimentPanel::ReceiveFileNameStatus);
    connect(ui->experimentPanel, &ExperimentPanel::ExperimentRunning, fileQueue.get(), &FileQueue::AcceptInput);
    connect(ui->experimentPanel, &ExperimentPanel::ExperimentDone, fileQueue.get(), &FileQueue::EndFile);
    connect(ui->experimentPanel, &ExperimentPanel::FileNameTextChanged, fileQueue.get(), &FileQueue::ReceiveFileName);
    connect(ui->topicPanel, &TopicSelector::TopicSelectionChanged, ui->experimentPanel, &ExperimentPanel::TopicsChanged);
    connect(ui->experimentPanel, &ExperimentPanel::LogEventClicked, this, &MainWindow::logEventClicked);
    connect(ui->experimentPanel, &ExperimentPanel::ExperimentDone, ui->detailPanel, &TopicDetails::ClearMessages);
    connect(ui->experimentPanel, &ExperimentPanel::UpdateStatus, this, &MainWindow::Status);
    connect(ui->topicPanel, &TopicSelector::UpdateStatus, this, &MainWindow::Status);
    connect(ui->countPanel, &TopicCounts::UpdateStatus, this, &MainWindow::Status);
    connect(ui->detailPanel, &TopicDetails::UpdateStatus, this, &MainWindow::Status);
    connect(_subscriptionManager.get(), &SubscriptionManager::UpdateStatus, this, &MainWindow::Status);
    connect(_subscriptionManager.get(), &SubscriptionManager::TopicFactoriesCreated, ui->countPanel, &TopicCounts::ReceiveNewTopics);
    connect(ui->countPanel, &TopicCounts::toggleSubscription, _subscriptionManager.get(), &SubscriptionManager::toggleSubscription);
    connect(ui->experimentPanel, &ExperimentPanel::ExperimentRunning, ui->countPanel, &TopicCounts::experimentRunning);
    connect(ui->experimentPanel, &ExperimentPanel::ClearData, _subscriptionManager.get(), &SubscriptionManager::ClearData);
    connect(_subscriptionManager.get(), &SubscriptionManager::DataReceived, ui->experimentPanel, &ExperimentPanel::DataReceived);
    connect(ui->experimentPanel, &ExperimentPanel::inCleanState, this, &MainWindow::modeSwitchingEnabled);
}

void MainWindow::configureMessageListeners()
{
    _listeners.push_back(ui->detailPanel->listener());
    _listeners.push_back(fileQueue->listener());
    _listeners.push_back(ui->countPanel->listener());
    for (auto& listener : _listeners) {
        connect(this, &MainWindow::LogMessage, listener, &MessageListener::Log);
    }
    _subscriptionManager->addMessageListeners(_listeners);
}

#include "qtgui/mainwindow.h"
#include "ui_mainwindow.h"
#include <iostream>
#include <QFuture>
#include <QInputDialog>
#include <QLabel>
#include <QtConcurrent/QtConcurrent>
#include "common.h"
#include "qtgui/dataloaderpanel.h"
#include "net/driverfactory.h"
#include "messagelistener.h"
#include "qtgui/stylemanager.h"
#include "qtgui/toggleswitch.h"
#include "proxies/AbstractProxy.h"

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

    dataLoader = new dataLoaderPanel;
    ui->verticalLayout->insertWidget(0, dataLoader);
    dataLoader->hide();

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

void MainWindow::setupProxies(std::unique_ptr<ProxySet>& ps)
{
    ps->add(new AbstractProxy(ui->experimentPanel),ProxySet::ProxyTypes::Experiment);
    ps->add(new AbstractProxy(dataLoader),ProxySet::ProxyTypes::DataLoader);
    ps->add(new AbstractProxy(this),ProxySet::ProxyTypes::Main);
    ps->add(new AbstractProxy(ui->countPanel),ProxySet::ProxyTypes::TCounts);
    ps->add(new AbstractProxy(ui->topicPanel),ProxySet::ProxyTypes::TSelector);
    ps->add(new AbstractProxy(ui->detailPanel),ProxySet::ProxyTypes::TDetails);

    if(Common::IsTest())
    {
        TestWindow* tmp = new TestWindow(this);
        connect(ui->experimentPanel, &ExperimentPanel::ExperimentRunning, tmp, &TestWindow::receiveExperimentRunStatus);
        connect(ui->experimentPanel, &ExperimentPanel::ExperimentRunning, tmp, &TestWindow::stopPublishingMessages);
        ps->add(new AbstractProxy(tmp), ProxySet::ProxyTypes::Test);
    }
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
    }
    else
    {
        dataLoader->hide();
        ui->frame_experimentPanel->show();
        ui->frame_topicPanel->show();
        ui->topicPanel->selectionChanged();
        dataLoader->clearData();
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
    delete ui;
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

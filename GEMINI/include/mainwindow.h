#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <memory>
#include <QCloseEvent>
#include <QMainWindow>
#include <QThread>
#include <string>
#include <vector>

#include "filequeue.h"
#include "subscriptionmanager.h"

#include "ComponentID_I.h"
#include "PubSubService_I.h"

class dataLoaderPanel;
class MessageListener;
class TestWindow;
class ToggleSwitch;

namespace Ui {
  class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    void closeEvent(QCloseEvent *);
    void Load();
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

public slots:
    void Status(std::string s);

private slots:
    void logEventClicked();
    void setDataMode(bool savedDataMode);
    void modeSwitchingEnabled(bool enabled);

signals:
    void startFileQueueThread(int msec);
    void stopFileQueueThread();
    void LogMessage(QString);

private:
    Ui::MainWindow *ui;
    TestWindow* testWindow;
    infrastructureservices::common::ComponentID_I* id;
    infrastructureservices::pubsub::PubSubService_I* pss;
    std::unique_ptr<FileQueue> fileQueue;
    dataLoaderPanel* dataLoader;
    QThread* fileQueueThread;
    QThread* messageProcessingThread;
    std::unique_ptr<SubscriptionManager> _subscriptionManager;
    std::vector<MessageListener*> _listeners;
    static short logMessageCount;
    ToggleSwitch* _modeToggle;

    void setDebugColoring();
    void setUpFileQueue();
    void setUpMessageProcessing();
    void setUpConnections();
    void configureMessageListeners();
};

#endif // MAINWINDOW_H

#ifndef TESTWINDOW_H
#define TESTWINDOW_H

#include <map>
#include <memory>
#include <mutex>
#include <QCloseEvent>
#include <QMainWindow>
#include <QString>
#include <QVBoxLayout>
#include <string>
#include <thread>
#include "net/message.h"
#include "defaultstatuslistener.h"
#include "uiinterface/i_test.h"

class AbstractDriver;

namespace Ui {
    class TestWindow;
}

class TestWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit TestWindow(QWidget *parent = 0);
    ~TestWindow();

signals:
    void MessagePassing(QString, Message*);

public slots:
    void ButtonClicked();
    void stopButtonClicked();

    void receiveExperimentRunStatus(bool status);
    void stopPublishingMessages(bool experimentRunning);
    void ReceiveNewTopics(std::map<std::string, AbstractDriver*> factories);

private:
    Ui::TestWindow *ui;
    std::map<std::string, AbstractDriver*> myButtons;
    bool shouldPublish;
    bool experimentRunning;
    std::mutex publishingMutex;
    std::thread publishingThread;
    std::vector<std::unique_ptr<DefaultStatusListener>> defaultStatusListeners;

    void closeEvent(QCloseEvent*);
    void publishMessages(std::pair<std::string, AbstractDriver*> topicFactory, int frequency, int multiplier);
    void setPublishingIndicator(bool publishing);

    I_Test* testProxy;
};

#endif // TESTWINDOW_H

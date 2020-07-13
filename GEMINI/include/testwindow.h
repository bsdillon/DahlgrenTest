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

#include "defaultstatuslistener.h"
#include "Message_T.h"
#include "Publication_I.h"
#include "PubSubService_I.h"

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
    void StartPublication(infrastructureservices::pubsub::PubSubService_I*);

signals:
    void Message(QString, infrastructureservices::common::Message_T*);

public slots:
    void ReceiveNewTopics(std::map<std::string, AbstractDriver*> factories);
    void ButtonClicked();
    void stopPublishingMessages(bool experimentRunning);
    void receiveExperimentRunStatus(bool status);
    void stopButtonClicked();

private:
    Ui::TestWindow *ui;
    infrastructureservices::pubsub::PubSubService_I* pss;
    std::map<std::string, AbstractDriver*> myButtons;
    std::map<QString, infrastructureservices::pubsub::Publication_I*> publications;
    bool shouldPublish;
    bool experimentRunning;
    std::mutex publishingMutex;
    std::thread publishingThread;
    std::vector<std::unique_ptr<DefaultStatusListener>> defaultStatusListeners;

    void closeEvent(QCloseEvent*);
    void publishMessages(std::pair<std::string, AbstractDriver*> topicFactory, int frequency, int multiplier);
    void setPublishingIndicator(bool publishing);
};

#endif // TESTWINDOW_H

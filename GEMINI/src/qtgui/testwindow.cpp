#include "qtgui/testwindow.h"
#include "ui_testwindow.h"

#include <chrono>
#include <QDebug>
#include <QGraphicsDropShadowEffect>
#include <QToolButton>

#include "net/abstractdriver.h"
#include "common.h"
#include "qtgui/stylemanager.h"

TestWindow::TestWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::TestWindow),
    shouldPublish(false),
    experimentRunning(false)
{
    ui->setupUi(this);
    ui->layout_buttons->setAlignment(Qt::AlignTop);
    setWindowFlags(Qt::Window | Qt::WindowMinimizeButtonHint);
    connect(ui->stopButton, &QPushButton::clicked, this, &TestWindow::stopButtonClicked);
    ui->stopButton->setEnabled(false);
    setPublishingIndicator(false);
}

TestWindow::~TestWindow()
{
    delete ui;
}

void TestWindow::ReceiveNewTopics(std::map<std::string, AbstractDriver*> factories)
{
    // clear existing elements
    auto layoutCount = ui->layout_buttons->count();
    for (auto i = 0; i < layoutCount; ++i)
    {
        auto button = ui->layout_buttons->takeAt(0)->widget();
        // Disable publication associated with button
        auto topicName = button->objectName();

        //TODO Turn off topics

        // Delete button
        button->setParent(nullptr);
        delete button;
    }
    defaultStatusListeners.clear();

    //TODO clear list of topics

    myButtons = factories;

    for (auto it = factories.begin(); it != factories.end(); ++it)
    {
        auto topicName = QString::fromStdString(it->first);

        if (!Common::IsDebug())
        {
            auto newStatusListener = std::unique_ptr<DefaultStatusListener>(new DefaultStatusListener);

            //TODO Create new topics

            defaultStatusListeners.push_back(std::move(newStatusListener));
        }

        auto button = new QPushButton();
        button->setText(topicName);
        button->setToolTip(topicName);
        button->setObjectName(topicName);
        button->setMinimumHeight(22);
        ui->layout_buttons->addWidget(button);
        connect(button, &QToolButton::clicked, this, &TestWindow::ButtonClicked);
    }
}

void TestWindow::ButtonClicked()
{
    bool ableToCaptureInt;

    int multiplier = 0;
    int m = ui->multiplier->text().toInt(&ableToCaptureInt);
    if (ableToCaptureInt && m >= 1)
    {
        multiplier = m;
    }
    else
    {
        ui->multiplier->setText("");
    }

    int frequency = 1;
    int f = ui->frequency->text().toInt(&ableToCaptureInt);
    if (ableToCaptureInt && f >= 1)
    {
        frequency = f;
    }
    else
    {
        ui->frequency->setText("1");
    }

    QString topic = sender()->objectName();

    try
    {
        // Don't do anything if already publishing messages
        if (!shouldPublish && experimentRunning)
        {
          ui->multiplier->setEnabled(false);
          ui->frequency->setEnabled(false);
          auto topicFactory = myButtons.find(topic.toStdString());
          // Allow user to send one-off messages without spawning new threads
          if (multiplier != 1)
          {
              setPublishingIndicator(true);
              ui->stopButton->setEnabled(true);
              std::thread tempPublishingThread(&TestWindow::publishMessages, this, *topicFactory, frequency, multiplier);
              std::swap(publishingThread, tempPublishingThread);
          }
          else
          {
              publishMessages(*topicFactory, frequency, multiplier);
          }
        }
    }
    catch (const DriverException& e)
    {
        QString errorMsg = "DriverException for topic "  + topic;
        errorMsg.append("[" + QString::fromStdString(e.InterpretLevel()) + "]: " + QString::fromStdString(e.getMessage()));
        qDebug() <<  errorMsg;
    }
    catch(const std::exception& e)
    {
        QString errorMsg = "DriverException for topic " + topic + ": " + e.what();
        qDebug() << "Exception while testing: " << errorMsg ;
    }
}

void TestWindow::stopPublishingMessages(bool experimentRunning)
{
    if (experimentRunning) {
        return;
    }
    ui->multiplier->setEnabled(true);
    ui->frequency->setEnabled(true);
    ui->stopButton->setEnabled(false);
    {
        std::lock_guard<std::mutex> _lock(publishingMutex);
        shouldPublish = false;
    }
    if (publishingThread.joinable())
    {
        publishingThread.join();
    }
    setPublishingIndicator(false);
}

void TestWindow::receiveExperimentRunStatus(bool status)
{
    experimentRunning = status;
}

void TestWindow::stopButtonClicked()
{
    stopPublishingMessages(false);
}

void TestWindow::closeEvent(QCloseEvent* event)
{
    event->ignore();
}

void TestWindow::publishMessages(std::pair<std::string, AbstractDriver *> topicFactory, int frequency, int multiplier)
{
    {
        std::lock_guard<std::mutex> _lock(publishingMutex);
        shouldPublish = true;
    }
    auto topic = QString::fromStdString(topicFactory.first);
    auto factory = topicFactory.second;

    int periodInNanos = 1000000000.0 / frequency;
    int messagesSent = 0;

    while (shouldPublish)
    {
        auto msg = factory->CreateRandom();
        if (Common::IsDebug())
        {
            emit Message(topic, msg);
        }
        else
        {
            //TODO Publish message on network
        }
        ++messagesSent;

        if (multiplier != 0 && messagesSent >= multiplier)
        {
            std::lock_guard<std::mutex> _lock(publishingMutex);
            shouldPublish = false;
            break;
        }

        std::this_thread::sleep_for(std::chrono::nanoseconds(periodInNanos));
    }
    // If multiplier is set by user and reached, need to signal the calling
    // thread that the work is done. Emit a signal so it's queued in the calling
    // thread's event queue, rather than directly calling the slot, which would
    // block this function
    if (multiplier != 0 && messagesSent >= multiplier)
    {
        emit(ui->stopButton->clicked());
    }
}

void TestWindow::setPublishingIndicator(bool publishing)
{
    ui->publishingLayout->setAlignment(Qt::AlignCenter);
    QString backgroundColor, textColor, borderColor;
    if (publishing)
    {
        backgroundColor = StyleManager::Instance()->requestColor("@active");
        textColor = StyleManager::Instance()->requestColor("@text_active");
        borderColor = StyleManager::Instance()->requestColor("@dark");
        ui->publishingLabel->setText("Publishing");
    }
    else
    {
        backgroundColor = StyleManager::Instance()->requestColor("@inactive");
        textColor = StyleManager::Instance()->requestColor("@text_inactive");
        borderColor = StyleManager::Instance()->requestColor("@dark");
        ui->publishingLabel->setText("Not Publishing");
    }
    QString frameStyle = "QFrame {background-color: " + backgroundColor + "; border-color: " + borderColor + ";}";
    QString labelStyle = "QLabel {background-color: " + backgroundColor + "; color: " + textColor + ";}";
    ui->publishing->setStyleSheet(frameStyle);
    ui->publishingLabel->setStyleSheet(labelStyle);
}

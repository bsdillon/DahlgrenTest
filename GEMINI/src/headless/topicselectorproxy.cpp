#include "headless/topicselectorproxy.h"
#include "../../include/qtgui/topicselector.h"
#include "net/drivers/FactoryInterfaceImpl.h"
#include <QMessageBox>
#include <QDir>
#include <QFileDialog>
#include <QDebug>

TopicSelectorProxy::TopicSelectorProxy()
{
    topicPanelProxy = new I_TopicPanel(this);
    topicPanelProxy->setReadSettingsCallback(std::bind(&TopicSelectorProxy::readSettings, this));
    //signal Forwarding
    connect(this, &TopicSelectorProxy::UpdateStatus, topicPanelProxy, &I_TopicPanel::UpdateStatus);
    connect(this, &TopicSelectorProxy::TopicSelectionChanged, topicPanelProxy, &I_TopicPanel::TopicSelectionChanged);
}

void TopicSelectorProxy::readSettings()
{

}

void TopicSelectorProxy::onMessage(){
    TopicSelector* topicSelect = new TopicSelector();
    topicSelect->loadTopicsFromFile();
}

void TopicSelectorProxy::getTopics(){
    FactoryInterfaceImpl impl;
    QString topics = "topicnames";
    impl.GetTopicList();

    auto stdTopicNames = impl.GetTopicList();
    auto allTopics = QStringList{};
    for (const auto& topic : stdTopicNames) {
        allTopics.append(QString::fromStdString(topic));
    }

    for(const QString& topic : allTopics){
        topics += ":" + topic;
    }

    emit sendingMessage(topics);
    //QMessageBox::information(nullptr, "title", topics);
}

void TopicSelectorProxy::requestSavedTopicLists(){
    auto dirName = getenv("APPHOME") + QString("/savedTopicLists");
    QDir dir(dirName);
    if (!dir.exists())
    {
        dir.mkpath(".");
    }

    if(dir.isEmpty()){
        //Send a message to the client saying it's empty
        QString mes = "empty!";
        emit sendingMessage(mes);
    }else {
        QStringList fileNames = dir.entryList();
        QString names = "filenames:" + fileNames[2] + ":";

        if(fileNames.size() > 3){
            for(qint8 i = 3; i < fileNames.size(); i++){
                names += fileNames[i] + ":";
            }
        }
        emit sendingMessage(names);
    }
}

void TopicSelectorProxy::loadSaveFile(const QString &file){
    //TopicSelector* topicSelect = new TopicSelector();

    auto dirName = getenv("APPHOME") + QString("/savedTopicLists");
    QDir dir(dirName);
    if (!dir.exists())
    {
        dir.mkpath(".");
    }

    if(dir.isEmpty()){
        //Send a message to the client saying it's empty
        QString mes = "empty!";
        emit sendingMessage(mes);
    }

    QString fileName = dirName + "/" + file;

    if (!(fileName.length() == 0))
    {
        auto settings = new QSettings(fileName, QSettings::IniFormat);
        auto savedTopics = settings->value("TopicSelector/SelectedTopics").toStringList();

        QString topics = "topicstomove";
        for(const QString topic : savedTopics){
            topics += ":" + topic;
        }
        qDebug() << topics;
        sendingMessage(topics);
        //sendingMessage(topics);
        //topicSelect->selectListOfTopics(savedTopics);
        //topicPanelProxy->signalSelectListOfTopics(savedTopics);

    }
}

void TopicSelectorProxy::saveTopicFile(){
    QMessageBox::information(nullptr, "title", "saveTopicFile called");
    auto dirName = getenv("APPHOME") + QString("/savedTopicLists");
    QDir dir(dirName);
    if (!dir.exists())
    {
        dir.mkpath(".");
    }
    /*auto fileName = QFileDialog::getSaveFileName(nullptr, tr("Save Topic List"),
                                                 dir.absolutePath() + "/untitled.gii",
                                                 tr("GEMINI Topic Files (*.gii)"));*/
    QString fileName;

    if (!(fileName.length() == 0))
    {
        if (!fileName.endsWith(".gii"))
        {
            fileName.append(".gii");
        }
        //auto settings = new QSettings(fileName, QSettings::IniFormat);
        //writeSettings(settings);
    }
}

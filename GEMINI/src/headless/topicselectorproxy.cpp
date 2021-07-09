#include "headless/topicselectorproxy.h"
#include "../../include/qtgui/topicselector.h"
#include "net/drivers/FactoryInterfaceImpl.h"
#include "topicselectorlogic.h"
#include <QMessageBox>
#include <QDir>
#include <QFileDialog>
#include <QDebug>

TopicSelectorProxy::TopicSelectorProxy()
{
    topicPanelProxy = new I_TopicPanel(this);
    topicPanelProxy->setReadSettingsCallback(std::bind(&TopicSelectorProxy::readSettings, this));
    topicLogic = new TopicSelectorLogic();
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

void TopicSelectorProxy::displayTopics(){
    QMessageBox::information(nullptr, "Title", "displayTopics() called!");

    QStringList allTopics = topicLogic->getTopics();

    QString topics = "topicnames";

    for(const QString& topic : allTopics){
        topics += ":" + topic;
    }

    emit sendingMessage(topics);
    //QMessageBox::information(nullptr, "title", topics);
}

void TopicSelectorProxy::requestSavedTopicLists(){
    QMessageBox::information(nullptr, "title", "requestSavedTopicLists() called");
    auto dirName = getenv("APPHOME") + QString("/savedTopicLists");
    QDir dir = topicLogic->makeDirectory(dirName);

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
    QMessageBox::information(nullptr, "title", "loadSaveFile() called!");

    auto dirName = getenv("APPHOME") + QString("/savedTopicLists");
    QDir dir = topicLogic->makeDirectory(dirName);

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
    }
}

void TopicSelectorProxy::saveTopicFile(const QString &information){
    //QMessageBox::information(nullptr, "title", "saveTopicFile called");
    //TopicSelector* topicSelect = new TopicSelector();
    auto dirName = getenv("APPHOME") + QString("/savedTopicLists");
    //QDir dir = topicLogic->makeDirectory(dirName);

    QList<QString> saveInfo = information.split(":");
    QString fileName = dirName + "/" + saveInfo[0];

    QStringList saveTopics;
    for(qint16 i = 1; i < saveInfo.length(); i++){
        saveTopics.append(saveInfo[i]);
    }

    if (!(fileName.length() == 0))
    {
        if (!fileName.endsWith(".gii"))
        {
            fileName.append(".gii");
        }
        auto settings = new QSettings(fileName, QSettings::IniFormat);
        topicLogic->writeSettings(settings, saveTopics);
        //settings->setValue("TopicSelector/SelectedTopics", saveTopics);
    }
}

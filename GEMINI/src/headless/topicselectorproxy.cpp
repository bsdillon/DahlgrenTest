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
    //topicPanelProxy = new I_TopicPanel(this);
    //topicPanelProxy->setReadSettingsCallback(std::bind(&TopicSelectorProxy::readSettings, this));
    topicLogic = new TopicSelectorLogic();
    //signal Forwarding
    //connect(this, &TopicSelectorProxy::UpdateStatus, topicPanelProxy, &I_TopicPanel::UpdateStatus);
}

void TopicSelectorProxy::readSettings()
{

}

void TopicSelectorProxy::displayTopics(){
    QStringList allTopics = topicLogic->getTopics();

    QString topics = "topicnames";
    for(const QString& topic : allTopics){
        topics += ":" + topic;
    }

    emit sendingMessage(topics);
}

void TopicSelectorProxy::requestSavedTopicLists(){
    QDir dir = topicLogic->makeDirectory();

    if(dir.isEmpty()){
        //Send a message to the client saying it's empty
        QString mes = "empty!";
        emit sendingMessage(mes);
    }else {
        QStringList fileNames = dir.entryList();
        QString names = "filenames:" + fileNames[2];

        if(fileNames.size() > 3){
            for(qint8 i = 3; i < fileNames.size(); i++){
                names += ":" + fileNames[i];
            }
        }
        emit sendingMessage(names);
    }
}

void TopicSelectorProxy::loadSaveFile(const QString &file){
    QDir dir = topicLogic->makeDirectory();

    QString fileName = dir.absolutePath() + "/" + file;

    QStringList savedTopics = topicLogic->readSettings(fileName);
    QString topics = "topicstomove";
    for(const QString topic : savedTopics){
        topics += ":" + topic;
    }

    emit sendingMessage(topics);
}

void TopicSelectorProxy::saveTopicFile(const QString &information){
    //QMessageBox::information(nullptr, "title", "saveTopicFile called");
    QList<QString> saveInfo = information.split(":");
    QString file = saveInfo[0];
    QStringList saveTopics;
    for(qint16 i = 1; i < saveInfo.length(); i++){
        saveTopics.append(saveInfo[i]);
    }

    QDir dir = topicLogic->makeDirectory();
    QString fileName = dir.absolutePath() + "/" + file;

    topicLogic->writeSettings(fileName, saveTopics);
}

void TopicSelectorProxy::selectionChanged(QStringList selectedTopics){
    topicLogic->topicSelectionChanged(selectedTopics);
}

#include "headless/topicselectorproxy.h"
#include "../../include/qtgui/topicselector.h"
#include <QMessageBox>
#include <QDir>
#include <QFileDialog>

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
    TopicSelector* topicSelect = new TopicSelector();

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
        topicSelect->selectListOfTopics(savedTopics);
        //topicPanelProxy->signalSelectListOfTopics(savedTopics);

    }
}

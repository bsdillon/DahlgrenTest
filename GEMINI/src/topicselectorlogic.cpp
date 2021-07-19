#include "topicselectorlogic.h"
#include "net/drivers/FactoryInterfaceImpl.h"
#include "uiinterface/i_topicpanel.h"
#include <QDir>
#include <QSettings>
#include <QMessageBox>

TopicSelectorLogic::TopicSelectorLogic()
{
    topicPanelProxy = new I_TopicPanel(this);
    connect(this, &TopicSelectorLogic::TopicSelectionChanged, topicPanelProxy, &I_TopicPanel::TopicSelectionChanged);
}

QDir TopicSelectorLogic::makeDirectory(){
    QDir dir = getenv("APPHOME") + QString("/savedTopicLists");
    if (!dir.exists())
    {
        dir.mkpath(".");
    }

    return dir;
}

QStringList TopicSelectorLogic::getTopics(){
    FactoryInterfaceImpl impl;
    impl.GetTopicList();

    auto stdTopicNames = impl.GetTopicList();
    auto allTopics = QStringList{};
    for (const auto& topic : stdTopicNames) {
        allTopics.append(QString::fromStdString(topic));
    }

    return allTopics;
}

void TopicSelectorLogic::writeSettings(QString fileName, QStringList saveTopics){
    if (!(fileName.length() == 0))
    {
        if (!fileName.endsWith(".gii"))
        {
            fileName.append(".gii");
        }
        auto settings = new QSettings(fileName, QSettings::IniFormat);
        settings->setValue("TopicSelector/SelectedTopics", saveTopics);
    }

}

QStringList TopicSelectorLogic::readSettings(QString fileName){
    QStringList savedTopics;
    if (!(fileName.length() == 0))
    {
        auto settings = new QSettings(fileName, QSettings::IniFormat);
        savedTopics.append(settings->value("TopicSelector/SelectedTopics").toStringList());
    }
    return savedTopics;
}

void TopicSelectorLogic::topicSelectionChanged(QStringList topicsSelected){
    auto selectedTopics = std::vector<std::string>{};
    for (const auto& topic : topicsSelected) {
        selectedTopics.push_back(topic.toStdString());
    }

    //emit TopicSelectionChanged(selectedTopics);
}

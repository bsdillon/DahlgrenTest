#include "topicselectorlogic.h"
#include "net/drivers/FactoryInterfaceImpl.h"
#include <QDir>
#include <QSettings>
#include <QMessageBox>

TopicSelectorLogic::TopicSelectorLogic()
{

}

QDir TopicSelectorLogic::makeDirectory(QString dirName){
    QMessageBox::information(nullptr, "title", "makeDirectory() called");
    QDir dir(dirName);
    if (!dir.exists())
    {
        dir.mkpath(".");
    }

    return dir;
}

QStringList TopicSelectorLogic::getTopics(){
    QMessageBox::information(nullptr, "title", "getTopics() called");
    FactoryInterfaceImpl impl;
    impl.GetTopicList();

    auto stdTopicNames = impl.GetTopicList();
    auto allTopics = QStringList{};
    for (const auto& topic : stdTopicNames) {
        allTopics.append(QString::fromStdString(topic));
    }

    return allTopics;
}

void TopicSelectorLogic::writeSettings(QSettings* settings, QStringList saveTopics){
    QMessageBox::information(nullptr, "title", "writeSettings() called");
    settings->setValue("TopicSelector/SelectedTopics", saveTopics);
}

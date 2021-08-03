#include "uiinterface/i_topicpanel.h"
#include <QMessageBox>

I_TopicPanel::I_TopicPanel(QObject *parent)
    :QObject(parent),
      _readSettingsCallback([](){})
{
    i_topicId = i_topicCount ++;
}

//Slot Callback
void I_TopicPanel::setReadSettingsCallback(std::function<void()> readSettingsCallback)
{
    _readSettingsCallback = readSettingsCallback;
}
//Slot
void I_TopicPanel::readSettings()
{
    _readSettingsCallback();
}

//Signals
void I_TopicPanel::signalUpdateStatus(std::string status)
{
    emit UpdateStatus(status);
}

void I_TopicPanel::signalTopicSelectionChanged(std::vector<std::string> v)
{
    emit TopicSelectionChanged(v);
}

void I_TopicPanel::signalSelectListOfTopics(const QStringList& topics){
    emit selectTopicList(topics);
}

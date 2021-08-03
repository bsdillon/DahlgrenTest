#ifndef I_TOPICPANEL_H
#define I_TOPICPANEL_H

#include "qobject.h"

class I_TopicPanel : public QObject
{
    Q_OBJECT
public:
    I_TopicPanel(QObject *parent=0);

    //Slot
    void setReadSettingsCallback(std::function<void()> readSettingsCallback);

    //Signals
    void signalUpdateStatus(std::string status);
    void signalTopicSelectionChanged(std::vector<std::string> v);
    void signalSelectListOfTopics(const QStringList& topics);

public slots:
    void readSettings();

signals:
    void UpdateStatus(std::string);
    void TopicSelectionChanged(std::vector<std::string>);
    void selectTopicList(const QStringList& topics);

private:
    std::function<void()> _readSettingsCallback;
    int i_topicId;
};
static int i_topicCount = 0;

#endif // I_TOPICPANEL_H

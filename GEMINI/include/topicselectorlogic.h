#ifndef TOPICSELECTORLOGIC_H
#define TOPICSELECTORLOGIC_H

#include "uiinterface/i_topicpanel.h"
#include <QObject>
#include <QDir>
#include <QSettings>

class TopicSelectorLogic : public QObject
{
    Q_OBJECT
public:
    I_TopicPanel* topicPanelProxy;
    TopicSelectorLogic();
    QDir makeDirectory();
    QStringList getTopics();
    void writeSettings(QString fileName, QStringList saveTopics);
    QStringList readSettings(QString fileName);
    void topicSelectionChanged(QStringList selectedTopics);

signals:
    void TopicSelectionChanged(std::vector<std::string>);
};

#endif // TOPICSELECTORLOGIC_H

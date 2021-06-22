#ifndef TOPICSELECTORPROXY_H
#define TOPICSELECTORPROXY_H

#include "proxies/AbstractProxy.h"
#include "uiinterface/i_topicpanel.h"
#include "../qtgui/topicselector.h"
#include <QDir>

class TopicSelectorProxy : public QObject
{
    Q_OBJECT
public:
    TopicSelectorProxy();

public slots:
    void onMessage();
    void requestSavedTopicLists();
    void loadSaveFile(const QString &fileName);

signals:
    void UpdateStatus(std::string);
    void TopicSelectionChanged(std::vector<std::string>);
    void sendingMessage(const QString &message);
    void selectTopicList(const QStringList savedTopics);

private:
    I_TopicPanel* topicPanelProxy;
    TopicSelector topicSelect;
    void readSettings();
    QDir createDirectory();
};

#endif // TOPICSELECTORPROXY_H

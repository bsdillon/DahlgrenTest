#ifndef TOPICSELECTORPROXY_H
#define TOPICSELECTORPROXY_H

#include "proxies/AbstractProxy.h"
#include "uiinterface/i_topicpanel.h"
#include "../qtgui/topicselector.h"
#include "topicselectorlogic.h"
#include <QDir>

class TopicSelectorProxy : public QObject
{
    Q_OBJECT
public:
    TopicSelectorProxy();

public slots:
    void displayTopics();
    void requestSavedTopicLists();
    void loadSaveFile(const QString &fileName);
    void saveTopicFile(const QString &information);
    void selectionChanged(QStringList selectedTopics);
    void readSettings();

signals:
    void UpdateStatus(std::string);
    void sendingMessage(const QString &message);

private:
    I_TopicPanel* topicPanelProxy;
    TopicSelectorLogic* topicLogic;
};

#endif // TOPICSELECTORPROXY_H

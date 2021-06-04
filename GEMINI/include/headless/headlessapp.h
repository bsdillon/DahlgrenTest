#ifndef HEADLESSAPP_H
#define HEADLESSAPP_H

#include "proxies/proxyset.h"
#include "headless/dataloaderproxy.h"
#include "headless/experimentproxy.h"
#include "headless/mainproxy.h"
#include "headless/testwindowproxy.h"
#include "headless/topiccountproxy.h"
#include "headless/topicdetailsproxy.h"
#include "headless/topicselectorproxy.h"
#include <QWebSocketServer>
#include <QWebSocket>

class HeadlessApp : public QObject
{
    Q_OBJECT
public:
    HeadlessApp();
    HeadlessApp(quint16 port, bool debug = false, QObject *parent = nullptr);
    ~HeadlessApp();
    void setupProxies(std::unique_ptr<ProxySet>& ps);

public slots:
    void onNewConnection();
    void socketDisconnected();
    void onMessage(const QString &message);

signals:
    void closed();
    void testSignal();

private:
    DataLoaderProxy* dataloader;
    ExperimentProxy* experiment;
    MainProxy* main;
    TopicCountProxy* countPanel;
    TopicDetailsProxy* detailPanel;
    TopicSelectorProxy* topicPanel;
    QWebSocketServer *m_pWebSocketServer;
    QList<QWebSocket *>m_clients;
    bool m_debug;
};

#endif // HEADLESSAPP_H

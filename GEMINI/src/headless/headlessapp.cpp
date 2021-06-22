#include "headless/headlessapp.h"
#include "common.h"
#include "uiinterface/i_countpanel.h"
#include "uiinterface/i_dataloader.h"
#include "uiinterface/i_detailpanel.h"
#include "uiinterface/i_experiment.h"
#include "uiinterface/i_main.h"
#include "uiinterface/i_topicpanel.h"
#include "uiinterface/i_test.h"
#include "QtWebSockets/qwebsocketserver.h"
#include "QtWebSockets/qwebsocket.h"
#include <QtWebSockets/QtWebSockets>
#include <iostream>
#include <QMessageBox>

HeadlessApp::HeadlessApp(uint16_t port, bool debug, QObject *parent):
    QObject(parent),
    m_pWebSocketServer(new QWebSocketServer(QStringLiteral("Backend Server"), QWebSocketServer::NonSecureMode, this)), m_debug(debug)
{
    if (m_pWebSocketServer->listen(QHostAddress::Any, port)){
        connect(m_pWebSocketServer, &QWebSocketServer::newConnection, this, &HeadlessApp::onNewConnection);
        connect(m_pWebSocketServer, &QWebSocketServer::closed, this, &HeadlessApp::closed);
    }

    dataloader = new DataLoaderProxy();
    experiment = new ExperimentProxy();
    main = new MainProxy();
    countPanel = new TopicCountProxy();
    detailPanel = new TopicDetailsProxy();
    topicPanel = new TopicSelectorProxy();
}

HeadlessApp::~HeadlessApp(){
    m_pWebSocketServer->close();
    qDeleteAll(m_clients.begin(), m_clients.end());
}

void HeadlessApp::setupProxies(std::unique_ptr<ProxySet>& ps)
{
    ps->add(new AbstractProxy(experiment),ProxySet::ProxyTypes::Experiment);
    ps->add(new AbstractProxy(dataloader),ProxySet::ProxyTypes::DataLoader);
    ps->add(new AbstractProxy(main),ProxySet::ProxyTypes::Main);
    ps->add(new AbstractProxy(countPanel),ProxySet::ProxyTypes::TCounts);
    ps->add(new AbstractProxy(topicPanel),ProxySet::ProxyTypes::TSelector);
    ps->add(new AbstractProxy(detailPanel),ProxySet::ProxyTypes::TDetails);

    if(Common::IsTest())
    {
        TestWindowProxy* tmp = new TestWindowProxy();
        connect(experiment, SIGNAL(&I_Experiment::ExperimentRunning), tmp, SLOT(&I_Test::receiveExperimentRunStatus));
        connect(experiment, SIGNAL(&I_Experiment::ExperimentRunning), tmp, SLOT(&I_Test::stopPublishingMessages));
        ps->add(new AbstractProxy(tmp), ProxySet::ProxyTypes::Test);
    }
}

void HeadlessApp::onNewConnection(){
    QWebSocket *pSocket = m_pWebSocketServer->nextPendingConnection();

    connect(pSocket, &QWebSocket::disconnected, this, &HeadlessApp::socketDisconnected);
    connect(pSocket, &QWebSocket::textMessageReceived, this, &HeadlessApp::onMessage);
    connect(topicPanel, &TopicSelectorProxy::sendingMessage, pSocket, &QWebSocket::sendTextMessage);

    m_clients << pSocket;

    qDebug() << "Socket Connected:";
}

void HeadlessApp::socketDisconnected(){
    QWebSocket *pClient = qobject_cast<QWebSocket *>(sender());

    if (pClient){
        m_clients.removeAll(pClient);
        pClient->deleteLater();
    }

    qDebug() << "Socket Disconnected:";
}

void HeadlessApp::onMessage(const QString &message){
    //QWebSocket *pClient = qobject_cast<QWebSocket *>(sender());

    /*if (pClient){
        pClient->sendTextMessage(message);
    }*/

    qDebug() << "Message Received:";

    if (message.contains("Function:")){
        QStringList fctLis = message.split(":");
        QString fct = fctLis[1];

        QJsonObject mesJson;
        mesJson["function:"] = fct;

        if (mesJson["function:"] == "loadTopicsFromFile"){
            topicPanel->onMessage();
        }else if (mesJson["function:"] == "requestSavedTopicLists"){
            topicPanel->requestSavedTopicLists();
        }
    }else if (message.contains("loadSaveFile:")){
        QStringList fctLis = message.split(":");
        QString fct = fctLis[1];

        QJsonObject mesJson;
        mesJson["loadSaveFile:"] = fct;

        topicPanel->loadSaveFile(fct);
    }
}

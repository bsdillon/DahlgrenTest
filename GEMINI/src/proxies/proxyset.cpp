#include "proxies/proxyset.h"
#include "uiinterface/i_main.h"
#include "uiinterface/i_test.h"
#include "uiinterface/i_detailpanel.h"
#include "uiinterface/i_topicpanel.h"
#include "uiinterface/i_countpanel.h"
#include "uiinterface/i_experiment.h"
#include "uiinterface/i_dataloader.h"
#include "common.h"

ProxySet::ProxySet()
{

}

void ProxySet::add(AbstractProxy* w, ProxyTypes type)
{
    proxies[type] = w;
}

void ProxySet::configureMessageListeners(std::vector<MessageListener*>& set)
{
    set.push_back(((I_DetailPanel*)proxies[ProxySet::ProxyTypes::TDetails]->getWidget())->listener());
    set.push_back(((I_CountPanel*)proxies[ProxySet::ProxyTypes::TCounts]->getWidget())->listener());
    for (auto& listener : set) {
        connect((I_Main*)proxies[ProxySet::ProxyTypes::Main]->getWidget(), &I_Main::LogMessage, listener, &MessageListener::Log);
    }
}

void ProxySet::setUpConnections(std::unique_ptr<FileQueue>& fq, std::unique_ptr<SubscriptionManager>& sm)
{
    if(Common::IsTest())
    {
        connect(sm.get(), &SubscriptionManager::TopicFactoriesCreated, (I_Test*)proxies[ProxySet::ProxyTypes::Test]->getWidget(), &I_Test::ReceiveNewTopics);
    }

    if(Common::IsDebug())
    {
        // Bypass pub/sub by injecting messages directly from TestWindow into DefaultListeners
        connect((I_Test*)proxies[ProxySet::ProxyTypes::Test]->getWidget(), &I_Test::MessagePassing, sm.get(), &SubscriptionManager::testMessageInDebug);
    }
    else
    {
        //TODO setup network connection
    }

    connect(fq.get(), &FileQueue::FileClosed, (I_Experiment*)proxies[ProxySet::ProxyTypes::Experiment]->getWidget(), &I_Experiment::FinishPressed);
    connect(fq.get(), &FileQueue::FileNameChecked, (I_Experiment*)proxies[ProxySet::ProxyTypes::Experiment]->getWidget(), &I_Experiment::ReceiveFileNameStatus);
    connect((I_Experiment*)proxies[ProxySet::ProxyTypes::Experiment]->getWidget(), &I_Experiment::ExperimentRunning, fq.get(), &FileQueue::AcceptInput);
    connect((I_Experiment*)proxies[ProxySet::ProxyTypes::Experiment]->getWidget(), &I_Experiment::ExperimentDone, fq.get(), &FileQueue::EndFile);
    connect((I_Experiment*)proxies[ProxySet::ProxyTypes::Experiment]->getWidget(), &I_Experiment::FileNameTextChanged, fq.get(), &FileQueue::ReceiveFileName);

    connect((I_DataLoader*)proxies[ProxySet::ProxyTypes::DataLoader]->getWidget(), &I_DataLoader::loadDataFrom, sm.get(), &SubscriptionManager::loadDataFrom);
    connect((I_DataLoader*)proxies[ProxySet::ProxyTypes::DataLoader]->getWidget(), &I_DataLoader::requestToClearData, sm.get(), &SubscriptionManager::ClearData);
    connect((I_Experiment*)proxies[ProxySet::ProxyTypes::Experiment]->getWidget(), &I_Experiment::TopicsUpdated, sm.get(), &SubscriptionManager::receiveTopicList);
    connect(sm.get(), &SubscriptionManager::UpdateStatus, (I_Main*)proxies[ProxySet::ProxyTypes::Main]->getWidget(), &I_Main::Status);
    connect(sm.get(), &SubscriptionManager::TopicFactoriesCreated, (I_CountPanel*)proxies[ProxySet::ProxyTypes::TCounts]->getWidget(), &I_CountPanel::ReceiveNewTopics);
    connect(sm.get(), &SubscriptionManager::DataReceived, (I_Experiment*)proxies[ProxySet::ProxyTypes::Experiment]->getWidget(), &I_Experiment::DataReceived);
    connect((I_Experiment*)proxies[ProxySet::ProxyTypes::Experiment]->getWidget(), &I_Experiment::ClearData, sm.get(), &SubscriptionManager::ClearData);
    connect((I_CountPanel*)proxies[ProxySet::ProxyTypes::TCounts]->getWidget(), &I_CountPanel::toggleSubscription, sm.get(), &SubscriptionManager::toggleSubscription);

    connect((I_TopicPanel*)proxies[ProxySet::ProxyTypes::TSelector]->getWidget(), &I_TopicPanel::TopicSelectionChanged, (I_Experiment*)proxies[ProxySet::ProxyTypes::Experiment]->getWidget(), &I_Experiment::TopicsChanged);
    connect((I_Experiment*)proxies[ProxySet::ProxyTypes::Experiment]->getWidget(), &I_Experiment::LogEventClicked, (I_Main*)proxies[ProxySet::ProxyTypes::Main]->getWidget(), &I_Main::logEventClicked);
    connect((I_Experiment*)proxies[ProxySet::ProxyTypes::Experiment]->getWidget(), &I_Experiment::ExperimentDone, (I_DetailPanel*)proxies[ProxySet::ProxyTypes::TDetails]->getWidget(), &I_DetailPanel::ClearMessages);
    connect((I_Experiment*)proxies[ProxySet::ProxyTypes::Experiment]->getWidget(), &I_Experiment::UpdateStatus, (I_Main*)proxies[ProxySet::ProxyTypes::Main]->getWidget(), &I_Main::Status);
    connect((I_TopicPanel*)proxies[ProxySet::ProxyTypes::TSelector]->getWidget(), &I_TopicPanel::UpdateStatus, (I_Main*)proxies[ProxySet::ProxyTypes::Main]->getWidget(), &I_Main::Status);
    connect((I_CountPanel*)proxies[ProxySet::ProxyTypes::TCounts]->getWidget(), &I_CountPanel::UpdateStatus, (I_Main*)proxies[ProxySet::ProxyTypes::Main]->getWidget(), &I_Main::Status);
    connect((I_DetailPanel*)proxies[ProxySet::ProxyTypes::TDetails]->getWidget(), &I_DetailPanel::UpdateStatus, (I_Main*)proxies[ProxySet::ProxyTypes::Main]->getWidget(), &I_Main::Status);
    connect((I_Experiment*)proxies[ProxySet::ProxyTypes::Experiment]->getWidget(), &I_Experiment::ExperimentRunning, (I_CountPanel*)proxies[ProxySet::ProxyTypes::TCounts]->getWidget(), &I_CountPanel::experimentRunning);
    connect((I_Experiment*)proxies[ProxySet::ProxyTypes::Experiment]->getWidget(), &I_Experiment::inCleanState, (I_Main*)proxies[ProxySet::ProxyTypes::Main]->getWidget(), &I_Main::modeSwitchingEnabled);
}

void ProxySet::LoadUI()
{
    if (Common::IsTest() || Common::IsDebug())
    {
        ((I_Test*)proxies[ProxySet::ProxyTypes::Test]->getWidget())->show();
    }

    ((I_TopicPanel*)proxies[ProxySet::ProxyTypes::TSelector]->getWidget())->readSettings();

    if(!Common::isHeadless())
    {
        ((I_Main*)proxies[ProxySet::ProxyTypes::Main]->getWidget())->show();
    }
}

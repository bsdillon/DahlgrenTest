#include "headless/headlessapp.h"
#include "common.h"
#include "uiinterface/i_countpanel.h"
#include "uiinterface/i_dataloader.h"
#include "uiinterface/i_detailpanel.h"
#include "uiinterface/i_experiment.h"
#include "uiinterface/i_main.h"
#include "uiinterface/i_topicpanel.h"
#include "uiinterface/i_test.h"

HeadlessApp::HeadlessApp()
{
    dataloader = new DataLoaderProxy();
    experiment = new ExperimentProxy();
    main = new MainProxy();
    countPanel = new TopicCountProxy();
    detailPanel = new TopicDetailsProxy();
    topicPanel = new TopicSelectorProxy();
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
        connect(experiment, &I_Experiment::ExperimentRunning, tmp, &I_Test::receiveExperimentRunStatus);
        connect(experiment, &I_Experiment::ExperimentRunning, tmp, &I_Test::stopPublishingMessages);
        ps->add(new AbstractProxy(tmp), ProxySet::ProxyTypes::Test);
    }
}

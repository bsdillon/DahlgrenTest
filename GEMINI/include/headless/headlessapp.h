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

class HeadlessApp
{
public:
    HeadlessApp();
    void setupProxies(std::unique_ptr<ProxySet>& ps);

private:
    DataLoaderProxy* dataloader;
    ExperimentProxy* experiment;
    MainProxy* main;
    TopicCountProxy* countPanel;
    TopicDetailsProxy* detailPanel;
    TopicSelectorProxy* topicPanel;
};

#endif // HEADLESSAPP_H

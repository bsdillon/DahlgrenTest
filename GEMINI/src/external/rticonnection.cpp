#include "rticonnection.h"

#include "ComponentIdentificationServiceFactory_T.h"
#include "PubSubServiceFactory_T.h"
#include "PubSubService_I.h"

using namespace infrastructureservices::pubsub;
using namespace infrastructureservices::componentidentification;

RTIConnection::RTIConnection()
{
    id = ComponentIdentificationServiceFactory_T::getInstance()->createServiceInstance()->getComponentID();
    pss = PubSubServiceFactory_T::getInstance()->createServiceInstance(*id);
}

RTIConnection::~RTIConnection()
{
    PubSubServiceFactory_T::getInstance()->destroyAllServiceInstances(*id);
}

RTIConnection::Load()
{
    //test or normal conditions requires a genuine connection
    pss->createTopic(DriverFactory::GetTopicList()[0]);
}

void RTIConnection::startTestWindow()
{
    testWindow->StartPublication(pss);
}

//from subscription mananger
_topicMap[topic] = _pss->createTopic(topic);
_subscriptionMap[topic] = _pss->createSubscription(*_topicMap[topic], *_listenerMap[topic].get());


_pss->enableAllSubscriptions();

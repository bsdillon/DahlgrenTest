#ifndef RTITESTER_H
#define RTITESTER_H

#include "Message_T.h"
#include "Publication_I.h"
#include "PubSubService_I.h"

class RTITester
{
public:
    RTITester();
    void StartPublication(infrastructureservices::pubsub::PubSubService_I*);

private:
    infrastructureservices::pubsub::PubSubService_I* pss;
    std::map<QString, infrastructureservices::pubsub::Publication_I*> publications;
    void publishMessages(std::pair<std::string, AbstractDriver*> topicFactory, int frequency, int multiplier);

public slots:
    void ReceiveNewTopics();
};

#endif // RTITESTER_H

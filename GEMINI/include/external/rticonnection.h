#ifndef RTICONNECTION_H
#define RTICONNECTION_H

#include "ComponentID_I.h"
#include "PubSubService_I.h"

class RTIConnection
{
    private:
        infrastructureservices::common::ComponentID_I* id;
        infrastructureservices::pubsub::PubSubService_I* pss;

    public:
        RTIConnection();
        ~RTIConnection();
        void Load();
        void startTestWindow();
};

#endif // RTICONNECTION_H

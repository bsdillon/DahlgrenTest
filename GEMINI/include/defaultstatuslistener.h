#ifndef DEFAULTSTATUSLISTENER
#define DEFAULTSTATUSLISTENER

//TODO Determine if a publication status is needed in all networks
//#include "Publication_I.h"
//#include "PublicationStatusListener_I.h"
//#include "PubSubStatus_T.h"

class DefaultStatusListener//: public infrastructureservices::pubsub::PublicationStatusListener_I
{
public:
    DefaultStatusListener() throw ();
    //void onStatusEvent(const infrastructureservices::pubsub::PubSubStatus_T&, infrastructureservices::pubsub::Publication_I&) throw ();
};

#endif // DEFAULTSTATUSLISTENER


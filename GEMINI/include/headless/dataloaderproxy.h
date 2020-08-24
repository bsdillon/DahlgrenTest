#ifndef DATALOADERPROXY_H
#define DATALOADERPROXY_H

#include "proxies/AbstractProxy.h"
#include "uiinterface/i_dataloader.h"

class DataLoaderProxy : public QObject
{
    Q_OBJECT
public:
    DataLoaderProxy();

private:
    I_DataLoader* DataLoaderProxy;
};

#endif // DATALOADERPROXY_H

#ifndef DATALOADERPROXY_H
#define DATALOADERPROXY_H

#include "proxies/AbstractProxy.h"
#include "uiinterface/i_dataloader.h"

class DataLoaderProxy : public QObject
{
    Q_OBJECT
public:
    DataLoaderProxy();

signals:
    void loadDataFrom(QString fileName);
    void requestToClearData();

private:
    I_DataLoader* dataLoaderProxy;
};

#endif // DATALOADERPROXY_H

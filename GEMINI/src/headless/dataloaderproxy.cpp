#include "headless/dataloaderproxy.h"

DataLoaderProxy::DataLoaderProxy()
{
    dataLoaderProxy = new I_DataLoader(this);
    //Signal Forwarding
    connect(this, &DataLoaderProxy::loadDataFrom, dataLoaderProxy, &I_DataLoader::loadDataFrom);
    connect(this, &DataLoaderProxy::requestToClearData, dataloaderProxy, &I_DataLoader::requestToClearData);

}

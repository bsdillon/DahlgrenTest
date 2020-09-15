#include "uiinterface/i_dataloader.h"

I_DataLoader::I_DataLoader(QObject *parent)
    :QObject(parent)
{}

void I_DataLoader::signaLoadData(QString filename){
    emit loadDataFrom(filename);
}

void I_DataLoader::signalRequestToClearData(){
    emit requestToClearData();
}

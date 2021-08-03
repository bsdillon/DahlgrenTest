#ifndef I_DATALOADER_H
#define I_DATALOADER_H

#include "qobject.h"

class I_DataLoader : public QObject
{
    Q_OBJECT

public:
    //Constructor
    I_DataLoader(QObject *parent=0);

    //public signal function
    void signaLoadData(QString filename);
    void signalRequestToClearData();

signals:
    void loadDataFrom(QString fileName);
    void requestToClearData();

private:
    int i_dataId;

};
static int i_dateCount = 0;

#endif // I_DATALOADER_H

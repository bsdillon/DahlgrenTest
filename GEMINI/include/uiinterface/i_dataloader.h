#ifndef I_DATALOADER_H
#define I_DATALOADER_H

#include "qobject.h"

class I_DataLoader : public QObject
{
    Q_OBJECT

signals:
    void loadDataFrom(QString fileName);
    void requestToClearData();

};

#endif // I_DATALOADER_H

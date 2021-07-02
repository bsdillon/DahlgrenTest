#ifndef PLUGIN_H
#define PLUGIN_H

#include "net/drivers/FactoryInterfaceImpl.h"

//#include <QtDesigner/qtdesigner.h>
//#include <QtCore/qplugin.h>
//#include <QObject>
//#include <QList>
#include <vector>
class Plugin
{
    //Q_OBJECT
    //Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QDesignerCustomWidgetCollectionInterface")
    //Q_INTERFACES(QDesignerCustomWidgetCollectionInterface)
    public:
        FactoryInterfaceImpl impl;
        
};

#endif // PLUGIN_H

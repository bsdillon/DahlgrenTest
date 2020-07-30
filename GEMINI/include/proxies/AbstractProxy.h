#ifndef ABSTRACTPROXY_H
#define ABSTRACTPROXY_H

#include <QObject>

class AbstractProxy
{
public:
    AbstractProxy(QObject* w){myWidget=w;}
    QObject* getWidget()
    {
        return myWidget;
    }

private:
    QObject* myWidget;
};

#endif // ABSTRACTPROXY_H

#ifndef TESTWINDOWPROXY_H
#define TESTWINDOWPROXY_H

#include "proxies/AbstractProxy.h"

class TestWindowProxy : public QObject
{
    Q_OBJECT
public:
    TestWindowProxy();
    void show();
};

#endif // TESTWINDOWPROXY_H

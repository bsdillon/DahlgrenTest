#ifndef TESTWINDOW_PROXY_H
#define TESTWINDOW_PROXY_H

#include "testwindow.h"

class TestWindow_Proxy
{
public:
    TestWindow_Proxy();
    void show();

private:
    TestWindow* testWindow;
};

#endif // TESTWINDOW_PROXY_H

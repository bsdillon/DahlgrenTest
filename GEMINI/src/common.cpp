#include "common.h"

bool Common::headless = true;
int Common::level = 0;//zero provides no introspection

bool Common::IsTest()//test is more introspective and uses normal functionality to run the program.
{
    return level > 0;
}

bool Common::IsDebug()//debug is most introspective and may produce a non-production set of functionality
{
    return level > 1;
}

QString Common::ValidateIntrospection(QString l)
{
    bool ans;
    int val = l.toInt(&ans);
    if(ans && val >= 0 && val <= 2)//current limits of introspection
    {
        level = val;
        return QString();
    }
    return QString("Invalid introspection level: Valid values=[0=Normal,1=Test,2=Debug]\n");
}

bool Common::isHeadless()
{
    return headless;
}

void Common::SetHeadless(bool noGUI)
{
    headless = noGUI;
}

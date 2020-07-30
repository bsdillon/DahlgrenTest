#ifndef COMMON_H
#define COMMON_H

#include <QString>

class Common
{
public:
    static bool isHeadless();
    static void SetHeadless(bool noGUI);
    static bool IsTest();
    static bool IsDebug();
    static QString ValidateIntrospection(QString);
private:
    static int level;
    static bool headless;
};

#endif // COMMON_H

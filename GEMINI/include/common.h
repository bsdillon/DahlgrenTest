#ifndef COMMON_H
#define COMMON_H

#include <QString>

class Common
{
public:
    static bool IsTest();
    static bool IsDebug();
    static QString ValidateIntrospection(QString);
private:
    static int level;
};

#endif // COMMON_H

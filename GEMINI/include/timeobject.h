#ifndef TIMEOBJECT_H
#define TIMEOBJECT_H

#include <chrono>
#include <QString>
#include <string>

class TimeObject
{
public:
    TimeObject();
    ~TimeObject();
    TimeObject(const TimeObject&);
    static TimeObject GetCurrentTime();
    TimeObject(long long);
    QString ToString();
    std::string toStdString();
    long long ToLongLong();
    long MillisecondsSince(TimeObject);

private:
    long long data;
    std::chrono::time_point<std::chrono::system_clock> timePoint;
};

#endif // TIMEOBJECT_H

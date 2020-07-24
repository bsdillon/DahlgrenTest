#include "timeobject.h"

#include <QDateTime>
#include <QTimeZone>

TimeObject::TimeObject()
{
    data = 0;
    std::chrono::time_point<std::chrono::system_clock> epoch;
    timePoint = epoch;
}

TimeObject::~TimeObject()
{
}

TimeObject::TimeObject(const TimeObject& other)
{
    data = other.data;
    timePoint = other.timePoint;
}

TimeObject TimeObject::GetCurrentTime()
{
    std::chrono::time_point<std::chrono::system_clock> now = std::chrono::system_clock::now();
    std::chrono::nanoseconds ns = std::chrono::duration_cast<std::chrono::nanoseconds>(now.time_since_epoch());
    return TimeObject(ns.count());
}

TimeObject::TimeObject(long long t)
{
    data = t;
    std::chrono::time_point<std::chrono::system_clock> epoch;
    timePoint = epoch;
    timePoint += std::chrono::nanoseconds(data);
}

QString TimeObject::ToString()
{
    QDateTime dateTime;
    dateTime.setTimeZone(QTimeZone::utc());
    dateTime.setMSecsSinceEpoch(data / 1000000);
    return dateTime.toString("MM/dd/yy HH:mm:ss.zzz t");
}

std::string TimeObject::toStdString()
{
    return ToString().toStdString();
}

long long TimeObject::ToLongLong()
{
    return data;
}

long TimeObject::MillisecondsSince(TimeObject other)
{
    std::chrono::milliseconds ans = std::chrono::duration_cast<std::chrono::milliseconds>(timePoint.time_since_epoch() - other.timePoint.time_since_epoch());
    return ans.count();
}

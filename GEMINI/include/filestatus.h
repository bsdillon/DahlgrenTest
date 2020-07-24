#ifndef FILESTATUS_H
#define FILESTATUS_H

#include <QMetaType>
#include <QString>

struct FileStatus
{
    bool valid;
    QString infoMessage;

    // Default must be included in order to register FileStatus as a Qt Meta Type
    FileStatus()
      : valid(false), infoMessage("UNINITIALIZED")
    {}

    FileStatus(bool valid, QString info)
      : valid(valid), infoMessage(info)
    {}
};
Q_DECLARE_METATYPE(FileStatus)

#endif // FILESTATUS_H

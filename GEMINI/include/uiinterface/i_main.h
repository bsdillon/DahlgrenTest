#ifndef I_MAIN_H
#define I_MAIN_H

#include "qobject.h"

class I_Main : public QObject
{
    Q_OBJECT

public:
    void show();
public slots:
    void Status(std::string s);
    void modeSwitchingEnabled(bool enabled);
    void logEventClicked();

signals:
    void LogMessage(QString);

};

#endif // I_MAIN_H

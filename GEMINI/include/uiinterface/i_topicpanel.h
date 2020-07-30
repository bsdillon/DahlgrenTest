#ifndef I_EXPERIMENT_H
#define I_EXPERIMENT_H

#include "qobject.h"

class I_TopicPanel : public QObject
{
    Q_OBJECT

public slots:
    void readSettings();

signals:
    void UpdateStatus(std::string);
    void TopicSelectionChanged(std::vector<std::string>);
};

#endif // I_EXPERIMENT_H

#ifndef I_EXPERIMENT_H
#define I_EXPERIMENT_H

#include "qobject.h"

class I_TopicPanel : public QObject
{
    Q_OBJECT
public:
    I_TopicPanel(QObject *parent=0);

    //Slot
    void setReadSettingsCallback(std::function<void()> readSettingsCallback);

    //Signals
    void signalUpdateStatus(std::string status);
    void signalTopicSelectionChanged(std::vector<std::string> v);

public slots:
    void readSettings();

signals:
    void UpdateStatus(std::string);
    void TopicSelectionChanged(std::vector<std::string>);

private:
    std::function<void()> _readSettingsCallback;

};

#endif // I_EXPERIMENT_H

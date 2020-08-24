#ifndef EXPERIMENTPROXY_H
#define EXPERIMENTPROXY_H

#include "proxies/AbstractProxy.h"
#include "uiinterface/i_experiment.h"

class ExperimentProxy : public QObject
{
    Q_OBJECT
public:
    ExperimentProxy();

private:
    I_Experiment* experimentProxy;

    void TopicsChanged(std::vector<std::string> s); //Need variable names
    void FinishPressed();
    void ReceiveFileNameStatus(FileStatus fs);
    void DataReceived();
};

#endif // EXPERIMENTPROXY_H

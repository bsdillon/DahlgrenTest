#include "i_detailpanel.h"

//Constructors
I_DetailPanel::I_DetailPanel(QObject *parent)
    :QObject(parent),
     _clearMessageCallback([]()[])
{}

//Signals
void I_DetailPanel::signalUpdateStatus(std::string status)
{
    emit UpdateStatus(status);
}

//Slot Callback
void setClearMessageCallback(std::function<void()> clearMessageCallback)
{
    _clearMessageCallback = clearMessageCallback;
}

//Slot
void I_DetailPanel::ClearMessages()
{
    _clearMessageCallback();
}

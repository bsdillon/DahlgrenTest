#include "uiinterface/i_detailpanel.h"

//Constructors
I_DetailPanel::I_DetailPanel(QObject *parent)
    :QObject(parent),
     _clearMessageCallback([](){})
{
    i_detailId = i_detailCount ++;
    _messageListener = (new MessageListener(this));
}

//Signals
void I_DetailPanel::signalUpdateStatus(std::string status)
{
    emit UpdateStatus(status);
}

//Slot Callback
void I_DetailPanel::setClearMessageCallback(std::function<void()> clearMessage)
{
    _clearMessageCallback = clearMessage;
}

//Slot
void I_DetailPanel::ClearMessages()
{
    _clearMessageCallback();
}

MessageListener *I_DetailPanel::listener()
{
    return _messageListener;
}

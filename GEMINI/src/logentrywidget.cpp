#include "logentrywidget.h"
#include "ui_logentrywidget.h"

#include <QDateTime>

#include "stylemanager.h"
#include "timeobject.h"

LogEntryWidget::LogEntryWidget(QString logMessage, QWidget *parent) :
    QWidget(parent),
    ui(new Ui::LogEntryWidget),
    _logMessage(logMessage)
{
    ui->setupUi(this);
    TimeObject now(static_cast<long long>(QDateTime::currentMSecsSinceEpoch() * 1000000));
    ui->label_time->setText(now.ToString());
    ui->label_message->setText(_logMessage);
    setStyle();
}

LogEntryWidget::~LogEntryWidget()
{
    delete ui;
}
QString LogEntryWidget::logMessage() const
{
    return _logMessage;
}

void LogEntryWidget::setStyle()
{
    auto styler = StyleManager::Instance();
    auto backgroundColor = styler->requestColor("@inactive");
    auto textColor = styler->requestColor("@text_inactive");
    auto borderColor = styler->requestColor("@dark");
    auto style = QString("QWidget {background-color: " + backgroundColor + "; color: " + textColor + "; border: 1px solid "  + borderColor + ";}") +
            "QLabel {border: none;}";
    setStyleSheet(style);
}

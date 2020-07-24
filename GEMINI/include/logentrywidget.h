#ifndef LOGENTRYWIDGET_H
#define LOGENTRYWIDGET_H

#include <QString>
#include <QWidget>

namespace Ui {
    class LogEntryWidget;
}

class LogEntryWidget : public QWidget
{
        Q_OBJECT

    public:
        explicit LogEntryWidget(QString logMessage, QWidget *parent = 0);
        ~LogEntryWidget();

        QString logMessage() const;
        void setStyle();

    private:
        Ui::LogEntryWidget *ui;
        QString _logMessage;
};

#endif // LOGENTRYWIDGET_H

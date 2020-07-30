#ifndef TOPICCOUNTSUMMARY_H
#define TOPICCOUNTSUMMARY_H

#include <QMouseEvent>
#include <QString>
#include <QWidget>
#include "timeobject.h"

namespace Ui {
  class TopicCountSummary;
}

enum summaryStatus
{
    DISABLED,
    ENABLED,
    RECEIVING
};

class TopicCountSummary : public QWidget
{
    Q_OBJECT

public:
    explicit TopicCountSummary(QString topic, QWidget *parent = 0);
    ~TopicCountSummary();
    void AddMessage(long long);
    void SetInitialLabelValues();
    void resizeEvent(QResizeEvent*);

signals:
    void toggleSubscription(QString topic, bool enable);

public slots:
    void AcceptInput(bool);

protected:
    void mousePressEvent(QMouseEvent*);

private:
    Ui::TopicCountSummary *ui;
    QString _topic;
    bool acceptInput;
    bool enabled;
    size_t count;
    TimeObject lastTime;
    double average_ms;

    void SetState();
    void setStyle(summaryStatus status);
};

#endif // TOPICCOUNTSUMMARY_H

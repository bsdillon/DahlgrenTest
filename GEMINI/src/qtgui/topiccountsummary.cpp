#include "qtgui/topiccountsummary.h"
#include "ui_topiccountsummary.h"

#include <exception>
#include <QColor>
#include <QDebug>
#include <QFontMetrics>
#include <QPalette>
#include <QString>

#include "common.h"
#include "qtgui/stylemanager.h"

TopicCountSummary::TopicCountSummary(QString topic, QWidget *parent) :
    QWidget(parent),
    ui(new Ui::TopicCountSummary),
    _topic(topic),
    acceptInput(false),
    enabled(true),
    count(0)
{
    ui->setupUi(this);
    SetInitialLabelValues();
    setStyle(ENABLED);
}

TopicCountSummary::~TopicCountSummary()
{
    delete ui;
}

void TopicCountSummary::SetState()
{
    if (!enabled)
    {
        if (!Common::IsDebug())
        {
            toggleSubscription(_topic, false);
        }
        setStyle(DISABLED);
    }
    else if (!acceptInput)
    {
        if (!Common::IsDebug())
        {
            toggleSubscription(_topic, false);
        }
        setStyle(ENABLED);
    }
    else
    {
        if (!Common::IsDebug())
        {
            toggleSubscription(_topic, true);
        }
        setStyle(RECEIVING);
    }
}

void TopicCountSummary::setStyle(summaryStatus status)
{
    QString background, text;
    switch (status)
    {
        case DISABLED:
            background = StyleManager::Instance()->requestColor("@disabled");
            text = StyleManager::Instance()->requestColor("@text_dark");
            break;
        case ENABLED:
            background = StyleManager::Instance()->requestColor("@light");
            text = StyleManager::Instance()->requestColor("@text_light");
            break;
        case RECEIVING:
            background = StyleManager::Instance()->requestColor("@active");
            text = StyleManager::Instance()->requestColor("@text_active");
            break;
    }
    QString style = "QWidget {background-color: " + background + "; color: " + text + ";}";
    setStyleSheet(style);
}

void TopicCountSummary::SetInitialLabelValues()
{
    count = 0;
    ui->topicLabel->setText(_topic);
    ui->topicLabel->setToolTip(_topic);
    ui->issueLabel->setText("0");
    ui->lastArrival->setText("Never");
    ui->intervalLabel->setText("Invalid");

}

void TopicCountSummary::resizeEvent(QResizeEvent *)
{
    QFontMetrics metrics(ui->topicLabel->font());
    auto width = ui->topicLabel->width() - 2;
    auto elidedText = metrics.elidedText(_topic, Qt::ElideRight, width);
    ui->topicLabel->setText(elidedText);
}

void TopicCountSummary::AcceptInput(bool accepting)
{
    acceptInput = accepting;
    SetState();
}

void TopicCountSummary::mousePressEvent(QMouseEvent*)
{
    enabled = !enabled;
    SetState();
}

void TopicCountSummary::AddMessage(long long time)
{
    TimeObject to(time);
    ++count;
    ui->issueLabel->setText(QString::number(count));
    ui->lastArrival->setText(to.ToString());

    long delta = to.MillisecondsSince(lastTime);
    lastTime = to;

    if (count > 1) // there is no valid average until we have two.
    {
        average_ms = (((count - 1) * average_ms) + delta) / count;
        if (count == 2)
        {
            average_ms = static_cast<double>(delta); // Base case is one time between two events.
        }
        auto average_s = average_ms / 1000.0f;
        ui->intervalLabel->setText(QString::number(average_s, 'f', 6));
    }
}

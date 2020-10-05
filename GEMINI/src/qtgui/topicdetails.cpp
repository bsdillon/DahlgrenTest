#include "qtgui/topicdetails.h"
#include "ui_topicdetails.h"

#include <exception>
#include <QColor>
#include <QDebug>
#include <QLayoutItem>

//#include "AbstractDriver.h"
#include "net/abstractdriver.h"
#include "detailsummary.h"
#include "logentrywidget.h"

TopicDetails::TopicDetails(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::TopicDetails)
{
    ui->setupUi(this);
    ui->layout_details->setAlignment(Qt::AlignTop);
    connect(ui->button_expandSummaries, &QPushButton::clicked, this, &TopicDetails::expandAllSummaries);
    connect(ui->button_collapseSummaries, &QPushButton::clicked, this, &TopicDetails::collapseAllSummaries);
    connect(ui->button_expandContents, &QPushButton::clicked, this, &TopicDetails::expandAllMessageContents);
    connect(ui->button_collapseContents, &QPushButton::clicked, this, &TopicDetails::collapseAllMessageContents);
    _messageListener = new MessageListener(this);
    _messageListener->setMessageCallback(std::bind(&TopicDetails::Message, this, std::placeholders::_1));
    _messageListener->setLoggingCallback(std::bind(&TopicDetails::Log, this, std::placeholders::_1));
    _messageListener->setClearDataCallback(std::bind(&TopicDetails::ClearMessages, this));


    detailPanelProxy = new I_DetailPanel(this);
    //detailpanelProxy->setClearMessageCallback(std::bind(&TopicDetails::ClearMessages, this, std::placeholders::_1));
    detailPanelProxy->setClearMessageCallback(std::bind(&TopicDetails::ClearMessages, this));
    //Signal Forwarding
    connect(this, &TopicDetails::UpdateStatus, detailPanelProxy, &I_DetailPanel::UpdateStatus);
}

TopicDetails::~TopicDetails()
{
    delete ui;
}

MessageListener *TopicDetails::listener() const
{
    return _messageListener;
}

void TopicDetails::Message(const PLAMessage &m)
{
    try
    {
        auto newSummary = new DetailSummary();
        summaryWidgets.push_back(newSummary);
        newSummary->LoadData(m);
        ui->layout_details->insertWidget(0, newSummary);
    }
    catch (const std::exception& e)
    {
        qDebug() << "Error in TopicDetails accepting new message: " << e.what();
    }
}

void TopicDetails::Log(QString logMessage)
{
    auto logEntry = new LogEntryWidget(logMessage, this);
    ui->layout_details->insertWidget(0, logEntry);
}

void TopicDetails::expandAllSummaries()
{
    forEachSummaryWidget([](DetailSummary* summary) {
        if (!summary->widgetIsExpanded()) summary->expandWidgetClicked();
    });
}

void TopicDetails::collapseAllSummaries()
{
    forEachSummaryWidget([](DetailSummary* summary) {
        if (summary->widgetIsExpanded()) summary->expandWidgetClicked();
    });
}

void TopicDetails::expandAllMessageContents()
{
    forEachSummaryWidget([](DetailSummary* summary) {
        if (summary->widgetIsExpanded()) summary->expandMessageTree();
    });
}

void TopicDetails::collapseAllMessageContents()
{
    forEachSummaryWidget([](DetailSummary* summary) {
        if (summary->widgetIsExpanded()) summary->collapseMessageTree();
    });
}

void TopicDetails::ClearMessages()
{
    // clear existing elements
    int layoutCount = ui->layout_details->count();
    for (int i = 0; i < layoutCount; ++i)
    {
        auto widget = ui->layout_details->takeAt(0)->widget();
        widget->setParent(nullptr);
        delete widget;
    }
    summaryWidgets.clear();
}

#include "qtgui/topiccounts.h"
#include "ui_topiccounts.h"
#include "qtgui/topiccountsummary.h"

TopicCounts::TopicCounts(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::TopicCounts)
{
    ui->setupUi(this);
    ui->summaryLayout->setSpacing(1);
    ui->summaryLayout->setAlignment(Qt::AlignTop);
    _messageListener = new MessageListener(this);
    _messageListener->setMessageCallback(std::bind(&TopicCounts::Message, this, std::placeholders::_1));
    _messageListener->setClearDataCallback(std::bind(&TopicCounts::ClearData, this));

    countPanelProxy = new I_CountPanel;
    countPanelProxy->setReceiveNewTopicsCallback(std::bind(&TopicCounts::ReceiveNewTopics, this, std::placeholders::_1));
}

TopicCounts::~TopicCounts()
{
    delete ui;
}

void TopicCounts::Message(const PLAMessage &message)
{
    auto searchResult = _summaries.find(message.topic.toStdString());
    if (searchResult == _summaries.end())
    {
        auto summary = new TopicCountSummary(message.topic);
        _summaries.insert({message.topic.toStdString(), summary});
        ui->summaryLayout->addWidget(summary);
    }
    _summaries[message.topic.toStdString()]->AddMessage(message.time);
}

MessageListener *TopicCounts::listener() const
{
    return _messageListener;
}

void TopicCounts::ReceiveNewTopics(std::map<std::string, AbstractDriver*> factories)
{
    DeleteTopics();
    for (auto it = factories.begin(); it != factories.end(); ++it)
    {
        auto topicName = QString::fromStdString(it->first);
        auto summary = new TopicCountSummary(topicName);
        _summaries.insert({it->first, summary});
        connect(this, &TopicCounts::experimentRunning, summary, &TopicCountSummary::AcceptInput);
        connect(summary, &TopicCountSummary::toggleSubscription, this, &TopicCounts::toggleSubscription);
        ui->summaryLayout->addWidget(summary);
    }
}

void TopicCounts::DeleteTopics() {
    auto layoutCount = ui->summaryLayout->count();
    for (auto i = 0; i < layoutCount; ++i)
    {
        auto summary = ui->summaryLayout->takeAt(0)->widget();
        summary->setParent(nullptr);
        delete summary;
    }
    _summaries.clear();
}

void TopicCounts::ClearData()
{
    for (auto summary : _summaries) {
        summary.second->SetInitialLabelValues();
    }
}

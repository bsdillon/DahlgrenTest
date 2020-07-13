#ifndef TOPICCOUNTS_H
#define TOPICCOUNTS_H

#include <unordered_map>
#include <QWidget>
#include <string>

#include "messagelistener.h"
#include "topiccountsummary.h"

namespace Ui {
  class TopicCounts;
}

class TopicCounts : public QWidget
{
    Q_OBJECT

    public:
        explicit TopicCounts(QWidget *parent = 0);
        ~TopicCounts();
        void Message(const PLAMessage& message);
        MessageListener* listener() const;

    public slots:
        void ReceiveNewTopics(std::map<std::string, AbstractDriver *> factories);
        void DeleteTopics();

    signals:
        void UpdateStatus(std::string);
        void StopAll();
        void toggleSubscription(QString topic, bool enable);
        void experimentRunning(bool);

private:
    Ui::TopicCounts *ui;
    std::unordered_map<std::string, TopicCountSummary*> _summaries;
    MessageListener* _messageListener;

    void ClearData();
};

#endif // TOPICCOUNTS_H

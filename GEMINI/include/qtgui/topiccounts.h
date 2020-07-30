#ifndef TOPICCOUNTS_H
#define TOPICCOUNTS_H

#include <unordered_map>
#include <QWidget>
#include <string>
#include "uiinterface/i_countpanel.h"
#include "topiccountsummary.h"

namespace Ui {
  class TopicCounts;
}

class TopicCounts : public QWidget, I_CountPanel
{
    Q_OBJECT

    public:
        explicit TopicCounts(QWidget *parent = 0);
        ~TopicCounts();
        void Message(const PLAMessage& message);

    public slots:
        void DeleteTopics();

    signals:
        void StopAll();

private:
    Ui::TopicCounts *ui;
    std::unordered_map<std::string, TopicCountSummary*> _summaries;
    MessageListener* _messageListener;

    void ClearData();
};

#endif // TOPICCOUNTS_H

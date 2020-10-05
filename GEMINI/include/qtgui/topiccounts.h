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

class TopicCounts : public QWidget
{
    Q_OBJECT
public:
    explicit TopicCounts(QWidget *parent = 0);
    ~TopicCounts();
    void Message(const PLAMessage& message);

    MessageListener* listener() const;
    I_CountPanel* countPanelProxy;

public slots:
    void DeleteTopics();

signals:
    void StopAll();
    void toggleSubscription(QString topic, bool enable);
    void UpdateStatus(std::string);
    void experimentRunning(bool);

private:
    void ReceiveNewTopics(std::map<std::string, AbstractDriver*> factories);

    Ui::TopicCounts *ui;
    std::unordered_map<std::string, TopicCountSummary*> _summaries;
    MessageListener* _messageListener;
    //I_CountPanel* countPanelProxy;

    void ClearData();
};

#endif // TOPICCOUNTS_H

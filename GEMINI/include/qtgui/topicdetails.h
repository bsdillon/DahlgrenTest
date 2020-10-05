#ifndef TOPICDETAILS_H
#define TOPICDETAILS_H

#include <algorithm>
#include <memory>
#include <QWidget>
#include <QVBoxLayout>
#include <string>
#include <vector>
#include "uiinterface/i_detailpanel.h"
#include "plamessage.h"

class AbstractDriver;
class DetailSummary;

namespace Ui {
    class TopicDetails;
}

class TopicDetails : public QWidget
{
    Q_OBJECT

public:
    explicit TopicDetails(QWidget *parent = 0);
    ~TopicDetails();
    MessageListener* listener() const;
    I_DetailPanel* detailPanelProxy;

signals:
    void UpdateStatus(std::string);

public slots:
    void Message(const PLAMessage& m);
    void Log(QString logMessage);
    void ClearMessages();

private slots:
    void expandAllSummaries();
    void collapseAllSummaries();
    void expandAllMessageContents();
    void collapseAllMessageContents();

private:
    Ui::TopicDetails *ui;
    std::vector<DetailSummary*> summaryWidgets;
    MessageListener* _messageListener;
    //I_DetailPanel* detailPanelProxy;
    //void ClearMessages();

    template<typename T>
    void forEachSummaryWidget(T&& function)
    {
        std::for_each(summaryWidgets.rbegin(), summaryWidgets.rend(), function);
    }
};

#endif // TOPICDETAILS_H

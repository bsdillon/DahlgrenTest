#ifndef ISSUESUMMARY_H
#define ISSUESUMMARY_H

#include <memory>
#include <QString>
#include <QTreeWidget>
#include <QTreeWidgetItem>
#include <QWidget>

#include "net/abstractdriver.h"
#include "plamessage.h"

namespace Ui {
    class IssueSummary;
}

class DetailSummary : public QWidget
{
    Q_OBJECT

public:
    explicit DetailSummary(QWidget *parent = 0);
    ~DetailSummary();
    void LoadData(const PLAMessage&);
    bool widgetIsExpanded() const;

public slots:
    void expandWidgetClicked();
    void expandMessageTree();
    void collapseMessageTree();

private slots:
    void resizeContentsFrame();

signals:
    void treeWidgetChanged();

private:
    Ui::IssueSummary *ui;
    bool widgetExpanded;

    int expandedItemCount(QTreeWidget* tree, QTreeWidgetItem* parent = nullptr) const;
    void setStyle(bool expanded);
    void collapseWidget();
    void expandWidget();
};

#endif // ISSUESUMMARY_H

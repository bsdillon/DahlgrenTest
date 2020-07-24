#include "detailsummary.h"
#include "ui_detailsummary.h"

#include "readmessage.h"
#include "stylemanager.h"
#include "timeobject.h"

DetailSummary::DetailSummary(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::IssueSummary),
    widgetExpanded(false)
{
    ui->setupUi(this);
    connect(ui->button_expandWidget, &QPushButton::clicked, this, &DetailSummary::expandWidgetClicked);
    connect(ui->button_expandTree, &QPushButton::clicked, this, &DetailSummary::expandMessageTree);
    connect(ui->button_collapseTree, &QPushButton::clicked, this, &DetailSummary::collapseMessageTree);
    connect(ui->treeWidget, &QTreeWidget::expanded, this, &DetailSummary::treeWidgetChanged);
    connect(ui->treeWidget, &QTreeWidget::collapsed, this, &DetailSummary::treeWidgetChanged);
    connect(this, &DetailSummary::treeWidgetChanged, this, &DetailSummary::resizeContentsFrame);

    ui->treeWidget->setAnimated(true);
    ui->treeWidget->setEditTriggers(QAbstractItemView::NoEditTriggers);
    ui->treeWidget->setIndentation(15);

    setStyle(widgetExpanded);
}

DetailSummary::~DetailSummary()
{
    delete ui;
}

void DetailSummary::LoadData(const PLAMessage &m)
{
    ui->topicLabel->setText(m.topic);
    TimeObject to(m.time);
    ui->arrivalLabel->setText(to.ToString());
    ReadMessage::ReadToTreeWidget(m, ui->treeWidget);
    collapseWidget();
}

bool DetailSummary::widgetIsExpanded() const
{
    return widgetExpanded;
}

void DetailSummary::expandWidgetClicked()
{
    if (widgetExpanded)
    {
        collapseWidget();
    }
    else
    {
        expandWidget();
    }
    widgetExpanded = !widgetExpanded;
    setStyle(widgetExpanded);
}

void DetailSummary::expandMessageTree()
{
    ui->treeWidget->blockSignals(true);
    ui->treeWidget->expandAll();
    ui->treeWidget->blockSignals(false);
    emit treeWidgetChanged();
}

void DetailSummary::collapseMessageTree()
{
    ui->treeWidget->blockSignals(true);
    ui->treeWidget->collapseAll();
    ui->treeWidget->blockSignals(false);
    emit treeWidgetChanged();
}

void DetailSummary::collapseWidget()
{
    ui->button_expandWidget->setArrowType(Qt::RightArrow);
    ui->frame_contents->hide();
    setMinimumHeight(ui->frame_header->maximumHeight());
    setMaximumHeight(ui->frame_header->maximumHeight());
}

void DetailSummary::expandWidget()
{
    ui->button_expandWidget->setArrowType(Qt::DownArrow);
    ui->frame_contents->show();
    resizeContentsFrame();
}

/*
 * Author: Vahancho
 * Site: Stack Overflow
 * URL: https://stackoverflow.com/questions/28829192/how-to-get-the-numbers-of-items-of-a-qtreewidget
 */
int DetailSummary::expandedItemCount(QTreeWidget *tree, QTreeWidgetItem *parent) const
{
    int count = 0;
    if (parent == nullptr)
    {
        int topCount = tree->topLevelItemCount();
        count += topCount;
        for (int i = 0; i < topCount; ++i)
        {
            auto item = tree->topLevelItem(i);
            if (item->isExpanded())
            {
                count += expandedItemCount(tree, item);
            }
        }
    }
    else
    {
        int childCount = parent->childCount();
        for (int i = 0; i < childCount; ++i)
        {
            auto item = parent->child(i);
            if (item->isExpanded())
            {
                count += expandedItemCount(tree, item);
            }
        }
        count += childCount;
    }
    return count;
}

void DetailSummary::setStyle(bool expanded)
{
  auto styler = StyleManager::Instance();
  auto light = styler->requestColor("@light");
  auto lightText = styler->requestColor("@text_light");
  auto middle = styler->requestColor("@middle");
  auto middleText = styler->requestColor("@text_middle");
  auto dark = styler->requestColor("@dark");
  auto darkText = styler->requestColor("@text_dark");
  QString style;
  if (expanded)
  {
      style = QString("QFrame#frame_header {background-color: " + dark + "; color: " + darkText + "; border: 2px solid " + middle + "; border-bottom: 1px solid " + dark + ";}") +
              "QToolButton {background-color: " + light + "; color: " + lightText + "; border: 0px solid black; border-bottom: 2px solid " + middle + ";}" +
              "QToolButton:pressed {background-color: " + middle + "; color: " + lightText + "; border: 0px solid black;}" +
              "QFrame#frame_buttons {background-color: " + middle + "; color: " + middleText + "; border: 0px solid black;}" +
              "QFrame#frame_contents {background-color: " + middle + "; color: " + middleText + "; border: 0px solid black;}" +
              "QPushButton {background-color: " + light + "; color: " + lightText + "; border: 0px solid black; border-bottom: 2px solid " + dark + ";}" +
              "QPushButton:pressed {background-color: " + dark + "; color: " + lightText + "; border: 0px solid black;}" +
              "QTreeWidget {background-color: " + light + "; color: " + lightText + "; selection-background-color: " + dark + "; selection-color: " + darkText + ";}" +
              "QHeaderView::section {background-color: " + light + "; color: " + lightText + "; border: 1px solid " + middle + ";}" +
              "QScrollArea {background-color: " + light + ";}" +
              "QScrollBar {border: 1px solid " + dark + "; background: " + middle + ";}" +
              "QScrollBar::add-line, QScrollBar::sub-line {border: none; background: none; width: 0px; height: 0px;}" +
              "QScrollBar::handle {background: " + light + "; min-width: 20px; min-height: 20px;}";
  }
  else
  {
      style = QString("QWidget {background-color: " + light + "; color: " + lightText + "; border: 1px solid " + dark + ";}") +
              "QLabel {border: none}" +
              "QToolButton {background-color: " + middle + "; color: " + middleText + "; border: 0px solid black; border-bottom: 2px solid " + dark + ";}" +
              "QToolButton:pressed {background-color: " + dark + "; color: " + middleText + "; border: 0px solid black;}";
  }
  setStyleSheet(style);
}

void DetailSummary::resizeContentsFrame()
{
    // Resize treeWidget
    auto headerHeight = ui->treeWidget->header()->geometry().height();
    auto numRows = expandedItemCount(ui->treeWidget);
    auto rowHeight = ui->treeWidget->visualItemRect(ui->treeWidget->topLevelItem(0)).height();
    auto scrollBarHeight = 20;  // From styleSheet.qss
    auto treeHeight = headerHeight + scrollBarHeight + (numRows * rowHeight);
    ui->treeWidget->setMinimumHeight(treeHeight);

    // Resize contents frame
    auto buttonHeight = ui->button_expandTree->height();
    auto buttonMargins = ui->layout_treeControlButtons->contentsMargins();
    auto buttonMarginsSum = buttonMargins.top() + buttonMargins.bottom();
    auto contentFrameMargins = ui->layout_treeControlButtons->contentsMargins();
    auto contentFrameMarginsSum = contentFrameMargins.top() + contentFrameMargins.bottom();
    auto vlayoutMargins = ui->verticalLayout->contentsMargins();
    auto vlayoutMarginsSum = vlayoutMargins.top() + vlayoutMargins.bottom();
    auto buttonFrameMargins = ui->frame_buttons->contentsMargins();
    auto buttonFrameMarginsSum = buttonFrameMargins.top() + buttonFrameMargins.bottom();
    auto scrollAreaMargins = ui->scrollAreaWidgetContents->contentsMargins();
    auto scrollAreaMarginsSum = scrollAreaMargins.top() + scrollAreaMargins.bottom();

    auto frameHeight = treeHeight + buttonHeight + buttonMarginsSum + contentFrameMarginsSum +
            vlayoutMarginsSum + buttonFrameMarginsSum + scrollAreaMarginsSum;

    ui->frame_contents->setMinimumHeight(frameHeight);
    ui->frame_contents->setMaximumHeight(frameHeight);

    setMinimumHeight(ui->frame_header->maximumHeight() + ui->frame_contents->maximumHeight());
    setMaximumHeight(ui->frame_header->maximumHeight() + ui->frame_contents->maximumHeight());
    ui->treeWidget->resizeColumnToContents(0);
}

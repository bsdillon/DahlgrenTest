/********************************************************************************
** Form generated from reading UI file 'detailsummary.ui'
**
** Created by: Qt User Interface Compiler version 5.9.7
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_DETAILSUMMARY_H
#define UI_DETAILSUMMARY_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QFrame>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QScrollArea>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QToolButton>
#include <QtWidgets/QTreeWidget>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_IssueSummary
{
public:
    QGridLayout *gridLayout_5;
    QVBoxLayout *verticalLayout_2;
    QFrame *frame_header;
    QGridLayout *gridLayout_2;
    QHBoxLayout *horizontalLayout;
    QToolButton *button_expandWidget;
    QSpacerItem *horizontalSpacer_2;
    QLabel *topicLabel;
    QSpacerItem *horizontalSpacer_3;
    QLabel *arrivalLabel;
    QSpacerItem *horizontalSpacer_4;
    QFrame *frame_contents;
    QGridLayout *gridLayout_4;
    QVBoxLayout *verticalLayout;
    QFrame *frame_buttons;
    QGridLayout *gridLayout_3;
    QHBoxLayout *layout_treeControlButtons;
    QPushButton *button_expandTree;
    QPushButton *button_collapseTree;
    QSpacerItem *horizontalSpacer;
    QScrollArea *scrollArea;
    QWidget *scrollAreaWidgetContents;
    QGridLayout *gridLayout;
    QTreeWidget *treeWidget;

    void setupUi(QWidget *IssueSummary)
    {
        if (IssueSummary->objectName().isEmpty())
            IssueSummary->setObjectName(QStringLiteral("IssueSummary"));
        IssueSummary->resize(790, 505);
        QSizePolicy sizePolicy(QSizePolicy::Preferred, QSizePolicy::Expanding);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(IssueSummary->sizePolicy().hasHeightForWidth());
        IssueSummary->setSizePolicy(sizePolicy);
        IssueSummary->setMinimumSize(QSize(450, 35));
        gridLayout_5 = new QGridLayout(IssueSummary);
        gridLayout_5->setSpacing(0);
        gridLayout_5->setObjectName(QStringLiteral("gridLayout_5"));
        gridLayout_5->setContentsMargins(0, 0, 0, 0);
        verticalLayout_2 = new QVBoxLayout();
        verticalLayout_2->setSpacing(0);
        verticalLayout_2->setObjectName(QStringLiteral("verticalLayout_2"));
        frame_header = new QFrame(IssueSummary);
        frame_header->setObjectName(QStringLiteral("frame_header"));
        QSizePolicy sizePolicy1(QSizePolicy::Minimum, QSizePolicy::Minimum);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(frame_header->sizePolicy().hasHeightForWidth());
        frame_header->setSizePolicy(sizePolicy1);
        frame_header->setMinimumSize(QSize(0, 25));
        frame_header->setMaximumSize(QSize(16777215, 25));
        frame_header->setFrameShape(QFrame::StyledPanel);
        frame_header->setFrameShadow(QFrame::Raised);
        gridLayout_2 = new QGridLayout(frame_header);
        gridLayout_2->setSpacing(0);
        gridLayout_2->setObjectName(QStringLiteral("gridLayout_2"));
        gridLayout_2->setContentsMargins(4, 4, 4, 0);
        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setSpacing(0);
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        horizontalLayout->setContentsMargins(0, -1, -1, -1);
        button_expandWidget = new QToolButton(frame_header);
        button_expandWidget->setObjectName(QStringLiteral("button_expandWidget"));
        button_expandWidget->setMinimumSize(QSize(16, 16));
        button_expandWidget->setMaximumSize(QSize(16, 16));
        button_expandWidget->setArrowType(Qt::DownArrow);

        horizontalLayout->addWidget(button_expandWidget);

        horizontalSpacer_2 = new QSpacerItem(84, 20, QSizePolicy::Fixed, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer_2);

        topicLabel = new QLabel(frame_header);
        topicLabel->setObjectName(QStringLiteral("topicLabel"));
        QSizePolicy sizePolicy2(QSizePolicy::MinimumExpanding, QSizePolicy::Preferred);
        sizePolicy2.setHorizontalStretch(0);
        sizePolicy2.setVerticalStretch(0);
        sizePolicy2.setHeightForWidth(topicLabel->sizePolicy().hasHeightForWidth());
        topicLabel->setSizePolicy(sizePolicy2);
        topicLabel->setAlignment(Qt::AlignLeading|Qt::AlignLeft|Qt::AlignVCenter);

        horizontalLayout->addWidget(topicLabel);

        horizontalSpacer_3 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer_3);

        arrivalLabel = new QLabel(frame_header);
        arrivalLabel->setObjectName(QStringLiteral("arrivalLabel"));
        arrivalLabel->setAlignment(Qt::AlignCenter);
        arrivalLabel->setIndent(-1);

        horizontalLayout->addWidget(arrivalLabel);

        horizontalSpacer_4 = new QSpacerItem(10, 20, QSizePolicy::Fixed, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer_4);


        gridLayout_2->addLayout(horizontalLayout, 0, 0, 1, 1);


        verticalLayout_2->addWidget(frame_header);

        frame_contents = new QFrame(IssueSummary);
        frame_contents->setObjectName(QStringLiteral("frame_contents"));
        frame_contents->setFrameShape(QFrame::NoFrame);
        frame_contents->setFrameShadow(QFrame::Plain);
        gridLayout_4 = new QGridLayout(frame_contents);
        gridLayout_4->setSpacing(0);
        gridLayout_4->setObjectName(QStringLiteral("gridLayout_4"));
        gridLayout_4->setContentsMargins(4, 0, 4, 4);
        verticalLayout = new QVBoxLayout();
        verticalLayout->setSpacing(0);
        verticalLayout->setObjectName(QStringLiteral("verticalLayout"));
        verticalLayout->setContentsMargins(0, 0, 0, 0);
        frame_buttons = new QFrame(frame_contents);
        frame_buttons->setObjectName(QStringLiteral("frame_buttons"));
        frame_buttons->setFrameShape(QFrame::StyledPanel);
        frame_buttons->setFrameShadow(QFrame::Raised);
        gridLayout_3 = new QGridLayout(frame_buttons);
        gridLayout_3->setSpacing(0);
        gridLayout_3->setObjectName(QStringLiteral("gridLayout_3"));
        gridLayout_3->setContentsMargins(0, 0, 0, 0);
        layout_treeControlButtons = new QHBoxLayout();
        layout_treeControlButtons->setSpacing(6);
        layout_treeControlButtons->setObjectName(QStringLiteral("layout_treeControlButtons"));
        layout_treeControlButtons->setContentsMargins(0, 4, -1, 4);
        button_expandTree = new QPushButton(frame_buttons);
        button_expandTree->setObjectName(QStringLiteral("button_expandTree"));
        button_expandTree->setMinimumSize(QSize(140, 22));
        button_expandTree->setMaximumSize(QSize(140, 22));

        layout_treeControlButtons->addWidget(button_expandTree);

        button_collapseTree = new QPushButton(frame_buttons);
        button_collapseTree->setObjectName(QStringLiteral("button_collapseTree"));
        button_collapseTree->setMinimumSize(QSize(140, 22));
        button_collapseTree->setMaximumSize(QSize(140, 22));

        layout_treeControlButtons->addWidget(button_collapseTree);

        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        layout_treeControlButtons->addItem(horizontalSpacer);


        gridLayout_3->addLayout(layout_treeControlButtons, 0, 0, 1, 1);


        verticalLayout->addWidget(frame_buttons);

        scrollArea = new QScrollArea(frame_contents);
        scrollArea->setObjectName(QStringLiteral("scrollArea"));
        scrollArea->setFrameShape(QFrame::NoFrame);
        scrollArea->setFrameShadow(QFrame::Plain);
        scrollArea->setWidgetResizable(true);
        scrollAreaWidgetContents = new QWidget();
        scrollAreaWidgetContents->setObjectName(QStringLiteral("scrollAreaWidgetContents"));
        scrollAreaWidgetContents->setGeometry(QRect(0, 0, 778, 440));
        gridLayout = new QGridLayout(scrollAreaWidgetContents);
        gridLayout->setSpacing(0);
        gridLayout->setObjectName(QStringLiteral("gridLayout"));
        gridLayout->setContentsMargins(0, 0, 0, 0);
        treeWidget = new QTreeWidget(scrollAreaWidgetContents);
        QFont font;
        font.setPointSize(9);
        font.setBold(true);
        font.setWeight(75);
        QTreeWidgetItem *__qtreewidgetitem = new QTreeWidgetItem();
        __qtreewidgetitem->setTextAlignment(0, Qt::AlignLeading|Qt::AlignVCenter);
        __qtreewidgetitem->setFont(0, font);
        treeWidget->setHeaderItem(__qtreewidgetitem);
        treeWidget->setObjectName(QStringLiteral("treeWidget"));
        sizePolicy.setHeightForWidth(treeWidget->sizePolicy().hasHeightForWidth());
        treeWidget->setSizePolicy(sizePolicy);
        treeWidget->setStyleSheet(QStringLiteral(""));
        treeWidget->setSizeAdjustPolicy(QAbstractScrollArea::AdjustToContents);
        treeWidget->setEditTriggers(QAbstractItemView::NoEditTriggers);
        treeWidget->setSelectionMode(QAbstractItemView::ContiguousSelection);
        treeWidget->setSelectionBehavior(QAbstractItemView::SelectItems);
        treeWidget->setAnimated(false);
        treeWidget->header()->setDefaultSectionSize(200);
        treeWidget->header()->setMinimumSectionSize(50);

        gridLayout->addWidget(treeWidget, 0, 0, 1, 1);

        scrollArea->setWidget(scrollAreaWidgetContents);

        verticalLayout->addWidget(scrollArea);


        gridLayout_4->addLayout(verticalLayout, 0, 0, 1, 1);


        verticalLayout_2->addWidget(frame_contents);


        gridLayout_5->addLayout(verticalLayout_2, 0, 0, 1, 1);


        retranslateUi(IssueSummary);

        QMetaObject::connectSlotsByName(IssueSummary);
    } // setupUi

    void retranslateUi(QWidget *IssueSummary)
    {
        IssueSummary->setWindowTitle(QApplication::translate("IssueSummary", "Form", Q_NULLPTR));
        button_expandWidget->setText(QApplication::translate("IssueSummary", "+", Q_NULLPTR));
        topicLabel->setText(QApplication::translate("IssueSummary", "<Detailed Topic Name>", Q_NULLPTR));
        arrivalLabel->setText(QApplication::translate("IssueSummary", "<Delivery time>", Q_NULLPTR));
        button_expandTree->setText(QApplication::translate("IssueSummary", "Expand Contents", Q_NULLPTR));
        button_collapseTree->setText(QApplication::translate("IssueSummary", "Collapse Contents", Q_NULLPTR));
        QTreeWidgetItem *___qtreewidgetitem = treeWidget->headerItem();
        ___qtreewidgetitem->setText(0, QApplication::translate("IssueSummary", "Message Contents", Q_NULLPTR));
    } // retranslateUi

};

namespace Ui {
    class IssueSummary: public Ui_IssueSummary {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DETAILSUMMARY_H

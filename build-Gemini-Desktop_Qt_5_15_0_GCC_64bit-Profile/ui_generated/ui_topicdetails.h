/********************************************************************************
** Form generated from reading UI file 'topicdetails.ui'
**
** Created by: Qt User Interface Compiler version 5.15.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_TOPICDETAILS_H
#define UI_TOPICDETAILS_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QFrame>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QLabel>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QScrollArea>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_TopicDetails
{
public:
    QGridLayout *gridLayout_4;
    QHBoxLayout *horizontalLayout;
    QLabel *label;
    QSpacerItem *horizontalSpacer;
    QGridLayout *gridLayout_3;
    QPushButton *button_expandSummaries;
    QPushButton *button_collapseContents;
    QPushButton *button_expandContents;
    QSpacerItem *horizontalSpacer_2;
    QPushButton *button_collapseSummaries;
    QSpacerItem *horizontalSpacer_3;
    QFrame *line;
    QScrollArea *scrollArea;
    QWidget *scrollAreaWidgetContents;
    QGridLayout *gridLayout_2;
    QFrame *frame;
    QGridLayout *gridLayout;
    QVBoxLayout *layout_details;
    QSpacerItem *verticalSpacer;

    void setupUi(QWidget *TopicDetails)
    {
        if (TopicDetails->objectName().isEmpty())
            TopicDetails->setObjectName(QString::fromUtf8("TopicDetails"));
        TopicDetails->resize(684, 498);
        QSizePolicy sizePolicy(QSizePolicy::Preferred, QSizePolicy::MinimumExpanding);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(TopicDetails->sizePolicy().hasHeightForWidth());
        TopicDetails->setSizePolicy(sizePolicy);
        TopicDetails->setMinimumSize(QSize(660, 0));
        gridLayout_4 = new QGridLayout(TopicDetails);
        gridLayout_4->setObjectName(QString::fromUtf8("gridLayout_4"));
        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setSpacing(0);
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        horizontalLayout->setContentsMargins(0, -1, -1, -1);
        label = new QLabel(TopicDetails);
        label->setObjectName(QString::fromUtf8("label"));
        QSizePolicy sizePolicy1(QSizePolicy::Preferred, QSizePolicy::Minimum);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(label->sizePolicy().hasHeightForWidth());
        label->setSizePolicy(sizePolicy1);
        label->setMinimumSize(QSize(0, 20));
        QFont font;
        font.setBold(true);
        font.setWeight(75);
        label->setFont(font);

        horizontalLayout->addWidget(label);

        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer);


        gridLayout_4->addLayout(horizontalLayout, 0, 0, 1, 1);

        gridLayout_3 = new QGridLayout();
        gridLayout_3->setObjectName(QString::fromUtf8("gridLayout_3"));
        button_expandSummaries = new QPushButton(TopicDetails);
        button_expandSummaries->setObjectName(QString::fromUtf8("button_expandSummaries"));
        button_expandSummaries->setMinimumSize(QSize(160, 22));
        button_expandSummaries->setMaximumSize(QSize(160, 22));

        gridLayout_3->addWidget(button_expandSummaries, 0, 0, 1, 1);

        button_collapseContents = new QPushButton(TopicDetails);
        button_collapseContents->setObjectName(QString::fromUtf8("button_collapseContents"));
        button_collapseContents->setMinimumSize(QSize(160, 22));
        button_collapseContents->setMaximumSize(QSize(160, 22));

        gridLayout_3->addWidget(button_collapseContents, 1, 2, 1, 1);

        button_expandContents = new QPushButton(TopicDetails);
        button_expandContents->setObjectName(QString::fromUtf8("button_expandContents"));
        button_expandContents->setMinimumSize(QSize(160, 22));
        button_expandContents->setMaximumSize(QSize(160, 22));

        gridLayout_3->addWidget(button_expandContents, 0, 2, 1, 1);

        horizontalSpacer_2 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        gridLayout_3->addItem(horizontalSpacer_2, 0, 3, 1, 1);

        button_collapseSummaries = new QPushButton(TopicDetails);
        button_collapseSummaries->setObjectName(QString::fromUtf8("button_collapseSummaries"));
        button_collapseSummaries->setMinimumSize(QSize(160, 22));
        button_collapseSummaries->setMaximumSize(QSize(160, 22));

        gridLayout_3->addWidget(button_collapseSummaries, 1, 0, 1, 1);

        horizontalSpacer_3 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        gridLayout_3->addItem(horizontalSpacer_3, 1, 3, 1, 1);

        line = new QFrame(TopicDetails);
        line->setObjectName(QString::fromUtf8("line"));
        line->setStyleSheet(QString::fromUtf8(""));
        line->setFrameShadow(QFrame::Plain);
        line->setFrameShape(QFrame::VLine);

        gridLayout_3->addWidget(line, 0, 1, 2, 1);


        gridLayout_4->addLayout(gridLayout_3, 1, 0, 1, 1);

        scrollArea = new QScrollArea(TopicDetails);
        scrollArea->setObjectName(QString::fromUtf8("scrollArea"));
        scrollArea->setWidgetResizable(true);
        scrollAreaWidgetContents = new QWidget();
        scrollAreaWidgetContents->setObjectName(QString::fromUtf8("scrollAreaWidgetContents"));
        scrollAreaWidgetContents->setGeometry(QRect(0, 0, 664, 392));
        gridLayout_2 = new QGridLayout(scrollAreaWidgetContents);
        gridLayout_2->setSpacing(0);
        gridLayout_2->setObjectName(QString::fromUtf8("gridLayout_2"));
        gridLayout_2->setContentsMargins(0, 0, 0, 0);
        frame = new QFrame(scrollAreaWidgetContents);
        frame->setObjectName(QString::fromUtf8("frame"));
        frame->setFrameShape(QFrame::StyledPanel);
        frame->setFrameShadow(QFrame::Raised);
        gridLayout = new QGridLayout(frame);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        gridLayout->setHorizontalSpacing(0);
        gridLayout->setVerticalSpacing(4);
        gridLayout->setContentsMargins(0, 0, 0, 0);
        layout_details = new QVBoxLayout();
        layout_details->setSpacing(0);
        layout_details->setObjectName(QString::fromUtf8("layout_details"));

        gridLayout->addLayout(layout_details, 0, 0, 1, 1);

        verticalSpacer = new QSpacerItem(20, 379, QSizePolicy::Minimum, QSizePolicy::Expanding);

        gridLayout->addItem(verticalSpacer, 1, 0, 1, 1);


        gridLayout_2->addWidget(frame, 0, 0, 1, 1);

        scrollArea->setWidget(scrollAreaWidgetContents);

        gridLayout_4->addWidget(scrollArea, 2, 0, 1, 1);


        retranslateUi(TopicDetails);

        QMetaObject::connectSlotsByName(TopicDetails);
    } // setupUi

    void retranslateUi(QWidget *TopicDetails)
    {
        TopicDetails->setWindowTitle(QCoreApplication::translate("TopicDetails", "Form", nullptr));
        label->setText(QCoreApplication::translate("TopicDetails", "Issue details", nullptr));
        button_expandSummaries->setText(QCoreApplication::translate("TopicDetails", "Expand All Messages", nullptr));
        button_collapseContents->setText(QCoreApplication::translate("TopicDetails", "Collapse All Contents", nullptr));
        button_expandContents->setText(QCoreApplication::translate("TopicDetails", "Expand All Contents", nullptr));
        button_collapseSummaries->setText(QCoreApplication::translate("TopicDetails", "Collapse All Messages", nullptr));
    } // retranslateUi

};

namespace Ui {
    class TopicDetails: public Ui_TopicDetails {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_TOPICDETAILS_H

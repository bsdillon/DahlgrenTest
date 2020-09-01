/********************************************************************************
** Form generated from reading UI file 'topiccounts.ui'
**
** Created by: Qt User Interface Compiler version 5.9.7
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_TOPICCOUNTS_H
#define UI_TOPICCOUNTS_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QFrame>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QScrollArea>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_TopicCounts
{
public:
    QGridLayout *gridLayout_4;
    QVBoxLayout *verticalLayout_2;
    QHBoxLayout *horizontalLayout_2;
    QLabel *label;
    QSpacerItem *horizontalSpacer;
    QFrame *frame_2;
    QGridLayout *gridLayout_3;
    QScrollArea *scrollArea;
    QWidget *scrollAreaWidgetContents_2;
    QGridLayout *gridLayout_2;
    QVBoxLayout *verticalLayout;
    QFrame *frame;
    QGridLayout *gridLayout;
    QHBoxLayout *horizontalLayout_4;
    QLabel *label_2;
    QLabel *label_3;
    QLabel *label_4;
    QLabel *label_5;
    QVBoxLayout *summaryLayout;
    QSpacerItem *verticalSpacer;

    void setupUi(QWidget *TopicCounts)
    {
        if (TopicCounts->objectName().isEmpty())
            TopicCounts->setObjectName(QStringLiteral("TopicCounts"));
        TopicCounts->resize(666, 328);
        QSizePolicy sizePolicy(QSizePolicy::MinimumExpanding, QSizePolicy::Preferred);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(TopicCounts->sizePolicy().hasHeightForWidth());
        TopicCounts->setSizePolicy(sizePolicy);
        TopicCounts->setMinimumSize(QSize(370, 0));
        gridLayout_4 = new QGridLayout(TopicCounts);
        gridLayout_4->setObjectName(QStringLiteral("gridLayout_4"));
        verticalLayout_2 = new QVBoxLayout();
        verticalLayout_2->setObjectName(QStringLiteral("verticalLayout_2"));
        horizontalLayout_2 = new QHBoxLayout();
        horizontalLayout_2->setSpacing(0);
        horizontalLayout_2->setObjectName(QStringLiteral("horizontalLayout_2"));
        label = new QLabel(TopicCounts);
        label->setObjectName(QStringLiteral("label"));
        label->setMaximumSize(QSize(16777215, 25));
        QFont font;
        font.setBold(true);
        font.setWeight(75);
        label->setFont(font);

        horizontalLayout_2->addWidget(label);

        horizontalSpacer = new QSpacerItem(138, 25, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_2->addItem(horizontalSpacer);


        verticalLayout_2->addLayout(horizontalLayout_2);

        frame_2 = new QFrame(TopicCounts);
        frame_2->setObjectName(QStringLiteral("frame_2"));
        frame_2->setFrameShape(QFrame::StyledPanel);
        frame_2->setFrameShadow(QFrame::Sunken);
        gridLayout_3 = new QGridLayout(frame_2);
        gridLayout_3->setSpacing(0);
        gridLayout_3->setObjectName(QStringLiteral("gridLayout_3"));
        gridLayout_3->setContentsMargins(0, 0, 0, 0);
        scrollArea = new QScrollArea(frame_2);
        scrollArea->setObjectName(QStringLiteral("scrollArea"));
        scrollArea->setStyleSheet(QStringLiteral(""));
        scrollArea->setFrameShape(QFrame::NoFrame);
        scrollArea->setFrameShadow(QFrame::Plain);
        scrollArea->setWidgetResizable(true);
        scrollAreaWidgetContents_2 = new QWidget();
        scrollAreaWidgetContents_2->setObjectName(QStringLiteral("scrollAreaWidgetContents_2"));
        scrollAreaWidgetContents_2->setGeometry(QRect(0, 0, 644, 273));
        scrollAreaWidgetContents_2->setStyleSheet(QStringLiteral(""));
        gridLayout_2 = new QGridLayout(scrollAreaWidgetContents_2);
        gridLayout_2->setObjectName(QStringLiteral("gridLayout_2"));
        gridLayout_2->setContentsMargins(0, 0, 0, 0);
        verticalLayout = new QVBoxLayout();
        verticalLayout->setSpacing(0);
        verticalLayout->setObjectName(QStringLiteral("verticalLayout"));
        verticalLayout->setContentsMargins(0, 0, 0, 0);
        frame = new QFrame(scrollAreaWidgetContents_2);
        frame->setObjectName(QStringLiteral("frame"));
        frame->setFrameShape(QFrame::NoFrame);
        frame->setFrameShadow(QFrame::Plain);
        frame->setLineWidth(0);
        gridLayout = new QGridLayout(frame);
        gridLayout->setObjectName(QStringLiteral("gridLayout"));
        gridLayout->setContentsMargins(0, 0, 0, 0);
        horizontalLayout_4 = new QHBoxLayout();
        horizontalLayout_4->setSpacing(0);
        horizontalLayout_4->setObjectName(QStringLiteral("horizontalLayout_4"));
        label_2 = new QLabel(frame);
        label_2->setObjectName(QStringLiteral("label_2"));
        label_2->setMinimumSize(QSize(150, 20));
        label_2->setMaximumSize(QSize(800, 20));
        label_2->setFont(font);
        label_2->setAlignment(Qt::AlignLeading|Qt::AlignLeft|Qt::AlignVCenter);
        label_2->setIndent(5);

        horizontalLayout_4->addWidget(label_2);

        label_3 = new QLabel(frame);
        label_3->setObjectName(QStringLiteral("label_3"));
        label_3->setMinimumSize(QSize(50, 20));
        label_3->setMaximumSize(QSize(50, 20));
        label_3->setFont(font);
        label_3->setIndent(5);

        horizontalLayout_4->addWidget(label_3);

        label_4 = new QLabel(frame);
        label_4->setObjectName(QStringLiteral("label_4"));
        label_4->setMinimumSize(QSize(180, 20));
        label_4->setMaximumSize(QSize(180, 20));
        QFont font1;
        font1.setBold(true);
        font1.setWeight(75);
        font1.setKerning(true);
        label_4->setFont(font1);
        label_4->setAlignment(Qt::AlignLeading|Qt::AlignLeft|Qt::AlignVCenter);

        horizontalLayout_4->addWidget(label_4);

        label_5 = new QLabel(frame);
        label_5->setObjectName(QStringLiteral("label_5"));
        label_5->setMinimumSize(QSize(105, 20));
        label_5->setMaximumSize(QSize(105, 20));
        label_5->setFont(font);
        label_5->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);
        label_5->setIndent(5);

        horizontalLayout_4->addWidget(label_5);


        gridLayout->addLayout(horizontalLayout_4, 0, 0, 1, 1);


        verticalLayout->addWidget(frame);

        summaryLayout = new QVBoxLayout();
        summaryLayout->setSpacing(0);
        summaryLayout->setObjectName(QStringLiteral("summaryLayout"));
        summaryLayout->setContentsMargins(0, -1, -1, 0);

        verticalLayout->addLayout(summaryLayout);

        verticalSpacer = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout->addItem(verticalSpacer);


        gridLayout_2->addLayout(verticalLayout, 0, 0, 1, 1);

        scrollArea->setWidget(scrollAreaWidgetContents_2);

        gridLayout_3->addWidget(scrollArea, 0, 0, 1, 1);


        verticalLayout_2->addWidget(frame_2);


        gridLayout_4->addLayout(verticalLayout_2, 0, 0, 1, 1);


        retranslateUi(TopicCounts);

        QMetaObject::connectSlotsByName(TopicCounts);
    } // setupUi

    void retranslateUi(QWidget *TopicCounts)
    {
        TopicCounts->setWindowTitle(QApplication::translate("TopicCounts", "Form", Q_NULLPTR));
        label->setText(QApplication::translate("TopicCounts", "Topic counts", Q_NULLPTR));
        label_2->setText(QApplication::translate("TopicCounts", "Topic", Q_NULLPTR));
        label_3->setText(QApplication::translate("TopicCounts", "Count", Q_NULLPTR));
        label_4->setText(QApplication::translate("TopicCounts", "Last Received", Q_NULLPTR));
        label_5->setText(QApplication::translate("TopicCounts", "Mean Interval", Q_NULLPTR));
    } // retranslateUi

};

namespace Ui {
    class TopicCounts: public Ui_TopicCounts {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_TOPICCOUNTS_H

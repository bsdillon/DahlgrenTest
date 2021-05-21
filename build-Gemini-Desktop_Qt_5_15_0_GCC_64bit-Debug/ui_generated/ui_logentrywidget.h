/********************************************************************************
** Form generated from reading UI file 'logentrywidget.ui'
**
** Created by: Qt User Interface Compiler version 5.15.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_LOGENTRYWIDGET_H
#define UI_LOGENTRYWIDGET_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QFrame>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QLabel>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_LogEntryWidget
{
public:
    QGridLayout *gridLayout_2;
    QFrame *frame;
    QGridLayout *gridLayout;
    QHBoxLayout *horizontalLayout;
    QLabel *label;
    QSpacerItem *horizontalSpacer_3;
    QLabel *label_message;
    QSpacerItem *horizontalSpacer_2;
    QLabel *label_time;
    QSpacerItem *horizontalSpacer;

    void setupUi(QWidget *LogEntryWidget)
    {
        if (LogEntryWidget->objectName().isEmpty())
            LogEntryWidget->setObjectName(QString::fromUtf8("LogEntryWidget"));
        LogEntryWidget->resize(540, 25);
        LogEntryWidget->setMinimumSize(QSize(0, 25));
        LogEntryWidget->setMaximumSize(QSize(16777215, 25));
        gridLayout_2 = new QGridLayout(LogEntryWidget);
        gridLayout_2->setSpacing(0);
        gridLayout_2->setObjectName(QString::fromUtf8("gridLayout_2"));
        gridLayout_2->setContentsMargins(0, 0, 0, 0);
        frame = new QFrame(LogEntryWidget);
        frame->setObjectName(QString::fromUtf8("frame"));
        frame->setFrameShape(QFrame::StyledPanel);
        frame->setFrameShadow(QFrame::Raised);
        gridLayout = new QGridLayout(frame);
        gridLayout->setSpacing(0);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        gridLayout->setContentsMargins(0, 0, 0, 0);
        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setSpacing(0);
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        horizontalLayout->setContentsMargins(4, -1, 4, -1);
        label = new QLabel(frame);
        label->setObjectName(QString::fromUtf8("label"));
        label->setMinimumSize(QSize(60, 0));
        label->setIndent(0);

        horizontalLayout->addWidget(label);

        horizontalSpacer_3 = new QSpacerItem(40, 20, QSizePolicy::Fixed, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer_3);

        label_message = new QLabel(frame);
        label_message->setObjectName(QString::fromUtf8("label_message"));
        label_message->setAlignment(Qt::AlignLeading|Qt::AlignLeft|Qt::AlignVCenter);

        horizontalLayout->addWidget(label_message);

        horizontalSpacer_2 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer_2);

        label_time = new QLabel(frame);
        label_time->setObjectName(QString::fromUtf8("label_time"));
        label_time->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);
        label_time->setIndent(0);

        horizontalLayout->addWidget(label_time);

        horizontalSpacer = new QSpacerItem(10, 20, QSizePolicy::Fixed, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer);


        gridLayout->addLayout(horizontalLayout, 0, 0, 1, 1);


        gridLayout_2->addWidget(frame, 0, 0, 1, 1);


        retranslateUi(LogEntryWidget);

        QMetaObject::connectSlotsByName(LogEntryWidget);
    } // setupUi

    void retranslateUi(QWidget *LogEntryWidget)
    {
        LogEntryWidget->setWindowTitle(QCoreApplication::translate("LogEntryWidget", "Form", nullptr));
        label->setText(QCoreApplication::translate("LogEntryWidget", "Log Entry", nullptr));
        label_message->setText(QCoreApplication::translate("LogEntryWidget", "<Log Message>", nullptr));
        label_time->setText(QCoreApplication::translate("LogEntryWidget", "<Time>", nullptr));
    } // retranslateUi

};

namespace Ui {
    class LogEntryWidget: public Ui_LogEntryWidget {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_LOGENTRYWIDGET_H

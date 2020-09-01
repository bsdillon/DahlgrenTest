/********************************************************************************
** Form generated from reading UI file 'topiccountsummary.ui'
**
** Created by: Qt User Interface Compiler version 5.9.7
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_TOPICCOUNTSUMMARY_H
#define UI_TOPICCOUNTSUMMARY_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_TopicCountSummary
{
public:
    QGridLayout *gridLayout;
    QHBoxLayout *horizontalLayout;
    QLabel *topicLabel;
    QLabel *issueLabel;
    QLabel *lastArrival;
    QLabel *intervalLabel;

    void setupUi(QWidget *TopicCountSummary)
    {
        if (TopicCountSummary->objectName().isEmpty())
            TopicCountSummary->setObjectName(QStringLiteral("TopicCountSummary"));
        TopicCountSummary->resize(350, 30);
        TopicCountSummary->setMinimumSize(QSize(350, 30));
        TopicCountSummary->setMaximumSize(QSize(16777215, 30));
        QPalette palette;
        QBrush brush(QColor(0, 0, 0, 255));
        brush.setStyle(Qt::SolidPattern);
        palette.setBrush(QPalette::Active, QPalette::WindowText, brush);
        QBrush brush1(QColor(255, 255, 255, 255));
        brush1.setStyle(Qt::SolidPattern);
        palette.setBrush(QPalette::Active, QPalette::Button, brush1);
        palette.setBrush(QPalette::Active, QPalette::Light, brush1);
        palette.setBrush(QPalette::Active, QPalette::Midlight, brush1);
        QBrush brush2(QColor(127, 127, 127, 255));
        brush2.setStyle(Qt::SolidPattern);
        palette.setBrush(QPalette::Active, QPalette::Dark, brush2);
        QBrush brush3(QColor(170, 170, 170, 255));
        brush3.setStyle(Qt::SolidPattern);
        palette.setBrush(QPalette::Active, QPalette::Mid, brush3);
        palette.setBrush(QPalette::Active, QPalette::Text, brush);
        palette.setBrush(QPalette::Active, QPalette::BrightText, brush1);
        palette.setBrush(QPalette::Active, QPalette::ButtonText, brush);
        palette.setBrush(QPalette::Active, QPalette::Base, brush1);
        palette.setBrush(QPalette::Active, QPalette::Window, brush1);
        palette.setBrush(QPalette::Active, QPalette::Shadow, brush);
        palette.setBrush(QPalette::Active, QPalette::AlternateBase, brush1);
        QBrush brush4(QColor(255, 255, 220, 255));
        brush4.setStyle(Qt::SolidPattern);
        palette.setBrush(QPalette::Active, QPalette::ToolTipBase, brush4);
        palette.setBrush(QPalette::Active, QPalette::ToolTipText, brush);
        palette.setBrush(QPalette::Inactive, QPalette::WindowText, brush);
        palette.setBrush(QPalette::Inactive, QPalette::Button, brush1);
        palette.setBrush(QPalette::Inactive, QPalette::Light, brush1);
        palette.setBrush(QPalette::Inactive, QPalette::Midlight, brush1);
        palette.setBrush(QPalette::Inactive, QPalette::Dark, brush2);
        palette.setBrush(QPalette::Inactive, QPalette::Mid, brush3);
        palette.setBrush(QPalette::Inactive, QPalette::Text, brush);
        palette.setBrush(QPalette::Inactive, QPalette::BrightText, brush1);
        palette.setBrush(QPalette::Inactive, QPalette::ButtonText, brush);
        palette.setBrush(QPalette::Inactive, QPalette::Base, brush1);
        palette.setBrush(QPalette::Inactive, QPalette::Window, brush1);
        palette.setBrush(QPalette::Inactive, QPalette::Shadow, brush);
        palette.setBrush(QPalette::Inactive, QPalette::AlternateBase, brush1);
        palette.setBrush(QPalette::Inactive, QPalette::ToolTipBase, brush4);
        palette.setBrush(QPalette::Inactive, QPalette::ToolTipText, brush);
        palette.setBrush(QPalette::Disabled, QPalette::WindowText, brush2);
        palette.setBrush(QPalette::Disabled, QPalette::Button, brush1);
        palette.setBrush(QPalette::Disabled, QPalette::Light, brush1);
        palette.setBrush(QPalette::Disabled, QPalette::Midlight, brush1);
        palette.setBrush(QPalette::Disabled, QPalette::Dark, brush2);
        palette.setBrush(QPalette::Disabled, QPalette::Mid, brush3);
        palette.setBrush(QPalette::Disabled, QPalette::Text, brush2);
        palette.setBrush(QPalette::Disabled, QPalette::BrightText, brush1);
        palette.setBrush(QPalette::Disabled, QPalette::ButtonText, brush2);
        palette.setBrush(QPalette::Disabled, QPalette::Base, brush1);
        palette.setBrush(QPalette::Disabled, QPalette::Window, brush1);
        palette.setBrush(QPalette::Disabled, QPalette::Shadow, brush);
        palette.setBrush(QPalette::Disabled, QPalette::AlternateBase, brush1);
        palette.setBrush(QPalette::Disabled, QPalette::ToolTipBase, brush4);
        palette.setBrush(QPalette::Disabled, QPalette::ToolTipText, brush);
        TopicCountSummary->setPalette(palette);
        gridLayout = new QGridLayout(TopicCountSummary);
        gridLayout->setSpacing(0);
        gridLayout->setObjectName(QStringLiteral("gridLayout"));
        gridLayout->setContentsMargins(0, 0, 0, 0);
        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setSpacing(0);
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        topicLabel = new QLabel(TopicCountSummary);
        topicLabel->setObjectName(QStringLiteral("topicLabel"));
        QSizePolicy sizePolicy(QSizePolicy::Minimum, QSizePolicy::Preferred);
        sizePolicy.setHorizontalStretch(1);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(topicLabel->sizePolicy().hasHeightForWidth());
        topicLabel->setSizePolicy(sizePolicy);
        topicLabel->setMinimumSize(QSize(150, 0));
        topicLabel->setMaximumSize(QSize(800, 16777215));
        topicLabel->setBaseSize(QSize(150, 0));
        topicLabel->setLineWidth(0);
        topicLabel->setAlignment(Qt::AlignLeading|Qt::AlignLeft|Qt::AlignVCenter);
        topicLabel->setIndent(5);

        horizontalLayout->addWidget(topicLabel);

        issueLabel = new QLabel(TopicCountSummary);
        issueLabel->setObjectName(QStringLiteral("issueLabel"));
        QSizePolicy sizePolicy1(QSizePolicy::Preferred, QSizePolicy::Preferred);
        sizePolicy1.setHorizontalStretch(1);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(issueLabel->sizePolicy().hasHeightForWidth());
        issueLabel->setSizePolicy(sizePolicy1);
        issueLabel->setMinimumSize(QSize(50, 0));
        issueLabel->setMaximumSize(QSize(50, 16777215));
        issueLabel->setLineWidth(0);
        issueLabel->setAlignment(Qt::AlignLeading|Qt::AlignLeft|Qt::AlignVCenter);
        issueLabel->setIndent(5);

        horizontalLayout->addWidget(issueLabel);

        lastArrival = new QLabel(TopicCountSummary);
        lastArrival->setObjectName(QStringLiteral("lastArrival"));
        QSizePolicy sizePolicy2(QSizePolicy::MinimumExpanding, QSizePolicy::Preferred);
        sizePolicy2.setHorizontalStretch(0);
        sizePolicy2.setVerticalStretch(0);
        sizePolicy2.setHeightForWidth(lastArrival->sizePolicy().hasHeightForWidth());
        lastArrival->setSizePolicy(sizePolicy2);
        lastArrival->setMinimumSize(QSize(180, 0));
        lastArrival->setMaximumSize(QSize(180, 16777215));
        lastArrival->setLineWidth(0);
        lastArrival->setAlignment(Qt::AlignLeading|Qt::AlignLeft|Qt::AlignVCenter);

        horizontalLayout->addWidget(lastArrival);

        intervalLabel = new QLabel(TopicCountSummary);
        intervalLabel->setObjectName(QStringLiteral("intervalLabel"));
        intervalLabel->setMinimumSize(QSize(105, 0));
        intervalLabel->setMaximumSize(QSize(105, 16777215));
        intervalLabel->setLineWidth(0);
        intervalLabel->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);
        intervalLabel->setIndent(5);

        horizontalLayout->addWidget(intervalLabel);


        gridLayout->addLayout(horizontalLayout, 0, 0, 1, 1);


        retranslateUi(TopicCountSummary);

        QMetaObject::connectSlotsByName(TopicCountSummary);
    } // setupUi

    void retranslateUi(QWidget *TopicCountSummary)
    {
        TopicCountSummary->setWindowTitle(QApplication::translate("TopicCountSummary", "Form", Q_NULLPTR));
        topicLabel->setText(QApplication::translate("TopicCountSummary", "topicLabel", Q_NULLPTR));
        issueLabel->setText(QApplication::translate("TopicCountSummary", "count", Q_NULLPTR));
        lastArrival->setText(QApplication::translate("TopicCountSummary", "lastArrival", Q_NULLPTR));
        intervalLabel->setText(QApplication::translate("TopicCountSummary", "intervalLabel", Q_NULLPTR));
    } // retranslateUi

};

namespace Ui {
    class TopicCountSummary: public Ui_TopicCountSummary {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_TOPICCOUNTSUMMARY_H

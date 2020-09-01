/********************************************************************************
** Form generated from reading UI file 'experimentpanel.ui'
**
** Created by: Qt User Interface Compiler version 5.9.7
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_EXPERIMENTPANEL_H
#define UI_EXPERIMENTPANEL_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QFormLayout>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_ExperimentPanel
{
public:
    QGridLayout *gridLayout;
    QVBoxLayout *verticalLayout_2;
    QLabel *mainLabel;
    QLabel *statusOutput;
    QVBoxLayout *verticalLayout;
    QFormLayout *formLayout;
    QLabel *label;
    QLineEdit *nameInput;
    QLabel *nameOutput;
    QHBoxLayout *horizontalLayout_3;
    QPushButton *updateTopicsButton;
    QPushButton *recordButton;
    QPushButton *logButton;
    QPushButton *pauseButton;
    QPushButton *stopButton;
    QPushButton *clearDataButton;
    QHBoxLayout *horizontalLayout_2;
    QLabel *label_testButtons;
    QPushButton *errorButton;
    QPushButton *finishButton;
    QLabel *label_3;

    void setupUi(QWidget *ExperimentPanel)
    {
        if (ExperimentPanel->objectName().isEmpty())
            ExperimentPanel->setObjectName(QStringLiteral("ExperimentPanel"));
        ExperimentPanel->resize(465, 165);
        ExperimentPanel->setMinimumSize(QSize(465, 165));
        ExperimentPanel->setMaximumSize(QSize(16777215, 165));
        gridLayout = new QGridLayout(ExperimentPanel);
        gridLayout->setObjectName(QStringLiteral("gridLayout"));
        verticalLayout_2 = new QVBoxLayout();
        verticalLayout_2->setObjectName(QStringLiteral("verticalLayout_2"));
        mainLabel = new QLabel(ExperimentPanel);
        mainLabel->setObjectName(QStringLiteral("mainLabel"));
        QFont font;
        font.setBold(true);
        font.setWeight(75);
        mainLabel->setFont(font);

        verticalLayout_2->addWidget(mainLabel);

        statusOutput = new QLabel(ExperimentPanel);
        statusOutput->setObjectName(QStringLiteral("statusOutput"));
        statusOutput->setAlignment(Qt::AlignCenter);

        verticalLayout_2->addWidget(statusOutput);

        verticalLayout = new QVBoxLayout();
        verticalLayout->setObjectName(QStringLiteral("verticalLayout"));
        formLayout = new QFormLayout();
        formLayout->setObjectName(QStringLiteral("formLayout"));
        label = new QLabel(ExperimentPanel);
        label->setObjectName(QStringLiteral("label"));

        formLayout->setWidget(0, QFormLayout::LabelRole, label);

        nameInput = new QLineEdit(ExperimentPanel);
        nameInput->setObjectName(QStringLiteral("nameInput"));
        nameInput->setMinimumSize(QSize(0, 0));

        formLayout->setWidget(0, QFormLayout::FieldRole, nameInput);


        verticalLayout->addLayout(formLayout);

        nameOutput = new QLabel(ExperimentPanel);
        nameOutput->setObjectName(QStringLiteral("nameOutput"));
        nameOutput->setMinimumSize(QSize(0, 20));
        nameOutput->setMaximumSize(QSize(16777215, 20));
        nameOutput->setAlignment(Qt::AlignCenter);

        verticalLayout->addWidget(nameOutput);


        verticalLayout_2->addLayout(verticalLayout);

        horizontalLayout_3 = new QHBoxLayout();
        horizontalLayout_3->setObjectName(QStringLiteral("horizontalLayout_3"));
        updateTopicsButton = new QPushButton(ExperimentPanel);
        updateTopicsButton->setObjectName(QStringLiteral("updateTopicsButton"));
        updateTopicsButton->setEnabled(false);
        updateTopicsButton->setMinimumSize(QSize(0, 22));

        horizontalLayout_3->addWidget(updateTopicsButton);

        recordButton = new QPushButton(ExperimentPanel);
        recordButton->setObjectName(QStringLiteral("recordButton"));
        recordButton->setEnabled(false);
        recordButton->setMinimumSize(QSize(0, 22));

        horizontalLayout_3->addWidget(recordButton);

        logButton = new QPushButton(ExperimentPanel);
        logButton->setObjectName(QStringLiteral("logButton"));
        logButton->setMinimumSize(QSize(0, 22));
        logButton->setStyleSheet(QStringLiteral(""));

        horizontalLayout_3->addWidget(logButton);

        pauseButton = new QPushButton(ExperimentPanel);
        pauseButton->setObjectName(QStringLiteral("pauseButton"));
        pauseButton->setEnabled(false);
        pauseButton->setMinimumSize(QSize(0, 22));

        horizontalLayout_3->addWidget(pauseButton);

        stopButton = new QPushButton(ExperimentPanel);
        stopButton->setObjectName(QStringLiteral("stopButton"));
        stopButton->setEnabled(false);
        stopButton->setMinimumSize(QSize(0, 22));

        horizontalLayout_3->addWidget(stopButton);

        clearDataButton = new QPushButton(ExperimentPanel);
        clearDataButton->setObjectName(QStringLiteral("clearDataButton"));
        clearDataButton->setMinimumSize(QSize(0, 22));

        horizontalLayout_3->addWidget(clearDataButton);


        verticalLayout_2->addLayout(horizontalLayout_3);

        horizontalLayout_2 = new QHBoxLayout();
        horizontalLayout_2->setObjectName(QStringLiteral("horizontalLayout_2"));
        label_testButtons = new QLabel(ExperimentPanel);
        label_testButtons->setObjectName(QStringLiteral("label_testButtons"));
        label_testButtons->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        horizontalLayout_2->addWidget(label_testButtons);

        errorButton = new QPushButton(ExperimentPanel);
        errorButton->setObjectName(QStringLiteral("errorButton"));
        errorButton->setEnabled(false);
        errorButton->setMinimumSize(QSize(40, 22));
        QPalette palette;
        QBrush brush(QColor(0, 0, 0, 255));
        brush.setStyle(Qt::SolidPattern);
        palette.setBrush(QPalette::Active, QPalette::WindowText, brush);
        QBrush brush1(QColor(136, 138, 133, 255));
        brush1.setStyle(Qt::SolidPattern);
        palette.setBrush(QPalette::Active, QPalette::Button, brush1);
        QBrush brush2(QColor(204, 207, 200, 255));
        brush2.setStyle(Qt::SolidPattern);
        palette.setBrush(QPalette::Active, QPalette::Light, brush2);
        QBrush brush3(QColor(170, 172, 166, 255));
        brush3.setStyle(Qt::SolidPattern);
        palette.setBrush(QPalette::Active, QPalette::Midlight, brush3);
        QBrush brush4(QColor(68, 69, 66, 255));
        brush4.setStyle(Qt::SolidPattern);
        palette.setBrush(QPalette::Active, QPalette::Dark, brush4);
        QBrush brush5(QColor(91, 92, 89, 255));
        brush5.setStyle(Qt::SolidPattern);
        palette.setBrush(QPalette::Active, QPalette::Mid, brush5);
        palette.setBrush(QPalette::Active, QPalette::Text, brush);
        QBrush brush6(QColor(255, 255, 255, 255));
        brush6.setStyle(Qt::SolidPattern);
        palette.setBrush(QPalette::Active, QPalette::BrightText, brush6);
        palette.setBrush(QPalette::Active, QPalette::ButtonText, brush);
        palette.setBrush(QPalette::Active, QPalette::Base, brush6);
        palette.setBrush(QPalette::Active, QPalette::Window, brush1);
        palette.setBrush(QPalette::Active, QPalette::Shadow, brush);
        QBrush brush7(QColor(195, 196, 194, 255));
        brush7.setStyle(Qt::SolidPattern);
        palette.setBrush(QPalette::Active, QPalette::AlternateBase, brush7);
        QBrush brush8(QColor(255, 255, 220, 255));
        brush8.setStyle(Qt::SolidPattern);
        palette.setBrush(QPalette::Active, QPalette::ToolTipBase, brush8);
        palette.setBrush(QPalette::Active, QPalette::ToolTipText, brush);
        palette.setBrush(QPalette::Inactive, QPalette::WindowText, brush);
        palette.setBrush(QPalette::Inactive, QPalette::Button, brush1);
        palette.setBrush(QPalette::Inactive, QPalette::Light, brush2);
        palette.setBrush(QPalette::Inactive, QPalette::Midlight, brush3);
        palette.setBrush(QPalette::Inactive, QPalette::Dark, brush4);
        palette.setBrush(QPalette::Inactive, QPalette::Mid, brush5);
        palette.setBrush(QPalette::Inactive, QPalette::Text, brush);
        palette.setBrush(QPalette::Inactive, QPalette::BrightText, brush6);
        palette.setBrush(QPalette::Inactive, QPalette::ButtonText, brush);
        palette.setBrush(QPalette::Inactive, QPalette::Base, brush6);
        palette.setBrush(QPalette::Inactive, QPalette::Window, brush1);
        palette.setBrush(QPalette::Inactive, QPalette::Shadow, brush);
        palette.setBrush(QPalette::Inactive, QPalette::AlternateBase, brush7);
        palette.setBrush(QPalette::Inactive, QPalette::ToolTipBase, brush8);
        palette.setBrush(QPalette::Inactive, QPalette::ToolTipText, brush);
        palette.setBrush(QPalette::Disabled, QPalette::WindowText, brush4);
        palette.setBrush(QPalette::Disabled, QPalette::Button, brush1);
        palette.setBrush(QPalette::Disabled, QPalette::Light, brush2);
        palette.setBrush(QPalette::Disabled, QPalette::Midlight, brush3);
        palette.setBrush(QPalette::Disabled, QPalette::Dark, brush4);
        palette.setBrush(QPalette::Disabled, QPalette::Mid, brush5);
        palette.setBrush(QPalette::Disabled, QPalette::Text, brush4);
        palette.setBrush(QPalette::Disabled, QPalette::BrightText, brush6);
        palette.setBrush(QPalette::Disabled, QPalette::ButtonText, brush4);
        palette.setBrush(QPalette::Disabled, QPalette::Base, brush1);
        palette.setBrush(QPalette::Disabled, QPalette::Window, brush1);
        palette.setBrush(QPalette::Disabled, QPalette::Shadow, brush);
        palette.setBrush(QPalette::Disabled, QPalette::AlternateBase, brush1);
        palette.setBrush(QPalette::Disabled, QPalette::ToolTipBase, brush8);
        palette.setBrush(QPalette::Disabled, QPalette::ToolTipText, brush);
        errorButton->setPalette(palette);

        horizontalLayout_2->addWidget(errorButton);

        finishButton = new QPushButton(ExperimentPanel);
        finishButton->setObjectName(QStringLiteral("finishButton"));
        finishButton->setEnabled(false);
        finishButton->setMinimumSize(QSize(40, 22));
        QPalette palette1;
        palette1.setBrush(QPalette::Active, QPalette::WindowText, brush);
        palette1.setBrush(QPalette::Active, QPalette::Button, brush1);
        palette1.setBrush(QPalette::Active, QPalette::Light, brush2);
        palette1.setBrush(QPalette::Active, QPalette::Midlight, brush3);
        palette1.setBrush(QPalette::Active, QPalette::Dark, brush4);
        palette1.setBrush(QPalette::Active, QPalette::Mid, brush5);
        palette1.setBrush(QPalette::Active, QPalette::Text, brush);
        palette1.setBrush(QPalette::Active, QPalette::BrightText, brush6);
        palette1.setBrush(QPalette::Active, QPalette::ButtonText, brush);
        palette1.setBrush(QPalette::Active, QPalette::Base, brush6);
        palette1.setBrush(QPalette::Active, QPalette::Window, brush1);
        palette1.setBrush(QPalette::Active, QPalette::Shadow, brush);
        palette1.setBrush(QPalette::Active, QPalette::AlternateBase, brush7);
        palette1.setBrush(QPalette::Active, QPalette::ToolTipBase, brush8);
        palette1.setBrush(QPalette::Active, QPalette::ToolTipText, brush);
        palette1.setBrush(QPalette::Inactive, QPalette::WindowText, brush);
        palette1.setBrush(QPalette::Inactive, QPalette::Button, brush1);
        palette1.setBrush(QPalette::Inactive, QPalette::Light, brush2);
        palette1.setBrush(QPalette::Inactive, QPalette::Midlight, brush3);
        palette1.setBrush(QPalette::Inactive, QPalette::Dark, brush4);
        palette1.setBrush(QPalette::Inactive, QPalette::Mid, brush5);
        palette1.setBrush(QPalette::Inactive, QPalette::Text, brush);
        palette1.setBrush(QPalette::Inactive, QPalette::BrightText, brush6);
        palette1.setBrush(QPalette::Inactive, QPalette::ButtonText, brush);
        palette1.setBrush(QPalette::Inactive, QPalette::Base, brush6);
        palette1.setBrush(QPalette::Inactive, QPalette::Window, brush1);
        palette1.setBrush(QPalette::Inactive, QPalette::Shadow, brush);
        palette1.setBrush(QPalette::Inactive, QPalette::AlternateBase, brush7);
        palette1.setBrush(QPalette::Inactive, QPalette::ToolTipBase, brush8);
        palette1.setBrush(QPalette::Inactive, QPalette::ToolTipText, brush);
        palette1.setBrush(QPalette::Disabled, QPalette::WindowText, brush4);
        palette1.setBrush(QPalette::Disabled, QPalette::Button, brush1);
        palette1.setBrush(QPalette::Disabled, QPalette::Light, brush2);
        palette1.setBrush(QPalette::Disabled, QPalette::Midlight, brush3);
        palette1.setBrush(QPalette::Disabled, QPalette::Dark, brush4);
        palette1.setBrush(QPalette::Disabled, QPalette::Mid, brush5);
        palette1.setBrush(QPalette::Disabled, QPalette::Text, brush4);
        palette1.setBrush(QPalette::Disabled, QPalette::BrightText, brush6);
        palette1.setBrush(QPalette::Disabled, QPalette::ButtonText, brush4);
        palette1.setBrush(QPalette::Disabled, QPalette::Base, brush1);
        palette1.setBrush(QPalette::Disabled, QPalette::Window, brush1);
        palette1.setBrush(QPalette::Disabled, QPalette::Shadow, brush);
        palette1.setBrush(QPalette::Disabled, QPalette::AlternateBase, brush1);
        palette1.setBrush(QPalette::Disabled, QPalette::ToolTipBase, brush8);
        palette1.setBrush(QPalette::Disabled, QPalette::ToolTipText, brush);
        finishButton->setPalette(palette1);

        horizontalLayout_2->addWidget(finishButton);

        label_3 = new QLabel(ExperimentPanel);
        label_3->setObjectName(QStringLiteral("label_3"));

        horizontalLayout_2->addWidget(label_3);


        verticalLayout_2->addLayout(horizontalLayout_2);


        gridLayout->addLayout(verticalLayout_2, 0, 0, 1, 1);


        retranslateUi(ExperimentPanel);

        QMetaObject::connectSlotsByName(ExperimentPanel);
    } // setupUi

    void retranslateUi(QWidget *ExperimentPanel)
    {
        ExperimentPanel->setWindowTitle(QApplication::translate("ExperimentPanel", "Form", Q_NULLPTR));
        mainLabel->setText(QApplication::translate("ExperimentPanel", "Configure and run experiment", Q_NULLPTR));
        statusOutput->setText(QApplication::translate("ExperimentPanel", "STATUS OUTPUT", Q_NULLPTR));
        label->setText(QApplication::translate("ExperimentPanel", "File name", Q_NULLPTR));
        nameOutput->setText(QApplication::translate("ExperimentPanel", "INFORMATION TEXT LABEL", Q_NULLPTR));
        updateTopicsButton->setText(QApplication::translate("ExperimentPanel", "Update Topics", Q_NULLPTR));
        recordButton->setText(QApplication::translate("ExperimentPanel", "Record", Q_NULLPTR));
        logButton->setText(QApplication::translate("ExperimentPanel", "Log Event", Q_NULLPTR));
        pauseButton->setText(QApplication::translate("ExperimentPanel", "Pause", Q_NULLPTR));
        stopButton->setText(QApplication::translate("ExperimentPanel", "Stop", Q_NULLPTR));
        clearDataButton->setText(QApplication::translate("ExperimentPanel", "Clear Data", Q_NULLPTR));
        label_testButtons->setText(QApplication::translate("ExperimentPanel", "Test Buttons", Q_NULLPTR));
        errorButton->setText(QApplication::translate("ExperimentPanel", "Error", Q_NULLPTR));
        finishButton->setText(QApplication::translate("ExperimentPanel", "Finish", Q_NULLPTR));
        label_3->setText(QString());
    } // retranslateUi

};

namespace Ui {
    class ExperimentPanel: public Ui_ExperimentPanel {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_EXPERIMENTPANEL_H

/********************************************************************************
** Form generated from reading UI file 'experimentpanel.ui'
**
** Created by: Qt User Interface Compiler version 5.15.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_EXPERIMENTPANEL_H
#define UI_EXPERIMENTPANEL_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QFormLayout>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHBoxLayout>
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
            ExperimentPanel->setObjectName(QString::fromUtf8("ExperimentPanel"));
        ExperimentPanel->resize(465, 165);
        ExperimentPanel->setMinimumSize(QSize(465, 165));
        ExperimentPanel->setMaximumSize(QSize(16777215, 165));
        gridLayout = new QGridLayout(ExperimentPanel);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        verticalLayout_2 = new QVBoxLayout();
        verticalLayout_2->setObjectName(QString::fromUtf8("verticalLayout_2"));
        mainLabel = new QLabel(ExperimentPanel);
        mainLabel->setObjectName(QString::fromUtf8("mainLabel"));
        QFont font;
        font.setBold(true);
        font.setWeight(75);
        mainLabel->setFont(font);

        verticalLayout_2->addWidget(mainLabel);

        statusOutput = new QLabel(ExperimentPanel);
        statusOutput->setObjectName(QString::fromUtf8("statusOutput"));
        statusOutput->setAlignment(Qt::AlignCenter);

        verticalLayout_2->addWidget(statusOutput);

        verticalLayout = new QVBoxLayout();
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        formLayout = new QFormLayout();
        formLayout->setObjectName(QString::fromUtf8("formLayout"));
        label = new QLabel(ExperimentPanel);
        label->setObjectName(QString::fromUtf8("label"));

        formLayout->setWidget(0, QFormLayout::LabelRole, label);

        nameInput = new QLineEdit(ExperimentPanel);
        nameInput->setObjectName(QString::fromUtf8("nameInput"));
        nameInput->setMinimumSize(QSize(0, 0));

        formLayout->setWidget(0, QFormLayout::FieldRole, nameInput);


        verticalLayout->addLayout(formLayout);

        nameOutput = new QLabel(ExperimentPanel);
        nameOutput->setObjectName(QString::fromUtf8("nameOutput"));
        nameOutput->setMinimumSize(QSize(0, 20));
        nameOutput->setMaximumSize(QSize(16777215, 20));
        nameOutput->setAlignment(Qt::AlignCenter);

        verticalLayout->addWidget(nameOutput);


        verticalLayout_2->addLayout(verticalLayout);

        horizontalLayout_3 = new QHBoxLayout();
        horizontalLayout_3->setObjectName(QString::fromUtf8("horizontalLayout_3"));
        updateTopicsButton = new QPushButton(ExperimentPanel);
        updateTopicsButton->setObjectName(QString::fromUtf8("updateTopicsButton"));
        updateTopicsButton->setEnabled(false);
        updateTopicsButton->setMinimumSize(QSize(0, 22));

        horizontalLayout_3->addWidget(updateTopicsButton);

        recordButton = new QPushButton(ExperimentPanel);
        recordButton->setObjectName(QString::fromUtf8("recordButton"));
        recordButton->setEnabled(false);
        recordButton->setMinimumSize(QSize(0, 22));

        horizontalLayout_3->addWidget(recordButton);

        logButton = new QPushButton(ExperimentPanel);
        logButton->setObjectName(QString::fromUtf8("logButton"));
        logButton->setMinimumSize(QSize(0, 22));
        logButton->setStyleSheet(QString::fromUtf8(""));

        horizontalLayout_3->addWidget(logButton);

        pauseButton = new QPushButton(ExperimentPanel);
        pauseButton->setObjectName(QString::fromUtf8("pauseButton"));
        pauseButton->setEnabled(false);
        pauseButton->setMinimumSize(QSize(0, 22));

        horizontalLayout_3->addWidget(pauseButton);

        stopButton = new QPushButton(ExperimentPanel);
        stopButton->setObjectName(QString::fromUtf8("stopButton"));
        stopButton->setEnabled(false);
        stopButton->setMinimumSize(QSize(0, 22));

        horizontalLayout_3->addWidget(stopButton);

        clearDataButton = new QPushButton(ExperimentPanel);
        clearDataButton->setObjectName(QString::fromUtf8("clearDataButton"));
        clearDataButton->setMinimumSize(QSize(0, 22));

        horizontalLayout_3->addWidget(clearDataButton);


        verticalLayout_2->addLayout(horizontalLayout_3);

        horizontalLayout_2 = new QHBoxLayout();
        horizontalLayout_2->setObjectName(QString::fromUtf8("horizontalLayout_2"));
        label_testButtons = new QLabel(ExperimentPanel);
        label_testButtons->setObjectName(QString::fromUtf8("label_testButtons"));
        label_testButtons->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        horizontalLayout_2->addWidget(label_testButtons);

        errorButton = new QPushButton(ExperimentPanel);
        errorButton->setObjectName(QString::fromUtf8("errorButton"));
        errorButton->setEnabled(true);
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
        QBrush brush9(QColor(0, 0, 0, 128));
        brush9.setStyle(Qt::NoBrush);
#if QT_VERSION >= QT_VERSION_CHECK(5, 12, 0)
        palette.setBrush(QPalette::Active, QPalette::PlaceholderText, brush9);
#endif
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
        QBrush brush10(QColor(0, 0, 0, 128));
        brush10.setStyle(Qt::NoBrush);
#if QT_VERSION >= QT_VERSION_CHECK(5, 12, 0)
        palette.setBrush(QPalette::Inactive, QPalette::PlaceholderText, brush10);
#endif
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
        QBrush brush11(QColor(0, 0, 0, 128));
        brush11.setStyle(Qt::NoBrush);
#if QT_VERSION >= QT_VERSION_CHECK(5, 12, 0)
        palette.setBrush(QPalette::Disabled, QPalette::PlaceholderText, brush11);
#endif
        errorButton->setPalette(palette);

        horizontalLayout_2->addWidget(errorButton);

        finishButton = new QPushButton(ExperimentPanel);
        finishButton->setObjectName(QString::fromUtf8("finishButton"));
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
        QBrush brush12(QColor(0, 0, 0, 128));
        brush12.setStyle(Qt::NoBrush);
#if QT_VERSION >= QT_VERSION_CHECK(5, 12, 0)
        palette1.setBrush(QPalette::Active, QPalette::PlaceholderText, brush12);
#endif
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
        QBrush brush13(QColor(0, 0, 0, 128));
        brush13.setStyle(Qt::NoBrush);
#if QT_VERSION >= QT_VERSION_CHECK(5, 12, 0)
        palette1.setBrush(QPalette::Inactive, QPalette::PlaceholderText, brush13);
#endif
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
        QBrush brush14(QColor(0, 0, 0, 128));
        brush14.setStyle(Qt::NoBrush);
#if QT_VERSION >= QT_VERSION_CHECK(5, 12, 0)
        palette1.setBrush(QPalette::Disabled, QPalette::PlaceholderText, brush14);
#endif
        finishButton->setPalette(palette1);

        horizontalLayout_2->addWidget(finishButton);

        label_3 = new QLabel(ExperimentPanel);
        label_3->setObjectName(QString::fromUtf8("label_3"));

        horizontalLayout_2->addWidget(label_3);


        verticalLayout_2->addLayout(horizontalLayout_2);


        gridLayout->addLayout(verticalLayout_2, 0, 0, 1, 1);


        retranslateUi(ExperimentPanel);

        QMetaObject::connectSlotsByName(ExperimentPanel);
    } // setupUi

    void retranslateUi(QWidget *ExperimentPanel)
    {
        ExperimentPanel->setWindowTitle(QCoreApplication::translate("ExperimentPanel", "Form", nullptr));
        mainLabel->setText(QCoreApplication::translate("ExperimentPanel", "Configure and run experiment", nullptr));
        statusOutput->setText(QCoreApplication::translate("ExperimentPanel", "STATUS OUTPUT", nullptr));
        label->setText(QCoreApplication::translate("ExperimentPanel", "File name", nullptr));
        nameOutput->setText(QCoreApplication::translate("ExperimentPanel", "INFORMATION TEXT LABEL", nullptr));
        updateTopicsButton->setText(QCoreApplication::translate("ExperimentPanel", "Update Topics", nullptr));
        recordButton->setText(QCoreApplication::translate("ExperimentPanel", "Record", nullptr));
        logButton->setText(QCoreApplication::translate("ExperimentPanel", "Log Event", nullptr));
        pauseButton->setText(QCoreApplication::translate("ExperimentPanel", "Pause", nullptr));
        stopButton->setText(QCoreApplication::translate("ExperimentPanel", "Stop", nullptr));
        clearDataButton->setText(QCoreApplication::translate("ExperimentPanel", "Clear Data", nullptr));
        label_testButtons->setText(QCoreApplication::translate("ExperimentPanel", "Test Buttons", nullptr));
        errorButton->setText(QCoreApplication::translate("ExperimentPanel", "Error", nullptr));
        finishButton->setText(QCoreApplication::translate("ExperimentPanel", "Finish", nullptr));
        label_3->setText(QString());
    } // retranslateUi

};

namespace Ui {
    class ExperimentPanel: public Ui_ExperimentPanel {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_EXPERIMENTPANEL_H

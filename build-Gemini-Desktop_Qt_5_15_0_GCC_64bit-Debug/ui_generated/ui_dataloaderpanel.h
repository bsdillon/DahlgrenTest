/********************************************************************************
** Form generated from reading UI file 'dataloaderpanel.ui'
**
** Created by: Qt User Interface Compiler version 5.15.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_DATALOADERPANEL_H
#define UI_DATALOADERPANEL_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_dataLoaderPanel
{
public:
    QGridLayout *gridLayout;
    QVBoxLayout *verticalLayout;
    QHBoxLayout *horizontalLayout;
    QLabel *label;
    QSpacerItem *horizontalSpacer;
    QPushButton *pushButton_clearData;
    QPushButton *pushButton_loadData;
    QLineEdit *lineEdit_currentFile;

    void setupUi(QWidget *dataLoaderPanel)
    {
        if (dataLoaderPanel->objectName().isEmpty())
            dataLoaderPanel->setObjectName(QString::fromUtf8("dataLoaderPanel"));
        dataLoaderPanel->resize(481, 72);
        gridLayout = new QGridLayout(dataLoaderPanel);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        verticalLayout = new QVBoxLayout();
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        label = new QLabel(dataLoaderPanel);
        label->setObjectName(QString::fromUtf8("label"));
        QFont font;
        font.setBold(true);
        font.setWeight(75);
        label->setFont(font);

        horizontalLayout->addWidget(label);

        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer);

        pushButton_clearData = new QPushButton(dataLoaderPanel);
        pushButton_clearData->setObjectName(QString::fromUtf8("pushButton_clearData"));
        pushButton_clearData->setMinimumSize(QSize(80, 22));

        horizontalLayout->addWidget(pushButton_clearData);

        pushButton_loadData = new QPushButton(dataLoaderPanel);
        pushButton_loadData->setObjectName(QString::fromUtf8("pushButton_loadData"));
        pushButton_loadData->setMinimumSize(QSize(80, 22));

        horizontalLayout->addWidget(pushButton_loadData);


        verticalLayout->addLayout(horizontalLayout);


        gridLayout->addLayout(verticalLayout, 0, 0, 1, 1);

        lineEdit_currentFile = new QLineEdit(dataLoaderPanel);
        lineEdit_currentFile->setObjectName(QString::fromUtf8("lineEdit_currentFile"));

        gridLayout->addWidget(lineEdit_currentFile, 1, 0, 1, 1);


        retranslateUi(dataLoaderPanel);

        QMetaObject::connectSlotsByName(dataLoaderPanel);
    } // setupUi

    void retranslateUi(QWidget *dataLoaderPanel)
    {
        dataLoaderPanel->setWindowTitle(QCoreApplication::translate("dataLoaderPanel", "Form", nullptr));
        label->setText(QCoreApplication::translate("dataLoaderPanel", "Select File to Load", nullptr));
        pushButton_clearData->setText(QCoreApplication::translate("dataLoaderPanel", "Clear Data", nullptr));
        pushButton_loadData->setText(QCoreApplication::translate("dataLoaderPanel", "Load Data", nullptr));
    } // retranslateUi

};

namespace Ui {
    class dataLoaderPanel: public Ui_dataLoaderPanel {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DATALOADERPANEL_H

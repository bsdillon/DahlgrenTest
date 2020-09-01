/********************************************************************************
** Form generated from reading UI file 'dataloaderpanel.ui'
**
** Created by: Qt User Interface Compiler version 5.9.7
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_DATALOADERPANEL_H
#define UI_DATALOADERPANEL_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
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
            dataLoaderPanel->setObjectName(QStringLiteral("dataLoaderPanel"));
        dataLoaderPanel->resize(481, 72);
        gridLayout = new QGridLayout(dataLoaderPanel);
        gridLayout->setObjectName(QStringLiteral("gridLayout"));
        verticalLayout = new QVBoxLayout();
        verticalLayout->setObjectName(QStringLiteral("verticalLayout"));
        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        label = new QLabel(dataLoaderPanel);
        label->setObjectName(QStringLiteral("label"));
        QFont font;
        font.setBold(true);
        font.setWeight(75);
        label->setFont(font);

        horizontalLayout->addWidget(label);

        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer);

        pushButton_clearData = new QPushButton(dataLoaderPanel);
        pushButton_clearData->setObjectName(QStringLiteral("pushButton_clearData"));
        pushButton_clearData->setMinimumSize(QSize(80, 22));

        horizontalLayout->addWidget(pushButton_clearData);

        pushButton_loadData = new QPushButton(dataLoaderPanel);
        pushButton_loadData->setObjectName(QStringLiteral("pushButton_loadData"));
        pushButton_loadData->setMinimumSize(QSize(80, 22));

        horizontalLayout->addWidget(pushButton_loadData);


        verticalLayout->addLayout(horizontalLayout);


        gridLayout->addLayout(verticalLayout, 0, 0, 1, 1);

        lineEdit_currentFile = new QLineEdit(dataLoaderPanel);
        lineEdit_currentFile->setObjectName(QStringLiteral("lineEdit_currentFile"));

        gridLayout->addWidget(lineEdit_currentFile, 1, 0, 1, 1);


        retranslateUi(dataLoaderPanel);

        QMetaObject::connectSlotsByName(dataLoaderPanel);
    } // setupUi

    void retranslateUi(QWidget *dataLoaderPanel)
    {
        dataLoaderPanel->setWindowTitle(QApplication::translate("dataLoaderPanel", "Form", Q_NULLPTR));
        label->setText(QApplication::translate("dataLoaderPanel", "Select File to Load", Q_NULLPTR));
        pushButton_clearData->setText(QApplication::translate("dataLoaderPanel", "Clear Data", Q_NULLPTR));
        pushButton_loadData->setText(QApplication::translate("dataLoaderPanel", "Load Data", Q_NULLPTR));
    } // retranslateUi

};

namespace Ui {
    class dataLoaderPanel: public Ui_dataLoaderPanel {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DATALOADERPANEL_H

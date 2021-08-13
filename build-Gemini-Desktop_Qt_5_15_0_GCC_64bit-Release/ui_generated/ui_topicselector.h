/********************************************************************************
** Form generated from reading UI file 'topicselector.ui'
**
** Created by: Qt User Interface Compiler version 5.15.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_TOPICSELECTOR_H
#define UI_TOPICSELECTOR_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QListView>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_TopicSelector
{
public:
    QGridLayout *gridLayout;
    QVBoxLayout *verticalLayout_4;
    QHBoxLayout *horizontalLayout_3;
    QLabel *label;
    QSpacerItem *horizontalSpacer;
    QPushButton *pushButton_2_saveTopics;
    QPushButton *pushButton_loadTopics;
    QHBoxLayout *horizontalLayout_4;
    QVBoxLayout *verticalLayout;
    QListView *TopicListAll;
    QHBoxLayout *horizontalLayout;
    QPushButton *allSelect_allTopics;
    QPushButton *noneSelect_allTopics;
    QLineEdit *lineEdit_filter_allTopics;
    QVBoxLayout *verticalLayout_3;
    QPushButton *pushButton_selectTopics;
    QPushButton *pushButton_deselectTopics;
    QVBoxLayout *verticalLayout_2;
    QListView *TopicListSelected;
    QHBoxLayout *horizontalLayout_2;
    QPushButton *allSelect_selectedTopics;
    QPushButton *noneSelect_selectedTopics;
    QLineEdit *lineEdit_filter_selectedTopics;

    void setupUi(QWidget *TopicSelector)
    {
        if (TopicSelector->objectName().isEmpty())
            TopicSelector->setObjectName(QString::fromUtf8("TopicSelector"));
        TopicSelector->resize(684, 170);
        TopicSelector->setMinimumSize(QSize(460, 170));
        TopicSelector->setMaximumSize(QSize(16777215, 170));
        gridLayout = new QGridLayout(TopicSelector);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        verticalLayout_4 = new QVBoxLayout();
        verticalLayout_4->setObjectName(QString::fromUtf8("verticalLayout_4"));
        horizontalLayout_3 = new QHBoxLayout();
        horizontalLayout_3->setObjectName(QString::fromUtf8("horizontalLayout_3"));
        label = new QLabel(TopicSelector);
        label->setObjectName(QString::fromUtf8("label"));
        QFont font;
        font.setBold(true);
        font.setWeight(75);
        label->setFont(font);

        horizontalLayout_3->addWidget(label);

        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_3->addItem(horizontalSpacer);

        pushButton_2_saveTopics = new QPushButton(TopicSelector);
        pushButton_2_saveTopics->setObjectName(QString::fromUtf8("pushButton_2_saveTopics"));
        pushButton_2_saveTopics->setMinimumSize(QSize(160, 22));

        horizontalLayout_3->addWidget(pushButton_2_saveTopics);

        pushButton_loadTopics = new QPushButton(TopicSelector);
        pushButton_loadTopics->setObjectName(QString::fromUtf8("pushButton_loadTopics"));
        pushButton_loadTopics->setMinimumSize(QSize(160, 22));

        horizontalLayout_3->addWidget(pushButton_loadTopics);


        verticalLayout_4->addLayout(horizontalLayout_3);

        horizontalLayout_4 = new QHBoxLayout();
        horizontalLayout_4->setObjectName(QString::fromUtf8("horizontalLayout_4"));
        verticalLayout = new QVBoxLayout();
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        TopicListAll = new QListView(TopicSelector);
        TopicListAll->setObjectName(QString::fromUtf8("TopicListAll"));
        TopicListAll->setSelectionMode(QAbstractItemView::MultiSelection);

        verticalLayout->addWidget(TopicListAll);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        allSelect_allTopics = new QPushButton(TopicSelector);
        allSelect_allTopics->setObjectName(QString::fromUtf8("allSelect_allTopics"));
        allSelect_allTopics->setMinimumSize(QSize(80, 22));
        QFont font1;
        font1.setBold(false);
        font1.setWeight(50);
        allSelect_allTopics->setFont(font1);

        horizontalLayout->addWidget(allSelect_allTopics);

        noneSelect_allTopics = new QPushButton(TopicSelector);
        noneSelect_allTopics->setObjectName(QString::fromUtf8("noneSelect_allTopics"));
        noneSelect_allTopics->setMinimumSize(QSize(80, 22));

        horizontalLayout->addWidget(noneSelect_allTopics);

        lineEdit_filter_allTopics = new QLineEdit(TopicSelector);
        lineEdit_filter_allTopics->setObjectName(QString::fromUtf8("lineEdit_filter_allTopics"));
        lineEdit_filter_allTopics->setClearButtonEnabled(true);

        horizontalLayout->addWidget(lineEdit_filter_allTopics);


        verticalLayout->addLayout(horizontalLayout);


        horizontalLayout_4->addLayout(verticalLayout);

        verticalLayout_3 = new QVBoxLayout();
        verticalLayout_3->setObjectName(QString::fromUtf8("verticalLayout_3"));
        pushButton_selectTopics = new QPushButton(TopicSelector);
        pushButton_selectTopics->setObjectName(QString::fromUtf8("pushButton_selectTopics"));
        pushButton_selectTopics->setMinimumSize(QSize(22, 22));
        pushButton_selectTopics->setMaximumSize(QSize(22, 22));

        verticalLayout_3->addWidget(pushButton_selectTopics);

        pushButton_deselectTopics = new QPushButton(TopicSelector);
        pushButton_deselectTopics->setObjectName(QString::fromUtf8("pushButton_deselectTopics"));
        pushButton_deselectTopics->setMinimumSize(QSize(22, 22));
        pushButton_deselectTopics->setMaximumSize(QSize(22, 22));

        verticalLayout_3->addWidget(pushButton_deselectTopics);


        horizontalLayout_4->addLayout(verticalLayout_3);

        verticalLayout_2 = new QVBoxLayout();
        verticalLayout_2->setObjectName(QString::fromUtf8("verticalLayout_2"));
        TopicListSelected = new QListView(TopicSelector);
        TopicListSelected->setObjectName(QString::fromUtf8("TopicListSelected"));
        TopicListSelected->setSelectionMode(QAbstractItemView::MultiSelection);

        verticalLayout_2->addWidget(TopicListSelected);

        horizontalLayout_2 = new QHBoxLayout();
        horizontalLayout_2->setObjectName(QString::fromUtf8("horizontalLayout_2"));
        allSelect_selectedTopics = new QPushButton(TopicSelector);
        allSelect_selectedTopics->setObjectName(QString::fromUtf8("allSelect_selectedTopics"));
        allSelect_selectedTopics->setMinimumSize(QSize(80, 22));
        allSelect_selectedTopics->setFont(font1);

        horizontalLayout_2->addWidget(allSelect_selectedTopics);

        noneSelect_selectedTopics = new QPushButton(TopicSelector);
        noneSelect_selectedTopics->setObjectName(QString::fromUtf8("noneSelect_selectedTopics"));
        noneSelect_selectedTopics->setMinimumSize(QSize(80, 22));

        horizontalLayout_2->addWidget(noneSelect_selectedTopics);

        lineEdit_filter_selectedTopics = new QLineEdit(TopicSelector);
        lineEdit_filter_selectedTopics->setObjectName(QString::fromUtf8("lineEdit_filter_selectedTopics"));
        lineEdit_filter_selectedTopics->setClearButtonEnabled(true);

        horizontalLayout_2->addWidget(lineEdit_filter_selectedTopics);


        verticalLayout_2->addLayout(horizontalLayout_2);


        horizontalLayout_4->addLayout(verticalLayout_2);


        verticalLayout_4->addLayout(horizontalLayout_4);


        gridLayout->addLayout(verticalLayout_4, 0, 0, 1, 1);


        retranslateUi(TopicSelector);

        QMetaObject::connectSlotsByName(TopicSelector);
    } // setupUi

    void retranslateUi(QWidget *TopicSelector)
    {
        TopicSelector->setWindowTitle(QCoreApplication::translate("TopicSelector", "Form", nullptr));
        label->setText(QCoreApplication::translate("TopicSelector", "Select topics to follow", nullptr));
        pushButton_2_saveTopics->setText(QCoreApplication::translate("TopicSelector", "Save Current Topic List", nullptr));
        pushButton_loadTopics->setText(QCoreApplication::translate("TopicSelector", "Load Topic List", nullptr));
        allSelect_allTopics->setText(QCoreApplication::translate("TopicSelector", "All", nullptr));
        noneSelect_allTopics->setText(QCoreApplication::translate("TopicSelector", "None", nullptr));
        pushButton_selectTopics->setText(QCoreApplication::translate("TopicSelector", ">", nullptr));
        pushButton_deselectTopics->setText(QCoreApplication::translate("TopicSelector", "<", nullptr));
        allSelect_selectedTopics->setText(QCoreApplication::translate("TopicSelector", "All", nullptr));
        noneSelect_selectedTopics->setText(QCoreApplication::translate("TopicSelector", "None", nullptr));
    } // retranslateUi

};

namespace Ui {
    class TopicSelector: public Ui_TopicSelector {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_TOPICSELECTOR_H

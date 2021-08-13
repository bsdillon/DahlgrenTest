/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.15.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtGui/QIcon>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QFrame>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QSplitter>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>
#include "qtgui/experimentpanel.h"
#include "qtgui/topiccounts.h"
#include "qtgui/topicdetails.h"
#include "qtgui/topicselector.h"

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QAction *actionCreate_manual_event;
    QWidget *centralWidget;
    QGridLayout *gridLayout;
    QVBoxLayout *verticalLayout_2;
    QSplitter *splitter;
    QWidget *layoutWidget;
    QVBoxLayout *verticalLayout;
    QFrame *frame_topicPanel;
    QGridLayout *gridLayout_3;
    TopicSelector *topicPanel;
    QFrame *frame_experimentPanel;
    QGridLayout *gridLayout_5;
    ExperimentPanel *experimentPanel;
    QFrame *frame_2;
    QGridLayout *gridLayout_2;
    TopicCounts *countPanel;
    TopicDetails *detailPanel;
    QFrame *modeSelectorFrame;
    QGridLayout *gridLayout_4;
    QHBoxLayout *horizontalLayout;
    QSpacerItem *horizontalSpacer;
    QStatusBar *statusBar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QString::fromUtf8("MainWindow"));
        MainWindow->resize(1493, 787);
        MainWindow->setBaseSize(QSize(1100, 800));
        QIcon icon;
        QString iconThemeName = QString::fromUtf8("gemini");
        if (QIcon::hasThemeIcon(iconThemeName)) {
            icon = QIcon::fromTheme(iconThemeName);
        } else {
            icon.addFile(QString::fromUtf8(":/Icon.bmp"), QSize(), QIcon::Normal, QIcon::Off);
        }
        MainWindow->setWindowIcon(icon);
        actionCreate_manual_event = new QAction(MainWindow);
        actionCreate_manual_event->setObjectName(QString::fromUtf8("actionCreate_manual_event"));
        actionCreate_manual_event->setEnabled(false);
        centralWidget = new QWidget(MainWindow);
        centralWidget->setObjectName(QString::fromUtf8("centralWidget"));
        gridLayout = new QGridLayout(centralWidget);
        gridLayout->setSpacing(6);
        gridLayout->setContentsMargins(11, 11, 11, 11);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        verticalLayout_2 = new QVBoxLayout();
        verticalLayout_2->setSpacing(6);
        verticalLayout_2->setObjectName(QString::fromUtf8("verticalLayout_2"));
        splitter = new QSplitter(centralWidget);
        splitter->setObjectName(QString::fromUtf8("splitter"));
        splitter->setOrientation(Qt::Horizontal);
        splitter->setChildrenCollapsible(false);
        layoutWidget = new QWidget(splitter);
        layoutWidget->setObjectName(QString::fromUtf8("layoutWidget"));
        verticalLayout = new QVBoxLayout(layoutWidget);
        verticalLayout->setSpacing(6);
        verticalLayout->setContentsMargins(11, 11, 11, 11);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        verticalLayout->setContentsMargins(0, 0, 0, 0);
        frame_topicPanel = new QFrame(layoutWidget);
        frame_topicPanel->setObjectName(QString::fromUtf8("frame_topicPanel"));
        QSizePolicy sizePolicy(QSizePolicy::Preferred, QSizePolicy::Preferred);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(1);
        sizePolicy.setHeightForWidth(frame_topicPanel->sizePolicy().hasHeightForWidth());
        frame_topicPanel->setSizePolicy(sizePolicy);
        frame_topicPanel->setMinimumSize(QSize(0, 190));
        frame_topicPanel->setMaximumSize(QSize(16777215, 190));
        frame_topicPanel->setFrameShape(QFrame::NoFrame);
        frame_topicPanel->setFrameShadow(QFrame::Plain);
        gridLayout_3 = new QGridLayout(frame_topicPanel);
        gridLayout_3->setSpacing(6);
        gridLayout_3->setContentsMargins(11, 11, 11, 11);
        gridLayout_3->setObjectName(QString::fromUtf8("gridLayout_3"));
        gridLayout_3->setContentsMargins(0, 0, 0, 0);
        topicPanel = new TopicSelector(frame_topicPanel);
        topicPanel->setObjectName(QString::fromUtf8("topicPanel"));
        sizePolicy.setHeightForWidth(topicPanel->sizePolicy().hasHeightForWidth());
        topicPanel->setSizePolicy(sizePolicy);

        gridLayout_3->addWidget(topicPanel, 1, 0, 1, 1);


        verticalLayout->addWidget(frame_topicPanel);

        frame_experimentPanel = new QFrame(layoutWidget);
        frame_experimentPanel->setObjectName(QString::fromUtf8("frame_experimentPanel"));
        QSizePolicy sizePolicy1(QSizePolicy::Preferred, QSizePolicy::MinimumExpanding);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(frame_experimentPanel->sizePolicy().hasHeightForWidth());
        frame_experimentPanel->setSizePolicy(sizePolicy1);
        frame_experimentPanel->setMinimumSize(QSize(0, 185));
        frame_experimentPanel->setMaximumSize(QSize(16777215, 185));
        frame_experimentPanel->setFrameShape(QFrame::NoFrame);
        frame_experimentPanel->setFrameShadow(QFrame::Plain);
        gridLayout_5 = new QGridLayout(frame_experimentPanel);
        gridLayout_5->setSpacing(6);
        gridLayout_5->setContentsMargins(11, 11, 11, 11);
        gridLayout_5->setObjectName(QString::fromUtf8("gridLayout_5"));
        gridLayout_5->setContentsMargins(0, 0, 0, 0);
        experimentPanel = new ExperimentPanel(frame_experimentPanel);
        experimentPanel->setObjectName(QString::fromUtf8("experimentPanel"));
        QSizePolicy sizePolicy2(QSizePolicy::Preferred, QSizePolicy::Minimum);
        sizePolicy2.setHorizontalStretch(0);
        sizePolicy2.setVerticalStretch(0);
        sizePolicy2.setHeightForWidth(experimentPanel->sizePolicy().hasHeightForWidth());
        experimentPanel->setSizePolicy(sizePolicy2);

        gridLayout_5->addWidget(experimentPanel, 0, 1, 1, 1);


        verticalLayout->addWidget(frame_experimentPanel);

        frame_2 = new QFrame(layoutWidget);
        frame_2->setObjectName(QString::fromUtf8("frame_2"));
        sizePolicy.setHeightForWidth(frame_2->sizePolicy().hasHeightForWidth());
        frame_2->setSizePolicy(sizePolicy);
        frame_2->setFrameShape(QFrame::NoFrame);
        frame_2->setFrameShadow(QFrame::Plain);
        gridLayout_2 = new QGridLayout(frame_2);
        gridLayout_2->setSpacing(6);
        gridLayout_2->setContentsMargins(11, 11, 11, 11);
        gridLayout_2->setObjectName(QString::fromUtf8("gridLayout_2"));
        gridLayout_2->setContentsMargins(0, 0, 0, 0);
        countPanel = new TopicCounts(frame_2);
        countPanel->setObjectName(QString::fromUtf8("countPanel"));
        QSizePolicy sizePolicy3(QSizePolicy::MinimumExpanding, QSizePolicy::Preferred);
        sizePolicy3.setHorizontalStretch(0);
        sizePolicy3.setVerticalStretch(1);
        sizePolicy3.setHeightForWidth(countPanel->sizePolicy().hasHeightForWidth());
        countPanel->setSizePolicy(sizePolicy3);
        countPanel->setMinimumSize(QSize(370, 0));

        gridLayout_2->addWidget(countPanel, 0, 0, 1, 1);


        verticalLayout->addWidget(frame_2);

        splitter->addWidget(layoutWidget);
        detailPanel = new TopicDetails(splitter);
        detailPanel->setObjectName(QString::fromUtf8("detailPanel"));
        QSizePolicy sizePolicy4(QSizePolicy::Preferred, QSizePolicy::Preferred);
        sizePolicy4.setHorizontalStretch(0);
        sizePolicy4.setVerticalStretch(0);
        sizePolicy4.setHeightForWidth(detailPanel->sizePolicy().hasHeightForWidth());
        detailPanel->setSizePolicy(sizePolicy4);
        detailPanel->setMinimumSize(QSize(500, 0));
        splitter->addWidget(detailPanel);

        verticalLayout_2->addWidget(splitter);


        gridLayout->addLayout(verticalLayout_2, 1, 0, 1, 1);

        modeSelectorFrame = new QFrame(centralWidget);
        modeSelectorFrame->setObjectName(QString::fromUtf8("modeSelectorFrame"));
        modeSelectorFrame->setMinimumSize(QSize(0, 30));
        modeSelectorFrame->setMaximumSize(QSize(16777215, 30));
        modeSelectorFrame->setFrameShape(QFrame::NoFrame);
        modeSelectorFrame->setFrameShadow(QFrame::Raised);
        gridLayout_4 = new QGridLayout(modeSelectorFrame);
        gridLayout_4->setSpacing(6);
        gridLayout_4->setContentsMargins(11, 11, 11, 11);
        gridLayout_4->setObjectName(QString::fromUtf8("gridLayout_4"));
        gridLayout_4->setContentsMargins(0, 0, 0, 0);
        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setSpacing(6);
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer);


        gridLayout_4->addLayout(horizontalLayout, 0, 0, 1, 1);


        gridLayout->addWidget(modeSelectorFrame, 0, 0, 1, 1);

        MainWindow->setCentralWidget(centralWidget);
        statusBar = new QStatusBar(MainWindow);
        statusBar->setObjectName(QString::fromUtf8("statusBar"));
        MainWindow->setStatusBar(statusBar);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QCoreApplication::translate("MainWindow", "GEMINI", nullptr));
        actionCreate_manual_event->setText(QCoreApplication::translate("MainWindow", "Create manual event", nullptr));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H

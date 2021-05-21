/********************************************************************************
** Form generated from reading UI file 'testwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.15.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_TESTWINDOW_H
#define UI_TESTWINDOW_H

#include <QtCore/QVariant>
#include <QtGui/QIcon>
#include <QtWidgets/QApplication>
#include <QtWidgets/QFormLayout>
#include <QtWidgets/QFrame>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QScrollArea>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_TestWindow
{
public:
    QWidget *centralwidget;
    QGridLayout *gridLayout_3;
    QVBoxLayout *verticalLayout;
    QHBoxLayout *horizontalLayout;
    QLabel *label_3;
    QFormLayout *formLayout;
    QLabel *label;
    QLineEdit *multiplier;
    QLabel *label_2;
    QLineEdit *frequency;
    QPushButton *stopButton;
    QScrollArea *scrollArea;
    QWidget *scrollAreaWidgetContents;
    QGridLayout *gridLayout;
    QFrame *frame;
    QGridLayout *gridLayout_4;
    QVBoxLayout *layout_buttons;
    QFrame *publishing;
    QGridLayout *gridLayout_2;
    QVBoxLayout *publishingLayout;
    QLabel *publishingLabel;

    void setupUi(QMainWindow *TestWindow)
    {
        if (TestWindow->objectName().isEmpty())
            TestWindow->setObjectName(QString::fromUtf8("TestWindow"));
        TestWindow->resize(300, 225);
        QSizePolicy sizePolicy(QSizePolicy::Preferred, QSizePolicy::Preferred);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(TestWindow->sizePolicy().hasHeightForWidth());
        TestWindow->setSizePolicy(sizePolicy);
        TestWindow->setMinimumSize(QSize(300, 200));
        TestWindow->setMaximumSize(QSize(700, 16777215));
        TestWindow->setSizeIncrement(QSize(1, 1));
        TestWindow->setBaseSize(QSize(50, 50));
        QIcon icon;
        icon.addFile(QString::fromUtf8(":/Icon.bmp"), QSize(), QIcon::Normal, QIcon::Off);
        TestWindow->setWindowIcon(icon);
        centralwidget = new QWidget(TestWindow);
        centralwidget->setObjectName(QString::fromUtf8("centralwidget"));
        gridLayout_3 = new QGridLayout(centralwidget);
        gridLayout_3->setObjectName(QString::fromUtf8("gridLayout_3"));
        verticalLayout = new QVBoxLayout();
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        label_3 = new QLabel(centralwidget);
        label_3->setObjectName(QString::fromUtf8("label_3"));
        label_3->setMinimumSize(QSize(50, 50));
        label_3->setMaximumSize(QSize(50, 50));
        label_3->setPixmap(QPixmap(QString::fromUtf8(":/Icon.bmp")));
        label_3->setScaledContents(true);

        horizontalLayout->addWidget(label_3);

        formLayout = new QFormLayout();
        formLayout->setObjectName(QString::fromUtf8("formLayout"));
        label = new QLabel(centralwidget);
        label->setObjectName(QString::fromUtf8("label"));

        formLayout->setWidget(0, QFormLayout::LabelRole, label);

        multiplier = new QLineEdit(centralwidget);
        multiplier->setObjectName(QString::fromUtf8("multiplier"));

        formLayout->setWidget(0, QFormLayout::FieldRole, multiplier);

        label_2 = new QLabel(centralwidget);
        label_2->setObjectName(QString::fromUtf8("label_2"));

        formLayout->setWidget(1, QFormLayout::LabelRole, label_2);

        frequency = new QLineEdit(centralwidget);
        frequency->setObjectName(QString::fromUtf8("frequency"));

        formLayout->setWidget(1, QFormLayout::FieldRole, frequency);


        horizontalLayout->addLayout(formLayout);


        verticalLayout->addLayout(horizontalLayout);

        stopButton = new QPushButton(centralwidget);
        stopButton->setObjectName(QString::fromUtf8("stopButton"));
        stopButton->setMinimumSize(QSize(0, 22));
        stopButton->setAutoFillBackground(false);
        stopButton->setStyleSheet(QString::fromUtf8(""));
        stopButton->setCheckable(false);
        stopButton->setAutoDefault(false);
        stopButton->setFlat(false);

        verticalLayout->addWidget(stopButton);

        scrollArea = new QScrollArea(centralwidget);
        scrollArea->setObjectName(QString::fromUtf8("scrollArea"));
        scrollArea->setWidgetResizable(true);
        scrollAreaWidgetContents = new QWidget();
        scrollAreaWidgetContents->setObjectName(QString::fromUtf8("scrollAreaWidgetContents"));
        scrollAreaWidgetContents->setGeometry(QRect(0, 0, 278, 75));
        gridLayout = new QGridLayout(scrollAreaWidgetContents);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        gridLayout->setContentsMargins(0, 0, 0, 0);
        frame = new QFrame(scrollAreaWidgetContents);
        frame->setObjectName(QString::fromUtf8("frame"));
        QSizePolicy sizePolicy1(QSizePolicy::Expanding, QSizePolicy::Expanding);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(frame->sizePolicy().hasHeightForWidth());
        frame->setSizePolicy(sizePolicy1);
        frame->setFrameShape(QFrame::StyledPanel);
        frame->setFrameShadow(QFrame::Raised);
        gridLayout_4 = new QGridLayout(frame);
        gridLayout_4->setObjectName(QString::fromUtf8("gridLayout_4"));
        gridLayout_4->setHorizontalSpacing(0);
        gridLayout_4->setVerticalSpacing(1);
        gridLayout_4->setContentsMargins(0, 0, 0, 0);
        layout_buttons = new QVBoxLayout();
        layout_buttons->setSpacing(0);
        layout_buttons->setObjectName(QString::fromUtf8("layout_buttons"));

        gridLayout_4->addLayout(layout_buttons, 0, 0, 1, 1);


        gridLayout->addWidget(frame, 0, 0, 1, 1);

        scrollArea->setWidget(scrollAreaWidgetContents);

        verticalLayout->addWidget(scrollArea);

        publishing = new QFrame(centralwidget);
        publishing->setObjectName(QString::fromUtf8("publishing"));
        publishing->setMinimumSize(QSize(25, 34));
        publishing->setMaximumSize(QSize(16777215, 34));
        publishing->setLayoutDirection(Qt::LeftToRight);
        publishing->setFrameShape(QFrame::StyledPanel);
        publishing->setFrameShadow(QFrame::Raised);
        gridLayout_2 = new QGridLayout(publishing);
        gridLayout_2->setObjectName(QString::fromUtf8("gridLayout_2"));
        publishingLayout = new QVBoxLayout();
        publishingLayout->setSpacing(6);
        publishingLayout->setObjectName(QString::fromUtf8("publishingLayout"));
        publishingLabel = new QLabel(publishing);
        publishingLabel->setObjectName(QString::fromUtf8("publishingLabel"));

        publishingLayout->addWidget(publishingLabel);


        gridLayout_2->addLayout(publishingLayout, 0, 0, 1, 1);


        verticalLayout->addWidget(publishing);


        gridLayout_3->addLayout(verticalLayout, 0, 0, 1, 1);

        TestWindow->setCentralWidget(centralwidget);

        retranslateUi(TestWindow);

        stopButton->setDefault(false);


        QMetaObject::connectSlotsByName(TestWindow);
    } // setupUi

    void retranslateUi(QMainWindow *TestWindow)
    {
        TestWindow->setWindowTitle(QCoreApplication::translate("TestWindow", "GEMINI Tester", nullptr));
        label_3->setText(QString());
        label->setText(QCoreApplication::translate("TestWindow", "Multiplier", nullptr));
        label_2->setText(QCoreApplication::translate("TestWindow", "Frequency", nullptr));
        frequency->setText(QCoreApplication::translate("TestWindow", "1", nullptr));
        stopButton->setText(QCoreApplication::translate("TestWindow", "Stop Publishing Messages", nullptr));
        publishingLabel->setText(QCoreApplication::translate("TestWindow", "TextLabel", nullptr));
    } // retranslateUi

};

namespace Ui {
    class TestWindow: public Ui_TestWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_TESTWINDOW_H

#include "qtgui/dataloaderpanel.h"
#include "ui_dataloaderpanel.h"
#include <QFileDialog>
#include <QStringListModel>

dataLoaderPanel::dataLoaderPanel(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::dataLoaderPanel)
{
    ui->setupUi(this);
    connect(ui->pushButton_loadData, &QPushButton::clicked, this, &dataLoaderPanel::loadData);
    connect(ui->pushButton_clearData, &QPushButton::clicked, this, &dataLoaderPanel::clearData);
    ui->lineEdit_currentFile->setEnabled(false);
    ui->pushButton_clearData->setEnabled(false);
}

dataLoaderPanel::~dataLoaderPanel()
{
    delete ui;
}

void dataLoaderPanel::loadData()
{
    QString dir(getenv("LOG_FILE_PATH"));
    auto fileName = QFileDialog::getOpenFileName(this, tr("Select Load File"), dir, tr("GEMINI Log Files (*.bin)"));
    if (fileName.length() > 0)
    {
        ui->lineEdit_currentFile->setText(fileName);
        ui->pushButton_clearData->setEnabled(true);
        ui->pushButton_loadData->setEnabled(false);
        emit loadDataFrom(fileName);
        emit inCleanState(false);
    }
}

void dataLoaderPanel::clearData()
{
    ui->lineEdit_currentFile->clear();
    ui->pushButton_clearData->setEnabled(false);
    ui->pushButton_loadData->setEnabled(true);
    emit requestToClearData();
    emit inCleanState(true);
}

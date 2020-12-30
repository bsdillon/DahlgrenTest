#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    this->setContextMenuPolicy(Qt::CustomContextMenu);
    connect(this, &QWidget::customContextMenuRequested, this, &MainWindow::contextMenu);

    popupmenu = new QMenu(this);
    QAction* tmp[] = {ui->actionItem1, ui->actionItem2, ui->actionItem3};
    QString labels[] = {"Item1", "Item2", "Item3"};
    for(int i=1;i<=3;i++)
    {
        QAction* qa = new QAction(labels[i-1], this);
        switch(i)
        {
            case 1:
            connect(qa, &QAction::triggered, this, &MainWindow::menuAction1);
            connect(tmp[i-1], &QAction::triggered, this, &MainWindow::menuAction1);
            break;
            case 2:
            connect(qa, &QAction::triggered, this, &MainWindow::menuAction2);
            connect(tmp[i-1], &QAction::triggered, this, &MainWindow::menuAction2);
            break;
            case 3:
            connect(qa, &QAction::triggered, this, &MainWindow::menuAction3);
            connect(tmp[i-1], &QAction::triggered, this, &MainWindow::menuAction3);
            break;
        }

        popupmenu->addAction(qa);
    }
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::contextMenu(const QPoint &pos)
{
    popupmenu->popup(ui->centralwidget->mapToGlobal(pos));
}

void MainWindow::menuAction1(bool )
{
    ui->label_5->setText("Item1");
}

void MainWindow::menuAction2(bool )
{
    ui->label_5->setText("Item2");
}

void MainWindow::menuAction3(bool )
{
    ui->label_5->setText("Item3");
}

void MainWindow::on_menuOutput_linkHovered(const QString &)
{
}

void MainWindow::on_pushButton_3_clicked()
{
    QString txt = ui->lineEdit->text();
    QString answer = "Error";
    if(txt.compare("textfile1.txt")==0)
    {
        answer = "Value1";
    }
    else if(txt.compare("textfile2.txt")==0)
    {
        answer = "Value2";
    }
    ui->label_2->setText(answer);
}

void MainWindow::on_pushButton_clicked()
{
    createSecond("alpha");
}

void MainWindow::on_pushButton_2_clicked()
{
    createSecond("bravo");
}

void MainWindow::createSecond(QString txt)
{
    second mySecond;
    mySecond.Setup(txt);
    mySecond.exec();
}

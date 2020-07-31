#include "second.h"
#include "ui_second.h"

second::second(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::second)
{
    ui->setupUi(this);
}

void second::Setup(QString txt)
{
    ui->label->setText("You clicked "+txt+" button");
}

second::~second()
{
    delete ui;
}

void second::on_pushButton_clicked()
{
    this->close();
    emit closeMe();
}

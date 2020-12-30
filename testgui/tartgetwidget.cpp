#include "tartgetwidget.h"
#include "ui_tartgetwidget.h"
#include "QMouseEvent"
#include "QRandomGenerator"
#include "QPainter"
#include "QtMath"

TartgetWidget::TartgetWidget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::TartgetWidget),
    _state(Hidden)
{
    ui->setupUi(this);
}

TartgetWidget::~TartgetWidget()
{
    delete ui;
}

void TartgetWidget::enterEvent(QEvent*)
{
    _state=Blue;
    int w = this->width()-10;
    int h = this->height()-10;
    QRandomGenerator rand;
    target.setX(rand.generateDouble()*w+5);
    target.setY(rand.generateDouble()*h+5);
    this->repaint();
}

void TartgetWidget::leaveEvent(QEvent*)
{
    _state=Hidden;
    this->repaint();
}

void TartgetWidget::mousePressEvent(QMouseEvent *event)
{
    if(_state==Hidden)
    {
        return;
    }

    int x = event->x()-target.x();
    int y = event->y()-target.y();

    if(x<-5 || x>5 || y<-5 || y>5)
    {
        return;
    }
    _state = Red;
    this->repaint();
}

void TartgetWidget::paintEvent(QPaintEvent* )
{
    QColor color = QColor::fromRgb(0,0,0);
    QPainter painter(this);
    painter.fillRect(QRect(0,0,this->width(),this->height()),color);

    if(_state==Hidden)
    {
        return;
    }

    color = QColor::fromRgb(255,0,0);
    if(_state==Blue)
    {
        color = QColor::fromRgb(125,125,255);
    }

    painter.fillRect(QRect(target.x()-5,target.y()-5,10,10),color);
}

#ifndef TARTGETWIDGET_H
#define TARTGETWIDGET_H

#include <QWidget>

namespace Ui {
class TartgetWidget;
}

class TartgetWidget : public QWidget
{
    Q_OBJECT

public:
    explicit TartgetWidget(QWidget *parent = nullptr);
    ~TartgetWidget();

private:
    enum TargetState
    {
        Hidden,
        Blue,
        Red
    };

    Ui::TartgetWidget *ui;
    QPoint target;
    TargetState _state;
    QBrush red;
    QBrush blue;

protected:
    virtual void enterEvent(QEvent *event);
    virtual void leaveEvent(QEvent *event);
    virtual void mousePressEvent(QMouseEvent *event);
    virtual void paintEvent(QPaintEvent *event);
};

#endif // TARTGETWIDGET_H

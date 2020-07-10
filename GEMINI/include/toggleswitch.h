#ifndef TOGGLESWITCH_H
#define TOGGLESWITCH_H

/*
 * This class is based on a class created by StackOverflow User IMAN4K
 * https://stackoverflow.com/questions/14780517/toggle-switch-in-qt
 */

#include <QAbstractButton>
#include <QBrush>
#include <QPropertyAnimation>
#include <QSize>
#include <QWidget>

class ToggleSwitch : public QAbstractButton
{
        Q_OBJECT
        Q_PROPERTY(int offset READ offset WRITE setOffset)
        Q_PROPERTY(QBrush brush READ brush WRITE setBrush)

    public:
        explicit ToggleSwitch(QWidget *parent = nullptr);
        explicit ToggleSwitch(const QString& thumbColor, const QString& trackColor, QWidget* parent = nullptr);

        QSize sizeHint() const override;
        QBrush brush() const {return _brush;}
        void setBrush(const QBrush& brush) {_brush = brush;}
        int offset() const {return _x;}
        void setOffset(int offset) {_x = offset; update();}

    signals:
        void switchedLeft(bool);

    protected:
        virtual void paintEvent(QPaintEvent*) override;
        virtual void mouseReleaseEvent(QMouseEvent*) override;
        virtual void enterEvent(QEvent*) override;

    private:
        bool _switchedLeft;
        qreal _opacity;
        int _x, _y, _height, _margin;
        QBrush _thumb, _track, _brush;
        QPropertyAnimation *_anim = nullptr;
};

#endif // TOGGLESWITCH_H

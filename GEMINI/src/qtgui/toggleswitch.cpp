#include "qtgui/toggleswitch.h"

#include <QColor>
#include <QMouseEvent>
#include <QPainter>

ToggleSwitch::ToggleSwitch(QWidget *parent) :
    QAbstractButton(parent),
    _switchedLeft(true),
    _opacity(0.000),
    _height(16),
    _margin(3),
    _thumb("#d5d5d5"),
    _anim(new QPropertyAnimation(this, "offset", this))
{
    setOffset(_height / 2);
    _y = _height / 2;
    setBrush(QColor("#009688"));
}

ToggleSwitch::ToggleSwitch(const QString &thumbColor, const QString &trackColor, QWidget *parent)
    : ToggleSwitch(parent)
{
    _brush = _thumb = QBrush(QColor(thumbColor));
    _track = QBrush(QColor(trackColor));
}

QSize ToggleSwitch::sizeHint() const
{
    return QSize(2 * (_height + _margin), _height + 2 * _margin);
}

void ToggleSwitch::paintEvent(QPaintEvent *)
{
    QPainter p(this);
    p.setPen(Qt::NoPen);
    if (isEnabled())
    {
        p.setBrush(_track);
        p.setOpacity(0.5);
        p.setRenderHint(QPainter::Antialiasing, true);
        p.drawRoundedRect(QRect(_margin, _margin, width() - 2 * _margin, height() - 2 * _margin), 8.0, 8.0);
        p.setBrush(_thumb);
        p.setOpacity(1.0);
        p.drawEllipse(QRectF(offset() - (_height / 2), _y - (_height / 2), height(), height()));
    }
    else
    {
        p.setBrush(Qt::black);
        p.setOpacity(0.12);
        p.drawRoundedRect(QRect(_margin, _margin, width() - 2 * _margin, height() - 2 * _margin), 8.0, 8.0);
        p.setOpacity(1.0);
        p.setBrush(QColor("#BDBDBD"));
        p.drawEllipse(QRectF(offset() - (_height / 2), _y - (_height / 2), height(), height()));
    }
}


void ToggleSwitch::mouseReleaseEvent(QMouseEvent *e)
{
    if (e->button() && Qt::LeftButton)
    {
        _thumb = brush();
        _anim->setDuration(120);
        if (_switchedLeft)
        {
            _anim->setStartValue(_height / 2);
            _anim->setEndValue(width() - _height);
        }
        else
        {
            _anim->setStartValue(offset());
            _anim->setEndValue(_height / 2);
        }
        _anim->start();
        emit switchedLeft(_switchedLeft);
        _switchedLeft  = !_switchedLeft;
    }
    QAbstractButton::mouseReleaseEvent(e);
}


void ToggleSwitch::enterEvent(QEvent *e)
{
    setCursor(Qt::PointingHandCursor);
    QAbstractButton::enterEvent(e);
}

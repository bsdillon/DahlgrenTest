/****************************************************************************
** Meta object code from reading C++ file 'testwindow.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../GEMINI/include/qtgui/testwindow.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'testwindow.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_TestWindow_t {
    QByteArrayData data[13];
    char stringdata0[208];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_TestWindow_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_TestWindow_t qt_meta_stringdata_TestWindow = {
    {
QT_MOC_LITERAL(0, 0, 10), // "TestWindow"
QT_MOC_LITERAL(1, 11, 14), // "MessagePassing"
QT_MOC_LITERAL(2, 26, 0), // ""
QT_MOC_LITERAL(3, 27, 8), // "Message*"
QT_MOC_LITERAL(4, 36, 13), // "ButtonClicked"
QT_MOC_LITERAL(5, 50, 17), // "stopButtonClicked"
QT_MOC_LITERAL(6, 68, 26), // "receiveExperimentRunStatus"
QT_MOC_LITERAL(7, 95, 6), // "status"
QT_MOC_LITERAL(8, 102, 22), // "stopPublishingMessages"
QT_MOC_LITERAL(9, 125, 17), // "experimentRunning"
QT_MOC_LITERAL(10, 143, 16), // "ReceiveNewTopics"
QT_MOC_LITERAL(11, 160, 37), // "std::map<std::string,Abstract..."
QT_MOC_LITERAL(12, 198, 9) // "factories"

    },
    "TestWindow\0MessagePassing\0\0Message*\0"
    "ButtonClicked\0stopButtonClicked\0"
    "receiveExperimentRunStatus\0status\0"
    "stopPublishingMessages\0experimentRunning\0"
    "ReceiveNewTopics\0std::map<std::string,AbstractDriver*>\0"
    "factories"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_TestWindow[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    2,   44,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       4,    0,   49,    2, 0x0a /* Public */,
       5,    0,   50,    2, 0x0a /* Public */,
       6,    1,   51,    2, 0x0a /* Public */,
       8,    1,   54,    2, 0x0a /* Public */,
      10,    1,   57,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::QString, 0x80000000 | 3,    2,    2,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Bool,    7,
    QMetaType::Void, QMetaType::Bool,    9,
    QMetaType::Void, 0x80000000 | 11,   12,

       0        // eod
};

void TestWindow::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<TestWindow *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->MessagePassing((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< Message*(*)>(_a[2]))); break;
        case 1: _t->ButtonClicked(); break;
        case 2: _t->stopButtonClicked(); break;
        case 3: _t->receiveExperimentRunStatus((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 4: _t->stopPublishingMessages((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 5: _t->ReceiveNewTopics((*reinterpret_cast< std::map<std::string,AbstractDriver*>(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (TestWindow::*)(QString , Message * );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TestWindow::MessagePassing)) {
                *result = 0;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject TestWindow::staticMetaObject = { {
    QMetaObject::SuperData::link<QMainWindow::staticMetaObject>(),
    qt_meta_stringdata_TestWindow.data,
    qt_meta_data_TestWindow,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *TestWindow::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *TestWindow::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_TestWindow.stringdata0))
        return static_cast<void*>(this);
    return QMainWindow::qt_metacast(_clname);
}

int TestWindow::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QMainWindow::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 6;
    }
    return _id;
}

// SIGNAL 0
void TestWindow::MessagePassing(QString _t1, Message * _t2)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))), const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t2))) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE

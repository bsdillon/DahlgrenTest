/****************************************************************************
** Meta object code from reading C++ file 'testwindowproxy.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../GEMINI/include/headless/testwindowproxy.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'testwindowproxy.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_TestWindowProxy_t {
    QByteArrayData data[11];
    char stringdata0[181];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_TestWindowProxy_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_TestWindowProxy_t qt_meta_stringdata_TestWindowProxy = {
    {
QT_MOC_LITERAL(0, 0, 15), // "TestWindowProxy"
QT_MOC_LITERAL(1, 16, 14), // "MessagePassing"
QT_MOC_LITERAL(2, 31, 0), // ""
QT_MOC_LITERAL(3, 32, 8), // "Message*"
QT_MOC_LITERAL(4, 41, 26), // "receiveExperimentRunStatus"
QT_MOC_LITERAL(5, 68, 6), // "status"
QT_MOC_LITERAL(6, 75, 22), // "stopPublishingMessages"
QT_MOC_LITERAL(7, 98, 17), // "experimentRunning"
QT_MOC_LITERAL(8, 116, 16), // "ReceiveNewTopics"
QT_MOC_LITERAL(9, 133, 37), // "std::map<std::string,Abstract..."
QT_MOC_LITERAL(10, 171, 9) // "factories"

    },
    "TestWindowProxy\0MessagePassing\0\0"
    "Message*\0receiveExperimentRunStatus\0"
    "status\0stopPublishingMessages\0"
    "experimentRunning\0ReceiveNewTopics\0"
    "std::map<std::string,AbstractDriver*>\0"
    "factories"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_TestWindowProxy[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    2,   34,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       4,    1,   39,    2, 0x0a /* Public */,
       6,    1,   42,    2, 0x0a /* Public */,
       8,    1,   45,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::QString, 0x80000000 | 3,    2,    2,

 // slots: parameters
    QMetaType::Void, QMetaType::Bool,    5,
    QMetaType::Void, QMetaType::Bool,    7,
    QMetaType::Void, 0x80000000 | 9,   10,

       0        // eod
};

void TestWindowProxy::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<TestWindowProxy *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->MessagePassing((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< Message*(*)>(_a[2]))); break;
        case 1: _t->receiveExperimentRunStatus((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 2: _t->stopPublishingMessages((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 3: _t->ReceiveNewTopics((*reinterpret_cast< std::map<std::string,AbstractDriver*>(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (TestWindowProxy::*)(QString , Message * );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TestWindowProxy::MessagePassing)) {
                *result = 0;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject TestWindowProxy::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_TestWindowProxy.data,
    qt_meta_data_TestWindowProxy,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *TestWindowProxy::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *TestWindowProxy::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_TestWindowProxy.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int TestWindowProxy::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 4)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 4)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 4;
    }
    return _id;
}

// SIGNAL 0
void TestWindowProxy::MessagePassing(QString _t1, Message * _t2)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))), const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t2))) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE

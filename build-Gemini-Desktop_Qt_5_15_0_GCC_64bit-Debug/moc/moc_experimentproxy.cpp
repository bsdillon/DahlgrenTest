/****************************************************************************
** Meta object code from reading C++ file 'experimentproxy.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../GEMINI/include/headless/experimentproxy.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'experimentproxy.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_ExperimentProxy_t {
    QByteArrayData data[16];
    char stringdata0[217];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_ExperimentProxy_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_ExperimentProxy_t qt_meta_stringdata_ExperimentProxy = {
    {
QT_MOC_LITERAL(0, 0, 15), // "ExperimentProxy"
QT_MOC_LITERAL(1, 16, 12), // "FileSelected"
QT_MOC_LITERAL(2, 29, 0), // ""
QT_MOC_LITERAL(3, 30, 7), // "StopAll"
QT_MOC_LITERAL(4, 38, 17), // "ExperimentRunning"
QT_MOC_LITERAL(5, 56, 14), // "ExperimentDone"
QT_MOC_LITERAL(6, 71, 19), // "FileNameTextChanged"
QT_MOC_LITERAL(7, 91, 13), // "TopicsUpdated"
QT_MOC_LITERAL(8, 105, 24), // "std::vector<std::string>"
QT_MOC_LITERAL(9, 130, 9), // "ClearData"
QT_MOC_LITERAL(10, 140, 15), // "LogEventClicked"
QT_MOC_LITERAL(11, 156, 12), // "inCleanState"
QT_MOC_LITERAL(12, 169, 12), // "UpdateStatus"
QT_MOC_LITERAL(13, 182, 11), // "std::string"
QT_MOC_LITERAL(14, 194, 14), // "sendingMessage"
QT_MOC_LITERAL(15, 209, 7) // "message"

    },
    "ExperimentProxy\0FileSelected\0\0StopAll\0"
    "ExperimentRunning\0ExperimentDone\0"
    "FileNameTextChanged\0TopicsUpdated\0"
    "std::vector<std::string>\0ClearData\0"
    "LogEventClicked\0inCleanState\0UpdateStatus\0"
    "std::string\0sendingMessage\0message"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ExperimentProxy[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      11,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
      11,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   69,    2, 0x06 /* Public */,
       3,    0,   72,    2, 0x06 /* Public */,
       4,    1,   73,    2, 0x06 /* Public */,
       5,    0,   76,    2, 0x06 /* Public */,
       6,    1,   77,    2, 0x06 /* Public */,
       7,    1,   80,    2, 0x06 /* Public */,
       9,    0,   83,    2, 0x06 /* Public */,
      10,    0,   84,    2, 0x06 /* Public */,
      11,    1,   85,    2, 0x06 /* Public */,
      12,    1,   88,    2, 0x06 /* Public */,
      14,    1,   91,    2, 0x06 /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::QString,    2,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Bool,    2,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    2,
    QMetaType::Void, 0x80000000 | 8,    2,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Bool,    2,
    QMetaType::Void, 0x80000000 | 13,    2,
    QMetaType::Void, QMetaType::QString,   15,

       0        // eod
};

void ExperimentProxy::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<ExperimentProxy *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->FileSelected((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 1: _t->StopAll(); break;
        case 2: _t->ExperimentRunning((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 3: _t->ExperimentDone(); break;
        case 4: _t->FileNameTextChanged((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 5: _t->TopicsUpdated((*reinterpret_cast< std::vector<std::string>(*)>(_a[1]))); break;
        case 6: _t->ClearData(); break;
        case 7: _t->LogEventClicked(); break;
        case 8: _t->inCleanState((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 9: _t->UpdateStatus((*reinterpret_cast< std::string(*)>(_a[1]))); break;
        case 10: _t->sendingMessage((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (ExperimentProxy::*)(QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentProxy::FileSelected)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (ExperimentProxy::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentProxy::StopAll)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (ExperimentProxy::*)(bool );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentProxy::ExperimentRunning)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (ExperimentProxy::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentProxy::ExperimentDone)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (ExperimentProxy::*)(QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentProxy::FileNameTextChanged)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (ExperimentProxy::*)(std::vector<std::string> );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentProxy::TopicsUpdated)) {
                *result = 5;
                return;
            }
        }
        {
            using _t = void (ExperimentProxy::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentProxy::ClearData)) {
                *result = 6;
                return;
            }
        }
        {
            using _t = void (ExperimentProxy::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentProxy::LogEventClicked)) {
                *result = 7;
                return;
            }
        }
        {
            using _t = void (ExperimentProxy::*)(bool );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentProxy::inCleanState)) {
                *result = 8;
                return;
            }
        }
        {
            using _t = void (ExperimentProxy::*)(std::string );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentProxy::UpdateStatus)) {
                *result = 9;
                return;
            }
        }
        {
            using _t = void (ExperimentProxy::*)(const QString & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentProxy::sendingMessage)) {
                *result = 10;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject ExperimentProxy::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_ExperimentProxy.data,
    qt_meta_data_ExperimentProxy,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *ExperimentProxy::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ExperimentProxy::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_ExperimentProxy.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int ExperimentProxy::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 11)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 11)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 11;
    }
    return _id;
}

// SIGNAL 0
void ExperimentProxy::FileSelected(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void ExperimentProxy::StopAll()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void ExperimentProxy::ExperimentRunning(bool _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void ExperimentProxy::ExperimentDone()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void ExperimentProxy::FileNameTextChanged(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void ExperimentProxy::TopicsUpdated(std::vector<std::string> _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}

// SIGNAL 6
void ExperimentProxy::ClearData()
{
    QMetaObject::activate(this, &staticMetaObject, 6, nullptr);
}

// SIGNAL 7
void ExperimentProxy::LogEventClicked()
{
    QMetaObject::activate(this, &staticMetaObject, 7, nullptr);
}

// SIGNAL 8
void ExperimentProxy::inCleanState(bool _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 8, _a);
}

// SIGNAL 9
void ExperimentProxy::UpdateStatus(std::string _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 9, _a);
}

// SIGNAL 10
void ExperimentProxy::sendingMessage(const QString & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 10, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE

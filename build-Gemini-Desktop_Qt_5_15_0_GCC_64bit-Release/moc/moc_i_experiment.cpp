/****************************************************************************
** Meta object code from reading C++ file 'i_experiment.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../GEMINI/include/uiinterface/i_experiment.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'i_experiment.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_I_Experiment_t {
    QByteArrayData data[20];
    char stringdata0[253];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_I_Experiment_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_I_Experiment_t qt_meta_stringdata_I_Experiment = {
    {
QT_MOC_LITERAL(0, 0, 12), // "I_Experiment"
QT_MOC_LITERAL(1, 13, 17), // "ExperimentRunning"
QT_MOC_LITERAL(2, 31, 0), // ""
QT_MOC_LITERAL(3, 32, 3), // "run"
QT_MOC_LITERAL(4, 36, 14), // "ExperimentDone"
QT_MOC_LITERAL(5, 51, 19), // "FileNameTextChanged"
QT_MOC_LITERAL(6, 71, 13), // "TopicsUpdated"
QT_MOC_LITERAL(7, 85, 24), // "std::vector<std::string>"
QT_MOC_LITERAL(8, 110, 9), // "ClearData"
QT_MOC_LITERAL(9, 120, 15), // "LogEventClicked"
QT_MOC_LITERAL(10, 136, 12), // "inCleanState"
QT_MOC_LITERAL(11, 149, 12), // "UpdateStatus"
QT_MOC_LITERAL(12, 162, 11), // "std::string"
QT_MOC_LITERAL(13, 174, 13), // "TopicsChanged"
QT_MOC_LITERAL(14, 188, 1), // "s"
QT_MOC_LITERAL(15, 190, 13), // "FinishPressed"
QT_MOC_LITERAL(16, 204, 21), // "ReceiveFileNameStatus"
QT_MOC_LITERAL(17, 226, 10), // "FileStatus"
QT_MOC_LITERAL(18, 237, 2), // "fs"
QT_MOC_LITERAL(19, 240, 12) // "DataReceived"

    },
    "I_Experiment\0ExperimentRunning\0\0run\0"
    "ExperimentDone\0FileNameTextChanged\0"
    "TopicsUpdated\0std::vector<std::string>\0"
    "ClearData\0LogEventClicked\0inCleanState\0"
    "UpdateStatus\0std::string\0TopicsChanged\0"
    "s\0FinishPressed\0ReceiveFileNameStatus\0"
    "FileStatus\0fs\0DataReceived"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_I_Experiment[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      12,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       8,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   74,    2, 0x06 /* Public */,
       4,    0,   77,    2, 0x06 /* Public */,
       5,    1,   78,    2, 0x06 /* Public */,
       6,    1,   81,    2, 0x06 /* Public */,
       8,    0,   84,    2, 0x06 /* Public */,
       9,    0,   85,    2, 0x06 /* Public */,
      10,    1,   86,    2, 0x06 /* Public */,
      11,    1,   89,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
      13,    1,   92,    2, 0x0a /* Public */,
      15,    0,   95,    2, 0x0a /* Public */,
      16,    1,   96,    2, 0x0a /* Public */,
      19,    0,   99,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::Bool,    3,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    2,
    QMetaType::Void, 0x80000000 | 7,    2,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Bool,    2,
    QMetaType::Void, 0x80000000 | 12,    2,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 7,   14,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 17,   18,
    QMetaType::Void,

       0        // eod
};

void I_Experiment::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<I_Experiment *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->ExperimentRunning((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 1: _t->ExperimentDone(); break;
        case 2: _t->FileNameTextChanged((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 3: _t->TopicsUpdated((*reinterpret_cast< std::vector<std::string>(*)>(_a[1]))); break;
        case 4: _t->ClearData(); break;
        case 5: _t->LogEventClicked(); break;
        case 6: _t->inCleanState((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 7: _t->UpdateStatus((*reinterpret_cast< std::string(*)>(_a[1]))); break;
        case 8: _t->TopicsChanged((*reinterpret_cast< std::vector<std::string>(*)>(_a[1]))); break;
        case 9: _t->FinishPressed(); break;
        case 10: _t->ReceiveFileNameStatus((*reinterpret_cast< FileStatus(*)>(_a[1]))); break;
        case 11: _t->DataReceived(); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 10:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< FileStatus >(); break;
            }
            break;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (I_Experiment::*)(bool );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&I_Experiment::ExperimentRunning)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (I_Experiment::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&I_Experiment::ExperimentDone)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (I_Experiment::*)(QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&I_Experiment::FileNameTextChanged)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (I_Experiment::*)(std::vector<std::string> );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&I_Experiment::TopicsUpdated)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (I_Experiment::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&I_Experiment::ClearData)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (I_Experiment::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&I_Experiment::LogEventClicked)) {
                *result = 5;
                return;
            }
        }
        {
            using _t = void (I_Experiment::*)(bool );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&I_Experiment::inCleanState)) {
                *result = 6;
                return;
            }
        }
        {
            using _t = void (I_Experiment::*)(std::string );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&I_Experiment::UpdateStatus)) {
                *result = 7;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject I_Experiment::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_I_Experiment.data,
    qt_meta_data_I_Experiment,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *I_Experiment::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *I_Experiment::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_I_Experiment.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int I_Experiment::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 12)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 12;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 12)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 12;
    }
    return _id;
}

// SIGNAL 0
void I_Experiment::ExperimentRunning(bool _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void I_Experiment::ExperimentDone()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void I_Experiment::FileNameTextChanged(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void I_Experiment::TopicsUpdated(std::vector<std::string> _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void I_Experiment::ClearData()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void I_Experiment::LogEventClicked()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}

// SIGNAL 6
void I_Experiment::inCleanState(bool _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 6, _a);
}

// SIGNAL 7
void I_Experiment::UpdateStatus(std::string _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 7, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE

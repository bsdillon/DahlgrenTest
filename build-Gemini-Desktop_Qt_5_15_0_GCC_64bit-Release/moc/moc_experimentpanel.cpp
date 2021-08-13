/****************************************************************************
** Meta object code from reading C++ file 'experimentpanel.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../GEMINI/include/qtgui/experimentpanel.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'experimentpanel.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_ExperimentPanel_t {
    QByteArrayData data[28];
    char stringdata0[379];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_ExperimentPanel_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_ExperimentPanel_t qt_meta_stringdata_ExperimentPanel = {
    {
QT_MOC_LITERAL(0, 0, 15), // "ExperimentPanel"
QT_MOC_LITERAL(1, 16, 12), // "FileSelected"
QT_MOC_LITERAL(2, 29, 0), // ""
QT_MOC_LITERAL(3, 30, 7), // "StopAll"
QT_MOC_LITERAL(4, 38, 17), // "ExperimentRunning"
QT_MOC_LITERAL(5, 56, 14), // "ExperimentDone"
QT_MOC_LITERAL(6, 71, 13), // "TopicsUpdated"
QT_MOC_LITERAL(7, 85, 24), // "std::vector<std::string>"
QT_MOC_LITERAL(8, 110, 9), // "ClearData"
QT_MOC_LITERAL(9, 120, 15), // "LogEventClicked"
QT_MOC_LITERAL(10, 136, 12), // "inCleanState"
QT_MOC_LITERAL(11, 149, 12), // "UpdateStatus"
QT_MOC_LITERAL(12, 162, 11), // "std::string"
QT_MOC_LITERAL(13, 174, 19), // "UpdateTopicsPressed"
QT_MOC_LITERAL(14, 194, 13), // "TopicsChanged"
QT_MOC_LITERAL(15, 208, 1), // "s"
QT_MOC_LITERAL(16, 210, 15), // "FinishedPressed"
QT_MOC_LITERAL(17, 226, 21), // "ReceiveFileNameStatus"
QT_MOC_LITERAL(18, 248, 10), // "FileStatus"
QT_MOC_LITERAL(19, 259, 2), // "fs"
QT_MOC_LITERAL(20, 262, 12), // "DataReceived"
QT_MOC_LITERAL(21, 275, 13), // "RecordPressed"
QT_MOC_LITERAL(22, 289, 12), // "PausePressed"
QT_MOC_LITERAL(23, 302, 11), // "StopPressed"
QT_MOC_LITERAL(24, 314, 12), // "ErrorPressed"
QT_MOC_LITERAL(25, 327, 16), // "ClearDataPressed"
QT_MOC_LITERAL(26, 344, 22), // "on_errorButton_clicked"
QT_MOC_LITERAL(27, 367, 11) // "TestMessage"

    },
    "ExperimentPanel\0FileSelected\0\0StopAll\0"
    "ExperimentRunning\0ExperimentDone\0"
    "TopicsUpdated\0std::vector<std::string>\0"
    "ClearData\0LogEventClicked\0inCleanState\0"
    "UpdateStatus\0std::string\0UpdateTopicsPressed\0"
    "TopicsChanged\0s\0FinishedPressed\0"
    "ReceiveFileNameStatus\0FileStatus\0fs\0"
    "DataReceived\0RecordPressed\0PausePressed\0"
    "StopPressed\0ErrorPressed\0ClearDataPressed\0"
    "on_errorButton_clicked\0TestMessage"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ExperimentPanel[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      21,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       9,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,  119,    2, 0x06 /* Public */,
       3,    0,  122,    2, 0x06 /* Public */,
       4,    1,  123,    2, 0x06 /* Public */,
       5,    0,  126,    2, 0x06 /* Public */,
       6,    1,  127,    2, 0x06 /* Public */,
       8,    0,  130,    2, 0x06 /* Public */,
       9,    0,  131,    2, 0x06 /* Public */,
      10,    1,  132,    2, 0x06 /* Public */,
      11,    1,  135,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
      13,    0,  138,    2, 0x0a /* Public */,
      14,    1,  139,    2, 0x0a /* Public */,
      16,    0,  142,    2, 0x0a /* Public */,
      17,    1,  143,    2, 0x0a /* Public */,
      20,    0,  146,    2, 0x0a /* Public */,
      21,    0,  147,    2, 0x08 /* Private */,
      22,    0,  148,    2, 0x08 /* Private */,
      23,    0,  149,    2, 0x08 /* Private */,
      24,    0,  150,    2, 0x08 /* Private */,
      25,    0,  151,    2, 0x08 /* Private */,
      26,    0,  152,    2, 0x08 /* Private */,
      27,    0,  153,    2, 0x08 /* Private */,

 // signals: parameters
    QMetaType::Void, QMetaType::QString,    2,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Bool,    2,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 7,    2,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Bool,    2,
    QMetaType::Void, 0x80000000 | 12,    2,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 7,   15,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 18,   19,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void ExperimentPanel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<ExperimentPanel *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->FileSelected((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 1: _t->StopAll(); break;
        case 2: _t->ExperimentRunning((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 3: _t->ExperimentDone(); break;
        case 4: _t->TopicsUpdated((*reinterpret_cast< std::vector<std::string>(*)>(_a[1]))); break;
        case 5: _t->ClearData(); break;
        case 6: _t->LogEventClicked(); break;
        case 7: _t->inCleanState((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 8: _t->UpdateStatus((*reinterpret_cast< std::string(*)>(_a[1]))); break;
        case 9: _t->UpdateTopicsPressed(); break;
        case 10: _t->TopicsChanged((*reinterpret_cast< std::vector<std::string>(*)>(_a[1]))); break;
        case 11: _t->FinishedPressed(); break;
        case 12: _t->ReceiveFileNameStatus((*reinterpret_cast< FileStatus(*)>(_a[1]))); break;
        case 13: _t->DataReceived(); break;
        case 14: _t->RecordPressed(); break;
        case 15: _t->PausePressed(); break;
        case 16: _t->StopPressed(); break;
        case 17: _t->ErrorPressed(); break;
        case 18: _t->ClearDataPressed(); break;
        case 19: _t->on_errorButton_clicked(); break;
        case 20: _t->TestMessage(); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 12:
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
            using _t = void (ExperimentPanel::*)(QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentPanel::FileSelected)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (ExperimentPanel::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentPanel::StopAll)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (ExperimentPanel::*)(bool );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentPanel::ExperimentRunning)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (ExperimentPanel::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentPanel::ExperimentDone)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (ExperimentPanel::*)(std::vector<std::string> );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentPanel::TopicsUpdated)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (ExperimentPanel::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentPanel::ClearData)) {
                *result = 5;
                return;
            }
        }
        {
            using _t = void (ExperimentPanel::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentPanel::LogEventClicked)) {
                *result = 6;
                return;
            }
        }
        {
            using _t = void (ExperimentPanel::*)(bool );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentPanel::inCleanState)) {
                *result = 7;
                return;
            }
        }
        {
            using _t = void (ExperimentPanel::*)(std::string );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentPanel::UpdateStatus)) {
                *result = 8;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject ExperimentPanel::staticMetaObject = { {
    QMetaObject::SuperData::link<QWidget::staticMetaObject>(),
    qt_meta_stringdata_ExperimentPanel.data,
    qt_meta_data_ExperimentPanel,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *ExperimentPanel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ExperimentPanel::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_ExperimentPanel.stringdata0))
        return static_cast<void*>(this);
    return QWidget::qt_metacast(_clname);
}

int ExperimentPanel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QWidget::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 21)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 21;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 21)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 21;
    }
    return _id;
}

// SIGNAL 0
void ExperimentPanel::FileSelected(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void ExperimentPanel::StopAll()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void ExperimentPanel::ExperimentRunning(bool _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void ExperimentPanel::ExperimentDone()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void ExperimentPanel::TopicsUpdated(std::vector<std::string> _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void ExperimentPanel::ClearData()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}

// SIGNAL 6
void ExperimentPanel::LogEventClicked()
{
    QMetaObject::activate(this, &staticMetaObject, 6, nullptr);
}

// SIGNAL 7
void ExperimentPanel::inCleanState(bool _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 7, _a);
}

// SIGNAL 8
void ExperimentPanel::UpdateStatus(std::string _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 8, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE

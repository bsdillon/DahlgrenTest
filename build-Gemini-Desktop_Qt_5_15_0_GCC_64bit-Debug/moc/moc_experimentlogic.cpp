/****************************************************************************
** Meta object code from reading C++ file 'experimentlogic.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../GEMINI/include/experimentlogic.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'experimentlogic.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_ExperimentLogic_t {
    QByteArrayData data[10];
    char stringdata0[135];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_ExperimentLogic_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_ExperimentLogic_t qt_meta_stringdata_ExperimentLogic = {
    {
QT_MOC_LITERAL(0, 0, 15), // "ExperimentLogic"
QT_MOC_LITERAL(1, 16, 17), // "ExperimentRunning"
QT_MOC_LITERAL(2, 34, 0), // ""
QT_MOC_LITERAL(3, 35, 14), // "ExperimentDone"
QT_MOC_LITERAL(4, 50, 12), // "inCleanState"
QT_MOC_LITERAL(5, 63, 14), // "disableButtons"
QT_MOC_LITERAL(6, 78, 13), // "enableButtons"
QT_MOC_LITERAL(7, 92, 11), // "disableText"
QT_MOC_LITERAL(8, 104, 10), // "enableText"
QT_MOC_LITERAL(9, 115, 19) // "setStatusOutputText"

    },
    "ExperimentLogic\0ExperimentRunning\0\0"
    "ExperimentDone\0inCleanState\0disableButtons\0"
    "enableButtons\0disableText\0enableText\0"
    "setStatusOutputText"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ExperimentLogic[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       8,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   54,    2, 0x06 /* Public */,
       3,    0,   57,    2, 0x06 /* Public */,
       4,    1,   58,    2, 0x06 /* Public */,
       5,    1,   61,    2, 0x06 /* Public */,
       6,    1,   64,    2, 0x06 /* Public */,
       7,    1,   67,    2, 0x06 /* Public */,
       8,    1,   70,    2, 0x06 /* Public */,
       9,    1,   73,    2, 0x06 /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::Bool,    2,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Bool,    2,
    QMetaType::Void, QMetaType::QString,    2,
    QMetaType::Void, QMetaType::QString,    2,
    QMetaType::Void, QMetaType::QString,    2,
    QMetaType::Void, QMetaType::QString,    2,
    QMetaType::Void, QMetaType::QString,    2,

       0        // eod
};

void ExperimentLogic::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<ExperimentLogic *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->ExperimentRunning((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 1: _t->ExperimentDone(); break;
        case 2: _t->inCleanState((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 3: _t->disableButtons((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 4: _t->enableButtons((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 5: _t->disableText((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 6: _t->enableText((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 7: _t->setStatusOutputText((*reinterpret_cast< QString(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (ExperimentLogic::*)(bool );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentLogic::ExperimentRunning)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (ExperimentLogic::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentLogic::ExperimentDone)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (ExperimentLogic::*)(bool );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentLogic::inCleanState)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (ExperimentLogic::*)(QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentLogic::disableButtons)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (ExperimentLogic::*)(QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentLogic::enableButtons)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (ExperimentLogic::*)(QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentLogic::disableText)) {
                *result = 5;
                return;
            }
        }
        {
            using _t = void (ExperimentLogic::*)(QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentLogic::enableText)) {
                *result = 6;
                return;
            }
        }
        {
            using _t = void (ExperimentLogic::*)(QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ExperimentLogic::setStatusOutputText)) {
                *result = 7;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject ExperimentLogic::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_ExperimentLogic.data,
    qt_meta_data_ExperimentLogic,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *ExperimentLogic::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ExperimentLogic::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_ExperimentLogic.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int ExperimentLogic::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 8)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 8;
    }
    return _id;
}

// SIGNAL 0
void ExperimentLogic::ExperimentRunning(bool _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void ExperimentLogic::ExperimentDone()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void ExperimentLogic::inCleanState(bool _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void ExperimentLogic::disableButtons(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void ExperimentLogic::enableButtons(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void ExperimentLogic::disableText(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}

// SIGNAL 6
void ExperimentLogic::enableText(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 6, _a);
}

// SIGNAL 7
void ExperimentLogic::setStatusOutputText(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 7, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE

/****************************************************************************
** Meta object code from reading C++ file 'i_countpanel.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../GEMINI/include/uiinterface/i_countpanel.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'i_countpanel.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_I_CountPanel_t {
    QByteArrayData data[11];
    char stringdata0[154];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_I_CountPanel_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_I_CountPanel_t qt_meta_stringdata_I_CountPanel = {
    {
QT_MOC_LITERAL(0, 0, 12), // "I_CountPanel"
QT_MOC_LITERAL(1, 13, 18), // "toggleSubscription"
QT_MOC_LITERAL(2, 32, 0), // ""
QT_MOC_LITERAL(3, 33, 5), // "topic"
QT_MOC_LITERAL(4, 39, 6), // "enable"
QT_MOC_LITERAL(5, 46, 12), // "UpdateStatus"
QT_MOC_LITERAL(6, 59, 11), // "std::string"
QT_MOC_LITERAL(7, 71, 17), // "experimentRunning"
QT_MOC_LITERAL(8, 89, 16), // "ReceiveNewTopics"
QT_MOC_LITERAL(9, 106, 37), // "std::map<std::string,Abstract..."
QT_MOC_LITERAL(10, 144, 9) // "factories"

    },
    "I_CountPanel\0toggleSubscription\0\0topic\0"
    "enable\0UpdateStatus\0std::string\0"
    "experimentRunning\0ReceiveNewTopics\0"
    "std::map<std::string,AbstractDriver*>\0"
    "factories"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_I_CountPanel[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       3,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    2,   34,    2, 0x06 /* Public */,
       5,    1,   39,    2, 0x06 /* Public */,
       7,    1,   42,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       8,    1,   45,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::QString, QMetaType::Bool,    3,    4,
    QMetaType::Void, 0x80000000 | 6,    2,
    QMetaType::Void, QMetaType::Bool,    2,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 9,   10,

       0        // eod
};

void I_CountPanel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<I_CountPanel *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->toggleSubscription((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2]))); break;
        case 1: _t->UpdateStatus((*reinterpret_cast< std::string(*)>(_a[1]))); break;
        case 2: _t->experimentRunning((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 3: _t->ReceiveNewTopics((*reinterpret_cast< std::map<std::string,AbstractDriver*>(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (I_CountPanel::*)(QString , bool );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&I_CountPanel::toggleSubscription)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (I_CountPanel::*)(std::string );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&I_CountPanel::UpdateStatus)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (I_CountPanel::*)(bool );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&I_CountPanel::experimentRunning)) {
                *result = 2;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject I_CountPanel::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_I_CountPanel.data,
    qt_meta_data_I_CountPanel,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *I_CountPanel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *I_CountPanel::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_I_CountPanel.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int I_CountPanel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
void I_CountPanel::toggleSubscription(QString _t1, bool _t2)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))), const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t2))) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void I_CountPanel::UpdateStatus(std::string _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void I_CountPanel::experimentRunning(bool _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE

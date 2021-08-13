/****************************************************************************
** Meta object code from reading C++ file 'i_topicpanel.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../GEMINI/include/uiinterface/i_topicpanel.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'i_topicpanel.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_I_TopicPanel_t {
    QByteArrayData data[9];
    char stringdata0[122];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_I_TopicPanel_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_I_TopicPanel_t qt_meta_stringdata_I_TopicPanel = {
    {
QT_MOC_LITERAL(0, 0, 12), // "I_TopicPanel"
QT_MOC_LITERAL(1, 13, 12), // "UpdateStatus"
QT_MOC_LITERAL(2, 26, 0), // ""
QT_MOC_LITERAL(3, 27, 11), // "std::string"
QT_MOC_LITERAL(4, 39, 21), // "TopicSelectionChanged"
QT_MOC_LITERAL(5, 61, 24), // "std::vector<std::string>"
QT_MOC_LITERAL(6, 86, 15), // "selectTopicList"
QT_MOC_LITERAL(7, 102, 6), // "topics"
QT_MOC_LITERAL(8, 109, 12) // "readSettings"

    },
    "I_TopicPanel\0UpdateStatus\0\0std::string\0"
    "TopicSelectionChanged\0std::vector<std::string>\0"
    "selectTopicList\0topics\0readSettings"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_I_TopicPanel[] = {

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
       1,    1,   34,    2, 0x06 /* Public */,
       4,    1,   37,    2, 0x06 /* Public */,
       6,    1,   40,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       8,    0,   43,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void, 0x80000000 | 3,    2,
    QMetaType::Void, 0x80000000 | 5,    2,
    QMetaType::Void, QMetaType::QStringList,    7,

 // slots: parameters
    QMetaType::Void,

       0        // eod
};

void I_TopicPanel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<I_TopicPanel *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->UpdateStatus((*reinterpret_cast< std::string(*)>(_a[1]))); break;
        case 1: _t->TopicSelectionChanged((*reinterpret_cast< std::vector<std::string>(*)>(_a[1]))); break;
        case 2: _t->selectTopicList((*reinterpret_cast< const QStringList(*)>(_a[1]))); break;
        case 3: _t->readSettings(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (I_TopicPanel::*)(std::string );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&I_TopicPanel::UpdateStatus)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (I_TopicPanel::*)(std::vector<std::string> );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&I_TopicPanel::TopicSelectionChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (I_TopicPanel::*)(const QStringList & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&I_TopicPanel::selectTopicList)) {
                *result = 2;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject I_TopicPanel::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_I_TopicPanel.data,
    qt_meta_data_I_TopicPanel,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *I_TopicPanel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *I_TopicPanel::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_I_TopicPanel.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int I_TopicPanel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
void I_TopicPanel::UpdateStatus(std::string _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void I_TopicPanel::TopicSelectionChanged(std::vector<std::string> _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void I_TopicPanel::selectTopicList(const QStringList & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE

/****************************************************************************
** Meta object code from reading C++ file 'topicselectorproxy.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../GEMINI/include/headless/topicselectorproxy.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'topicselectorproxy.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_TopicSelectorProxy_t {
    QByteArrayData data[17];
    char stringdata0[238];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_TopicSelectorProxy_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_TopicSelectorProxy_t qt_meta_stringdata_TopicSelectorProxy = {
    {
QT_MOC_LITERAL(0, 0, 18), // "TopicSelectorProxy"
QT_MOC_LITERAL(1, 19, 12), // "UpdateStatus"
QT_MOC_LITERAL(2, 32, 0), // ""
QT_MOC_LITERAL(3, 33, 11), // "std::string"
QT_MOC_LITERAL(4, 45, 21), // "TopicSelectionChanged"
QT_MOC_LITERAL(5, 67, 24), // "std::vector<std::string>"
QT_MOC_LITERAL(6, 92, 14), // "sendingMessage"
QT_MOC_LITERAL(7, 107, 7), // "message"
QT_MOC_LITERAL(8, 115, 15), // "selectTopicList"
QT_MOC_LITERAL(9, 131, 11), // "savedTopics"
QT_MOC_LITERAL(10, 143, 9), // "onMessage"
QT_MOC_LITERAL(11, 153, 13), // "displayTopics"
QT_MOC_LITERAL(12, 167, 22), // "requestSavedTopicLists"
QT_MOC_LITERAL(13, 190, 12), // "loadSaveFile"
QT_MOC_LITERAL(14, 203, 8), // "fileName"
QT_MOC_LITERAL(15, 212, 13), // "saveTopicFile"
QT_MOC_LITERAL(16, 226, 11) // "information"

    },
    "TopicSelectorProxy\0UpdateStatus\0\0"
    "std::string\0TopicSelectionChanged\0"
    "std::vector<std::string>\0sendingMessage\0"
    "message\0selectTopicList\0savedTopics\0"
    "onMessage\0displayTopics\0requestSavedTopicLists\0"
    "loadSaveFile\0fileName\0saveTopicFile\0"
    "information"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_TopicSelectorProxy[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       4,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   59,    2, 0x06 /* Public */,
       4,    1,   62,    2, 0x06 /* Public */,
       6,    1,   65,    2, 0x06 /* Public */,
       8,    1,   68,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
      10,    0,   71,    2, 0x0a /* Public */,
      11,    0,   72,    2, 0x0a /* Public */,
      12,    0,   73,    2, 0x0a /* Public */,
      13,    1,   74,    2, 0x0a /* Public */,
      15,    1,   77,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void, 0x80000000 | 3,    2,
    QMetaType::Void, 0x80000000 | 5,    2,
    QMetaType::Void, QMetaType::QString,    7,
    QMetaType::Void, QMetaType::QStringList,    9,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,   14,
    QMetaType::Void, QMetaType::QString,   16,

       0        // eod
};

void TopicSelectorProxy::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<TopicSelectorProxy *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->UpdateStatus((*reinterpret_cast< std::string(*)>(_a[1]))); break;
        case 1: _t->TopicSelectionChanged((*reinterpret_cast< std::vector<std::string>(*)>(_a[1]))); break;
        case 2: _t->sendingMessage((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 3: _t->selectTopicList((*reinterpret_cast< const QStringList(*)>(_a[1]))); break;
        case 4: _t->onMessage(); break;
        case 5: _t->displayTopics(); break;
        case 6: _t->requestSavedTopicLists(); break;
        case 7: _t->loadSaveFile((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 8: _t->saveTopicFile((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (TopicSelectorProxy::*)(std::string );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TopicSelectorProxy::UpdateStatus)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (TopicSelectorProxy::*)(std::vector<std::string> );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TopicSelectorProxy::TopicSelectionChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (TopicSelectorProxy::*)(const QString & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TopicSelectorProxy::sendingMessage)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (TopicSelectorProxy::*)(const QStringList );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TopicSelectorProxy::selectTopicList)) {
                *result = 3;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject TopicSelectorProxy::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_TopicSelectorProxy.data,
    qt_meta_data_TopicSelectorProxy,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *TopicSelectorProxy::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *TopicSelectorProxy::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_TopicSelectorProxy.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int TopicSelectorProxy::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 9)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 9;
    }
    return _id;
}

// SIGNAL 0
void TopicSelectorProxy::UpdateStatus(std::string _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void TopicSelectorProxy::TopicSelectionChanged(std::vector<std::string> _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void TopicSelectorProxy::sendingMessage(const QString & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void TopicSelectorProxy::selectTopicList(const QStringList _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE

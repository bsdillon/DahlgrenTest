/****************************************************************************
** Meta object code from reading C++ file 'subscriptionmanager.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../GEMINI/include/subscriptionmanager.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'subscriptionmanager.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_SubscriptionManager_t {
    QByteArrayData data[20];
    char stringdata0[272];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_SubscriptionManager_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_SubscriptionManager_t qt_meta_stringdata_SubscriptionManager = {
    {
QT_MOC_LITERAL(0, 0, 19), // "SubscriptionManager"
QT_MOC_LITERAL(1, 20, 12), // "UpdateStatus"
QT_MOC_LITERAL(2, 33, 0), // ""
QT_MOC_LITERAL(3, 34, 11), // "std::string"
QT_MOC_LITERAL(4, 46, 21), // "TopicFactoriesCreated"
QT_MOC_LITERAL(5, 68, 37), // "std::map<std::string,Abstract..."
QT_MOC_LITERAL(6, 106, 9), // "ClearData"
QT_MOC_LITERAL(7, 116, 12), // "DataReceived"
QT_MOC_LITERAL(8, 129, 12), // "loadDataFrom"
QT_MOC_LITERAL(9, 142, 8), // "fileName"
QT_MOC_LITERAL(10, 151, 16), // "receiveTopicList"
QT_MOC_LITERAL(11, 168, 24), // "std::vector<std::string>"
QT_MOC_LITERAL(12, 193, 6), // "topics"
QT_MOC_LITERAL(13, 200, 18), // "toggleSubscription"
QT_MOC_LITERAL(14, 219, 6), // "enable"
QT_MOC_LITERAL(15, 226, 3), // "run"
QT_MOC_LITERAL(16, 230, 18), // "testMessageInDebug"
QT_MOC_LITERAL(17, 249, 5), // "topic"
QT_MOC_LITERAL(18, 255, 8), // "Message*"
QT_MOC_LITERAL(19, 264, 7) // "message"

    },
    "SubscriptionManager\0UpdateStatus\0\0"
    "std::string\0TopicFactoriesCreated\0"
    "std::map<std::string,AbstractDriver*>\0"
    "ClearData\0DataReceived\0loadDataFrom\0"
    "fileName\0receiveTopicList\0"
    "std::vector<std::string>\0topics\0"
    "toggleSubscription\0enable\0run\0"
    "testMessageInDebug\0topic\0Message*\0"
    "message"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_SubscriptionManager[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       5,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   59,    2, 0x06 /* Public */,
       4,    1,   62,    2, 0x06 /* Public */,
       6,    0,   65,    2, 0x06 /* Public */,
       7,    0,   66,    2, 0x06 /* Public */,
       8,    1,   67,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
      10,    1,   70,    2, 0x0a /* Public */,
      13,    2,   73,    2, 0x0a /* Public */,
      15,    0,   78,    2, 0x0a /* Public */,
      16,    2,   79,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void, 0x80000000 | 3,    2,
    QMetaType::Void, 0x80000000 | 5,    2,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    9,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 11,   12,
    QMetaType::Void, QMetaType::QString, QMetaType::Bool,    2,   14,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString, 0x80000000 | 18,   17,   19,

       0        // eod
};

void SubscriptionManager::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<SubscriptionManager *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->UpdateStatus((*reinterpret_cast< std::string(*)>(_a[1]))); break;
        case 1: _t->TopicFactoriesCreated((*reinterpret_cast< std::map<std::string,AbstractDriver*>(*)>(_a[1]))); break;
        case 2: _t->ClearData(); break;
        case 3: _t->DataReceived(); break;
        case 4: _t->loadDataFrom((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 5: _t->receiveTopicList((*reinterpret_cast< std::vector<std::string>(*)>(_a[1]))); break;
        case 6: _t->toggleSubscription((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2]))); break;
        case 7: _t->run(); break;
        case 8: _t->testMessageInDebug((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< Message*(*)>(_a[2]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (SubscriptionManager::*)(std::string );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&SubscriptionManager::UpdateStatus)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (SubscriptionManager::*)(std::map<std::string,AbstractDriver*> );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&SubscriptionManager::TopicFactoriesCreated)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (SubscriptionManager::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&SubscriptionManager::ClearData)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (SubscriptionManager::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&SubscriptionManager::DataReceived)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (SubscriptionManager::*)(QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&SubscriptionManager::loadDataFrom)) {
                *result = 4;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject SubscriptionManager::staticMetaObject = { {
    QMetaObject::SuperData::link<ThreadWorker::staticMetaObject>(),
    qt_meta_stringdata_SubscriptionManager.data,
    qt_meta_data_SubscriptionManager,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *SubscriptionManager::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *SubscriptionManager::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_SubscriptionManager.stringdata0))
        return static_cast<void*>(this);
    return ThreadWorker::qt_metacast(_clname);
}

int SubscriptionManager::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = ThreadWorker::qt_metacall(_c, _id, _a);
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
void SubscriptionManager::UpdateStatus(std::string _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void SubscriptionManager::TopicFactoriesCreated(std::map<std::string,AbstractDriver*> _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void SubscriptionManager::ClearData()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void SubscriptionManager::DataReceived()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void SubscriptionManager::loadDataFrom(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE

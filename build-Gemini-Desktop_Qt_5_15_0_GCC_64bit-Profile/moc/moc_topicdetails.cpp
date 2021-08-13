/****************************************************************************
** Meta object code from reading C++ file 'topicdetails.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../GEMINI/include/qtgui/topicdetails.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'topicdetails.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_TopicDetails_t {
    QByteArrayData data[14];
    char stringdata0[181];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_TopicDetails_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_TopicDetails_t qt_meta_stringdata_TopicDetails = {
    {
QT_MOC_LITERAL(0, 0, 12), // "TopicDetails"
QT_MOC_LITERAL(1, 13, 12), // "UpdateStatus"
QT_MOC_LITERAL(2, 26, 0), // ""
QT_MOC_LITERAL(3, 27, 11), // "std::string"
QT_MOC_LITERAL(4, 39, 7), // "Message"
QT_MOC_LITERAL(5, 47, 10), // "PLAMessage"
QT_MOC_LITERAL(6, 58, 1), // "m"
QT_MOC_LITERAL(7, 60, 3), // "Log"
QT_MOC_LITERAL(8, 64, 10), // "logMessage"
QT_MOC_LITERAL(9, 75, 13), // "ClearMessages"
QT_MOC_LITERAL(10, 89, 18), // "expandAllSummaries"
QT_MOC_LITERAL(11, 108, 20), // "collapseAllSummaries"
QT_MOC_LITERAL(12, 129, 24), // "expandAllMessageContents"
QT_MOC_LITERAL(13, 154, 26) // "collapseAllMessageContents"

    },
    "TopicDetails\0UpdateStatus\0\0std::string\0"
    "Message\0PLAMessage\0m\0Log\0logMessage\0"
    "ClearMessages\0expandAllSummaries\0"
    "collapseAllSummaries\0expandAllMessageContents\0"
    "collapseAllMessageContents"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_TopicDetails[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   54,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       4,    1,   57,    2, 0x0a /* Public */,
       7,    1,   60,    2, 0x0a /* Public */,
       9,    0,   63,    2, 0x0a /* Public */,
      10,    0,   64,    2, 0x08 /* Private */,
      11,    0,   65,    2, 0x08 /* Private */,
      12,    0,   66,    2, 0x08 /* Private */,
      13,    0,   67,    2, 0x08 /* Private */,

 // signals: parameters
    QMetaType::Void, 0x80000000 | 3,    2,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 5,    6,
    QMetaType::Void, QMetaType::QString,    8,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void TopicDetails::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<TopicDetails *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->UpdateStatus((*reinterpret_cast< std::string(*)>(_a[1]))); break;
        case 1: _t->Message((*reinterpret_cast< const PLAMessage(*)>(_a[1]))); break;
        case 2: _t->Log((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 3: _t->ClearMessages(); break;
        case 4: _t->expandAllSummaries(); break;
        case 5: _t->collapseAllSummaries(); break;
        case 6: _t->expandAllMessageContents(); break;
        case 7: _t->collapseAllMessageContents(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (TopicDetails::*)(std::string );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TopicDetails::UpdateStatus)) {
                *result = 0;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject TopicDetails::staticMetaObject = { {
    QMetaObject::SuperData::link<QWidget::staticMetaObject>(),
    qt_meta_stringdata_TopicDetails.data,
    qt_meta_data_TopicDetails,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *TopicDetails::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *TopicDetails::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_TopicDetails.stringdata0))
        return static_cast<void*>(this);
    return QWidget::qt_metacast(_clname);
}

int TopicDetails::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QWidget::qt_metacall(_c, _id, _a);
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
void TopicDetails::UpdateStatus(std::string _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE

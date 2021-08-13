/****************************************************************************
** Meta object code from reading C++ file 'filequeue.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../GEMINI/include/filequeue.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'filequeue.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_FileQueue_t {
    QByteArrayData data[15];
    char stringdata0[136];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_FileQueue_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_FileQueue_t qt_meta_stringdata_FileQueue = {
    {
QT_MOC_LITERAL(0, 0, 9), // "FileQueue"
QT_MOC_LITERAL(1, 10, 10), // "FileClosed"
QT_MOC_LITERAL(2, 21, 0), // ""
QT_MOC_LITERAL(3, 22, 15), // "FileNameChecked"
QT_MOC_LITERAL(4, 38, 10), // "FileStatus"
QT_MOC_LITERAL(5, 49, 15), // "ReceiveFileName"
QT_MOC_LITERAL(6, 65, 11), // "AcceptInput"
QT_MOC_LITERAL(7, 77, 7), // "EndFile"
QT_MOC_LITERAL(8, 85, 3), // "run"
QT_MOC_LITERAL(9, 89, 7), // "Message"
QT_MOC_LITERAL(10, 97, 10), // "PLAMessage"
QT_MOC_LITERAL(11, 108, 1), // "m"
QT_MOC_LITERAL(12, 110, 3), // "Log"
QT_MOC_LITERAL(13, 114, 10), // "logMessage"
QT_MOC_LITERAL(14, 125, 10) // "setEnabled"

    },
    "FileQueue\0FileClosed\0\0FileNameChecked\0"
    "FileStatus\0ReceiveFileName\0AcceptInput\0"
    "EndFile\0run\0Message\0PLAMessage\0m\0Log\0"
    "logMessage\0setEnabled"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_FileQueue[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   59,    2, 0x06 /* Public */,
       3,    1,   60,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       5,    1,   63,    2, 0x0a /* Public */,
       6,    1,   66,    2, 0x0a /* Public */,
       7,    0,   69,    2, 0x0a /* Public */,
       8,    0,   70,    2, 0x0a /* Public */,
       9,    1,   71,    2, 0x0a /* Public */,
      12,    1,   74,    2, 0x0a /* Public */,
      14,    1,   77,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 4,    2,

 // slots: parameters
    QMetaType::Void, QMetaType::QString,    2,
    QMetaType::Void, QMetaType::Bool,    2,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 10,   11,
    QMetaType::Void, QMetaType::QString,   13,
    QMetaType::Void, QMetaType::Bool,    2,

       0        // eod
};

void FileQueue::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<FileQueue *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->FileClosed(); break;
        case 1: _t->FileNameChecked((*reinterpret_cast< FileStatus(*)>(_a[1]))); break;
        case 2: _t->ReceiveFileName((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 3: _t->AcceptInput((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 4: _t->EndFile(); break;
        case 5: _t->run(); break;
        case 6: _t->Message((*reinterpret_cast< const PLAMessage(*)>(_a[1]))); break;
        case 7: _t->Log((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 8: _t->setEnabled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 1:
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
            using _t = void (FileQueue::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&FileQueue::FileClosed)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (FileQueue::*)(FileStatus );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&FileQueue::FileNameChecked)) {
                *result = 1;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject FileQueue::staticMetaObject = { {
    QMetaObject::SuperData::link<ThreadWorker::staticMetaObject>(),
    qt_meta_stringdata_FileQueue.data,
    qt_meta_data_FileQueue,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *FileQueue::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *FileQueue::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_FileQueue.stringdata0))
        return static_cast<void*>(this);
    return ThreadWorker::qt_metacast(_clname);
}

int FileQueue::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    }
    return _id;
}

// SIGNAL 0
void FileQueue::FileClosed()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void FileQueue::FileNameChecked(FileStatus _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE

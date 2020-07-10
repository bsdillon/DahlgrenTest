#include "binaryfilehandler.h"

#include <QMap>

binaryFileHandler::binaryFileHandler()
    : _mode(UNDEFINED)
{

}

binaryFileHandler::~binaryFileHandler()
{
    if (_file.isOpen())
    {
        closeFile();
    }
}

binaryFileHandler::binaryFileHandler(QString fileName, FileMode mode)
    : _mode(mode)
{
    openFile(fileName);
}

void binaryFileHandler::openFile(QString fileName)
{
    _file.setFileName(fileName);
    switch (_mode)
    {
        case READ:
            _file.open(QFile::ReadOnly);
            break;
        case WRITE:
            _file.open(QFile::WriteOnly);
            break;
        case UNDEFINED:
        default:
            throw std::logic_error("binaryFileHandler attempted to open a file before its mode was set");
            break;
    }
    _stream.setDevice(&_file);
    _stream.setVersion(QDataStream::Qt_5_5);
}

void binaryFileHandler::setFileMode(FileMode mode)
{
    _mode = mode;
}

void binaryFileHandler::closeFile()
{
    _file.close();
}

void binaryFileHandler::write(const PLAMessage &message)
{
    if (_mode != WRITE || _file.openMode() != QIODevice::WriteOnly)
    {
        throw std::logic_error("binaryFileHandler attempted to write, but is not configured as a writer");
    }
    _stream << message.topic;
    _stream << (qint64)message.time;
    _stream << (quint32)message.msg.size();
    for (const auto& field : message.msg)
    {
        writeField(field);
    }
}

std::unique_ptr<PLAMessage> binaryFileHandler::readMessage()
{
    QString topic = "NOT FOUND";
    qint64 time = 0;
    quint32 numberOfFields = 0;
    _stream >> topic >> time >> numberOfFields;
    auto messageContents = std::vector<MessageField>{};
    for (quint32 i = 0; i < numberOfFields; ++i)
    {
        auto field = readField();
        messageContents.push_back(*field);
    }
    auto message = std::unique_ptr<PLAMessage>(new PLAMessage);
    message->topic = topic;
    message->time = static_cast<long long>(time);
    message->msg = messageContents;
    return std::move(message);

}

std::unique_ptr<MessageField> binaryFileHandler::readField()
{
    auto qData = QMap<QString, QString>{};
    _stream >> qData;
    auto data = std::map<std::string, std::string>{};
    for (const auto& key : qData.keys())
    {
        data.insert({key.toStdString(), qData.value(key).toStdString()});
    }

    auto field = std::unique_ptr<MessageField>(new MessageField);
    field->setData(data);
    return std::move(field);

}

void binaryFileHandler::writeField(const MessageField &field)
{
    auto data = QMap<QString, QString>{};
    for (const auto& dataMember: field.getData())
    {
        data.insert(QString::fromStdString(dataMember.first),
                    QString::fromStdString(dataMember.second));
    }
    _stream << data;
}

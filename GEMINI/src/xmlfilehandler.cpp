#include "xmlfilehandler.h"

xmlFileHandler::xmlFileHandler()
    : _mode(UNDEFINED)
{}

xmlFileHandler::~xmlFileHandler()
{
    if (_file.isOpen())
    {
        closeFile();
    }
}

xmlFileHandler::xmlFileHandler(QString fileName, FileMode mode)
    : _mode(mode)
{
    openFile(fileName);
}

void xmlFileHandler::openFile(QString fileName)
{
    _file.setFileName(fileName);
    switch (_mode)
    {
        case READ:
            _file.open(QFile::ReadOnly);
            _reader.setDevice(&_file);
            break;
        case WRITE:
            _file.open(QFile::WriteOnly);
            _writer.setDevice(&_file);
            _writer.setAutoFormatting(true);
            _writer.writeStartDocument();
            _writer.writeStartElement("GEMINI");
            break;
        case UNDEFINED:
        default:
            throw std::logic_error("xmlFileHandler attempted to open a file before its mode was set");
            break;
    }
}

void xmlFileHandler::setFileMode(FileMode mode)
{
    _mode = mode;
}

void xmlFileHandler::closeFile()
{
    _file.close();
}

void xmlFileHandler::write(const PLAMessage &message)
{
    if (_mode != WRITE || _file.openMode() != QIODevice::WriteOnly)
    {
        throw std::logic_error("xmlFileHandler attempted to write, but is not configured as a writer");
    }
    _writer.writeStartElement("Message");
    _writer.writeAttribute("topic", message.topic);
    _writer.writeAttribute("time", QString::fromStdString(std::to_string(message.time)));
    for (const auto& field : message.msg)
    {
        writeField(field);
    }
    _writer.writeEndElement();  // Message
}

std::unique_ptr<PLAMessage> xmlFileHandler::readMessage()
{
    if (QStringRefToString(_reader.name()).compare("Message") != 0)
    {
        throw std::invalid_argument("This file cannot be read. It does not meet the XML expected by this tool");
    }

    auto attributeMap = std::map<std::string, std::string>{};
    for (const auto& attribute : _reader.attributes())
    {
        attributeMap.insert({QStringRefToString(attribute.name()),
                             QStringRefToString(attribute.value())});
    }

    auto message = std::unique_ptr<PLAMessage>(new PLAMessage);
    message->topic = QString::fromStdString(attributeMap["topic"]);
    message->time = std::stoll(attributeMap["time"]);

    auto messageContents = std::vector<MessageField>{};
    while (_reader.readNextStartElement())
    {
        auto field = readField();
        messageContents.push_back(*field);
    }
    message->msg = messageContents;
    return std::move(message);
}

std::unique_ptr<MessageField> xmlFileHandler::readField()
{
    auto data = std::map<std::string, std::string>{};
    while (_reader.readNextStartElement())
    {
        auto fieldName = _reader.name().toString().toStdString();
        auto fieldValue = _reader.readElementText().toStdString();
        data.insert({fieldName, fieldValue});
    }

    auto field = std::unique_ptr<MessageField>(new MessageField);
    field->setData(data);
    return std::move(field);
}

void xmlFileHandler::writeField(const MessageField &field)
{
    _writer.writeStartElement("Field");
    for (const auto& dataMember : field.getData())
    {
        _writer.writeTextElement(QString::fromStdString(dataMember.first),
                                 QString::fromStdString(dataMember.second));
    }
    _writer.writeEndElement();  // Field
}

std::string xmlFileHandler::QStringRefToString(QStringRef ref)
{
    return ref.toString().toStdString();
}


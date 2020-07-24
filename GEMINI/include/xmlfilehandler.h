#ifndef XMLFILEHANDLER_H
#define XMLFILEHANDLER_H

#include <memory>
#include <QFile>
#include <QIODevice>
#include <QString>
#include <QXmlStreamReader>
#include <QXmlStreamWriter>

#include "filemode.h"
#include "messagefield.h"
#include "plamessage.h"

class xmlFileHandler
{
    public:
        xmlFileHandler();
        ~xmlFileHandler();
        xmlFileHandler(QString fileName, FileMode mode);

        void openFile(QString fileName);
        void setFileMode(FileMode mode);
        void closeFile();
        void write(const PLAMessage& message);

        template <typename T>
        void read(T& messages)
        {
            if (_mode != READ || _file.openMode() != QIODevice::ReadOnly)
            {
                throw std::logic_error("xmlFileHandler attempted to read, but is not configured as a reader");
            }
            _reader.readNextStartElement(); // Read root element
            while (_reader.readNextStartElement())
            {
                auto message = readMessage();
                messages.push_back(*message);
            }
        }

    private:
        QFile _file;
        QXmlStreamReader _reader;
        QXmlStreamWriter _writer;
        FileMode _mode;

        std::unique_ptr<PLAMessage> readMessage();
        std::unique_ptr<MessageField> readField();
        void writeField(const MessageField& field);
        std::string QStringRefToString(QStringRef ref);
};

#endif // XMLFILEHANDLER_H

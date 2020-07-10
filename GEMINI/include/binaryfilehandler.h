#ifndef BINARYFILEHANDLER_H
#define BINARYFILEHANDLER_H

#include <memory>
#include <QDataStream>
#include <QIODevice>
#include <QFile>
#include <QString>

#include "filemode.h"
#include "messagefield.h"
#include "plamessage.h"

class binaryFileHandler
{
    public:
        binaryFileHandler();
        ~binaryFileHandler();
        binaryFileHandler(QString fileName, FileMode mode);

        void openFile(QString fileName);
        void setFileMode(FileMode mode);
        void closeFile();
        void write(const PLAMessage& message);

        template <typename T>
        void read(T& messages)
        {
            if (_mode != READ || _file.openMode() != QIODevice::ReadOnly)
            {
                throw std::logic_error("binaryFileHandler attempted to read, but is not configured as a reader");
            }
            while (!_stream.atEnd())
            {
                auto message = readMessage();
                messages.push_back(*message);
            }
        }

    private:
        QFile _file;
        QDataStream _stream;
        FileMode _mode;

        std::unique_ptr<PLAMessage> readMessage();
        std::unique_ptr<MessageField> readField();
        void writeField(const MessageField& field);
};

#endif // BINARYFILEHANDLER_H

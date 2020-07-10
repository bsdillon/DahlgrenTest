#ifndef FILEQUEUE_H
#define FILEQUEUE_H

#include <fstream>
#include <memory>
#include <QFileInfo>
#include <QObject>
#include <QString>
#include <queue>

#include "binaryfilehandler.h"
#include "filestatus.h"
#include "messagelistener.h"
#include "plamessage.h"
#include "threadworker.h"

class FileQueue : public ThreadWorker
{
    Q_OBJECT

public:
    FileQueue();
    MessageListener* listener();

public slots:
    void ReceiveFileName(QString);
    void AcceptInput(bool);
    void EndFile();
    virtual void run() override; // From ThreadWorker
    void Message(const PLAMessage& m);
    void Log(QString logMessage);
    void setEnabled(bool);

signals:
    void FileClosed();
    void FileNameChecked(FileStatus);

private:
    const unsigned short MIN_FILE_NAME_LENGTH = 4;
    const unsigned short MAX_FILE_NAME_LENGTH = 35;
    const size_t MAX_FILE_SIZE = (getenv("MAX_FILE_MB") ? atoi(getenv("MAX_FILE_MB")) : 5) * (1 << 20);
    QString fileName; // File name given and only modified by user
    QString currentFile; // File name this class is allowed to modify
    unsigned short fileCount;
    bool fileStarted;
    bool acceptInput;
    bool _enabled;
    QFileInfo fileState;
    std::queue<PLAMessage> messageQueue;
    MessageListener* _messageListener;
    binaryFileHandler _writer;

    FileStatus FileNameUsesValidCharacters(QString);
    void OpenNewFile();
    void CloseFile();
};

#endif // FILEQUEUE_H

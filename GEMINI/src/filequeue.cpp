#include "filequeue.h"

#include <cctype>
#include <ctime>
#include <exception>
#include <iostream>
#include <QDebug>
#include <QDir>
#include <QProcessEnvironment>

#include "common.h"
#include "net/emptydriver.h"
#include "readmessage.h"
#include "timeobject.h"

FileQueue::FileQueue()
  : ThreadWorker(),
    fileCount(0),
    fileStarted(false),
    acceptInput(false),
    _enabled(true)
{
    fileState.setCaching(false);
    _messageListener = (new MessageListener(this));
    _messageListener->setMessageCallback(std::bind(&FileQueue::Message, this, std::placeholders::_1));
    _messageListener->setLoggingCallback(std::bind(&FileQueue::Log, this, std::placeholders::_1));
    _writer.setFileMode(FileMode::WRITE);
}

MessageListener *FileQueue::listener()
{
    return _messageListener;
}

void FileQueue::Log(QString logMessage)
{
    if (_enabled && acceptInput)
    {
        PLAMessage p;
        p.topic = QString("Log entry: "  + logMessage);
        p.time = TimeObject::GetCurrentTime().ToLongLong();
        messageQueue.push(p);
    }
}

void FileQueue::setEnabled(bool enabled)
{
    _enabled = enabled;
}

void FileQueue::ReceiveFileName(QString file)
{
    if (!_enabled)
    {
        return;
    }
    // Get path
    QProcessEnvironment env;
    QString path(getenv("LOG_FILE_PATH"));

    // Get current date/time
    time_t now = time(0);
    tm *myTime = localtime(&now);
    char timeString[30];
    std::strftime(timeString, 30, "_%m-%d-%Y_%H-%M-%S", myTime);

    // Add path and date/time to file name
    QString fullFileName = path + file + timeString + ".bin";

    // Set up return FileStatus
    FileStatus fileStatus(true, fullFileName);
    // Not interested in displaying file path
    fileStatus.infoMessage.replace(path, "");

    // Check file name validity
    // * User-provided name must be nonempty
    // * User-provided name must be between MIN_ and MAX_FILE_NAME_LENGTH
    // * User-provided name must only use alphanumerics, underscores, and hyphens
    // * File must not already exist
    FileStatus validCharacters = FileNameUsesValidCharacters(file);
    if (file.length() == 0)
    {
        fileStatus.valid = false;
        fileStatus.infoMessage = "";
    }
    else if (file.length() < MIN_FILE_NAME_LENGTH)
    {
        fileStatus.valid = false;
        fileStatus.infoMessage = "File name must be more than " + QString::number(MIN_FILE_NAME_LENGTH - 1) + " characters";
    }
    else if (file.length() > MAX_FILE_NAME_LENGTH)
    {
        fileStatus.valid = false;
        fileStatus.infoMessage = "File name must be less than " + QString::number(MAX_FILE_NAME_LENGTH + 1) + " characters";
    }
    else if (!validCharacters.valid)
    {
        fileStatus.valid = false;
        fileStatus.infoMessage = "File name contains illegal character(s): " + validCharacters.infoMessage;
    }
    else if (QFileInfo::exists(fullFileName))
    {
        fileStatus.valid = false;
        fileStatus.infoMessage = "Invalid name. File already exists";
    }

    emit FileNameChecked(fileStatus);

    // Use name if it's valid
    if (fileStatus.valid)
    {
        this->fileName = fullFileName;
        fileCount = 0;
    }

}

void FileQueue::AcceptInput(bool accept)
{
    acceptInput = accept;
}

void FileQueue::EndFile()
{
    if (fileStarted)
    {
        CloseFile();
    }
    emit FileClosed();
}

void FileQueue::Message(const PLAMessage &m)
{
    if (_enabled)
    {
        messageQueue.push(m);
    }
}

void FileQueue::run()
{
    if (!fileStarted && !messageQueue.empty())
    {
        OpenNewFile();
    }

    while (!messageQueue.empty())
    {
        _writer.write(messageQueue.front());
        messageQueue.pop();

        if (fileState.size() > MAX_FILE_SIZE)
        {
            CloseFile();
            OpenNewFile();
        }
    }
}

FileStatus FileQueue::FileNameUsesValidCharacters(QString name)
{
    FileStatus validStatus(true, "");
    QString validCharacters("_-");
    for (const auto& c : name)
    {
        if (!(isalnum(c.toLatin1())) || validCharacters.contains(c))
        {
            validStatus.valid = false;
            if (!validStatus.infoMessage.contains(c))
            {
                validStatus.infoMessage.append(c);
            }
        }
    }
    return validStatus;
}

void FileQueue::OpenNewFile()
{
    if (fileStarted)
    {
        std::cerr << "FileQueue::OpenNewFile() - Cannot open new file when "
                  << currentFile.toStdString() << " is still open\n";
        return;
    }
    currentFile = fileName;
    if (fileCount != 0)
    {
        QFileInfo currentFileInfo(currentFile);
        auto newName = currentFileInfo.completeBaseName() + "_" + QString::number(fileCount) + "." + currentFileInfo.suffix();
        currentFile = currentFileInfo.absoluteDir().filePath(newName);
    }
    _writer.openFile(currentFile);
    fileState.setFile(currentFile);
    fileStarted = true;

    // Update name on GUI
    QString logPath(getenv("LOG_FILE_PATH"));
    QString fileNoPath = QString(fileName).replace(logPath, "");
    emit FileNameChecked(FileStatus(true, fileNoPath));

    if (Common::IsTest())
    {
        std::cout << "Opening new file: " << currentFile.toStdString() << "\n";
    }
}

void FileQueue::CloseFile()
{
    if (!fileStarted)
    {
        std::cerr << "FileQueue::CloseFile() - There is no open file to close\n";
        return;
    }
    _writer.closeFile();
    ++fileCount;
    fileStarted = false;

    if (Common::IsTest())
    {
        std::cout << "Closing file: " << currentFile.toStdString() << "\n";
    }
}

#include <exception>
#include <map>
#include <memory>
#include <iostream>
#include <QApplication>
#include <QMetaType>
#include <QPixmap>
#include <QString>
#include <QThread>
#include <string>

#include "configureenvironment.h"
#include "filestatus.h"
#include "core/corefunction.h"
#include "common.h"

int main(int argc, char *argv[])
{
    if (!(argc == 2 || (argc == 3 && QString::fromStdString(argv[2]).compare("gui") == 0)))
    {
        std::cout << "Usage: Gemini <config file path> [optional: gui]" << std::endl;
        exit(-1);
    }

    //2 args means no GUI.
    //3 args are passed in the previous conditional check
    Common::SetHeadless(argc==2);

    QApplication a(argc, argv);

    CoreFunction f;

    qRegisterMetaType<PLAMessage>("PLAMessage");
    qRegisterMetaType<FileStatus>("FileStatus");
    qRegisterMetaType<std::string>("std::string");
    qRegisterMetaType<std::vector<std::string>>("std::vector<std::string>");
    qRegisterMetaType<std::map<std::string, AbstractDriver*>>("std::map<std::string, AbstractDriver*>");

    ConfigureEnvironment::Load(argv[1], a.applicationDirPath());

    f.CompleteStartup();
    return a.exec();
}

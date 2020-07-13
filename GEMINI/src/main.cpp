#include <exception>
#include <map>
#include <memory>
#include <iostream>
#include <QApplication>
#include <QMetaType>
#include <QPixmap>
#include <QSplashScreen>
#include <QString>
#include <QThread>
#include <string>

#include "AbstractDriver.h"
#include "configureenvironment.h"
#include "filestatus.h"
#include "mainwindow.h"

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        std::cout << "Usage: Gemini <config file path>" << std::endl;
        exit(-1);
    }

    QApplication a(argc, argv);

    QSplashScreen qss(QPixmap(":/SplashScreen.bmp"));
    qss.setWindowFlags(qss.windowFlags() | Qt::WindowStaysOnTopHint);
    qss.show();

    qRegisterMetaType<PLAMessage>("PLAMessage");
    qRegisterMetaType<FileStatus>("FileStatus");
    qRegisterMetaType<std::string>("std::string");
    qRegisterMetaType<std::vector<std::string>>("std::vector<std::string>");
    qRegisterMetaType<std::map<std::string, AbstractDriver*>>("std::map<std::string, AbstractDriver*>");

    ConfigureEnvironment::Load(argv[1], a.applicationDirPath());

    MainWindow w;
    qss.finish(&w);
    w.Load();
    w.show();

    return a.exec();
}

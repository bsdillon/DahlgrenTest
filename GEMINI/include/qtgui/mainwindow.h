#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <memory>
#include <QMainWindow>
#include <QThread>
#include <string>
#include <vector>
#include "testwindow.h"
#include "proxies/proxyset.h"
#include "uiinterface/i_main.h"

class dataLoaderPanel;
class MessageListener;
class ToggleSwitch;

namespace Ui {
  class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();
    void setupProxies(std::unique_ptr<ProxySet>& ps);
    //void Status(std::string s);
    //void modeSwitchingEnabled(bool enabled);
    //void logEventClicked();

public slots:
    void Status(std::string s);
    void modeSwitchingEnabled(bool enabled);
    void logEventClicked();

signals:
    void LogMessage(QString);

private slots:
    void setDataMode(bool savedDataMode);

private:
    Ui::MainWindow *ui;
    dataLoaderPanel* dataLoader;
    static short logMessageCount;
    ToggleSwitch* _modeToggle;

    void setDebugColoring();

    I_Main* mainProxy;
};

#endif // MAINWINDOW_H

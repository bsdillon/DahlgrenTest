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

class MainWindow : public QMainWindow, I_Main
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();
    void setupProxies(std::unique_ptr<ProxySet>& ps);

private slots:
    void setDataMode(bool savedDataMode);

private:
    Ui::MainWindow *ui;
    dataLoaderPanel* dataLoader;
    static short logMessageCount;
    ToggleSwitch* _modeToggle;

    void setDebugColoring();
};

#endif // MAINWINDOW_H

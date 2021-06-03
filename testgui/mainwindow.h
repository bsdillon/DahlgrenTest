#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include "second.h"

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void on_menuOutput_linkHovered(const QString &link);

    void on_pushButton_3_clicked();

    void on_pushButton_clicked();

    void on_pushButton_2_clicked();

private:
    Ui::MainWindow *ui;
    QMenu* popupmenu;
    void contextMenu(const QPoint &pos);
    void menuAction1(bool checked = false);
    void menuAction2(bool checked = false);
    void menuAction3(bool checked = false);
    void createSecond(QString txt);
};
#endif // MAINWINDOW_H

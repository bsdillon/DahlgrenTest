#ifndef DATALOADERPANEL_H
#define DATALOADERPANEL_H

#include <QWidget>

namespace Ui {
    class dataLoaderPanel;
}

class dataLoaderPanel : public QWidget
{
        Q_OBJECT

    public:
        explicit dataLoaderPanel(QWidget *parent = 0);
        ~dataLoaderPanel();

    public slots:
        void loadData();
        void clearData();

    signals:
        void loadDataFrom(QString fileName);
        void requestToClearData();
        void inCleanState(bool);

    private:
        Ui::dataLoaderPanel *ui;
};

#endif // DATALOADERPANEL_H

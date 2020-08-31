#ifndef DATALOADERPANEL_H
#define DATALOADERPANEL_H

#include <QWidget>
#include "uiinterface/i_dataloader.h"

namespace Ui {
    class dataLoaderPanel;
}

class dataLoaderPanel : public QWidget
{
        Q_OBJECT

    public:
        explicit dataLoaderPanel(QWidget *parent = 0);
        ~dataLoaderPanel();

        I_DataLoader* dataloaderProxy;

    public slots:
        void loadData();
        void clearData();

    signals:
        void inCleanState(bool);
        void loadDataFrom(QString fileName);
        void requestToClearData();

    private:
        Ui::dataLoaderPanel *ui;
};

#endif // DATALOADERPANEL_H

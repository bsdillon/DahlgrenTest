#ifndef TOPICSELECTOR_H
#define TOPICSELECTOR_H

#include <QCompleter>
#include <QItemSelectionModel>
#include <QSettings>
#include <QSortFilterProxyModel>
#include <QStringListModel>
#include <QWidget>
#include <string>
#include <vector>
#include "uiinterface/i_topicpanel.h"

class AbstractDriver;

namespace Ui {
    class TopicSelector;
}

class TopicSelector : public QWidget
{
    Q_OBJECT

public:
    explicit TopicSelector(QWidget *parent = 0);
    ~TopicSelector();

signals:
    void UpdateStatus(std::string);
    void TopicSelectionChanged(std::vector<std::string>);

    public slots:
        void selectionChanged();

    private slots:
        void addTopics();
        void removeTopics();
        void saveTopicsToFile();
        void loadTopicsFromFile();
        void checkSaveButtonState();

private:
    Ui::TopicSelector *ui;
    QSettings* _settings;
    QStringListModel* _allTopicsModel;
    QSortFilterProxyModel* _allTopicsProxyModel;
    QStringListModel* _selectedTopicsModel;
    QSortFilterProxyModel* _selectedTopicsProxyModel;

    void moveTopicByIndex(QModelIndex index, QAbstractItemModel *from, QAbstractItemModel *to);
    void moveTopicsBySelection(QItemSelectionModel *selection, QAbstractItemModel *from, QAbstractItemModel *to);
    void selectListOfTopics(const QStringList &topics);
    void writeSettings(QSettings *settings);

    I_TopicPanel* topicPanelProxy;
};

#endif // TOPICSELECTOR_H

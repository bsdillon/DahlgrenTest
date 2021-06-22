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
    void readSettings();
    I_TopicPanel* topicPanelProxy;
    void loadTopicsFromFile();
    void selectListOfTopics(const QStringList &topics);

signals:
    void UpdateStatus(std::string);
    void TopicSelectionChanged(std::vector<std::string>);

public slots:
    void selectionChanged();

private slots:
    void addTopics();
    void removeTopics();
    void saveTopicsToFile();

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
    void writeSettings(QSettings *settings);
    //void readSettings();

    //I_TopicPanel* topicPanelProxy;
};

#endif // TOPICSELECTOR_H

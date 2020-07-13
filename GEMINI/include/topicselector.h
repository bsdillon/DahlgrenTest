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

    public slots:
        void readSettings();
        void selectionChanged();

    private slots:
        void addTopics();
        void removeTopics();
        void saveTopicsToFile();
        void loadTopicsFromFile();
        void checkSaveButtonState();

signals:
    void UpdateStatus(std::string);
    void TopicSelectionChanged(std::vector<std::string>);

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
};

#endif // TOPICSELECTOR_H

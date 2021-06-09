#include "qtgui/topicselector.h"
#include "ui_topicselector.h"

#include <QDir>
#include <QFileDialog>
#include <QMessageBox>
#include <QString>
#include<QMessageBox>

//#include "AbstractDriver.h"
#include "net/source/abstractdriver.h"
//#include "DriverFactory.h"
//#include "net/drivers/DriverFactory.h"
#include "net/drivers/FactoryInterfaceImpl.h"

TopicSelector::TopicSelector(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::TopicSelector)
{
    ui->setupUi(this);
    _settings = new QSettings(getenv("SAVE_FILE"), QSettings::IniFormat);

    ui->TopicListAll->setEditTriggers(QAbstractItemView::NoEditTriggers);
    ui->TopicListSelected->setEditTriggers(QAbstractItemView::NoEditTriggers);
    connect(ui->pushButton_selectTopics, &QPushButton::clicked, this, &TopicSelector::addTopics);
    connect(ui->pushButton_deselectTopics, &QPushButton::clicked, this, &TopicSelector::removeTopics);
    connect(ui->pushButton_2_saveTopics, &QPushButton::clicked, this, &TopicSelector::saveTopicsToFile);
    connect(ui->pushButton_loadTopics, &QPushButton::clicked, this, &TopicSelector::loadTopicsFromFile);
    FactoryInterfaceImpl impl;

    auto stdTopicNames = impl.GetTopicList();
    auto allTopics = QStringList{};
    for (const auto& topic : stdTopicNames) {
        allTopics.append(QString::fromStdString(topic));
    }

    _allTopicsModel = new QStringListModel(allTopics, this);
    _allTopicsProxyModel = new QSortFilterProxyModel(this);
    _allTopicsProxyModel->setSourceModel(_allTopicsModel);
    _allTopicsProxyModel->setFilterCaseSensitivity(Qt::CaseInsensitive);
    ui->TopicListAll->setModel(_allTopicsProxyModel);
    QCompleter* allTopicCompleter = new QCompleter(_allTopicsProxyModel, this);
    allTopicCompleter->setCaseSensitivity(Qt::CaseInsensitive);
    ui->lineEdit_filter_allTopics->setCompleter(allTopicCompleter);
    connect(ui->allSelect_allTopics, &QPushButton::clicked, ui->TopicListAll, &QListView::selectAll);
    connect(ui->noneSelect_allTopics, &QPushButton::clicked, ui->TopicListAll, &QListView::clearSelection);
    connect(ui->lineEdit_filter_allTopics, &QLineEdit::textChanged, _allTopicsProxyModel, &QSortFilterProxyModel::setFilterFixedString);


    _selectedTopicsModel = new QStringListModel(this);
    _selectedTopicsProxyModel = new QSortFilterProxyModel(this);
    _selectedTopicsProxyModel->setSourceModel(_selectedTopicsModel);
    _selectedTopicsProxyModel->setFilterCaseSensitivity(Qt::CaseInsensitive);
    ui->TopicListSelected->setModel(_selectedTopicsProxyModel);
    QCompleter* selectedTopicCompleter = new QCompleter(_selectedTopicsProxyModel, this);
    selectedTopicCompleter->setCaseSensitivity(Qt::CaseInsensitive);
    ui->lineEdit_filter_selectedTopics->setCompleter(selectedTopicCompleter);
    connect(ui->allSelect_selectedTopics, &QPushButton::clicked, ui->TopicListSelected, &QListView::selectAll);
    connect(ui->noneSelect_selectedTopics, &QPushButton::clicked, ui->TopicListSelected, &QListView::clearSelection);
    connect(ui->lineEdit_filter_selectedTopics, &QLineEdit::textChanged, _selectedTopicsProxyModel, &QSortFilterProxyModel::setFilterFixedString);
    connect(ui->lineEdit_filter_selectedTopics, &QLineEdit::textChanged, this, &TopicSelector::checkSaveButtonState);

    checkSaveButtonState();

    topicPanelProxy = new I_TopicPanel(this);
    //topicPanelProxy->setReadSettingsCallback(std::bind(&TopicSelector::readSettings, this, std::placeholder::_1));
    topicPanelProxy->setReadSettingsCallback(std::bind(&TopicSelector::readSettings, this));
    //Signal Forwarding
    connect(this, &TopicSelector::UpdateStatus, topicPanelProxy, &I_TopicPanel::UpdateStatus);
    connect(this, &TopicSelector::TopicSelectionChanged, topicPanelProxy, &I_TopicPanel::TopicSelectionChanged);
}

TopicSelector::~TopicSelector()
{
    delete ui;
}

void TopicSelector::selectionChanged()
{
    auto selectedTopics = std::vector<std::string>{};
    for (const auto& topic : _selectedTopicsModel->stringList()) {
        selectedTopics.push_back(topic.toStdString());
    }
    emit TopicSelectionChanged(selectedTopics);
    writeSettings(_settings);
    checkSaveButtonState();
}

void TopicSelector::writeSettings(QSettings* settings)
{
    settings->setValue("TopicSelector/SelectedTopics", _selectedTopicsModel->stringList());
}

void TopicSelector::saveTopicsToFile()
{
    auto dirName = getenv("APPHOME") + QString("/savedTopicLists");
    QDir dir(dirName);
    if (!dir.exists())
    {
        dir.mkpath(".");
    }
    auto fileName = QFileDialog::getSaveFileName(this, tr("Save Topic List"),
                                                 dir.absolutePath() + "/untitled.gii",
                                                 tr("GEMINI Topic Files (*.gii)"));

    if (!fileName.length() == 0)
    {
        if (!fileName.endsWith(".gii"))
        {
            fileName.append(".gii");
        }
        auto settings = new QSettings(fileName, QSettings::IniFormat);
        writeSettings(settings);
    }
}

void TopicSelector::loadTopicsFromFile()
{
    auto dirName = getenv("APPHOME") + QString("/savedTopicLists");
    QDir dir(dirName);
    if (!dir.exists())
    {
        dir.mkpath(".");
    }
    auto fileName = QFileDialog::getOpenFileName(this, tr("Load Topic List"),
                                                 dir.absolutePath(),
                                                 tr("GEMINI Topic Files (*.gii)"));
    if (!fileName.length() == 0)
    {
        auto settings = new QSettings(fileName, QSettings::IniFormat);
        auto savedTopics = settings->value("TopicSelector/SelectedTopics").toStringList();
        selectListOfTopics(savedTopics);
    }

    //QMessageBox::information(this, "Title","Success!");
}

void TopicSelector::addTopics()
{
    moveTopicsBySelection(ui->TopicListAll->selectionModel(), _allTopicsProxyModel, _selectedTopicsModel);
}

void TopicSelector::removeTopics()
{
    moveTopicsBySelection(ui->TopicListSelected->selectionModel(), _selectedTopicsProxyModel, _allTopicsModel);
}

void TopicSelector::readSettings()
{
    auto selectedTopics = _settings->value("TopicSelector/SelectedTopics").toStringList();
    selectListOfTopics(selectedTopics);
}

void TopicSelector::selectListOfTopics(const QStringList& topics)
{
    auto unfoundTopicsList = QStringList{};
    bool topicMovedFromAvailable = false;
    for (const auto& topic : topics)
    {
        auto matchesSelected = _selectedTopicsModel->match(_selectedTopicsModel->index(0), Qt::DisplayRole, topic);
        if (!matchesSelected.empty())
        {
            // Topic already selected, do nothing
        }
        else
        {
            auto matchesAvailable = _allTopicsModel->match(_allTopicsModel->index(0), Qt::DisplayRole, topic);
            if (!matchesAvailable.empty())
            {
                moveTopicByIndex(matchesAvailable.front(), _allTopicsModel, _selectedTopicsModel);
                topicMovedFromAvailable = true;
            }
            else
            {
                unfoundTopicsList.append(topic);
            }
        }
    }
    _selectedTopicsModel->sort(0);
    if (topicMovedFromAvailable)
    {
        selectionChanged();
    }

    if (!unfoundTopicsList.empty())
    {
        QString unfoundTopics = unfoundTopicsList.join('\n');
        QMessageBox::warning(this, "Topics Not Found", "The following topics were not found:\n\n"  + unfoundTopics,
                             QMessageBox::Ok);
    }
}

void TopicSelector::checkSaveButtonState()
{
    ui->pushButton_2_saveTopics->setEnabled(!_selectedTopicsModel->stringList().empty());
}

void TopicSelector::moveTopicByIndex(QModelIndex index, QAbstractItemModel* from, QAbstractItemModel* to)
{
    auto topic = from->data(index, Qt::DisplayRole).toString();
    from->removeRow(index.row());
    to->insertRow(to->rowCount());
    auto newIndex = to->index(to->rowCount() - 1, 0);
    to->setData(newIndex, topic);
}

void TopicSelector::moveTopicsBySelection(QItemSelectionModel* selection, QAbstractItemModel* from, QAbstractItemModel* to)
{
    while (selection->hasSelection())
    {
        auto index = selection->selectedIndexes()[0];
        moveTopicByIndex(index, from, to);
    }
    to->sort(0);
    selectionChanged();
}

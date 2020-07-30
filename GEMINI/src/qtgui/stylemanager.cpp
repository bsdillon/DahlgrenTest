#include "qtgui/stylemanager.h"

#include <QFile>
#include <QStringList>

StyleManager* StyleManager::_instance = nullptr;

StyleManager::StyleManager()
{
    loadStyleSheet();
}

StyleManager::~StyleManager()
{
    delete _instance;
}

bool StyleManager::lineIsValid(QString line) const
{
    return ((!line.startsWith("//") &&
            (!line.isEmpty())       &&
            (line.contains("=")))   &&
            (line.contains("@")));
}

StyleManager *StyleManager::Instance()
{
    if (_instance == nullptr)
    {
        _instance = new StyleManager;
    }
    return _instance;
}

void StyleManager::loadStyleSheet()
{
    QString configPath(getenv("TS_CONFIG_PATH"));
    QFile colorsFile(configPath + "/colors.conf");
    colorsFile.open(QFile::ReadOnly);
    QStringList keyValuePair;
    QString line;
    while (!colorsFile.atEnd())
    {
        line = colorsFile.readLine().replace("\n", "").replace(" ", "");
        // Ignore comments and blank lines
        if (lineIsValid(line))
        {
            keyValuePair = line.split("=");
            colorCodes.insert({keyValuePair[0], keyValuePair[1]});
        }
    }

    QFile qssFile(":/styleSheet.qss");
    qssFile.open(QFile::ReadOnly);
    QString style(qssFile.readAll());
    for (auto& keyValue : colorCodes)
    {
        style.replace(keyValue.first, keyValue.second);
    }
    styleSheet = style;
}

const QString& StyleManager::requestColor(QString key) const
{
    auto colorItr = colorCodes.find(key);
    return colorItr->second;
}

const QString& StyleManager::requestStyleSheet() const
{
    return styleSheet;
}

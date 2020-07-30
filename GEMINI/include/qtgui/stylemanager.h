#ifndef STYLEMANAGER_H
#define STYLEMANAGER_H

#include <map>
#include <QString>
#include <QPushButton>
#include <QWidget>

class StyleManager
{
    public:
        static StyleManager* Instance();
        void loadStyleSheet();
        const QString& requestColor(QString key) const;
        const QString& requestStyleSheet() const;

    private:
        StyleManager();
        ~StyleManager();
        bool lineIsValid(QString line) const;

        static StyleManager* _instance;
        std::map<QString, QString> colorCodes;
        QString styleSheet;
};

#endif // STYLEMANAGER_H

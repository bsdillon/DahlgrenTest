#include "configureenvironment.h"

#include <fstream>
#include <iostream>
#include <QDir>
#include <QFile>
#include <sstream>

#include "common.h"

QString FileCheck(QString s)
{
    if (!QFile::exists(s))
    {
        QString tmp = QString("Missing file at ");
        tmp.append(s + "\n");
        return tmp;
    }
    return QString();
}

void ConfigureEnvironment::Load(std::string fileName, QString homePath)
{
    QString errorMessage;
    std::ifstream configFile;
    configFile.open(fileName);
    std::string line;

    while (configFile >> line)
    {
        std::stringstream ss(line);
        std::string varName;
        std::string varValue;

        getline(ss, varName, ',');
        getline(ss, varValue, ',');

        setenv(varName.c_str(), varValue.c_str(), 1);
    }

    //check for required environmental variables
    QString ans;
    std::string required[4] = {"APPHOME", "INTROSPECTION", "VERBOSITY", "DOMAINID"};
    for (int i = 0; i < 4; ++i)
    {
        if (getenv(required[i].c_str()) == NULL)
        {
            ans.append("   ");
            ans.append(QString::fromStdString(required[i]));
            ans.append("\n");
        }
    }

    if (ans.length() > 0)
    {
        errorMessage.append("One or more required environmental variables missing:\n");
        errorMessage.append(ans);
        std::cerr << errorMessage.toStdString() << std::endl;
        exit(-1);
    }

    //dependent variables
    QString home(getenv("APPHOME"));

    //Setting homepath == home
    //home = "/home/cdang/Desktop/Documents/DahlgrenTest/build-Gemini-Desktop-Debug/bin";

    //set all variables
    QString verbosity(getenv("VERBOSITY"));
    QString introspection(getenv("INTROSPECTION"));
    QString msg = Common::ValidateIntrospection(introspection);
    if (msg.length() > 0)
    {
        errorMessage.append(msg);
    }
    else
    {
        if (QDir(homePath) != QDir(home))
        {
            //error in configuration
            if (Common::IsTest())
            {
                std::cerr << "Configuration error while running test: application running from " << homePath.toStdString() << std::endl;
                std::cerr << "     configuration file suggests " << home.toStdString() << std::endl;
            }
            else
            {
                errorMessage = errorMessage + "Configuration error(FAILURE): application running from " + homePath + "\n";
                errorMessage = errorMessage +"     configuration file requires " + home + "\n";
            }
        }
    }

    QString options = "-FATAL -DDS_Verbosity=" + verbosity + " -DDS_on_subscription_matched=0 -DDS_on_publication_matched=0 -DDS_on_sample_rejected=0 -DDS_on_sample_lost=0 -DDS_on_liveliness_lost=0 -DDS_on_liveliness_changed=0";
    setenv("SYSTEM_OPTIONS", options.toStdString().c_str(), 1);
    setenv("HOME", home.toStdString().c_str() ,1);

    QString tmp = home + "config/";
    setenv("STM_CONFIG_PATH", tmp.toStdString().c_str(), 1);
    setenv("TS_CONFIG_PATH", tmp.toStdString().c_str(), 1);

    tmp = home + "log/";
    setenv("LOG",tmp.toStdString().c_str(), 1);
    setenv("LOG_FILE_PATH", tmp.toStdString().c_str(), 1);

    tmp = home + "log/Gemini_current.txt";
    setenv("LOGFILE", tmp.toStdString().c_str(), 1);

    tmp = home + "tools/";
    setenv("TOOLS", tmp.toStdString().c_str(), 1);

    tmp = home + "config_data/";
    setenv("CONFIG_DATA_PATH", tmp.toStdString().c_str(), 1);

    /*tmp = home + "config_data/DrsConfigValues.xml";
    errorMessage.append(FileCheck(tmp));
    setenv("XML_DRS_CONFIG_FILE", tmp.toStdString().c_str(), 1);*/

    /*tmp = home + "config_data/LoggingServiceConfigValues.xml";
    errorMessage.append(FileCheck(tmp));
    setenv("XML_LOGGER_CONFIG_FILE", tmp.toStdString().c_str(), 1);*/

    /*tmp = home + "config_data/PubSubConfigValues.xml";
    errorMessage.append(FileCheck(tmp));
    setenv("XML_PUBSUB_CONFIG_FILE", tmp.toStdString().c_str(), 1);*/

   /* tmp = home + "log/QOS_PROFILES.xml";
    errorMessage.append(FileCheck(tmp));*/

    tmp = "[file://" + tmp + "]";
    setenv("NDDS_QOS_PROFILES", tmp.toStdString().c_str(), 1);

    tmp = QString::fromStdString(getenv("DOMAINID"));
    setenv("NDDS_SESSION_DOMAIN", tmp.toStdString().c_str(), 1);
    setenv("SLOT_ID", tmp.toStdString().c_str(), 1);

    if (errorMessage.length() > 0)
    {
        std::cerr << errorMessage.toStdString() << std::endl;
        exit(-1);
    }
}

void xmlConfigFile(){
    QString tmp = QString("Missing file at ");
    QString errorMessage;
    QString home;

    tmp = home + "config_data/DrsConfigValues.xml";
    errorMessage.append(FileCheck(tmp));
    setenv("XML_DRS_CONFIG_FILE", tmp.toStdString().c_str(), 1);

    tmp = home + "config_data/LoggingServiceConfigValues.xml";
    errorMessage.append(FileCheck(tmp));
    setenv("XML_LOGGER_CONFIG_FILE", tmp.toStdString().c_str(), 1);

    tmp = home + "config_data/PubSubConfigValues.xml";
    errorMessage.append(FileCheck(tmp));
    setenv("XML_PUBSUB_CONFIG_FILE", tmp.toStdString().c_str(), 1);

    tmp = home + "log/QOS_PROFILES.xml";
    errorMessage.append(FileCheck(tmp));

}

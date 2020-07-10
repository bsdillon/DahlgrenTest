#include "readmessage.h"

#include <fstream>
#include <iostream>
#include <unordered_map>
#include <QDebug>
#include <QFontMetrics>
#include <QString>
#include <QTreeWidget>
#include <sstream>

#include "AbstractDriver.h"
#include "timeobject.h"


void ReadMessage::ReadToStream(const PLAMessage &message, std::ofstream& out)
{
    try
    {
        TimeObject messageTime(message.time);
        out << message.topic.toStdString() << " @ " << messageTime.toStdString() << "\n";
        out << "------------------------------------------------------------\n";
        std::string spacer(" - ");
        for (const auto& field : message.msg)
        {
            std::string prefix("   ");
            for (auto i = 0; i < field.getNestedLevel(); ++i)
            {
                prefix.append("  ");
            }

            if (field.getName().compare("nanosecondsSinceEpoch") == 0)
            {
                out << prefix << field.getValue() << "\n";
                continue;
            }
            out << prefix << field.getName() << spacer << field.getType() << spacer << field.getValue() << "\n";
        }
        out << "------------------------------------------------------------\n" << std::endl;
    }
    catch (const DriverException& e)
    {
        qDebug() << "DriverException while writing to file [" <<  QString::fromStdString(e.InterpretLevel()) << "]: " << QString::fromStdString(e.getMessage());
    }
    catch (const std::exception& e)
    {
        qDebug() << "Other exception while writing to file: " << e.what();
    }
}

void ReadMessage::ReadToTreeWidget(const PLAMessage& message, QTreeWidget *tree)
{
    QTreeWidgetItem* newItem = nullptr;
    // Keep track of the last widget at nested level 0, nested level 1, etc.
    std::unordered_map<int, QTreeWidgetItem*> lastNestedLevelItems;
    for (const auto& field : message.msg) {
        if (field.getNestedLevel() == 0) {
            newItem = new QTreeWidgetItem(tree);
        } else {
            newItem = new QTreeWidgetItem(lastNestedLevelItems[field.getNestedLevel() - 1]);
        }
        auto itemText = QString::fromStdString(field.getName());
        if (!field.getType().empty())
        {
            auto spacer = QString("        |        ");
            auto type = QString::fromStdString(field.getType() == "[]" ? std::string("ARRAY") : field.getType());
            auto value = QString::fromStdString(field.getValue().empty() ? std::string("-") : field.getValue());
            itemText.append(spacer + type + spacer + value);
        }
        newItem->setText(0, itemText);
        lastNestedLevelItems[field.getNestedLevel()] = newItem;
    }
}

void ReadMessage::RecursiveLoadMessage(AbstractDriver* msg, std::vector<MessageField> &messageContents, unsigned short recursions)
{
    int numMethods = msg->getMethodCount();
    const auto& types = msg->getMethodTypes();

    MessageField field;
    field.setNestedLevel(recursions);

    std::stringstream ss; // For short[] special case
    std::unique_ptr<short[]> shortArray = nullptr; // For short[] special case
    int arraySize = 0;
    for (int i = 0; i < numMethods; ++i)
    {
        field.setType(msg->getTypeDescription(types[i]));
        field.setName(msg->getMethodName(i));
        switch (types[i])
        {
            case AbstractDriver::ReturnTypes::UNSIGNED_SHORT:
                field.setValue(std::to_string(msg->getUNSIGNED_SHORTMethod(i)));
                break;
            case AbstractDriver::ReturnTypes::UNSIGNED_CHAR:
                field.setValue(std::to_string(msg->getUNSIGNED_CHARMethod(i)));
                break;
            case AbstractDriver::ReturnTypes::BOOL:
                field.setValue(std::to_string(msg->getBOOLMethod(i)));
                break;
            case AbstractDriver::ReturnTypes::FLOAT:
                field.setValue(std::to_string(msg->getFLOATMethod(i)));
                break;
            case AbstractDriver::ReturnTypes::CHAR:
                field.setValue(std::to_string(msg->getCHARMethod(i)));
                break;
            case AbstractDriver::ReturnTypes::LONG:
                field.setValue(std::to_string(msg->getLONGMethod(i)));
                break;
            case AbstractDriver::ReturnTypes::SHORT:
                field.setValue(std::to_string(msg->getSHORTMethod(i)));
                break;
            case AbstractDriver::ReturnTypes::LONG_LONG:
                field.setValue(std::to_string(msg->getLONG_LONGMethod(i)));
                if (field.getName().compare("nanosecondsSinceEpoch") == 0)
                {
                    // time objects are long long, but require special handling.
                    TimeObject to(msg->getLONG_LONGMethod(i));
                    field.setValue(to.ToString().toStdString());
                }
                break;
            case AbstractDriver::ReturnTypes::UNSIGNED_LONG:
                field.setValue(std::to_string(msg->getUNSIGNED_LONGMethod(i)));
                break;
            case AbstractDriver::ReturnTypes::SIGNED_CHAR:
                field.setValue(std::to_string(msg->getSIGNED_CHARMethod(i)));
                break;
            case AbstractDriver::ReturnTypes::DOUBLE:
                field.setValue(std::to_string(msg->getDOUBLEMethod(i)));
                break;
            case AbstractDriver::ReturnTypes::STD_STRING:
                field.setValue(msg->getSTD_STRINGMethod(i));
                break;
            case AbstractDriver::ReturnTypes::SHORTPOINTER:
                // Array of shorts is a special case. Write shorts to a
                // stringstream, then convert to string
                shortArray = msg->getSHORTPOINTERMethod(i);
                arraySize = msg->getMethodArrayCount(i);
                for (auto i = 0; i < arraySize; ++i)
                {
                    ss << shortArray.get()[i];
                }
                field.setValue(ss.str());
                break;
            case AbstractDriver::ReturnTypes::CHARPOINTER:
                field.setValue(std::string(msg->getCHARPOINTERMethod(i).get()));
                break;
            case AbstractDriver::ReturnTypes::ABSTRACTENUMPOINTER:
                field.setValue(msg->getABSTRACTENUMPOINTERMethod(i)->MapEnum());
                break;
            case AbstractDriver::ReturnTypes::ABSTRACTDRIVERPOINTER:
                // just writing the header for the driver
                field.setValue("");  // empty field.value for this driver
                break;
            case AbstractDriver::ReturnTypes::ABSTRACTDRIVERDOUBLEPOINTER:
                // just writing the header for the array
                arraySize = msg->getMethodArrayCount(i);
                field.setValue("Size[" + std::to_string(arraySize) + "]");
                break;
            case AbstractDriver::ReturnTypes::ABSTRACTENUMDOUBLEPOINTER:
                // just writing the header for the array
                arraySize = msg->getMethodArrayCount(i);
                field.setValue("Size[" + std::to_string(arraySize) + "]");
                break;
            default:
                field.setValue("<UNKNOWN TYPE ERROR>");
                break;
        }
        messageContents.push_back(field);

        // If data is nested, we already wrote title. Now get nested data and add
        // to messageContents
        if (types[i] == AbstractDriver::ReturnTypes::ABSTRACTENUMDOUBLEPOINTER)
        {
            std::string methodName = msg->getMethodName(i);
            for (int j = 0; j < arraySize; ++j)
            {
                field.getName() = methodName + "[" + std::to_string(j) + "]";
                // simple print out of each enum value
                field.setValue(msg->getABSTRACTENUMDOUBLEPOINTERMethod(i)[j]->MapEnum());
                messageContents.push_back(field);
            }
        }
        else if (types[i] == AbstractDriver::ReturnTypes::ABSTRACTDRIVERPOINTER)
        {
            auto newArray = std::unique_ptr<AbstractDriver>(std::move(msg->getABSTRACTDRIVERPOINTERMethod(i)));
            RecursiveLoadMessage(newArray.get(), messageContents, recursions + 1);
        }
        else if (types[i] == AbstractDriver::ReturnTypes::ABSTRACTDRIVERDOUBLEPOINTER)
        {
            std::string methodName = msg->getMethodName(i);
            for (int j = 0; j < arraySize; ++j)
            {
                // we have to print out a new title for each driver
                field.getName() = methodName + "[" + std::to_string(j) + "]";
                field.setValue("");
                messageContents.push_back(field);

                auto newArray = std::unique_ptr<AbstractDriver>(std::move(msg->getABSTRACTDRIVERDOUBLEPOINTERMethod(i)[j]));
                RecursiveLoadMessage(newArray.get(), messageContents, recursions + 1);
            }
        }
    }
}

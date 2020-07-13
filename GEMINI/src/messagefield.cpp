#include "messagefield.h"

MessageField::MessageField()
    : _name("NOT FOUND"),
      _type("NOT FOUND"),
      _value("NOT FOUND"),
      _nestedLevel(0)
{
    setDataMap();
}

MessageField::MessageField(std::string name, std::string type, std::string value, int nestedLevel)
    : _name(name),
      _type(type),
      _value(value),
      _nestedLevel(nestedLevel)
{
    setDataMap();
}

const std::map<std::string, std::string>& MessageField::getData() const
{
    return _data;
}

void MessageField::setData(std::map<std::string, std::string> memento)
{
    for (const auto& pair : _data)
    {
        std::string fieldName = pair.first;
        auto mementoValue = memento.find(fieldName);
        if (mementoValue != memento.end()) {
            _data[fieldName] = mementoValue->second;
        }
    }
    loadFromDataMap();
}

std::string MessageField::getName() const {return _name;}

void MessageField::setName(const std::string &name)
{
    _name = name;
    setDataMap();
}

std::string MessageField::getType() const {return _type;}

void MessageField::setType(const std::string &type)
{
    _type = type;
    setDataMap();
}

std::string MessageField::getValue() const {return _value;}

void MessageField::setValue(const std::string &value)
{
    _value = value;
    setDataMap();
}

int MessageField::getNestedLevel() const {return _nestedLevel;}

void MessageField::setNestedLevel(int nestedLevel)
{
    _nestedLevel = nestedLevel;
    setDataMap();
}

void MessageField::setDataMap()
{
    _data["name"] = _name;
    _data["type"] = _type;
    _data["value"] = _value;
    _data["nestedLevel"] = std::to_string(_nestedLevel);
}

void MessageField::loadFromDataMap()
{
    _name = _data["name"];
    _type = _data["type"];
    _value = _data["value"];
    _nestedLevel = std::stoi(_data["nestedLevel"]);
}

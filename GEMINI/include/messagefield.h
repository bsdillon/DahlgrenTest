#ifndef MESSAGEFIELD_H
#define MESSAGEFIELD_H

#include <map>
#include <string>

class MessageField
{
    public:
        MessageField();

        MessageField(std::string name, std::string type, std::string value, int nestedLevel);

        const std::map<std::string, std::string> &getData() const;
        void setData(std::map<std::string, std::string> memento);

        std::string getName() const;
        void setName(const std::string &name);
        std::string getType() const;
        void setType(const std::string &type);
        std::string getValue() const;
        void setValue(const std::string &value);
        int getNestedLevel() const;
        void setNestedLevel(int nestedLevel);

    private:
        std::string _name;
        std::string _type;
        std::string _value;
        int _nestedLevel;
        std::map<std::string, std::string> _data;

        void setDataMap();
        void loadFromDataMap();
};

#endif // MESSAGEFIELD_H

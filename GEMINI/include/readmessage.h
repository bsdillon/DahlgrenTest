#ifndef READMESSAGE_H
#define READMESSAGE_H

#include <iosfwd>
#include <memory>
#include <vector>
#include <QTreeWidget>
#include <string>

#include "plamessage.h"

class AbstractDriver;

class ReadMessage
{
public:
    static void ReadToStream(const PLAMessage&, std::ofstream&);
    static void ReadToTreeWidget(const PLAMessage &, QTreeWidget*);
    static void RecursiveLoadMessage(AbstractDriver* msg, std::vector<MessageField> &messageContents, unsigned short recursions = 0);
};

#endif // READMESSAGE_H

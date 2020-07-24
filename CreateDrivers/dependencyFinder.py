import sys
import os
import CppHeaderParser  # v2.7.4 must be installed
from Parsers.typedef import TypeDef
from Parsers.parseClass import ParseClass
from Parsers.enum import ParseEnum
from Parsers.union import ParseUnion
from TypeDictionary import TypeDictionary

class DependencyFinder:
"""
  Extracts all the classes, typedefs, etc. from the source files.
"""
    def __init__(self, path, filename, driver_path):

        self.path = path
        self.filename = filename
        self.driver_path = driver_path
        self.driver_path = driver_path

        try:
            self.parser = CppHeaderParser.CppHeader(os.path.join(path, filename))
        except CppHeaderParser.CppParseError as ex:
            print(ex)
            print('Exiting!')
            sys.exit(1)
    #end __init__

    def AppendTypes(self, typeList):
        for t in self.parser.typedefs.keys():
            name = TypeDictionary.AddTypeName(t, self.parser.typedefs[t])
            typeList[name.GetName()]=self

        for c in self.parser.classes.keys():
            cName = c
            parts = c.split(' ')
            if len(parts)>1 and parts[0]=='union':
                cName=parts[1]
            typeList[cName]=self
            for t in self.parser.classes[c]._public_typedefs:
                name = TypeDictionary.AddTypeName(t, self.parser.classes[c]._public_typedefs[t])
                typeList[name.GetName()]=self
            for e in self.parser.classes[c]['enums']['public']:
                typeList[e['name']]=self

        for e in self.parser.enums:
            typeList[e['name']]=self
    #end AppendTypes

    def ParseType(self, name):
        for t in self.parser.typedefs.keys():
            p = TypeDictionary.AddTypeName(t, self.parser.typedefs[t])
            if p.GetName()==name:
                return TypeDef(self.path,self.filename, self.driver_path, p.GetName(), p.GetName())

        for c in self.parser.classes.keys():
            parts = c.split(' ')
            if len(parts)>1 and parts[0]=='union' and parts[1]==name:
                return ParseUnion(self.path, self.filename, self.driver_path, c, name)

            if c==name:
                return ParseClass(self.path, self.filename, self.driver_path, c, False, c)

            for t in self.parser.classes[c]._public_typedefs:
                p = TypeDictionary.AddTypeName(t, self.parser.classes[c]._public_typedefs[t])
                return TypeDef(self.path, self.filename, self.driver_path, p.GetName(), p.GetName())

            for e in self.parser.classes[c]['enums']['public']:
                en = e['name']
                if en == name:
                    pe = ParseEnum(self.path, self.filename, self.driver_path, en, en)
                    pe.SetClass(c)
                    return pe

        for e in self.parser.enums:
            en = e['name']
            if en==name:
                p=ParseEnum(self.path, self.filename, self.driver_path, en, en)
                return p
    #end ParseType
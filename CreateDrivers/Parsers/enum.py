import os
from .abstract_parser import AbstractParser


class ParseEnum(AbstractParser):
    def __init__(self, header_path, header_filename, driver_path,
                 driver_filename, target=''):
        self.valueMap = {}
        self.className = ''
        AbstractParser.__init__(self, header_path, header_filename,
                                driver_path,
                                driver_filename + '_Enum.h', target)

    def Parse(self):
        for e in self.parser.enums:
            en = e['name']
            if en == self.target:
                self.myObject = e
                for v in self.myObject['values']:
                    self.valueMap[v['value']] = v['name']
                return

        for c in self.parser.classes.keys():
            for e in self.parser.classes[c]['enums']['public']:
                en = e['name']
                if en == self.target:
                    self.myObject = e
                    for v in self.myObject['values']:
                        self.valueMap[v['value']] = v['name']
                    return

        print('Enum ' + self.target + ' not found in ' + self.header_full)
        exit(1)

    def GetType(self):
        return '{target}_Enum'.format(target=self.target)

    def GetValue(self, source, forArray):
        if forArray:
            return 'new {type}({source}[i])'.format(type=self.GetType(),
                                                    source=source)
        return 'new {type}' \
               '({source})'.format(type=self.GetType(), source=source)

    def AppendIncludes(self, includeStatements):
        return

    def AppendDependencies(self, dependencies):
        return

    def GetFileName(self):
        return self.driver_filename

    def GetAbstractType(self):
        return 'AbstractEnum*'

    def SetClass(self, c):
        self.className = c

    @staticmethod
    def WriteAbstract(driver_dir):
        f = open(os.path.join(driver_dir, 'AbstractEnum.h'), 'w')

        f.write(('#ifndef ABSTRACTENUM_H\n'
                 '#define ABSTRACTENUM_H\n'
                 '\n'
                 '#include <string>\n'
                 '\n'
                 'class AbstractEnum\n'
                 '{{\n'
                 '{__}public:\n'
                 '{__}{__}virtual std::string MapEnum()\n'
                 '{__}{__}{{\n'
                 '{__}{__}{__}return "UNKNOWN_VALUE";\n'
                 '{__}{__}}}\n'
                 '}};\n'
                 '#endif').format(__=AbstractParser.space))
        f.close()

    def WriteHeader(self, dependencies):
        f = open(self.driver_full, 'w')

        fullSourceName = self.target

        if len(self.className) > 0 and len(self.myObject['namespace']) > 0:
            print
            'Unexpected class and namespace for enum ' + fullSourceName
            exit(-1)

        if len(self.className) > 0:
            fullSourceName = self.className + '::' + self.target

        if len(self.myObject['namespace']) > 0:
            fullSourceName = self.myObject['namespace'] + self.target

        f.write(('#ifndef {driver_filename}_H\n'
                 '#define {driver_filename}_H\n'
                 '\n'
                 '#include "AbstractEnum.h"\n'
                 '#include "{header_filename}"\n'
                 '\n'
                 'class {target}_Enum: public virtual AbstractEnum\n'
                 '{{\n'
                 '{__}private:\n'
                 '{__}{__}{fullSourceName} source;\n'
                 '\n'
                 '{__}public:\n'
                 '{__}{__}{target}_Enum({fullSourceName} e) {{\n'
                 '{__}{__}{__}source = e;\n'
                 '{__}{__}}}\n'
                 '\n'
                 '{__}{__}std::string MapEnum() {{\n'
                 '{__}{__}{__}switch (source) {{\n').format(
            __=AbstractParser.space, driver_filename=self.driver_filename[:-2],
            header_filename=self.header_filename, target=self.target,
            fullSourceName=fullSourceName))
        for v in self.valueMap.keys():
            f.write(('{__}{__}{__}{__}case {v}:\n'
                     '{__}{__}{__}{__}{__}return "{valueMap_v}";\n').format(
                __=AbstractParser.space, v=v, valueMap_v=self.valueMap[v]))
        f.write(('{__}{__}{__}{__}default:\n'
                 '{__}{__}{__}{__}{__}return "GEMINI_UNKNOWN_VALUE";\n'
                 '{__}{__}{__}}}\n'
                 '{__}{__}}}\n'
                 '}};\n'
                 '#endif').format(__=AbstractParser.space))

        f.close()
    # end WriteHeader

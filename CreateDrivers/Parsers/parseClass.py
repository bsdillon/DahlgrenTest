import os
from .abstract_parser import AbstractParser
from .Method import Method


class ParseClass(AbstractParser):
    """
    Track one message's path and filename and the
    associated driver's path and filename.
    Maintain a parser for the message.
    """
    fileDelimeter = ','

    @staticmethod
    def FromFile(line):
        # remove the ]n on the end of the line and split
        parts = line[:-1].split(ParseClass.fileDelimeter)
        return ParseClass(parts[0], parts[1], parts[2], parts[3], True)

    def ToFile(self):
        return '{hdr_path}{delim}{hdr_filename}{delim}' \
               '{driver_path}' \
               '{delim}' \
               '{driver_filename}' \
               '\n'.format(hdr_path=self.header_path,
                           hdr_filename=self.header_filename,
                           driver_path=self.driver_path,
                           driver_filename=self.driver_filename,
                           delim=ParseClass.fileDelimeter)

    def __init__(self, header_path, header_filename, driver_path,
                 driver_filename, original, target=''):
        self.IsOriginal = original
        self.Methods = []
        self.parentClass = ''
        self.parentClassName = ''
        df = driver_filename + '_Driver.h'
        if driver_filename[len(driver_filename) - 9:] == '_Driver.h':
            df = driver_filename
        self.name = df[:-9]
        AbstractParser.__init__(self, header_path,
                                header_filename,
                                driver_path,
                                df,
                                target)

    def Parse(self):
        if len(self.parser.classes) > 1:
            # files with multiple classes are possible
            # IFF we are designating a target
            if not self.target == '':
                for c in self.parser.classes:
                    if c == self.target:
                        self.myObject = self.parser.classes[c]
                        self.ParseMethods()
                        self.ParseParentClass()
                        return
                # if the target isn't found, we need to throw an error
                print('\nTarget class {target} not found in '
                      '{header_full}'.format(target=self.target,
                                             header_full=self.header_full))
                exit(-1)

            # if no target it designated we need to throw an error
            print('\nHeader file has more than 1 class: {header_full}'.format(
                header_full=self.header_full))
            exit(-1)

        if len(self.parser.classes) == 0:
            print('\nHeader file has no class: {header_full}'.format(
                header_full=self.header_full))
            exit(-1)

        for c in self.parser.classes:
            self.target = c
            self.myObject = self.parser.classes[c]

            if self.driver_filename != c + '_Driver.h':
                print
                'Driver class mismatch: {driver_filename} != '
                '{this_class}_'
                'Driver.h'.format(driver_filename=self.driver_filename,
                                  this_class=c)
                exit(-1)

        self.ParseParentClass()
        self.ParseMethods()

    def ParseParentClass(self):
        if len(self.myObject['inherits']) > 0:
            # only update parent class if it is the Message_T.
            # Otherwise we create a new factory method
            self.parentClass = self.myObject['inherits'][0]['class']
            parts = self.parentClass.split('::')
            self.parentClassName = parts[-1]

    def ParseMethods(self):
        for m in self.myObject['properties']['public']:
            self.Methods.append(
                Method(self.header_full, m['line_number'], m['raw_type'],
                       m['name']))

    def AppendDependencies(self, dependencies):
        if self.target not in dependencies:
            dependencies.append(self.target)

        for m in self.Methods:
            m.AppendDependencies(dependencies)

        if self.parentClass and self.parentClass not in dependencies:
            dependencies.append(self.parentClass)

    def WriteIncludesOnly(self, f, dependencies, includeList):
        """
        This method is the recursive call for parent class to
        add include statements
        :param f:
        :param dependencies:
        :param includeList:
        :return:
        """
        if self.parentClassName:
            dependencies[self.parentClassName].WriteIncludesOnly(f,
                                                                 dependencies,
                                                                 includeList)

        for m in self.Methods:
            ri = '"{return_import}"'.format(
                return_import=m.GetReturnImport(dependencies))
            if len(ri) > 2 and ri not in includeList:
                includeList.append(ri)

    def WriteMethodsOnly(self, f, dependencies):
        """
        This method is the recursive call for parent class method definitions
        :param f:
        :param dependencies:
        :return:
        """
        if self.parentClassName:
            dependencies[self.parentClassName].WriteMethodsOnly(f,
                                                                dependencies)

        for m in self.Methods:
            m.WriteMethod(f, dependencies)

    def GetAllMethods(self, count, methodGroups, methodList, dependencies):
        """
        This method is the recursive call for parent class method signatures
        """

        if self.parentClassName:
            count = \
                dependencies[self.parentClassName].GetAllMethods(count,
                                                                 methodGroups,
                                                                 methodList,
                                                                 dependencies)

        for m in self.Methods:
            rt = m.GetReturnAbstractType(dependencies)
            if rt not in methodGroups.keys():
                methodGroups[rt] = {}
            methodGroups[rt][count] = m
            methodList.append(m)
            count += 1

        return count

    def WriteHeader(self, dependencies):
        f = open(self.driver_full, 'w')

        fullSourceName = self.target
        if len(self.myObject['namespace']) > 0:
            if not self.myObject['namespace'][-2:] == '::':
                fullSourceName = '{ns}::{target}'.format(
                    ns=self.myObject['namespace'], target=self.target)
            else:
                fullSourceName = self.myObject['namespace'] + self.target

        f.write(('#ifndef {driver_filename}_H\n'
                 '#define {driver_filename}_H\n'
                 '\n').format(driver_filename=self.driver_filename[:-2]))
        for define in self.parser.defines[1:]:
            f.write('#define {define}\n\n'.format(define=define))

        # include statements
        includeList = []
        includeList.append('<cstdio>')
        includeList.append('<memory>')
        includeList.append('<string>')
        includeList.append('"AbstractEnum.h"')
        includeList.append('"AbstractDriver.h"')
        includeList.append('"DriverException.h"')
        includeList.append(
            '"{header_filename}"'.format(header_filename=self.header_filename))
        for incl in self.parser.includes:
            includeList.append(incl)
        for m in self.Methods:
            ri = '"{return_import}"'.format(
                return_import=m.GetReturnImport(dependencies))
            if len(ri) > 2 and ri not in includeList:
                includeList.append(ri)

        if self.parentClassName:
            dependencies[self.parentClassName].WriteIncludesOnly(f,
                                                                 dependencies,
                                                                 includeList)

        for item in includeList:
            f.write('#include {item}\n'.format(item=item))
        f.write('\n')

        # write the class name and private source object
        f.write(('class {target}_Driver: public virtual AbstractDriver\n'
                 '{{\n'
                 '{__}private:\n'
                 '{__}{__}bool factory;\n'
                 '\n'
                 '{__}{__}{fullSourceName} source;\n\n').format(
            __=AbstractParser.space, target=self.target,
            fullSourceName=fullSourceName))

        # write methods
        if self.parentClassName:
            dependencies[self.parentClassName].WriteMethodsOnly(f,
                                                                dependencies)

        for m in self.Methods:
            m.WriteMethod(f, dependencies)

        # constructor initializes source and signatures array
        f.write(('{__}public:\n'
                 '{__}{__}{target}_Driver() {{factory = true;}}\n'
                 '\n'
                 '{__}{__}std::unique_ptr<AbstractDriver> '
                 'CreateDriver({fullSourceName} p) {{\n'
                 '{__}{__}{__}if (!factory) {{\n'
                 '{__}{__}{__}{__}throw DriverException'
                 '("CreateDriver() is only valid from factory instances of '
                 '{target}_Driver", DriverException::Level::UnstableProgram);'
                 '\n'
                 '{__}{__}{__}}}\n'
                 '{__}{__}{__}return std::move(std::unique_ptr'
                 '<AbstractDriver>(new {target}_Driver(p)));\n'
                 '{__}{__}}}\n\n').format(__=AbstractParser.space,
                                          target=self.target,
                                          fullSourceName=fullSourceName))

        # only original Drivers need to have a conversion
        # method which overrides the virtual one.
        if self.IsOriginal:
            f.write((
                        '{__}{__}std::unique_ptr<AbstractDriver> CreateDriver'
                        '(const infrastructureservices::common::Message_T* p) '
                        '{{\n'
                        '{__}{__}{__}if (!factory) {{\n'
                        '{__}{__}{__}{__}'
                        'throw DriverException("CreateDriver() '
                        'is only valid from factory instances of {target}_'
                        'Driver", DriverException::Level::UnstableProgram);\n'
                        '{__}{__}{__}}}\n'
                        '{__}{__}{__}{fullSourceName}* tmp = '
                        '({fullSourceName}*)p;\n'
                        '{__}{__}{__}auto answer = this->CreateDriver(*tmp);\n'
                        '{__}{__}{__}return std::move(answer);\n{__}{__}}}'
                        '\n\n').format(__=AbstractParser.space,
                                       target=self.target,
                                       fullSourceName=fullSourceName))

        f.write(('{__}{__}{target}_Driver({fullSourceName} s) {{\n'
                 '{__}{__}{__}factory = false;\n'
                 '{__}{__}{__}'
                 'source = s;\n').format(__=AbstractParser.space,
                                         target=self.target,
                                         fullSourceName=fullSourceName))
        mCount = 0
        methodGroups = {}
        methodList = []

        # by parsing parent classes first
        # we get all the top methods in that order
        if self.parentClassName:
            mCount = \
                dependencies[self.parentClassName].GetAllMethods(mCount,
                                                                 methodGroups,
                                                                 methodList,
                                                                 dependencies)

        for m in self.Methods:
            rt = m.GetReturnAbstractType(dependencies)

            if rt not in methodGroups.keys():
                methodGroups[rt] = {}
            methodGroups[rt][mCount] = m
            methodList.append(m)
            mCount += 1

        f.write(
            '{__}{__}{__}signatures = std::vector<AbstractDriver::'
            'ReturnTypes>({mCount});\n'.format(
                __=AbstractParser.space, mCount=mCount))

        index = 0
        for m in methodList:
            rt = m.GetReturnAbstractType(dependencies)
            t = ParseClass.FormatReturnType(rt)
            f.write('{__}{__}{__}signatures[{index}] = {type};\n'.format(
                __=AbstractParser.space, index=index, type=t))
            index += 1

        f.write(('\n'
                 '{__}{__}{__}methodCount = {mCount};\n'
                 '{__}{__}}}\n'
                 '\n'
                 '{__}{__}~{target}_Driver() {{ }}\n\n').format(
            __=AbstractParser.space, mCount=mCount, target=self.target))

        if self.IsOriginal:
            f.write((
                        '{__}{__}infrastructureservices::common::Message_T* '
                        'CreateRandom() {{\n'
                        '{__}{__}{__}if (!factory) {{\n'
                        '{__}{__}{__}{__}'
                        'throw DriverException("CreateDriver() '
                        'is only valid from factory instances of '
                        '{target}_Driver", DriverException::Level::'
                        'UnstableProgram);\n'
                        '{__}{__}{__}}}\n'
                        '\n'
                        '{__}{__}{__}return new {fullSourceName}();\n{__}'
                        '{__}}}\n\n').format(__=AbstractParser.space,
                                             target=self.target,
                                             fullSourceName=fullSourceName))

        # overwrite virtual array count method
        mCount = 0
        f.write(('{__}{__}int getMethodArrayCount(int index) {{\n'
                 '{__}{__}{__}switch (index) {{\n').format(
            __=AbstractParser.space))
        for m in methodList:
            size = m.GetArraySize(dependencies)
            mCount += 1
            if not size == 0:
                f.write(('{__}{__}{__}{__}case {mCount_minus_1}:\n'
                         '{__}{__}{__}{__}{__}return (int){size};\n').format(
                    __=AbstractParser.space, mCount_minus_1=mCount - 1,
                    size=size))
        f.write(('{__}{__}{__}}}\n'
                 '{__}{__}{__}std::string msg = '
                 '"{target}_Driver has no array method at index ";\n'
                 '{__}{__}{__}msg.append(std::to_string(index));\n'
                 '{__}{__}{__}throw '
                 'DriverException(msg, DriverException::Level::DataLoss);\n'
                 '{__}{__}}}\n\n').format(__=AbstractParser.space,
                                          target=self.target))

        # overwrite virtual getter methods
        for rt in methodGroups:
            t = ParseClass.FormatReturnType(rt)
            returnType = ParseClass.FormatCodeReturnType(rt)['returnType']
            # this method returns an rt and has t in the signature
            f.write(('{__}{__}{returnType} get{t}Method(int index) {{\n'
                     '{__}{__}{__}switch (index) {{\n').format(
                __=AbstractParser.space, returnType=returnType, t=t))
            for count in methodGroups[rt].keys():
                m = methodGroups[rt][count]
                if "std::unique_ptr" in returnType:
                    returnCall = 'return std::move({mGetCall})'.format(
                        mGetCall=m.GetCall())
                else:
                    returnCall = 'return {mGetCall}'.format(
                        mGetCall=m.GetCall())
                f.write(('{__}{__}{__}{__}case {count}:\n'
                         '{__}{__}{__}{__}{__}{returnCall};\n').format(
                    __=AbstractParser.space, count=count,
                    returnCall=returnCall))

            f.write(('{__}{__}{__}}}\n'
                     '{__}{__}{__}std::string msg = '
                     '"{target}_Driver has no {t} method at index ";\n'
                     '{__}{__}{__}msg.append(std::to_string(index));\n'
                     '{__}{__}{__}throw DriverException(msg, '
                     'DriverException::Level::DataLoss);\n'
                     '{__}{__}}}\n\n').format(__=AbstractParser.space,
                                              target=self.target, t=t))

        # overwrite virtual name method
        mCount = 0
        f.write(('{__}{__}std::string getMethodName(int index) {{\n'
                 '{__}{__}{__}switch (index) {{\n').format(
            __=AbstractParser.space))
        for m in methodList:
            f.write(('{__}{__}{__}{__}case {mCount}:\n'
                     '{__}{__}{__}{__}{__}return {mWriteName};\n').format(
                __=AbstractParser.space, mCount=mCount,
                mWriteName=m.WriteName()))
            mCount += 1

        f.write(('{__}{__}{__}}}\n'
                 '{__}{__}{__}std::string msg = "{target}_Driver '
                 'has no member at index ";\n'
                 '{__}{__}{__}msg.append(std::to_string(index));\n'
                 '{__}{__}{__}throw DriverException(msg, '
                 'DriverException::Level::DataLoss);\n'
                 '{__}{__}}}\n'
                 '}};\n'
                 '#endif\n').format(__=AbstractParser.space,
                                    target=self.target))
        f.close()

    def GetMethodSignatures(self, types, dependencies):
        for m in self.Methods:
            rt = m.GetReturnAbstractType(dependencies)
            if rt not in types:
                types.append(rt)

        if self.parentClassName:
            dependencies[self.parentClassName] \
                .GetMethodSignatures(types, dependencies)

    @staticmethod
    def FormatReturnType(rt):
        t = str(rt).upper()
        t = t.replace(' ', '_')
        t = t.replace('::', '_')
        t = t.replace('**', 'DOUBLEPOINTER')
        t = t.replace('*', 'POINTER')
        return t

    @staticmethod
    def FormatDescription(rt):
        t = str(rt).upper()
        t = t.replace('STD', '')
        t = t.replace('::', '')
        t = t.replace('ABSTRACT', '')
        t = t.replace('DRIVER', '')
        t = t.replace('**', '[]')
        t = t.replace('*', '')
        return t

    @staticmethod
    def FormatCodeReturnType(rt):
        returnDict = {}
        if rt == 'char*':
            returnDict['baseType'] = 'char'
            returnDict['arrayWithSize'] = 'char[size]'
            returnDict['returnType'] = 'std::unique_ptr<char[]>'
        elif rt == 'short*':
            returnDict['baseType'] = 'short'
            returnDict['arrayWithSize'] = 'short[size]'
            returnDict['returnType'] = 'std::unique_ptr<short[]>'
        elif rt == 'AbstractEnum*':
            returnDict['baseType'] = 'AbstractEnum'
            returnDict['arrayWithSize'] = 'AbstractEnum[size]'
            returnDict['returnType'] = 'std::unique_ptr<AbstractEnum>'
        elif rt == 'AbstractEnum**':
            returnDict['baseType'] = 'std::unique_ptr<AbstractEnum>'
            returnDict['arrayWithSize'] = 'std::unique_ptr<AbstractEnum>[size]'
            returnDict[
                'returnType'] = 'std::unique_ptr<std::' \
                                'unique_ptr<AbstractEnum>[]>'
        elif rt == 'AbstractDriver*':
            returnDict['baseType'] = 'AbstractDriver'
            returnDict['arrayWithSize'] = 'AbstractDriver[size]'
            returnDict['returnType'] = 'std::unique_ptr<AbstractDriver>'
        elif rt == 'AbstractDriver**':
            returnDict['baseType'] = 'std::unique_ptr<AbstractDriver>'
            returnDict[
                'arrayWithSize'] = 'std::unique_ptr<AbstractDriver>[size]'
            returnDict[
                'returnType'] = 'std::unique_ptr<std::' \
                                'unique_ptr<AbstractDriver>[]>'
        else:
            returnDict['returnType'] = rt
        return returnDict

    @staticmethod
    def WriteEmpty(driver_dir):
        f = open(os.path.join(driver_dir, 'EmptyDriver.h'), 'w')

        f.write(('#ifndef EMPTYDRIVER_H\n'
                 '#define EMPTYDRIVER_H\n'
                 '\n'
                 '#include "AbstractDriver.h"\n'
                 '\n'
                 'class EmptyDriver: public AbstractDriver\n'
                 '{{\n'
                 '{__}public:\n'
                 '{__}{__}EmptyDriver() {{\n'
                 '{__}{__}{__}signatures = std::vector'
                 '<AbstractDriver::ReturnTypes>(0);\n'
                 '{__}{__}{__}methodCount = 0;\n'
                 '{__}{__}}}\n'
                 '}};\n'
                 '#endif\n').format(__=AbstractParser.space))

        f.close()

    @staticmethod
    def WriteException(driver_dir):
        f = open(os.path.join(driver_dir, 'DriverException.h'), 'w')
        f.write(('#ifndef DRIVEREXCEPTION_H\n'
                 '#define DRIVEREXCEPTION_H\n'
                 '\n'
                 '#include <exception>\n'
                 '\n'
                 'class DriverException: public std::exception\n'
                 '{{\n'
                 '{__}private:\n'
                 '{__}{__}std::string message;\n'
                 '{__}{__}int level;\n'
                 '\n'
                 '{__}public:\n'
                 '{__}{__}enum Level {{\n'
                 '{__}{__}{__}NoEffect,\n'
                 '{__}{__}{__}UnstableProgram,\n'
                 '{__}{__}{__}DataLoss,\n'
                 '{__}{__}{__}Fatal\n'
                 '{__}{__}}};\n'
                 '\n'
                 '{__}{__}std::string InterpretLevel() const {{\n'
                 '{__}{__}{__}std::string answer = "Unknown Error Type";\n'
                 '{__}{__}{__}switch ((Level)level)\n'
                 '{__}{__}{__}{{\n'
                 '{__}{__}{__}{__}case NoEffect:\n'
                 '{__}{__}{__}{__}{__}answer = "No Effect";\n'
                 '{__}{__}{__}{__}{__}break;\n'
                 '{__}{__}{__}{__}case UnstableProgram:\n'
                 '{__}{__}{__}{__}{__}answer = "Unstable Program";\n'
                 '{__}{__}{__}{__}{__}break;\n'
                 '{__}{__}{__}{__}case DataLoss:\n'
                 '{__}{__}{__}{__}{__}answer = "Data Loss";\n'
                 '{__}{__}{__}{__}{__}break;\n'
                 '{__}{__}{__}{__}case Fatal:\n'
                 '{__}{__}{__}{__}{__}answer = "Fatal";\n'
                 '{__}{__}{__}{__}{__}break;\n'
                 '{__}{__}{__}}}\n'
                 '{__}{__}{__}return answer;\n'
                 '{__}{__}}}\n'
                 '\n'
                 '{__}{__}DriverException(std::string s, Level l) {{\n'
                 '{__}{__}{__}message = s;\n'
                 '{__}{__}{__}level = (int)l;\n'
                 '{__}{__}}}\n'
                 '\n'
                 '{__}{__}std::string getMessage() const {{return message;}}\n'
                 '\n'
                 '{__}{__}Level getLevel() const {{return (Level)level;}}\n'
                 '}};\n'
                 '#endif\n').format(__=AbstractParser.space))
        f.close()

    @staticmethod
    def WriteAbstract(driver_dir, enumTypes):
        f = open(os.path.join(driver_dir, 'AbstractDriver.h'), 'w')

        f.write(('#ifndef ABSTRACTDRIVER_H\n'
                 '#define ABSTRACTDRIVER_H\n'
                 '\n'

                 '#include <cstdio>\n'
                 '#include <memory>\n'
                 '#include <string>\n'
                 '#include <vector>\n'
                 '\n'
                 '#include "AbstractEnum.h"\n'
                 '#include "DriverException.h"\n'
                 '#include "Message_T.h"\n'
                 '\n'
                 'class AbstractDriver\n'
                 '{{\n'
                 '{__}protected:\n'
                 '{__}{__}int myID = 0;\n'
                 '\n'
                 '{__}public:\n'
                 '{__}{__}virtual ~AbstractDriver() {{ }}\n'
                 '\n'
                 '{__}{__}int getID() {{return myID;}}\n'
                 '\n'
                 '{__}{__}virtual std::unique_ptr<AbstractDriver> '
                 'CreateDriver(const '
                 'infrastructureservices::common::Message_T*) {{\n'
                 '{__}{__}{__}throw DriverException'
                 '("AbstractDriver has no valid use for CreateDriver()", '
                 'DriverException::Level::UnstableProgram);\n'
                 '{__}{__}}}\n'
                 '\n'
                 '{__}{__}virtual infrastructureservices::common::'
                 'Message_T* CreateRandom() {{\n'
                 '{__}{__}{__}throw DriverException("AbstractDriver has no '
                 'valid use for CreateRandom()", '
                 'DriverException::Level::UnstableProgram);\n'
                 '{__}{__}}}\n'
                 '\n').format(__=AbstractParser.space))

        # write the Return type enumeration
        f.write('{__}{__}enum ReturnTypes {{\n'.format
                (__=AbstractParser.space))
        for e in enumTypes:
            f.write(
                '{__}''{__}{__}{returnType},\n'.format
                (__=AbstractParser.space,
                 returnType=ParseClass.FormatReturnType(e)))
        f.write(('{__}{__}}};\n'
                 '\n'
                 '{__}protected:\n'
                 '{__}{__}std::vector<ReturnTypes> signatures;\n'
                 '{__}{__}int methodCount;\n'
                 '\n'
                 # Write non-virtual methods
                 '{__}public:\n'
                 '{__}{__}const std::vector<ReturnTypes>& '
                 'getMethodTypes() {{return signatures;}}\n'
                 '\n'
                 '{__}{__}int getMethodCount() {{return methodCount;}}\n'
                 '\n'
                 '{__}{__}std::string getTypeDescription(ReturnTypes r) {{\n'
                 '{__}{__}{__}switch ((int)r) {{\n').format(
            __=AbstractParser.space))
        for e in enumTypes:
            f.write(('{__}{__}{__}{__}case {returnType}:\n'
                     '{__}{__}{__}{__}{__}return "{description}";\n'
                     ).format(__=AbstractParser.space,
                              returnType=ParseClass.FormatReturnType(e),
                              description=ParseClass.FormatDescription(e)))
        f.write(('{__}{__}{__}}}\n'
                 '{__}{__}{__}std::string msg = '
                 '"No type description found for ";\n'
                 '{__}{__}{__}msg.append(std::to_string(r));\n'
                 '{__}{__}{__}throw DriverException'
                 '(msg, DriverException::Level::UnstableProgram);\n'
                 '{__}{__}}}\n'
                 '\n'
                 # Write member name method
                 '{__}{__}virtual std::string getMethodName(int index) {{\n'
                 '{__}{__}{__}std::string msg = '
                 '"AbstractDriver has no member at index ";\n'
                 '{__}{__}{__}msg.append(std::to_string(index));\n'
                 '{__}{__}{__}throw DriverException'
                 '(msg, DriverException::Level::UnstableProgram);\n'
                 '{__}{__}}}\n'
                 '\n'
                 # Write virtual array counts method
                 '{__}{__}virtual int getMethodArrayCount(int) {{\n'
                 '{__}{__}{__}throw DriverException'
                 '("AbstractDriver has no array counts", '
                 'DriverException::Level::UnstableProgram);\n'
                 '{__}{__}}}\n'
                 '\n').format(__=AbstractParser.space))

        # write virtual getter methods
        for e in enumTypes:
            t = ParseClass.FormatReturnType(e)
            returnType = ParseClass.FormatCodeReturnType(e)['returnType']
            f.write(('{__}{__}virtual {returnType} '
                     'get{t}Method(int index) {{\n'
                     '{__}{__}{__}std::string msg = '
                     '"AbstractDriver has no {t} method at index ";\n'
                     '{__}{__}{__}msg.append(std::to_string(index));\n'
                     '{__}{__}{__}throw DriverException(msg, '
                     'DriverException::Level::UnstableProgram);\n'
                     '{__}{__}}}\n'
                     '\n').format(__=AbstractParser.space,
                                  returnType=returnType, t=t))

        # get message time; always the second method
        # in a type (property inherited from Message_T)
        f.write(('{__}{__}long long getMessageArrival() {{\n'
                 '{__}{__}{__}return getABSTRACTDRIVERPOINTERMethod(1)->'
                 'getLONG_LONGMethod(0);\n'
                 '{__}{__}}}\n'
                 '}};\n'
                 '#endif\n').format(__=AbstractParser.space))

        f.close()

    def GetType(self):
        return self.target + '_Driver'

    def GetFileIncludes(self, file):
        file.write('#include "{driver_filename}"\n'.format(
            driver_filename=self.driver_filename))

    def GetValue(self, source, forArray):
        if forArray:
            return 'new {getType}({source}[i])'.format(getType=self.GetType(),
                                                       source=source)
        return 'new {getType}({source})'.format(getType=self.GetType(),
                                                source=source)

    def GetFileName(self):
        return self.driver_filename

    def GetAbstractType(self):
        return 'AbstractDriver*'

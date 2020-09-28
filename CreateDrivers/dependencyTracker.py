import os
from primitive import Primitive
from Parsers.enum import ParseEnum
from Parsers.parseClass import ParseClass
from dependencyFinder import DependencyFinder
from Parsers.abstract_parser import AbstractParser
from TypeDictionary import TypeDictionary


class DependencyTracker:
    def __init__(self, driverlist, allHeaderFiles, driverDirectory):
        self.driverList = driverlist
        self.allHeaders = allHeaderFiles
        self.driverDirectory = driverDirectory
        self.permanentDependencies = {}
        self.primitives = {'bool': Primitive('bool'),
                           'char': Primitive('char'),
                           'double': Primitive('double'),
                           'float': Primitive('float'),
                           'long': Primitive('long'),
                           'long long': Primitive('long long'),
                           'short': Primitive('short'),
                           'signed char': Primitive('signed char'),
                           'unsigned long': Primitive('unsigned long'),
                           'unsigned char': Primitive('unsigned char'),
                           'unsigned short': Primitive('unsigned short')}
        IncludeFiles = []
        tempDependencies = []

        for p in self.driverList:
            p.AppendIncludes(IncludeFiles)
            p.AppendDependencies(tempDependencies)
            self.permanentDependencies[p.name] = p

        old = len(self.permanentDependencies)
        self.MatchDependencies(IncludeFiles, tempDependencies)
        new = len(self.permanentDependencies)

        new_count = new - old
        print('{new_count} new dependencies found\n'.format(new_count))
        old = new

        # All the dependency files have been found,
        # but more may exist which are secondary or tertiary dependency

        # this will run once and then again as necessary
        # to eliminate any new dependencies
        while len(tempDependencies) > 0:
            IncludeFiles = []
            tempDependencies = []
            self.FindNewDependencies(IncludeFiles, tempDependencies)
            self.MatchDependencies(IncludeFiles, tempDependencies)
            new = len(self.permanentDependencies)
            print('{new_count} new dependencies found\n'.format(
                new_count=new - old))
            old = new

        print('Total of {new} dependencies identified\n'.format(new=new))

    # end __init__

    def FindNewDependencies(self, includes, depends):
        """searches for includes statements in the header file"""
        for t in self.permanentDependencies.keys():
            # get the dependencies of the types
            temp = []
            if isinstance(self.permanentDependencies[t], AbstractParser):
                self.permanentDependencies[t].AppendDependencies(temp)
            else:
                continue

            # see if any of these are new
            newType = False
            for t2 in temp:
                name = TypeDictionary.ParseLongName(t2)
                if name not in self.permanentDependencies.keys():
                    newType = True
                    break

            # if any of them is new, we need to search for them all
            if newType:
                self.permanentDependencies[t].AppendIncludes(includes)
                self.permanentDependencies[t].AppendDependencies(depends)

    # end AppendNewDependencies

    def MatchDependencies(self, newIncludeFiles, targetDependencies):
        # Called for at least one class file which has additional dependencies
        print('Parsing dependency files...', end=" ")

        # the first loop partially parses the include
        # files and then adds the types to the typesFound collection
        typesFound = {}
        count = 0
        for f in newIncludeFiles:
            count += 1
            if count % 20 == 0:
                print('.', end=" ")

            if '.h' == f[
                       -2:]:
                # only bother to parse header files, not standard libraries
                v = self.allHeaders[f]
                DependencyFinder(v[0], v[1], self.driverDirectory).AppendTypes(
                    typesFound)

        # the second parsing matches the
        # dependency to the typesFound collection
        unfoundDependency = []
        for d in targetDependencies:
            name = TypeDictionary.ParseLongName(d)

            # skip any already-known types
            if name in self.permanentDependencies.keys():
                continue

            count += 1
            if count % 20 == 0:
                print('.', end=" ")


# end AppendNewDependencies

def MatchDependencies(self, newIncludeFiles, targetDependencies):
    # Called for at least one class file which has additional dependencies
    print
    'Parsing dependency files...',

    # the first loop partially parses the include files and
    # then adds the types to the typesFound collection
    typesFound = {}
    count = 0
    for f in newIncludeFiles:
        count += 1
        if count % 20 == 0:
            print
            '.',

        if '.h' == f[
                   -2:]:
            # only bother to parse header files, not standard libraries
            v = self.allHeaders[f]
            DependencyFinder(v[0], v[1], self.driverDirectory).AppendTypes(
                typesFound)

    # the second parsing matches the dependency to the typesFound collection
    unfoundDependency = []
    for d in targetDependencies:
        name = TypeDictionary.ParseLongName(d)

        # skip any already-known types
        if name in self.permanentDependencies.keys():
            continue

        count += 1
        if count % 20 == 0:
            print
            '.',

        if name in self.primitives.keys():
            self.permanentDependencies[name] = self.primitives[name]
        else:
            if name not in typesFound:
                unfoundDependency.append(name)
            else:
                self.permanentDependencies[name] = typesFound[name].ParseType(
                    name)
    print
    'Done'

    PrintRemainders(unfoundDependency)


# end FindDependencies

def PrintRemainders(self, unfoundDependency):
    if len(unfoundDependency) > 0:
        print
        '\nDid not discover some required types within dependency files'
        for d in unfoundDependency:
            print
            d
        exit(1)


def WriteFiles(self, driverDirectory):
    # gets the type of enumerated signature
    print
    'Creating Abstract files...',
    count = 0
    enumTypes = []
    for t in self.permanentDependencies:
        count += 1
        if count % 100 == 0:
            print
            '.',
        dep = self.permanentDependencies[t]
        if isinstance(dep, ParseClass):
            dep.GetMethodSignatures(enumTypes, self.permanentDependencies)

    ParseClass.WriteEmpty(driverDirectory)
    ParseClass.WriteException(driverDirectory)
    # Abstract Driver class implemented already
    # ParseClass.WriteAbstract(driverDirectory, enumTypes)
    ParseEnum.WriteAbstract(driverDirectory)
    print
    'Done\n'

    print
    'Creating driver files...',
    count = 0
    for t in self.permanentDependencies:
        count += 1
        if count % 20 == 0:
            print
            '.',
        dep = self.permanentDependencies[t]
        if isinstance(dep, AbstractParser):
            dep.WriteHeader(self.permanentDependencies)
    print
    'Done\n'


# end WriteFiles

def WriteFactory(self, driver_dir, topicMap, drivers):
    print
    'Writing factory...',

    f = open(os.path.join(driver_dir, 'DriverFactory.h'), 'w')

    f.write(('#ifndef DRIVERFACTORY_H\n'
             '#define DRIVERFACTORY_H\n'
             '\n'
             '#include <memory>\n'
             '#include <vector>\n'
             '\n'
             '#include "AbstractDriver.h"\n'
             '#include "DriverException.h"\n'))

    count = 0
    for t in drivers:
        t.GetFileIncludes(f)
        count += 1
        if count % 20 == 0:
            print
            '.',

    f.write(('\n'
             'class DriverFactory\n'
             '{{\n'
             '{__}public:\n'
             # List of topics for the GUI
             '{__}{__}static int GetTopicCount() {{return {topicMap_len};}}\n'
             '\n'
             '{__}{__}static std::vector<std::string> GetTopicList() {{\n'
             '{__}{__}{__}auto answer = std::vector<std::string>'
             '({topicMap_len});\n').format(
        __=AbstractParser.space, topicMap_len=len(topicMap)))

    index = 0
    for t in topicMap:
        f.write('{__}{__}{__}answer[{index}] = "{t_0}";\n'.format(
            __=AbstractParser.space, index=index, t_0=t[0]))
        index += 1
        count += 1
        if count % 20 == 0:
            print
            '.',
    f.write(('\n'
             '{__}{__}{__}return answer;\n'
             '{__}{__}}}\n'
             '\n'
             # Get topic reader by index
             '{__}{__}static std::unique_ptr<AbstractDriver> '
             'GetTopicFactory(int index) {{\n'
             '{__}{__}{__}std::unique_ptr<AbstractDriver> answer;\n'
             '{__}{__}{__}switch '
             '(index) {{\n').format(__=AbstractParser.space))

    index = 0
    for t in topicMap:
        driverName = t[1] + '_Driver'
        f.write(('{__}{__}{__}{__}case {index}:\n'
                 '{__}{__}{__}{__}{__}answer = std::unique_ptr'
                 '<AbstractDriver>(new {driverName}());\n'
                 '{__}{__}{__}{__}'
                 '{__}break;\n').format(__=AbstractParser.space,
                                        index=index,
                                        driverName=driverName))
        index += 1
        count += 1
        if count % 20 == 0:
            print('.', )
    f.write(('{__}{__}{__}}}\n'
             '\n'
             '{__}{__}{__}return std::move(answer);\n'
             '{__}{__}}}\n'
             '}};\n'
             '#endif\n').format(__=AbstractParser.space))
    f.close()

    print('Done\n')
# end WriteFactory

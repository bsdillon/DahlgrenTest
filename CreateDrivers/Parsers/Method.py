from .abstract_parser import AbstractParser
from TypeDictionary import TypeDictionary


class Method:
    def __init__(self, fileName, line, rt, tf):
        self.details = TypeDictionary.ParseReturnType(fileName, line, tf, rt)

    def AppendDependencies(self, dependencies):
        if not self.details.GetType() in dependencies:
            dependencies.append(self.details.GetType())

    def GetReturnImport(self, dependencies):
        """
        Finds the file which must be imported, based on return type,
        in order to enable the code
        :param dependencies: Dictionary of all typeNames->Parsers
        :return: '' if no import is required,
        otherwise the name of the import file
        """
        # Arrayness is of no importance here
        returnD = dependencies[self.details.GetType()]
        if isinstance(returnD, AbstractParser):
            return returnD.GetFileName()
        else:
            return ''

    def GetArraySize(self, dependencies):
        t = dependencies[self.details.GetType()]

        if self.details.IsArray() and t.IsArray():
            print(
                'Never implemented a means of getting '
                'array size from a double pointer')
            exit(-1)

        if self.details.IsArray():
            return self.details.GetSize()

        if t.IsArray():
            return t.GetArraySize()

        return 0

    def GetReturnAbstractType(self, dependencies):
        '''
        Returns the return type of the method as it will appear in
        the pattern matching enum e.g. possiblelibrary::sometype**
        :param dependencies:
        :return:
        '''
        t = dependencies[self.details.GetType()]
        answer = t.GetAbstractType()

        if self.details.IsArray():
            answer = answer + '*'

        if t.IsArray():
            answer = answer + '*'

        return answer

    def GetCall(self):
        return 'get_{getName}()'.format(getName=self.details.GetName())

    def WriteMethod(self, file, dependencies):
        from .parseClass import ParseClass
        returnD = dependencies[self.details.GetType()]
        returnType = returnD.GetAbstractType()
        if self.details.IsArray():
            returnType += '*'

        if returnD.IsArray():
            returnType += '*'

        typeDict = ParseClass.FormatCodeReturnType(returnType)
        returnType = typeDict['returnType']

        file.write('{__}{__}{returnType} get_{getName}() {{\n'.format(
            __=AbstractParser.space, returnType=returnType,
            getName=self.details.GetName()))
        if self.details.IsArray() or returnD.IsArray():
            arrayWithSize = typeDict['arrayWithSize']
            baseType = typeDict['baseType']
            file.write(('{__}{__}{__}int size = (int){getSize};\n'
                        '{__}{__}{__}auto answer = '
                        '{returnType}(new {arrayWithSize});\n'
                        '{__}{__}{__}for (int i = 0; i < size; ++i) {{\n'
                        '{__}{__}{__}{__}answer[i] = '
                        '{baseType}({source_name});\n'
                        '{__}{__}{__}}}\n'
                        '{__}{__}{__}return std::move(answer);\n'
                        ).format(__=AbstractParser.space,
                                 getSize=self.details.GetSize(),
                                 returnType=returnType,
                                 arrayWithSize=arrayWithSize,
                                 baseType=baseType,
                                 source_name=returnD.GetValue(
                                     'source.' +
                                     self.details.GetName(), True)))
        else:
            if 'std::unique_ptr' in returnType:
                file.write(
                    '{__}{__}{__}return std::move'
                    '({returnType}({source_name}));\n'.format(
                        __=AbstractParser.space, returnType=returnType,
                        source_name=returnD.GetValue(
                            'source.' + self.details.GetName(), False)))
            else:
                file.write('{__}{__}{__}return {source_name};\n'.format(
                    __=AbstractParser.space, source_name=returnD.GetValue(
                        'source.' + self.details.GetName(), False)))
        file.write('{__}{__}}}\n\n'.format(__=AbstractParser.space))

    def WriteName(self):
        return '"{getName}"'.format(getName=self.details.GetName())

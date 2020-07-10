import os

class TypeDetails:
    def __init__(self, type, name, size, arrayType):
        self.__myType = type
        self.__myName = name
        self.__mySize = size
        self.__isArray = arrayType

    def GetType(self):
        return self.__myType

    def GetName(self):
        return self.__myName

    def GetSize(self):
        return self.__mySize

    def IsArray(self):
        return self.__isArray

class TypeDictionary:
    simpleNames = []
    uniqueNames = {}

    @staticmethod
    def ParseReturnType(fileName, line, fullName, type):
        spaceUsed=False
        if ' ' in type:
            type = type.replace(' ','_')
            spaceUsed = True

        file = open(fileName, 'r')

        txt = file.readline()
        index = 1
        while index!=line:
            txt = file.readline()
            index += 1

        core = txt.strip().split(';')[0]
        parts = core.split(' ')

        index=0
        typeFound = ''
        if spaceUsed:
            while index+1<len(parts) and not parts[index]+"_"+parts[index+1] == type:
                index+=1
            if index+1 == len(parts):
                print 'Type ' + type + ' not found in ' + core
                exit(-1)

            typeFound = parts[index]+' '+parts[index+1]
            index+=1;
        else:
            while index<len(parts) and not parts[index] == type:
                index+=1

            if index == len(parts):
                print 'Type '+type+' not found in '+ core
                exit(-1)

            typeFound = parts[index]

        if index+1 == len(parts):
            print 'Not enough tokens in '+core
            exit(-1)

        if '[' in parts[index+1]:
            array = parts[index+1][:-1].split('[')
            return TypeDetails(TypeDictionary.ParseLongName(typeFound), array[0], array[1], True)

        return TypeDetails(TypeDictionary.ParseLongName(typeFound), parts[index+1], '0', False)


    @staticmethod
    def AddTypeName(fullName, type):
        temp = fullName
        if '[' in type:
            pieces1 = fullName.split('::::')
            if not pieces1[0] in type:
                print 'Parts not formatted as expected. ' + pieces1[0] + ' not found in ' + type
                exit(-1)

            # get the rest of the string, reformat it and split the pieces
            rest = type[-len(pieces1[0]) + 1:]
            rest = rest.replace('[', '')
            rest = rest.replace('  ', ' ')
            pieces2 = rest.split(' ')

            return TypeDetails(pieces2[0], TypeDictionary.ParseLongName(pieces2[1]), pieces2[2] + '::' + pieces1[1].replace(']', ''), True)

        return TypeDetails(type, TypeDictionary.ParseLongName(temp), '0', False)

    @staticmethod
    def ParseLongName(fullName):
        parts = fullName.split('::')
        name = parts[0]
        if len(parts) > 1:
            name = parts[len(parts) - 1]

        if not name in TypeDictionary.simpleNames:
            TypeDictionary.simpleNames.append(name)

        if len(parts)>1 and not name in TypeDictionary.uniqueNames.keys():
            TypeDictionary.uniqueNames[name]=fullName

        if len(parts)>1:
            if TypeDictionary.uniqueNames[name]==fullName:
                return name#exact match
            if fullName in TypeDictionary.uniqueNames[name]:
                return name#full uniquename is more inclusive
            if TypeDictionary.uniqueNames[name] in fullName:
                TypeDictionary.uniqueNames[name]=fullName #new fullname is more inclusive; replace it.
                return name

            #some error with names
            print 'Multiple full names correspond to the simple name '+name
            exit(-1)

        return name

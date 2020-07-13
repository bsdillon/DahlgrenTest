from abstract_parser import AbstractParser
from TypeDictionary import TypeDictionary

class TypeDef(AbstractParser):
    def __init__(self, header_path, header_filename, driver_path, driver_filename, target=''):
        self.trueType = ''
        AbstractParser.__init__(self, header_path, header_filename, driver_path, driver_filename, target)

    def Parse(self):
        for t in self.parser.typedefs.keys():
            p = TypeDictionary.AddTypeName(t, self.parser.typedefs[t])
            if p.GetName() == self.target:
                self.trueType = p.GetType()
                self.isArray = p.IsArray()
                self.ArraySize = p.GetSize()
                return

        for c in self.parser.classes.keys():
            for t in self.parser.classes[c]._public_typedefs:
                p = TypeDictionary.AddTypeName(t, self.parser.classes[c]._public_typedefs[t])
                if p.GetName() == self.target:
                    self.trueType = p.GetType()
                    self.isArray = p.IsArray()
                    self.ArraySize = p.GetSize()
                    return

        print '\nTypedef {target} not found in {header_full}'.format(target = self.target, header_full = self.header_full)
        exit(1)

    def GetType(self):
        return self.trueType

    def GetValue(self, source, forArray):
        if forArray:
            return '({GetType}){source}[i]'.format(GetType = self.GetType(), source = source)
        return '({GetType}){source}'.format(GetType = self.GetType(), source = source)

    def GetFileName(self):
        return ''

    def GetAbstractType(self):
        return self.trueType

    def AppendIncludes(self, includeStatements):
        for incl in self.parser.includes:
            name = incl[1:-1]
            if not name in includeStatements:
                includeStatements.append(name)

    def AppendDependencies(self, dependencies):
        dependencies.append(self.trueType)
        return

    def WriteHeader(self, dependencies):
        return
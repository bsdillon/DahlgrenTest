from .abstract_parser import AbstractParser


class ParseUnion(AbstractParser):
    def __init__(self, header_path, header_filename, driver_path,
                 driver_filename, target=''):
        AbstractParser.__init__(self, header_path, header_filename,
                                driver_path,
                                driver_filename + "_Driver.h", target)

    def Parse(self):
        for c in self.parser.classes:
            parts = c.split(' ')
            if len(parts) > 1 and parts[0] == 'union' and parts[1] == \
                    self.target:
                self.myObject = self.parser.classes[c]

        # for k in self.myUnion['members']:
        #     print '\t'+k['type']

    def GetType(self):
        return 'std::string'

    def GetValue(self, source, forArray):
        if forArray:
            print('Unions have not implemented with array capability')
            exit(-1)
        return '"Union: {target}"'.format(target=self.target)

    def WriteHeader(self, dependencies):
        return

    def GetFileName(self):
        return ''

    def GetAbstractType(self):
        return 'std::string'

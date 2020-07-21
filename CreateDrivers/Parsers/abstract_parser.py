import os.path

import CppHeaderParser



class AbstractParser:
    space = '  '

    def __repr__(self):
        return 'reprParser({header_path}, {header_filename}: {target})'.format(
            header_path=self.header_path, header_filename=self.header_filename,
            target=self.target)

    # end __repr__

    def __str__(self):
        return 'strParser({header_path}, {header_filename}: {target})'.format(
            header_path=self.header_path, header_filename=self.header_filename,
            target=self.target)

    # end __str__

    def __init__(self, header_path, header_filename, driver_path,
                 driver_filename, target=''):
        """
        Initialize fields.
        :param header_path: Message class header directory
        :param header_filename: Message class header filename
        :param driver_path: Associated driver's directory
        :param driver_filename: Associated driver's filename
        """

        self.header_path = header_path
        self.header_filename = header_filename
        self.driver_path = driver_path
        self.driver_filename = driver_filename
        self.header_full = os.path.join(self.header_path, self.header_filename)
        self.driver_full = os.path.join(self.driver_path, self.driver_filename)
        self.target = target
        self.isArray = False
        self.ArraySize = 0

        self.myObject = {}

        try:
            self.parser = CppHeaderParser.CppHeader(self.header_full)
        except CppHeaderParser.CppParseError as e:
            print
            e
            print
            'Exiting!'
            exit(1)

        self.Parse()

    # end __init__

    def AppendIncludes(self, includeStatements):
        for incl in self.parser.includes:
            name = incl[1:-1]  # remove surrounding " "
            if name not in includeStatements:
                includeStatements.append(name)

        # add this file
        includeStatements.append(self.header_filename)

    def AppendDependencies(self, dependencies):
        return

    def GetArraySize(self):
        return self.ArraySize

    def IsArray(self):
        return self.isArray

    def Parse(self):
        print
        'Parse not implemented in ' + type(self).__name__
        exit(-1)

    def GetType(self):
        print
        'GetType not implemented in ' + type(self).__name__
        exit(-1)

    def GetValue(self, source, forArray):
        print
        'GetValue not implemented in ' + type(self).__name__
        exit(-1)

    def GetFileName(self):
        print
        'GetFileName not implemented in ' + type(self).__name__
        exit(-1)

    def WriteHeader(self, dependencies):
        print
        'WriteHeader not implemented in ' + type(self).__name__
        exit(-1)

    def GetAbstractType(self):
        print
        'GetAbstractType not implemented in ' + type(self).__name__
        exit(-1)

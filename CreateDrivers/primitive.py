class Primitive:
"""
Primitive is a type that is defined in the language
and need not be found as a defined type in the code
"""
    def __init__(self, type):
        self.type = type

    # end __init__

    def GetType(self):
        return self.type

    # end getType

    def IsArray(self):
        return False

    def GetValue(self, source, forArray):
        if forArray:
            return '({GetType}){source}[i]'.format(GetType=self.GetType(),
                                                   source=source)
        return '({GetType}){source}'.format(GetType=self.GetType(),
                                            source=source)

    # end GetValue

    def GetAbstractType(self):
        return self.type
    # end GetAbstractType
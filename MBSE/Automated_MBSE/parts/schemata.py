import datetime

def _checkFloat(x:str):
    try:
        if not (type(x) == type("string")):
            return False

        f = float(x)
        return True
    except:
        return False
    

def _checkTime(x:str): 
    try:
        t = datetime.strptime(x, '%H::%M::%S').time()
        return True
    except:
        return False

def _checkDate(x:str): 
    try:
        t = datetime.strptime(x, '%m/%d/%y').time()
        return True
    except:
        return False

def _checkInt(x:str):
    try:
        int(x)
        return True
    except:
        return False

class DataType:
    def __init__(self, name:str, validateFunc):
        self.name = name
        self.validate = validateFunc
        try:
            tmp = self.validate("somestring")
            if type(True)!=type(tmp):
                raise Exception("Datatype "+name+" validator does not return Boolean")
        except Exception as ex:
            raise Exception("Datatype "+name+" validator fails no-throw guarantee")
        
    def __str__(self):
        return "DataType["+self.name+"]"

Time = DataType("double", _checkFloat)
Date = DataType("Date", _checkDate)
String = DataType("String", lambda x: type(x)==type("somestring"))
Int = DataType("Integer", _checkInt)

class Schemata:
    def __init__(self, name:str, type:DataType, default=None):
        self.name = name
        self.datatype = type
        self.default = default

        if self.default and not type.validate(self.default):
            raise Exception("Schemata "+name+" has default value "+str(default)+" incompatible with "+str(type))

    def __str__(self):
        return self.name

    @staticmethod
    def DefaultSchema():
        return []

    schema = DefaultSchema()
    schemaLength = 3

    @staticmethod
    def SetSchema(schema:[]):
        Schemata.schema = schema
        Schemata.schemaLength = len(schema)

    @staticmethod
    def getTitleIndex(title:str):
        for i in range(Schemata.schemaLength):
            if Schemata.schema[i].name==title:
                return i
        return -1

    @staticmethod
    def getNthSchemaTitle(n:int):
        return Schemata.schema[n].name

    @staticmethod
    def getSchemaLength():
        return Schemata.schemaLength

    @staticmethod
    def validateValue(index, value):
        return Schemata.schema[index].datatype.validate(value)

    @staticmethod
    def findTimeInSchema():
        for i in range(len(Schemata.schema)):
            if Schemata.schema[i]==Time:
                return i
        return -1

Source = Schemata("Source", String,"")
Sink = Schemata("Sink", String,"")
Label = Schemata("Label", String, default="_")


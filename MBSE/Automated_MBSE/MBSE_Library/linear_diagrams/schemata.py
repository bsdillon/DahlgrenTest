import datetime

class DataType:
    def __init__(self, name:str, validateFunc):
        self.name = name
        self.validate = validateFunc
        try:
            tmp = self.validate("somestring")
            if type(True)!=type(tmp):
                raise "Datatype "+name+" validator does not return Boolean"
        except:
            raise "Datatype "+name+" validator fails no-throw guarantee"
        
    def __str__(self):
        return "DataType["+self.name+"]"

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

class Schemata:
    Time = DataType("Time", _checkTime)
    Date = DataType("Date", _checkDate)
    String = DataType("String", lambda x: type(x)==type("somestring"))
    Int = DataType("Integer", lambda x : type(x)==type(0))

    KnownTypes = {
        "Time": Time,
        "Date": Date,
        "Integer": Int,
        "String": String
    }

    def __init__(self, name:str, type:DataType, default=None):
        self.name = name
        self.datatype = type
        self.default = default
        if self.default and not type.validate(self.default):
            raise "Schemata "+name+" has default value "+str(default)+" incompatible with "+str(type)

    @staticmethod
    def DefaultSchema():
        return [Source, Sink, Label]

Source = Schemata("Source", Schemata.String)
Sink = Schemata("Sink", Schemata.String)
Label = Schemata("Label", Schemata.String, default="_")
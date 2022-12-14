from OQE.sikuliLibrary import sikuliLibrary
from OQE.seleniumLibrary import seleniumLibrary
from robot.libraries.BuiltIn import BuiltIn
from OQE.textReader import textReader

class TestType(int):
    Sikuli = 1
    Selenium = 2
    Yeti = 3

def CreateTester(type:TestType, path):
    if type==TestType.Sikuli:
        temp = sikuliLibrary()
        temp.configureImagePath(path)
        return temp
    elif type==TestType.Selenium:
        temp = seleniumLibrary()
        temp.confgureImagePath(path)
        return temp
    elif type==TestType.Yeti:
        raise NotImplementedError

class Widget:
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self, imageLibrary):
        self.tester = imageLibrary
        self.group = None
        self.name = "UnknownWidget"
        self.x = self.y = self.w = self.h = 0

    def __str__(self):
        return self.name

    def LogToConsole(self, msg):
        BuiltIn().log_to_console(self.name+" INFO: "+ str(msg))

    def LogAll(self):
        raise NotImplementedError

    def setGroup(self, group):
        self.group = group
        group.add(self)

    def setLocation(self, x, y, w, h):
        self.baseX = self.x = x
        self.baseY = self.y = y
        self.w = w
        self.h = h

    def newOffsets(self, offset):
        self.x = self.baseX + offset[0]
        self.y = self.baseY + offset[1]

    def setDescription(self, description):
        self.description = description

    def read(self):
        fileName = self.capture()
        try:
            output = textReader().getText(fileName)
        except Exception as err:
            import traceback
            BuiltIn().log_to_console("Error "+str(err))
            BuiltIn().log_to_console(str(traceback.format_exception(type(err), err, err.__traceback__)))
        return output

    def click(self):
        if hasattr(self, 'description'):
            self.tester.click(self.description)
        else:
            self.tester.click2( self.x, self.y, self.w, self.h)    

    def doubleClick(self):
        if hasattr(self, 'description'):
            self.tester.dclick(self.description)
        else:
            self.tester.dclick2( self.x, self.y, self.w, self.h)

    def capture(self, name=None):
        if hasattr(self, 'description'):
            return self.tester.capture(self.description, name)
        else:
            return self.tester.capture2(self.x, self.y, self.w, self.h, name)
            
    def captureSmall(self, number, name=None):
        if hasattr(self, 'description'):
            return self.tester.captureSmall(self.description, number, name)
        else:
            return self.tester.captureSmall2(self.x, self.y, self.w, self.h, number, name)

    def write(self, text):
        if hasattr(self, 'description'):
            self.tester.write(self.description, text)
        else:
            self.tester.write2(self.x, self.y, self.w, self.h, text)

    def move(self, endX, endY):
        if hasattr(self, 'description'):
            self.tester.move(self.description, endX, endY)
        else:
            self.tester.move2(self.x, self.y, self.w, self.h, endX, endY)

    def find(self):
        if hasattr(self, 'description'):
            return self.tester.findElement(self.description)
        else:
            raise NotImplementedError("Cannot find widget without description")
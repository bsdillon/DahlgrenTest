import os.path
from OQE.sikulilibrary import sikulilibrary
from OQE.seleniumlibrary import seleniumlibrary
from robot.libraries.BuiltIn import BuiltIn
from OQE.textreader import textreader

class CheckState:
    CHECKED = "Checked"
    UNCHECKED = "Unchecked"
    UNKNOWN = "Unknown"

class TestType(int):
    Sikuli = 1
    Selenium = 2
    Yeti = 3

def CreateTester(type:TestType, path, remoteConnection="None"):
    if type==TestType.Sikuli:
        temp = sikulilibrary()
        temp.configureImagePath(path)
        temp.configureSikuli(remoteConnection)
        return temp
    elif type==TestType.Selenium:
        temp = seleniumlibrary()
        temp.confgureImagePath(path)
        return temp
    elif type==TestType.Yeti:
        raise NotImplementedError

class Widget:
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self):
        self.group = None
        self.name = "UnknownWidget"
        self.x = self.y = self.w = self.h = 0

    def generateCheckedImages(self, path):
        checked = os.path.join(path,"checked.png")
        unchecked = os.path.join(path,"unchecked.png")
        if os.path.exists(checked):
            self.checkedImage = str(checked)
        if os.path.exists(unchecked):
            self.uncheckedImage = str(unchecked)

    def configureWidget(self, imageLibrary):
        self.tester = imageLibrary

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
            output = textreader().getText(fileName)
        except Exception as err:
            import traceback
            self.LogToConsole("Error "+str(err))
            self.LogToConsole(str(traceback.format_exception(type(err), err, err.__traceback__)))
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
            self.LogToConsole("Finding window with "+self.description)
            return self.tester.findElement(self.description)
        else:
            raise NotImplementedError("Cannot find widget without description")

    def debugHighlight(self):
        if hasattr(self, 'description'):
            return self.tester.highlightElement(self.description)
        else:
            return self.tester.highlightElement2(self.x, self.y, self.w, self.h)

    def scroll(self, direction):
        raise NotImplementedError("Scroll is not available in "+self.name)

    def getState(self):
        if hasattr(self, 'description'):
            region = self.tester.searchRegion(self.description, self.checkedImage)
            if not(region[0]==-1 and region[1]==-1):
                #checked image found
                return CheckState.CHECKED
            
            region = self.tester.searchRegion(self.description, self.uncheckedImage)
            if not(region[0]==-1 and region[1]==-1):
                #unchecked image found
                return CheckState.UNCHECKED
        else:
            region = self.tester.searchRegion2(self.x, self.y, self.w, self.h, self.checkedImage)
            if not(region[0]==-1 and region[1]==-1):
                #checked image found
                return CheckState.CHECKED
            
            region = self.tester.searchRegion2(self.x, self.y, self.w, self.h, self.uncheckedImage)
            if not(region[0]==-1 and region[1]==-1):
                #unchecked image found
                return CheckState.UNCHECKED

        return CheckState.UNKNOWN

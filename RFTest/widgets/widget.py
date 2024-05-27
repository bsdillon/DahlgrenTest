from robot.libraries.BuiltIn import BuiltIn
from sikulilibrary import sikulilibrary
from textreader import textreader

class CheckState:
    CHECKED = "Checked"
    UNCHECKED = "Unchecked"
    UNKNOWN = "Unknown"

class TestType(int):
    Sikuli = 1

def CreateTester(type:TestType, path, remoteConnection="None"):
    if type==TestType.Sikuli:
        temp = sikulilibrary()
        temp.configureImagePath(path)
        temp.configureSikuli(remoteConnection)
        return temp
    else:
        raise NotImplementedError(f"Create tester for {type}")

class Widget:
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self):
        self.group = None
        self.name = "UnknownWidget"
        self.x = self.y = self.w = self.h = 0

    def configureWidget(self, imageLibrary):
        self.tester = imageLibrary

    def __str__(self):
        return self.name

    def LogToConsole(self, msg):
        BuiltIn().log_to_console("   "+self.name+" INFO: "+ str(msg))

    def LogAll(self):
        raise NotImplementedError(f"{self}.LogAll")

    #--------------------------------#
    #    Standard for all Widgets    #
    #--------------------------------#
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

    def click(self):
        self.tester.click2( self.x, self.y, self.w, self.h)  
    
    def clickAt(self, x, y):
        self.tester.click2( self.x+int(x), self.y+int(y), 1, 1)

    def doubleClick(self):
        self.tester.dclick2( self.x, self.y, self.w, self.h)

    def capture(self, name=None):
        return self.tester.capture2(self.x, self.y, self.w, self.h, name)

    def captureSmall(self, number, rate, name=None):
        return self.tester.captureSmall2(self.x, self.y, self.w, self.h, number, rate, name)

    def startWatcher(self, name):
        self.tester.startWatcher2(name, self.x, self.y, self.w, self.h)
    
    def haltWater(self, name):
        return self.tester.haltWatcher(name)

    #--------------------------------#
    #     Standard implementations   #
    #--------------------------------#
    def read(self):
        fileName = self.capture()
        try:
            output = textreader().getText(fileName)
        except Exception as err:
            import traceback
            self.LogToConsole("Error "+str(err))
            self.LogToConsole(str(traceback.format_exception(type(err), err, err.__traceback__)))
        return output

    def write(self, text):
        self.tester.write2(self.x, self.y, self.w, self.h, text)

    def move(self, endX, endY):
        self.tester.move2(self.x, self.y, self.w, self.h, endX, endY)

    def debugHighlight(self):
        return self.tester.highlightElement2(self.x, self.y, self.w, self.h)

    def getState(self):
        region = self.tester.searchRegion2(self.x, self.y, self.w, self.h, self.checkedImage)
        if not(region[0]==-1 and region[1]==-1):
            #checked image found
            return CheckState.CHECKED
        
        region = self.tester.searchRegion2(self.x, self.y, self.w, self.h, self.uncheckedImage)
        if not(region[0]==-1 and region[1]==-1):
            #unchecked image found
            return CheckState.UNCHECKED

    #--------------------------------#
    #          Deprecated            #
    #--------------------------------#
    def setDescription(self, _):
        raise Exception("Set Description is deprecated")

    def scroll(self, _):
        raise Exception("Scroll is deprecated")

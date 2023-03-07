import sys
import json
from widget import Widget
from widget import CreateTester
from button import Button
from group import Group
from anchor import Anchor
from movepoint import MovePoint
from button import Button
from checkbox import CheckBox
from dropdown import DropDown
from radiobutton import RadioButton
from scrollbar import ScrollBar
from tab import Tab
from textfield import TextField
from robot.api.deco import keyword

MARGIN = 5

class Window(Widget):
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self):
        Widget.__init__(self)
        self.widgets = {}
        self.anchors = {}
        self.movePoints = []
        self.name = "Window"

    def configureWindow(self, type, configPath, dataPath, remoteConnection="None"):
        tester = CreateTester(type, dataPath, remoteConnection)
        self.configureWidget(tester)
        self.configPath = configPath
        self.parseFile(self.configPath+"/project.json")
        #parse the configFile into widgets

    @keyword(name="Find")
    def find(self):
        '''
        Called to locate any anchor for the window and revise relative locations to 
        widgets.
        '''
        for name in self.anchors:
            anchor = self.anchors[name]
            loc = anchor.find()
            if loc[0] * loc[1] > 0: #default is 
                #determine offsets from widget; loc[x,y] is the CENTER of the anchor
                offset = (loc[0] - anchor.baseX - int(anchor.w/2), loc[1] - anchor.baseY - int(anchor.h/2))
                for w_name in self.widgets:
                    self.widgets[w_name].newOffsets(offset)
                self.newOffsets(offset)
                return name
        raise LookupError("Unable to find any anchor")

    def getWidget(self, name):        
        if not (name in self.widgets):
            raise LookupError("No widget with name "+name)
        
        return self.widgets[name]

    @keyword(name='Debug Window')
    def DebugAll(self):
        '''
        Uses the image library debug feature to identify the GUI component.
        '''        
        for w in self.widgets:
            self.widgets[w].debugHighlight()

    @keyword(name='Document API')
    def LogAll(self):
        '''
        Returns a single string containing a set of all widgets in the window and 
        their available functions.
        '''
        tmp = self.name+": find, setGroup, move, setLocation, click, capture, captureSmall\n"
        for w in self.widgets:
            tmp = tmp + self.widgets[w].LogAll()
        return tmp

    def read(self):
        raise NotImplementedError

    def doubleclick(self):
        raise NotImplementedError

    def write(self, _):
        raise NotImplementedError

    def getState(self):
        raise NotImplementedError

    def parseFile(self, config):
        reader = open(config)
        json_array = json.load(reader)
        reader.close()
        self.Path = json_array['Path']
        tmpName = self.Path[(self.Path.rindex("\\")+1):]
        self.name = "Window["+tmpName+"]"

        left = sys.maxsize
        right = -1
        top = sys.maxsize
        bottom = -1

        for widget_data in json_array['Widgets']:
            name = widget_data["name"]
            w_new = self.createWidget(widget_data["type"], name)
            self.widgets[name] = w_new
            
            if widget_data["type"]=="Anchor":
                self.anchors[name]=w_new
            elif widget_data["type"]=="MovePoint":
                self.movePoints.append(w_new)

            x = int(widget_data["X"])
            y = int(widget_data["Y"])
            w = int(widget_data["width"])
            h = int(widget_data["height"])
            w_new.setLocation(x, y, w, h)

            #calculate the effective size of the window
            if x<left:
                left = x
            if x+w>right:
                right = x+w

            if y<top:
                top = y
            if y+h>bottom:
                bottom = y+h

            if widget_data["type"]=="Anchor":
                w_new.setDescription(self.configPath+"/"+widget_data["Image file name"])
                
            #TODO figure out how this works with images vs CSS descriptions

            if "group" in widget_data:
                group = widget_data["group"]
                #create new group if needed
                if not group in self.widgets:
                    self.widgets[Group.GROUP+group] = Group(group, self.tester)

                w_new.setGroup(self.widgets[Group.GROUP+group])

        #this is the effective bounds of the window
        self.baseX = left - MARGIN
        self.baseY = top - MARGIN
        self.w = (right-left) + (2*MARGIN)
        self.h = (bottom-top) + (2*MARGIN)
    
    def createWidget(self, type, name):
        if type == "Anchor":
            return Anchor(name, self.tester)
        if type == "MovePoint":
            return MovePoint(name, self.tester)
        elif type == "Button":
            return Button(name, self.tester)
        elif type == "Check Box":
            return CheckBox(name, self.tester, self.Path)
        elif type == "Dropdown":
            return DropDown(name, self.tester)
        elif type == "Radio Button":
            return RadioButton(name, self.tester, self.Path)
        elif type == "Scroll Bar":
            return ScrollBar(name, self.tester)
        elif type == "Tab":
            return Tab(name, self.tester)
        elif type == "Text Field":
            return TextField(name, self.tester)
        else:
            raise NotImplementedError("No widget defined for "+type)

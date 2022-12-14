import json
from widgets.widget import Widget, CreateTester
from widgets.button import Button
from widgets.group import Group
from widgets.anchor import Anchor
from widgets.button import Button
from widgets.checkbox import CheckBox
from widgets.dropdown import DropDown
from widgets.radiobutton import RadioButton
from widgets.scrollbar import ScrollBar
from widgets.tab import Tab
from widgets.textfield import TextField
from robot.api.deco import keyword

class Window(Widget):
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self, type, configPath, dataPath):
        tester = CreateTester(type, dataPath)
        Widget.__init__(self, tester)
        self.offset = (0,0)
        self.widgets = {}
        self.anchors = {}
        self.name = "Window"
        self.configPath = configPath
        self.parseFile(self.configPath+"/project.json")
        #parse the configFile into widgets

    @keyword(name="Find")
    def find(self):
        for name in self.anchors:
            anchor = self.anchors[name]
            loc = anchor.find()
            if loc[0] * loc[1] > 0: #default is 
                #determine offsets from widget; loc[x,y] is the CENTER of the anchor
                self.offset = (loc[0] - (anchor.x + int(anchor.w/2)), loc[1] - (anchor.y + int(anchor.h/2)))
                for w_name in self.widgets:
                    self.widgets[w_name].newOffsets(self.offset)
                return name
        raise LookupError("Unable to find any anchor")

    def getWidget(self, name):
        if not (name in self.widgets):
            raise LookupError("No widget with name "+name)
        
        return self.widgets[name]

    @keyword(name='Document API')
    def LogAll(self):
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

    def parseFile(self, config):
        reader = open(config)
        json_array = json.load(reader)
        reader.close()
        tmpName = json_array['Path']
        tmpName = tmpName[(tmpName.rindex("\\")+1):]
        self.name = "Window["+tmpName+"]"

        for w in json_array['Widgets']:
            name = w["name"]
            w_new = self.createWidget(w["type"], name)
            self.widgets[name] = w_new
            if w["type"]=="Anchor":
                self.anchors[name]=w_new
            w_new.setLocation(int(w["X"]), int(w["Y"]), int(w["width"]), int(w["height"]))

            if w["type"]=="Anchor":
                w_new.setDescription(self.configPath+"/"+w["Image file name"])
                
            #TODO figure out how this works with images vs CSS descriptions

            if "group" in w:
                group = w["group"]
                #create new group if needed
                if not group in self.widgets:
                    self.widgets[Group.GROUP+group] = Group(group, self.tester)

                w_new.setGroup(self.widgets[Group.GROUP+group])
    
    def createWidget(self, type, name):
        if type == "Anchor":
            return Anchor(name, self.tester)
        elif type == "Button":
            return Button(name, self.tester)
        elif type == "Check Box":
            return CheckBox(name, self.tester)
        elif type == "Dropdown":
            return DropDown(name, self.tester)
        elif type == "Radio Button":
            return RadioButton(name, self.tester)
        elif type == "Scroll Bar":
            return ScrollBar(name, self.tester)
        elif type == "Tab":
            return Tab(name, self.tester)
        elif type == "Text Field":
            return TextField(name, self.tester)
        else:
            raise NotImplementedError("No widget defined for "+type)

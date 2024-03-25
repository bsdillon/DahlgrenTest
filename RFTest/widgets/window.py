import os
import sys
import json
from robot.api.deco import keyword
from anchor import Anchor
from button import Button
from checkbox import CheckBox
from dropdown import DropDown
from group import Group
from label import Label
from list import List
from movepoint import MovePoint
from radiobutton import RadioButton
from scrollbar import ScrollBar
from scrollbutton import ScrollButton
from tab import Tab
from textfield import TextField
from view import View
from widget import Widget, CreateTester

MARGIN = 5

class Window(Widget):
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self):
        Widget.__init__(self)
        self.views = {}
        self.currentView = None
        self.name = "Window"

    def configureWindow(self, type, configPath, dataPath, remoteConnection="None"):
        tester = CreateTester(type, dataPath, remoteConnection)
        self.configureWidget(tester)
        self.parseFile(configPath)
        #parse the configFile into widgets

    def parseFile(self, config):
        parts = os.path.split(config)
        directory = parts[0]
        file = parts[1]
        self.name = "Window["+file.split(".")[0]+"]"

        reader = open(config)
        json_array = json.load(reader)
        reader.close()

        #-----------------------------------#
        #       Validate file version       #
        #-----------------------------------#
        version = "3.0"
        if "Version" in json_array:
            version = json_array["Version"]
            
        if version!="3.1":
            raise Exception("JSON "+file+" is older than version 3.1")
        

        #-----------------------------------#
        #        First pass on views        #
        #-----------------------------------#
        assignments = {}
        if "Views" in json_array:
            for vName in json_array["Views"]:
                vData = json_array["Views"][vName]
                
                #Get any foreign offsets
                offsets = {}
                if "Foreign" in vData:
                    offsets = vData["Foreign"]
                self.views[vName] = View(vName, self.tester, offsets)
                
                #record the widgets from this view
                if "Widgets" in vData:
                    for wName in vData["Widgets"]:
                        if wName not in assignments:
                            assignments[wName]=[]
                        assignments[wName].append(vName)

        #-----------------------------------#
        # Generate widgets and add to views #
        #-----------------------------------#
        if "Widgets" in json_array:
            for wData in json_array["Widgets"]:
                wName = wData["name"]
                vNative = wData["view"]
                wType = wData["type"]
                x = int(wData["X"])
                y = int(wData["Y"])
                w = int(wData["width"])
                h = int(wData["height"])

                vGroup = None
                if "Group" in wData:
                    vGroup = wData["Group"]
                
                other = ["Image file name", "Link", "Checked", "Unchecked", "Value", "Direction"]
                props = {}
                for o in other:
                    if o in wData:                        
                        props[o]=wData[o]
                        
                        if props[o]=="<None>":
                            props[o]=None
                            
                        if o in ["Image file name", "Checked", "Unchecked"]:
                            props[o]=os.path.join(directory, props[o])
                    else:
                        props[o]=None

                w_new = self.createWidget(wType, wName, props)

                for vName in assignments[wName]:
                    v = self.views[vName]
                    v.addWidget(w_new, wName, wType, x, y, w, h, vNative, vGroup)

        #-----------------------------------#
        #        Second pass on views       #
        #-----------------------------------#
        for vName in self.views:
            self.views[vName].view_finalize()
    
    def createWidget(self, type, name, properties):
        if type == "Anchor":
            return Anchor(name, self.tester, properties)
        elif type == "Button":
            return Button(name, self.tester, self.updateView, properties)
        elif type == "Check Box":
            return CheckBox(name, self.tester, properties)
        if type == "Label":
            return Label(name, self.tester)
        if type == "List":
            return List(name, self.tester)
        if type == "MovePoint":
            return MovePoint(name, self.tester)
        elif type == "Radio Button":
            return RadioButton(name, self.tester, properties)
        elif type == "Scroll Button":
            return ScrollButton(name, self.tester, properties)
        elif type == "Tab":
            return Tab(name, self.tester, self.updateView, properties)
        elif type == "Text Field":
            return TextField(name, self.tester)
        elif type == "Dropdown":
            raise NotImplementedError("Dropdown is deprecated")
        elif type == "Scroll Bar":
            raise NotImplementedError("Scroll Bar is deprecated")
        else:
            raise NotImplementedError("No widget defined for "+type)

    def updateView(self, vName):
        if vName in self.views:
            self.currentView = self.views[vName]
        else:
            raise LookupError("Could not find View["+vName+"]")
            

    #-----------------------------------#
    #   Functions routed through views  #
    #-----------------------------------#
    #BSD these MAY not be needed any more. The method should be use getwidget to find the right widget in the view, THEN you just click on that widget
    # def click(self, name):
    #     if self.currentView:
    #         self.currentView.view_click(name)
        
    # def doubleClick(self, name):
    #     if self.currentView:
    #         self.currentView.view_doubleClick(name)

    # def capture(self, name:str=None):
    #     if self.currentView:
    #         return self.currentView.capture(name)

    # def captureSmall(self, number:int, name:str=None):
    #     if self.currentView:
    #         return self.currentView.captureSmall(number, name)

    @keyword(name='Document API')
    def DocumentAPI(self):
        '''
        Returns a single string containing a set of all widgets in the window and 
        their available functions.
        '''
        tmp = ""
        for vName in self.views:
            v = self.views[vName]
            tmp += v.view_LogAll()

        return tmp

    @keyword(name='Debug Window')
    def DebugAll(self):
        '''
        Uses the image library debug feature to identify the GUI component.
        '''        
        if self.currentView:
            return self.currentView.view_DebugAll()
            
        raise LookupError("No current view to Debug")

    @keyword(name="See Anchor")
    def seeAnchor(self, name):
        '''
        Called to search for a specific anchor by name and confirm it is visible.
        Returns true if the anchor is visible.
        '''
        for vName in self.views:
            v = self.views[vName]
            answer = v.view_see(name)
            if answer:
                return True

        return False

    @keyword(name="Find")
    def find(self):
        '''
        Called to locate any anchor for the window and revise relative locations to 
        widgets.
        
        Returns the name of the anchor found OR None
        '''
        if self.currentView:
            answer = self.currentView.view_find()
            if answer:
                return answer
        
        for vName in self.views:
            v = self.views[vName]
            answer = v.view_find()
            if answer:
                self.currentView = v
                return answer
        raise LookupError("Unable to find any anchor")

    def getWidget(self, name):
        if self.currentView:
            return self.currentView.view_getWidget(name)
            
        raise LookupError("No current view to get widget "+name)

    @keyword(name='Move')
    def Move(self, endX, endY):
        '''
        Move the window to the desired end location
        endX - x coordinate of end location
        endY - y coordinate of end location
        '''
        if self.currentView:
            self.currentView.view_move(endX, endY)
            return

        raise LookupError("No current view to move")

    @keyword(name="Expected View")
    def getExpectedView(self):
        '''
        Returns the name of the current view which represents what the WINDOW LOGIC things is currently on display
        '''
        if self.currentView:
            return str(self.currentView)
        
        raise LookupError("No current view expected")

    @keyword(name="Actual View")
    def getActualView(self):
        '''
        Returns the name of a view which can be verified (starting with current view) which represent reality.
        Useful to periodically verify the window logic.
        '''
        if self.currentView:
            answer = self.currentView.view_find()
            if answer:
                return str(self.currentView)

        for vName in self.views:
            v = self.views[vName]
            answer = v.view_find()
            if answer:
                return str(v)

        raise LookupError("Unable to get actual view")

    @keyword(name="Capture Window")
    def captureWindow(self):
        '''
        Takes a picture of the window itself and returns the image file\n\n
        '''
        if not self.currentView:
            self.find()

        if self.currentView:
            return self.currentView.view_Capture()

        raise LookupError("Unable to capture actual view")

    #not used in Window
    def debugHighlight(self):
        raise NotImplementedError

    def getState(self):
        raise NotImplementedError

    def write(self, _):
        raise NotImplementedError

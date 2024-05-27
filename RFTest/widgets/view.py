import sys
from widget import Widget
from group import Group

MARGIN = 5

class View(Widget):
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self, name:str, imageLibrary, offsets):
        Widget.__init__(self)
        self.name = "View["+name+"]"
        self.tester = imageLibrary
        self.offsets = offsets
        print(str(self)+": "+str(self.offsets))
        self.widgets = {}
        self.natives = {}
        self.anchors = {}
        self.groups = {}
        self.movePoints = []
        self.left = sys.maxsize
        self.right = -1
        self.top = sys.maxsize
        self.bottom = -1

    #----------------------------------------#
    #   Adding widget membership to a view   #
    #----------------------------------------#
    def addWidget(self, widget:Widget, name:str, type:str, x:int, y:int, w:int, h:int, native:str, group:str):
        '''
        This widget is a native/foreign member of view
        '''
        self.widgets[name] = widget
        self.natives[name] = "View["+native+"]"

        #TODO figure out groups
        #self.groups[gName]=group
        
        if type=="Anchor":
            self.anchors[name]=widget
        elif type=="MovePoint":
            self.movePoints.append(widget)

        widget.setLocation(x, y, w, h)
        #TODO figure out offsets

        #update the effective size of the view
        if x<self.left:
            self.left = x
        if x+w>self.right:
            self.right = x+w

        if y<self.top:
            self.top = y
        if y+h>self.bottom:
            self.bottom = y+h

    def view_finalize(self):
        '''
        After all members are added to the view, finalize 
        the bounds of the view itself
        '''
        #this is the effective bounds of the view
        self.baseX = self.left - MARGIN
        self.baseY = self.top - MARGIN
        self.w = (self.right-self.left) + (2*MARGIN)
        self.h = (self.bottom-self.top) + (2*MARGIN)

    def view_see(self, name):
        '''
        Called to search for a specific anchor by name and confirm it is visible.
        Returns the matching anchor OR None
        '''
        if name in self.anchors:
            return self.anchors[name]
        
        return None

    def view_find(self):
        '''
        Called to locate any anchor for the window and revise relative locations to 
        widgets.
        '''
        if len(self.anchors)==0:
            return None

        for name in self.anchors:
            if self.natives[name]==self.name:
                anchor = self.anchors[name]
                loc = anchor.find()
                if not (loc[0]==-1 and loc[1]==-1):
                    #determine offsets from widget; loc[x,y] is the CENTER of the anchor
                    offset = (loc[0] - anchor.baseX - int(anchor.w/2), loc[1] - anchor.baseY - int(anchor.h/2))
                    for w_name in self.widgets:
                        self.widgets[w_name].newOffsets(offset)
                    self.newOffsets(offset)
                    return name
        return None

    def view_getWidget(self, name:str):        
        if not (name in self.widgets):
            raise LookupError("In "+str(self)+" no widget with name "+name)
        
        return self.widgets[name]

    def view_DebugAll(self):
        '''
        Uses the image library debug feature to identify the GUI component.
        '''        
        for w in self.widgets:
            self.widgets[w].debugHighlight()

    def view_LogAll(self):
        '''
        Returns a single string containing a set of all widgets in the window and 
        their available functions.
        '''
        tmp = self.name+": find, setGroup, move, setLocation, click, capture, captureSmall\n"
        for w in self.widgets:
            tmp = tmp + self.widgets[w].LogAll()
        return tmp

    def view_Capture(self):
        return self.tester.capture2(self.x, self.y, self.w, self.h, None)
    
    def view_move(self, endX, endY):
        if len(self.movePoints) > 0:
            tmp = self.movePoints[0]
            tmp.move(endX, endY)
            self.view_find()
        else:
            raise IndexError("No MovePoint defined for "+self.name)

     #not used in view
    def debugHighlight(self):
        raise NotImplementedError(f"{self}.debugHighlight")

    def getState(self):
        raise NotImplementedError(f"{self}.getState")

    def write(self, _):
        raise NotImplementedError(f"{self}.write")

from widget import Widget

class Tab(Widget):
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self, name:str, imageLibrary, linkFunction, properties):
        Widget.__init__(self)
        self.configureWidget(imageLibrary)
        self.name = "Tab["+name+"]"
        self.linkFunction = linkFunction
        self.link = None
        if "Link" in properties:
            self.link = properties["Link"]

    def LogAll(self):
        return "\t"+self.name+": setGroup, read, click, doubleClick, capture, captureSmall\n"

    #redefined to deal with link capabilities
    def click(self):
        self.tester.click2( self.x, self.y, self.w, self.h)
        if self.link:
            self.linkFunction(self.link)

    #redefined to deal with link capabilities
    def doubleClick(self):
        self.tester.dclick2( self.x, self.y, self.w, self.h)
        if self.link:
            self.linkFunction(self.link)

    #not used in Tab
    def getState(self):
        raise NotImplementedError(f"{self}.getState")

    def move(self, *_):
        raise NotImplementedError(f"{self}.move")

    def write(self, _):
        raise NotImplementedError(f"{self}.write")

from widget import Widget

class List(Widget):
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self, name:str, imageLibrary):
        Widget.__init__(self)
        self.configureWidget(imageLibrary)
        self.name = "List["+name+"]"

    def LogAll(self):
        #TODO fix log all
        return "\t"+self.name+": setGroup, read, click, doubleClick, capture, captureSmall, getState\n"

    #not used in list
    def getState(self):
        raise NotImplementedError(f"{self}.getState")

    def move(self, *_):
        raise NotImplementedError(f"{self}.move")

    def write(self, _):
        raise NotImplementedError(f"{self}.write")

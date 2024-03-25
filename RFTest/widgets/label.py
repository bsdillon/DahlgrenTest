from widget import Widget

class Label(Widget):
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self, name:str, imageLibrary):
        Widget.__init__(self)
        self.configureWidget(imageLibrary)
        self.name = "Label["+name+"]"

    def LogAll(self):
        #TODO fix log all
        return "\t"+self.name+": setGroup, read, click, doubleClick, capture, captureSmall, getState\n"

    #not used in label
    def getState(self):
        raise NotImplementedError

    def move(self, *_):
        raise NotImplementedError

    def write(self, _):
        raise NotImplementedError

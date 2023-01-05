from widgets.widget import Widget

class Button(Widget):
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self, name, imageLibrary):
        Widget.__init__(self)
        self.configureWidget(imageLibrary)
        self.name = "Button["+name+"]"

    def LogAll(self):
        return "\t"+self.name+": read, click, doubleClick, capture, captureSmall\n"

    def write(self, _):
        raise NotImplementedError

    def move(self, *_):
        raise NotImplementedError
    
    def find(self):
        raise NotImplementedError

    def setGroup(self, _):
        raise NotImplementedError

    def getState(self):
        raise NotImplementedError

from widgets.widget import Widget

class Group(Widget):
    ROBOT_AUTO_KEYWORDS = False
    GROUP = "~group~"

    def __init__(self, name:str, imageLibrary):
        Widget.__init__(self, imageLibrary)
        self.name = "Group["+name+"]"
        self.widgets = []

    def add(self, widget:Widget):
        self.widgets.append(widget)

    def click(self):
        raise NotImplementedError

    def doubleClick(self):
        raise NotImplementedError

    def capture(self, _):
        raise NotImplementedError
            
    def captureSmall(self, *_):
        raise NotImplementedError

    def write(self, _):
        raise NotImplementedError

    def move(self, *_):
        raise NotImplementedError

    def find(self):
        raise NotImplementedError

    def setGroup(self, _):
        raise NotImplementedError

from widget import Widget

class Group(Widget):
    ROBOT_AUTO_KEYWORDS = False
    GROUP = "~group~"

    def __init__(self, name:str, imageLibrary):
        Widget.__init__(self)
        self.configureWidget(imageLibrary)
        self.name = "Group["+name+"]"
        self.widgets = []

    def add(self, widget:Widget):
        self.widgets.append(widget)

    #not used in Group
    def getState(self):
        raise NotImplementedError

    def move(self, *_):
        raise NotImplementedError

    def write(self, _):
        raise NotImplementedError

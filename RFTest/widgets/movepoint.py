from widgets.widget import Widget

class MovePoint(Widget):
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self, name:str, imageLibrary):
        Widget.__init__(self)
        self.configureWidget(imageLibrary)
        self.name = "MovePoint["+name+"]"

    def LogAll(self):
        return "\t"+self.name+": move, click, doubleClick, read, capture, captureSmall\n"

    def setGroup(self, _):
        raise NotImplementedError

    def write(self, _):
        raise NotImplementedError

    def getState(self):
        raise NotImplementedError

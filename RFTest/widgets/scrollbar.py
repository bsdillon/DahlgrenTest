from widgets.widget import Widget

class ScrollBar(Widget):
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self, name:str, imageLibrary):
        Widget.__init__(self, imageLibrary)
        self.name = "ScrollBar["+name+"]"

    def LogAll(self):
        return "\t"+self.name+": move, read, click, doubleClick, capture, captureSmall\n"

    def write(self, _):
        raise NotImplementedError

    def find(self):
        raise NotImplementedError

    def setGroup(self, _):
        raise NotImplementedError

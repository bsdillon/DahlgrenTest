from widgets.widget import Widget

class Anchor(Widget):
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self, name:str, imageLibrary):
        Widget.__init__(self, imageLibrary)
        self.name = "Achor["+name+"]"

    def LogAll(self):
        return "\t"+self.name+": find, click, doubleClick, capture, captureSmall\n"

    def setGroup(self, _):
        raise NotImplementedError

    def write(self, _):
        raise NotImplementedError

    def move(self, *_):
        raise NotImplementedError

    def read(self):
        raise NotImplementedError
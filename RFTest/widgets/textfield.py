from widgets.widget import Widget

class TextField(Widget):
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self, name:str, imageLibrary):
        Widget.__init__(self, imageLibrary)
        self.name = "TextField["+name+"]"

    def LogAll(self):
        return "\t"+self.name+": read, write, capture, captureSmall\n"

    def click(self):
        raise NotImplementedError

    def doubleClick(self):
        raise NotImplementedError

    def move(self, *_):
        raise NotImplementedError

    def find(self):
        raise NotImplementedError

    def setGroup(self, _):
        raise NotImplementedError

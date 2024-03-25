from widget import Widget

class Anchor(Widget):
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self, name:str, imageLibrary, properties):
        Widget.__init__(self)
        self.configureWidget(imageLibrary)
        self.name = "Achor["+name+"]"
        self.image = properties["Image file name"]

    def LogAll(self):
        return "\t"+self.name+": find, click, doubleClick, capture, captureSmall\n"

    def find(self):
        return self.tester.findElement(self.image)

    #not used in anchor
    def getState(self):
        raise NotImplementedError

    def move(self, *_):
        raise NotImplementedError

    def write(self, _):
        raise NotImplementedError

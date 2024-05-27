from widget import Widget

class Anchor(Widget):
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self, name:str, imageLibrary, properties):
        Widget.__init__(self)
        self.configureWidget(imageLibrary)
        self.name = "Achor["+name+"]"
        self.image = properties["Image file name"]
        self.LogToConsole(f"{self.name}: {self.image}")

    def LogAll(self):
        return "\t"+self.name+": find, click, doubleClick, capture, captureSmall\n"

    def find(self):
        self.LogToConsole(f"Anchor.Find {self.image}")
        return self.tester.findElement(self.image)

    #not used in anchor
    def getState(self):
        raise NotImplementedError(f"{self}.getState")

    def move(self, *_):
        raise NotImplementedError(f"{self}.move")

    def write(self, _):
        raise NotImplementedError(f"{self}.write")

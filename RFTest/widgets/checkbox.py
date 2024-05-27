from widget import Widget

class CheckBox(Widget):
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self, name:str, imageLibrary, properties):
        Widget.__init__(self)
        self.configureWidget(imageLibrary)
        self.name = "CheckBox["+name+"]"
        self.generateCheckedImages(path)
        if properties["Checked"]:
            self.checkedImage = properties["Checked"]
        else:
            raise LookupError("CheckBox: No checked image for "+str(self))

        if properties["Unchecked"]:
            self.uncheckedImage = properties["Unchecked"]
        else:
            raise LookupError("CheckBox: No unchecked image for "+str(self))

    def LogAll(self):
        return "\t"+self.name+": setGroup, read, click, doubleClick, capture, captureSmall, getState\n"

    #not used in checkbox
    def getState(self):
        raise NotImplementedError(f"{self}.getState")

    def move(self, *_):
        raise NotImplementedError(f"{self}.move")

    def write(self, _):
        raise NotImplementedError(f"{self}.write")

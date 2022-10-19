
class Tab():
    buttons = list
    text = list
    radio_buttons = ""

class Widget():
    def __init__(self, name, type, x, y, width, height, group):
        self.attributes={}
        self.attributes["name"]=name
        self.attributes["type"]=type
        self.attributes["X"]=x
        self.attributes["Y"]=y
        self.attributes["width"]=width
        self.attributes["height"]=height
        self.attributes["group"]=group
        #self.attributes[""]=

    def print(self):
        print(str(self.attributes))

    def to_dict(self):
        return str(self.attributes)



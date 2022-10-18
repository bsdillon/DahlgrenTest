from tokenize import group


class Tab():
    buttons = list
    text = list
    radio_buttons = ""


class Widget():
    name = ""
    type = ""
    X = 0
    Y = 0
    Width = 0
    Height = 0
    group = ""

    def __init__(self, name, type, x, y, width, height, group):
        self.name = name
        self.type = type
        self.X = x
        self.Y = y
        self.Width = width
        self.Height = height
        self.group = group

    def print(self):
        print("Name is: " + str(self.name) + "\nX is: " + str(self.X) + "\nY is: " +
              str(self.Y) + "\nWidth is: " + str(self.Width) + "\nHeight is: " + str(self.Height), "\nGroup is:" + str(self.group))

    def to_dict(self):
        return {"name": self.name, "type": self.type, "X": self.X, "Y": self.Y, "width": self.Width, "height": self.Height, "group": self.group}


test = Widget("", "type", 2, 3, 22, 33, "")

test.name = "iiii"

test.print()

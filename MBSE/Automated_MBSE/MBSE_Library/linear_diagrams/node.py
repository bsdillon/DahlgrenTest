####################################################
# Stores a node and all relative information for it#
####################################################

class Node:

    nodes = []
    # list of all the nodes

    def __init__(self, name):
        self.name = name  # the name of the node
        # //developer's note: Can probably get rid of boolean entirely and instead just check if the color String in not
        # // empty. Similar to how the box string is handled
        self.color = None  # empty string to be populated when called
        self.highlighOut = None  # by default there are no highlights
        self.highlighIn = None  # by default there are no highlights
        self.visible = True  # by default is visible
        self.add_nodes_list(self)  # calls add_nodes_list() on object creation to add object to list of all nodes
        self.box = ""  # empty string to represent no box

    def __str__(self):
        return "Node["+str(self.name)+"]"
    
    def printOut(self, lead):
        content = ""
        if self.visible:
            content += lead+ ' "' + self.name + '" as ' + self.tightName()
            if self.color:
                content += " #" + self.get_color()
            if self.highlighOut:
                content += " #"+self.highlighOut
            elif self.highlighIn:
                content += " #"+self.highlighIn
            content += "\n"
        return content

    def tightName(self):
        return self.name.replace(" ", "")

    def get_name(self):
        return self.name

    def has_color(self):
        return self.color

    def set_color(self, color):
        self.color = color

    def get_color(self):
        return self.color

    def get_highlighted_in(self):
        return self.highlighIn

    def set_highlighted_in(self, color:str):
        self.highlighIn = color

    def get_highlighted_out(self):
        return self.highlighOut

    def set_highlighted_out(self, color:str):
        self.highlighOut = color

    def is_visible(self):
        return self.visible

    def set_hidden(self):
        self.visible = False

    def get_box(self):
        return self.box

    def set_box_name(self, box):
        self.box = box

    @staticmethod
    def get_nodes():
        return Node.nodes

    @staticmethod
    def add_nodes_list(node):
        node.nodes.append(node)

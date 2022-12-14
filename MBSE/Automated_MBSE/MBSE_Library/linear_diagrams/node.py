####################################################
# Stores a node and all relative information for it#
####################################################

class Node:

    nodes = []
    # list of all the nodes

    def __init__(self, name):
        self.name = name  # the name of the node
        self.has_color = False  # by default there is no color
        # //developer's note: Can probably get rid of boolean entirely and instead just check if the color String in not
        # // empty. Similar to how the box string is handled
        self.color = ""  # empty string to be populated when called
        self.highlighted_out = False  # by default there are no highlights
        self.highlighted_in = False  # by default there are no highlights
        self.importance = True  # by default is important
        self.add_nodes_list(self)  # calls add_nodes_list() on object creation to add object to list of all nodes
        self.box = ""  # empty string to represent no box

    def get_name(self):
        return self.name

    def has_color(self):
        return self.has_color

    def set_color(self, color):
        self.has_color = True
        self.color = color

    def get_color(self):
        return self.color

    def get_highlighted_in(self):
        return self.highlighted_in

    def set_highlighted_in(self):
        self.highlighted_in = True

    def get_highlighted_out(self):
        return self.highlighted_out

    def set_highlighted_out(self):
        self.highlighted_out = True

    def get_importance(self):
        return self.importance

    def set_importance(self):
        self.importance = False

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

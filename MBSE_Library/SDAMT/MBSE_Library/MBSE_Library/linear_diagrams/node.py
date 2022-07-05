class Node:

    nodes = []

    def __init__(self, name):
        self.name = name
        self.has_color = False
        self.color = ""
        self.highlighted_out = False
        self.highlighted_in = False
        self.importance = True
        self.add_nodes_list(self)
        self.box = ""

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

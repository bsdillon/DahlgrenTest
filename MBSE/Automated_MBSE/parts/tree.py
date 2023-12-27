####################################################
# Stores a node and all relative information for it#
####################################################

class TreeNode:

    def __init__(self, name=""):
        self.name = name
        self.children = []
        self.parent = None
        self.actual = None

    def __str__(self):
        return "TreeNode["+str(self.name)+"]"
    
    def get_name(self):
        return self.name

    def setParent(self, parent):
        self.parent = parent

    def addChild(self, child):
        self.children.append(child)
        child.setParent(self)

    def getChildren(self):
        return self.children.copy()

    def getParent(self):
        return self.parent

    def setActual(self, other):
        self.actual = other

    def getActual(self):
        return self.actual

    def getDepth(self):
        if self.parent:
            return self.parent.getDepth()+1

        return 1
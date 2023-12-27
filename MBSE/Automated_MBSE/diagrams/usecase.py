import sys
import os
import pickle
import csv

from diagrams.nodemanager import NodeManager
from parts.node import Node
from parts.style import ActorStyle

class UseCaseDiagram(NodeManager):
    def __init__(self):
        NodeManager.__init__(self)
        self.actorStyle = ActorStyle.Stick

    def setActorStyle(self, style:ActorStyle):
        self.actorStyle = style

    def REAL_print_usecase_diagram(self, fileName):
        file = open(fileName, "w")
        content = "@startuml\n"

        content += "usecase \"Any name of use case here\" as case1\n"
        content += "actor \"Some actor\" as actor1\n"
        content += "actor \"Different actor\" as actor2\n"

        content += "@enduml"
        file.writelines(content)
        file.close()
        print("Use Case Diagram created successfully")


    def print_usecase_diagram(self, fileName):
        file = open(fileName, "w")
        content = "@startuml\n"
        if self.actorStyle == ActorStyle.Bust:
            content += "skinparam actorStyle awesome\n"
        elif self.actorStyle == ActorStyle.Cube:
            content += "skinparam actorStyle hollow\n"
        else: #default case is stick figure
            content += "skinparam actorStyle stick man\n"

        #print only nodes without packages
        for n in self.nodes:
            node = self.nodes[n]
            if node.get_box()=="":
                content += node.printOut()

        #some package
        for pName in self.superNodes:
            content += "package "+ pName +" {\n"
            for n in self.superNodes[pName].getNodes():
                content += n.printOut()
            content += "}\n"



        content += "@enduml"
        file.writelines(content)
        file.close()
        print("Use Case Diagram created successfully")


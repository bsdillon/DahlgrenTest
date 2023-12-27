import sys
import os
import pickle
import csv

from diagrams.linear import LinearDiagram
from parts.node import Node, SuperNode
from parts.tree import TreeNode
from parts.style import ActorStyle, Sprite

MAX_PAGE = 50

class SwimLaneDiagram(LinearDiagram):
    def __init__(self, filename):
        LinearDiagram.__init__(self, filename)
        self.swimlanes={}

    def createSwimLane(self,name,type,sprite=None, spriteColor=None, image=None):
        if name in self.swimlanes:
            raise Exception("Already have swim lane "+name)

        self.swimlanes[name]= SuperNode(name, type=type, sprite=sprite, spriteColor=spriteColor, image=image)

    def print_swimlane_diagram(self, fileName):
        file = open(fileName, "w")
        content = "@startuml\n"
        content += ActorStyle.printActorStyle()
        content += Sprite.RED_AIR
        content += Sprite.RED_SEA
        content += Sprite.BLUE_AIR
        content += Sprite.BLUE_SEA
        content += Sprite.GREEN_AIR
        content += Sprite.GREEN_SEA
        content += Sprite.YELLOW_AIR
        content += Sprite.YELLOW_SEA
        content += "\n"

        #this is a series of lifelines vertically across the page with connections between

        for key in self.swimlanes:
            n = self.swimlanes[key]
            content += n.printOut()
        content += "\n"

        count = 0
        page = 1
        sequenceStatus = {}
        i = 0
        for o in self.allRelationships:
            i = i+1
            count = count + 1
            s = self.nodes[o.get_sender()]
            r = self.nodes[o.get_receiver()]
            sequence = o.get_sequence()
            if count>=MAX_PAGE and not sequence:
                count = 0
                content += "newpage ...Page"+str(page)+"...\n"
                page = page + 1

            sName = s.get_tightName()

            content += "rnote over "+sName+"\n" + str(o.get_label())+"\nendrnote\n\n"
                
            #arrow shaft
            content += sName + " -"  + ">(30) " + r.get_tightName() + "\n\n"

        content += "@enduml"
        file.writelines(content)
        file.close()
        print("Swim Lane Diagram created successfully")


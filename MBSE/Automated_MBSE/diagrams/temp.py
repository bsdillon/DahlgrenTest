import sys
import os
import pickle
import csv

from diagrams.nodemanager import NodeManager
from parts.node import Node, SuperNode
from parts.tree import TreeNode
from parts.style import ActorStyle, Sprite

class SwimLaneDiagram(NodeManager):
    def __init__(self):
        NodeManager.__init__(self)
        self.connections = []
        self.superhead = TreeNode()
        self.aliasMap = {}

    def createSwimLane(self,name,type,sprite=None, spriteColor=None, image=None):
        if name in self.superNodes:
            raise Exception("Already have swim lane "+name)

        self.superNodes[name]= SuperNode(name, type=type, sprite=sprite, spriteColor=spriteColor, image=image)

    def createUseCase(self,name,text,lname):
        if not (lname in self.superNodes):
            raise Exception("No known swim lane "+lname)

        self.nodes[name]= Node(text, type="rectangle", tightName=name)
        self.superNodes[lname].addNode(self.nodes[name])

    def connectUseCases(self,start,end):
        if not start in self.nodes:
            raise Exception("Node "+start+" not found")
        s = self.nodes[start]

        if not end in self.nodes:
            raise Exception("Node "+end+" not found")
        e = self.nodes[end]

        if not s.getTreeNode():
            s.setTreeNode(TreeNode(start))
        tn_s = s.getTreeNode()

        if not e.getTreeNode():
            e.setTreeNode(TreeNode(end))
        tn_e = e.getTreeNode()

        tn_s.addChild(tn_e)
        self.connections.append((start,end))

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

        content += "skinparam interface {\n"
        content += "  borderColor Red\n"
        content += "  backgroundColor Red\n"
        content += "  fontColor Red\n"
        content += "}\n\n"
        #Transparent

        maxDepth = -1
        for pName in self.superNodes:
            for n in self.superNodes[pName].getNodes():
                tree = n.getTreeNode()
                if tree:
                    depth = tree.getDepth()
                    if depth>maxDepth:
                        maxDepth = depth

        print("Maximum depth is "+str(maxDepth))

        connections = []
        lastLane = None
        y = 0
        for pName in self.superNodes:
            content += "rectangle {\n"

            content += "  "+self.superNodes[pName].printOut()
            laneName = self.superNodes[pName].get_tightname()
            print("Rectangle "+laneName)

            if lastLane:
                connections.append(lastLane +"-[#FF00FF]d->"+laneName+"\n")
                connections.append(laneName +"-[#FF00FF]u->"+lastLane+"\n")

            lastLane = laneName
            lastHoriz = laneName

            for n in self.superNodes[pName].getNodes():
                tn_n = n.getTreeNode()
                depth_n = tn_n.getDepth()
                print("  "+str(n)+" at depth "+str(depth_n))

                if lastHoriz in self.nodes:
                    tn_lh = self.nodes[lastHoriz].getTreeNode()
                    depth_lh = tn_lh.getDepth()
                    print("  "+str(self.nodes[lastHoriz])+" at depth "+str(depth_lh))
                else:
                    depth_lh = 0
                    print("  Title node "+lastHoriz+" at depth "+str(depth_lh))

                print("Looking at values "+str(range(depth_lh + 1, depth_n)))

                #fill in all the interfaces
                for x in range(depth_lh + 1, depth_n ):
                    #make two different nodes
                    c1 = "c"+str(x)+"_"+str(y)
                    c2 = "c"+str(x)+"_"+str(y)+"_1"
                    print("    creating #FF00FF nodes "+c1+" and "+c2)
                    content += "  interface "+c1+"\n"
                    content += "  interface "+c2+"\n"

                    #connect them from left-to-right
                    connections.append(lastHoriz +"-[#FF00FF]r->"+c1+"\n")
                    connections.append(c1+"-[#FF00FF]r->"+c2+"\n")
                    lastHoriz = c2

                    if y>0:
                        lastY = y-1
                        cL1 = "c"+str(x)+"_"+str(lastY)
                        connections.append(cL1 +"-[#FF00FF]d->"+c1+"\n")
                        connections.append(c1 +"-[#FF00FF]u->"+cL1+"\n")

                nextC = "c"+str(depth_n)+"_"+str(y)
                content += "  "+n.printOut(alias=nextC)
                self.aliasMap[n.get_tightName()]=nextC
                connections.append(lastHoriz +"-[#FF00FF]r->"+nextC+"\n")

                if y>0:
                    lastY = y-1
                    cL1 = "c"+str(depth_n)+"_"+str(lastY)
                    connections.append(cL1 +"-[#FF00FF]d->"+nextC+"\n")
                    connections.append(nextC +"-[#FF00FF]u->"+cL1+"\n")

                lastHoriz = nextC
                self.nodes[nextC]=n #necessary because we are re-aliasing between loops

            #from depth_n to maxDepth
            for x in range(depth_n + 1, maxDepth+1 ):
                #make two different nodes
                c1 = "c"+str(x)+"_"+str(y)
                c2 = "c"+str(x)+"_"+str(y)+"_1"
                print("    creating #FF00FF nodes "+c1+" and "+c2)
                content += "  interface "+c1+"\n"
                content += "  interface "+c2+"\n"

                #connect them from left-to-right
                connections.append(lastHoriz +"-[#FF00FF]r->"+c1+"\n")
                connections.append(c1+"-[#FF00FF]r->"+c2+"\n")
                lastHoriz = c2

                if y>0:
                    lastY = y-1
                    cL1 = "c"+str(x)+"_"+str(lastY)
                    connections.append(cL1 +"-[#FF00FF]d->"+c1+"\n")
                    connections.append(c1 +"-[#FF00FF]u->"+cL1+"\n")

            y = y+1
            content += "}\n\n"

        for pair in self.connections:
            a1 = self.aliasMap[pair[0]]
            a2 = self.aliasMap[pair[1]]

            connections.append(a1 +"----u->"+a2+"\n")

        for c in connections:
            content += c

        content += "@enduml"
        file.writelines(content)
        file.close()
        print("Swim Lane Diagram created successfully")


import sys
import os
import pickle
import csv

from parts.node import Node, SuperNode

class NodeManager:
    def __init__(self):
        self.nodes = {} # Unique nodes may be visited many times.
        self.superNodes = {}

    def createNode(self, name, type):
        if name in self.nodes:
            raise Exception("Cannot add duplicate node "+name)

        self.nodes[name]= Node(name, type)

    def setNodeColor(self, node:str, color:str):
        if not node in self.nodes:
            raise Exception("Cannot find unknown node "+node)
        
        self.nodes[node].set_color(color)

    def highlightSender(self, node:str, color:str="yellow"):
        if not node in self.nodes:
            raise "Cannot find unknown node "+node
        
        self.nodes[node].set_highlighted_out(color)

    def highlightReceiver(self, node:str, color:str="powderblue"):
        if not node in self.nodes:
            raise "Cannot find unknown node "+node
        
        self.nodes[node].set_highlighted_in(color)

    def hideNode(self, node:str):
        if not node in self.nodes:
            raise "Cannot find unknown node "+node
        
        self.nodes[node].set_hidden()

    def createSuperNode(self, sn_name:str, n_name:[]):
        if sn_name in self.superNodes:
            raise "Cannot create second supernode named "+sn_name
        
        for n in n_name:
            if not n in self.nodes:
                raise "Cannot add unknown node "+n+" to supernode"
            node = self.nodes[n]
            if len(node.get_box())>0:
                raise "Cannot add "+str(node)+"; already in supernode "+node.get_box()
       
        self.superNodes[sn_name]= SuperNode(sn_name)
        for n in n_name:
            self.superNodes[sn_name].addNode(self.nodes[n])

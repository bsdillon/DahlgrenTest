from collections.abc import Iterable
import os
import pickle

from MBSE_Library import Relationships, Node
from MBSE_Library.linear_diagrams.relationships import Sequence
import csv

MAX_PAGE = 50

class LinearDiagram:
    def __init__(self,filename):
        #Model Members
        self.nodes = {} # Unique nodes may be visited many times.
        self.superNodes = {}
        self.uniqueRelationships = {} # Unique relationships are based on s/r/label keys
        self.allRelationships = [] # reuses the same relationships repeatedly

        # Load file as in, csv file, not loading in a previously created model but rather creating

        with open(filename, 'r') as file:  # Reads a csv file and appends it to the uniqueSender/uniqueReceiver/uniqueLabel arrays
            reader = csv.reader(file, delimiter=',')
            for row in reader:
                # add new nodes
                if row[0] not in self.nodes:
                    self.nodes[row[0]]= Node(row[0])
                if row[1] not in self.nodes:
                    self.nodes[row[1]]= Node(row[1])

                #assume a new relationship
                r = Relationships(row)
                key = str(r)

                #increment unique relationships
                if  key in self.uniqueRelationships:
                    self.uniqueRelationships[key].increment()
                else:
                    self.uniqueRelationships[key]=r

                #ALWAYS use new relationships; this allows individual instances to be
                #aligned with different findings in the figure.
                self.allRelationships.append(r)

    def setNodeColor(self, node:str, color:str):
        if not node in self.nodes:
            raise "Cannot find unknown node "+node
        
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

    def createSuperNode(self, sn_name:str, n_name:Iterable[str]):
        if sn_name in self.superNodes:
            raise "Cannot create second supernode named "+sn_name
        
        for n in n_name:
            if not n in self.nodes:
                raise "Cannot add unknown node "+n+" to supernode"
            node = self.nodes[n]
            if len(node.get_box())>0:
                raise "Cannot add "+str(node)+"; already in supernode "+node.get_box()
       
        self.superNodes[sn_name]=[]
        for n in n_name:
            node = self.nodes[n]
            self.superNodes[sn_name].append(node)
            node.set_box_name(sn_name)

    def showEdgeCardinality(self, show:bool):
        Relationships.showCardinality = show

    def highlight_sequence(self, name:str, seq:Iterable[str], color:str="00FF00"):
        """
            Highlights any list of nodes following this sequence.
            Highlights a sequence of node in the linear diagram. Highlights all the edges between the nodes.

            BSD - This is known to be inefficient (pre-process to find the optimal mapping) and
            incorrect (if two sequences are back to back it will fail).

            Parameters
            ----------
            name: str
                The name for the sequence
            
            seq : [str]
                The name of the nodes to be highlighted in the diagram.

            color: str
                The desired color for this sequence
            """
    	#Find the Relationships sequences of same order
        found = [None]*(len(seq)-1)
        index = 0
        count = 1
        for r in self.allRelationships:
            if r.get_sender() == seq[index] and r.get_receiver() == seq[index+1]:

                #this relationships is in the sequence
                found[index]=r
                index = index + 1

                #end of sequence
                if index + 1 == len(seq):
                    newSq = Sequence(name+"-"+str(count), color)
                    count = count + 1

                    r.set_sequence(newSq)
                    for r2 in found:
                        r2.set_sequence(newSq)
                    found = [None]*(len(seq)-1)
                    index = 0

            else:
                #the sequence is broken; recover if we can
                allMatch = False
                #until we run out of matches or have a full match
                while index>0 and not allMatch:
                    #shift everything to the left
                    for i in range(index):
                        found[i]=found[i+1]

                    #does the substring match?
                    index = index -1
                    allMatch = True #assume there is a match
                    for i in range(index):
                        if found[i]!=seq[index]:
                            allMatch=False #break assumption

    def print_communication_diagram(self, fileName:str):
        #this is a loose diagram with each "node" floating and held together by edges
        file = open(fileName, "w")
        content = "@startuml\n"

        for key in self.superNodes:
            content += 'rectangle "' + key + '" {\n'
            for node in self.superNodes[key]:
                content += node.printOut('rectangle')
            content += "}\n"

        for key in self.nodes:
            n = self.nodes[key]
            if len(n.get_box())==0:
                #this node is NOT in a supernode
                content += n.printOut('agent')
            content += "\n"

        for key in self.uniqueRelationships:
            o = self.uniqueRelationships[key]
            s = self.nodes[o.get_sender()]
            r = self.nodes[o.get_receiver()]
            if s.is_visible() and r.is_visible():
                #both sender/receiver are visible
                content += s.tightName()
                content += " -"

                if  s.get_highlighted_out():
                    content += "[#"+s.get_highlighted_out()+",plain,thickness=4]"
                elif r.get_highlighted_in():
                    content += "[#"+r.get_highlighted_in()+",plain,thickness=4]"

                content += "->> "
                content += r.tightName()
                content += " : "

                content += o.printLabel()
                content += " \n"
        content += "@enduml"
        file.writelines(content)
        file.close()
        print("Communication Diagram created successfully")

    def print_sequence_diagram(self, fileName):
        #this is a series of lifelines vertically across the page with connections between

        file = open(fileName, "w")
        content = "@startuml\n"

        for key in self.superNodes:
            content += 'box "' + key + '"\n'
            for node in self.superNodes[key]:
                content += node.printOut('participant')
            content += "end box\n"

        for key in self.nodes:
            n = self.nodes[key]
            if len(n.get_box())==0:
                #this node is NOT in a supernode
                content += n.printOut('participant')
            content += "\n"

        lastSequence = None
        count = 0
        page = 1
        for o in self.allRelationships:
            count = count + 1
            s = self.nodes[o.get_sender()]
            r = self.nodes[o.get_receiver()]
            sequence = o.get_sequence()
            if count>=MAX_PAGE and not sequence:
                count = 0
                content += "newpage ...Page"+str(page)+"...\n"
                page = page + 1
                
            if  sequence and not lastSequence:
                count = count + 1  #added for a box header
                #this is a new group
                content += "skinparam SequenceGroupBackgroundColor #"+sequence.getTitleColor()+"\n"
                content += "skinparam SequenceGroupBorderColor #"+sequence.getTitleColor()+"\n"
                content += "skinparam SequenceGroupHeaderFontColor #"+sequence.getFontColor()+"\n"
                content += "skinparam SequenceGroupBodyBackgroundColor #"+sequence.getBGColor()+"\n"
                content += "group "+sequence.getName()+" \n"
                lastSequence = sequence
            elif  not sequence and lastSequence:
                #this is AFTER the group
                content += "end \n"
                lastSequence = None
            
            if s.is_visible() and r.is_visible():
                #both sender/receiver are important

                content += s.tightName()
                content += " -"
                if  sequence:
                    content += "[#"+sequence.getLinkColor()+"]>"
                elif s.get_highlighted_out():
                    content += "[#"+s.get_highlighted_out()+"]>"
                elif r.get_highlighted_in():
                    content += "[#"+r.get_highlighted_in()+"]>"
                else:
                    content += ">"

                content += r.tightName()
                content += " : "
                content += str(o.get_label()).replace(" ", "")
                content += " \n"
        content += "@enduml"
        file.writelines(content)
        file.close()
        print("Sequence Diagram created successfully")

    # @staticmethod
    # def ld_compare(model1, model2):  # compares two linear diagrams and shows the differences between them. Only works
    #     # for sequence diagrams and does not show the changes between edges yet, only differences between nodes

    #     # create model of first diagram
    #     uniqueSender1 = []
    #     uniqueReceiver1 = []
    #     message1 = []
    #     order1 = []
    #     node1 = []

    #     # create model of second diagram
    #     uniqueSender2 = []
    #     uniqueReceiver2 = []
    #     message2 = []
    #     order2 = []
    #     node2 = []

    #     # Load model1 to model
    #     cd = os.path.join(model1, "linear_diagrams", "nodes")
    #     for file in os.scandir(cd):
    #         name, extension = os.path.splitext(file)
    #         if extension == '.txt':
    #             file_pi2 = open(file, 'rb')
    #             c = pickle.load(file_pi2)
    #             node1.append(c)

    #     with open(model1 + "/linear_diagrams/edges/edges.csv", 'r') as file:
    #         reader = csv.reader(file, delimiter=',')
    #         for row in reader:
    #             uniqueSender1.append(row[0])
    #             uniqueReceiver1.append(row[1])
    #             message1.append(row[2])

    #     for i in range(len(uniqueSender1)):
    #         updated = False
    #         for o in order1:
    #             if o.get_sender() == uniqueSender1[i] and o.get_receiver() == uniqueReceiver1[i]:
    #                 o.increment()
    #                 updated = True
    #                 break
    #         if not updated:
    #             r = Relationships(uniqueSender1[i], uniqueReceiver1[i])
    #             order1.append(r)
    #     cd = os.path.join(model2, "linear_diagrams", "nodes")
    #     for file in os.scandir(cd):
    #         name, extension = os.path.splitext(file)
    #         if extension == '.txt':
    #             file_pi2 = open(file, 'rb')
    #             c = pickle.load(file_pi2)
    #             node2.append(c)

    #     # Load model2 to model
    #     with open(model2 + "/linear_diagrams/edges/edges.csv", 'r') as file:
    #         reader = csv.reader(file, delimiter=',')
    #         for row in reader:
    #             uniqueSender2.append(row[0])
    #             uniqueReceiver2.append(row[1])
    #             message2.append(row[2])

    #     for i in range(len(uniqueSender2)):
    #         updated = False
    #         for o in order2:
    #             if o.get_sender() == uniqueSender2[i] and o.get_receiver() == uniqueReceiver2[i]:
    #                 o.increment()
    #                 updated = True
    #                 break
    #         if not updated:
    #             r = Relationships(uniqueSender2[i], uniqueReceiver2[i])
    #             order2.append(r)

    #     # Compare/print diagrams (Sequence)
    #     file = open("compared.txt", "w")
    #     content = "@startuml\n"

    #     nodecopy1 = []
    #     nodecopy2 = []

    #     for n1 in node1:
    #         nodecopy1.append(n1)
    #     for n2 in node2:
    #         nodecopy2.append(n2)

    #     for n1 in node1:
    #         for n2 in node2:
    #             if n1.get_name() == n2.get_name():
    #                 nodecopy1.remove(n1)
    #                 nodecopy2.remove(n2)
    #                 if n1.is_visible() and n2.is_visible():
    #                     content += 'participant "' + str(n1.get_name()) + '" as ' + n1.tightName()
    #                     content += "\n"
    #                 elif n1.is_visible():
    #                     content += 'participant "' + n1.get_name() + '" as ' + n1.tightName() + " #red"
    #                     content += "\n"
    #                 elif n2.is_visible():
    #                     content += 'participant "' + n1.get_name() + '" as ' + n1.tightName()+" #green"
    #                     content += "\n"
    #                 else:
    #                     print("error comparing " + n1.get_name() + " and " + n2.get_name())
    #     for n in nodecopy1:
    #         content += 'participant "' + n.get_name() + '" as ' + n.tightName() + " #red"
    #         content += "\n"
    #     for n in nodecopy2:
    #         content += 'participant "' + n.get_name() + '" as ' + n.tightName() + " #green"
    #         content += "\n"

    #     # TODO
    #     # need to compare edges in the comparing of two linear diagrams
    #     # below code prints out a normal sequence diagram, for reference when writing edge comparison
    #     '''for i in range(len(LinearDiagram.uniqueSender)):
    #         stop = False
    #         for n in LinearDiagram.nodes:
    #             if LinearDiagram.uniqueSender[i] == n.get_name() and not n.is_visible():
    #                 stop = True
    #         for n in LinearDiagram.nodes:
    #             if LinearDiagram.uniqueReceiver[i] == n.get_name() and not n.is_visible():
    #                 stop = True
    #         if not stop:
    #             out_list = []
    #             in_list = []
    #             for n in LinearDiagram.nodes:
    #                 if n.get_highlighted_in():
    #                     in_list.append(n.get_name())
    #                 if n.get_highlighted_out():
    #                     out_list.append(n.get_name())

    #             content += str(LinearDiagram.uniqueSender[i]).replace(" ", "")
    #             content += " -"
    #             if LinearDiagram.uniqueSender[i] in out_list:
    #                 content += "[#yellow]>"
    #             elif LinearDiagram.uniqueReceiver[i] in in_list:
    #                 content += "[#lightblue]>"
    #             else:
    #                 content += ">"

    #             content += str(LinearDiagram.uniqueReceiver[i]).replace(" ", "")
    #             content += " : "
    #             content += str(LinearDiagram.uniqueLabel[i]).replace(" ", "")
    #             content += " \n"'''
    #     content += "@enduml"
    #     file.writelines(content)
    #     file.close()
    #     print("Diagrams compared successfully")

#==========================================
#            Load/Save to File
#==========================================

    # @staticmethod
    # def load_linear_diagram(filename):
    #     """
    #         Loads the linear diagram.

    #         Loads the linear diagram digital model that can be edited now.

    #         Parameters
    #         ----------
    #         filename : str
    #             The name of the folder that you want the model to be loaded from.

    #         """
    #     cd = os.path.join(filename, "linear_diagrams", "nodes")
    #     for file in os.scandir(cd):
    #         name, extension = os.path.splitext(file)
    #         if extension == '.txt':
    #             file_pi2 = open(file, 'rb')
    #             c = pickle.load(file_pi2)
    #             LinearDiagram.nodes.append(c)

    #     with open(filename + "/linear_diagrams/edges/edges.csv", 'r') as file:
    #         reader = csv.reader(file, delimiter=',')
    #         for row in reader:
    #             LinearDiagram.sender.append(row[0])
    #             LinearDiagram.receiver.append(row[1])
    #             LinearDiagram.message_type.append(row[2])

    #     for i in range(len(LinearDiagram.sender)):  # searches if a node sends to and receives to the same multiple
    #         # times and then increments
    #         updated = False
    #         for o in LinearDiagram.order_list:
    #             if o.get_sender() == LinearDiagram.sender[i] and o.get_receiver() == LinearDiagram.receiver[i]:
    #                 o.increment()
    #                 updated = True
    #                 break
    #         if not updated:
    #             r = Relationships(LinearDiagram.sender[i], LinearDiagram.receiver[i])
    #             LinearDiagram.order_list.append(r)

    # @staticmethod
    # def save_linear_diagram(filename):
    #     """
    #         Saves the linear diagram.

    #         Saves the linear diagram digital model that can be loaded into the library later.

    #         Parameters
    #         ----------
    #         filename : str
    #             The name of the folder that you want the model to be saved in.

    #         """
    #     cd = os.path.join(filename, "linear_diagrams")
    #     os.makedirs(cd)

    #     cd = os.path.join(filename, "linear_diagrams", "nodes")
    #     os.makedirs(cd)
    #     i = 1
    #     for n in Node.get_nodes():
    #         filehandler = open(cd + "/" + str(i) + n.get_name() + ".txt", 'wb')
    #         pickle.dump(n, filehandler)
    #         i += 1

    #     cd = os.path.join(filename, "linear_diagrams", "edges")
    #     os.makedirs(cd)
    #     f = open(filename + "/linear_diagrams/edges/edges.csv", "w")
    #     content = ""
    #     for i in range(len(LinearDiagram.sender)):
    #         content += (LinearDiagram.sender[i]+","+LinearDiagram.receiver[i]+","+LinearDiagram.message_type[i]+"\n")
    #     f.write(content)
    #     f.close()

    #     i = 1
    #     cd = os.path.join(filename, "linear_diagrams", "receiver")
    #     os.makedirs(cd)
    #     for r in LinearDiagram.receiver:
    #         filehandler = open(cd + "/" + str(i) + ".txt", 'wb')
    #         pickle.dump(r, filehandler)
    #         i += 1
    #     i = 1
    #     cd = os.path.join(filename, "linear_diagrams", "message_type")
    #     os.makedirs(cd)
    #     for m in LinearDiagram.message_type:
    #         filehandler = open(cd + "/" + str(i) + ".txt", 'wb')
    #         pickle.dump(m, filehandler)
    #         i += 1

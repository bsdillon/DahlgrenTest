import os
import pickle
import csv

from diagrams.nodemanager import NodeManager
from parts.node import Node
from parts.relationships import Relationships, Sequence, Schemata

MAX_PAGE = 50

class TIME_CHECKS:
    NotChecked=0
    Passed=1
    Failed=-1

class SeqStatus:
    Starting=0
    Last=1
    Other=2
    Broken=-1

class LinearDiagram(NodeManager):
    def __init__(self,filename):
        NodeManager.__init__(self)
        #Model Members
        self.uniqueRelationships = {} # Unique relationships are based on s/r/label keys
        self.allRelationships = [] # reuses the same relationships repeatedly

        # Load file as in, csv file, not loading in a previously created model but rather creating

        with open(filename, 'r') as file:  # Reads a csv file and appends it to the uniqueSender/uniqueReceiver/uniqueLabel arrays
            reader = csv.reader(file, delimiter=',')
            for row in reader:
                # add new nodes
                if row[0] not in self.nodes:    
                    self.nodes[row[0]]= Node(row[0], 'participant')
                if row[1] not in self.nodes:
                    self.nodes[row[1]]= Node(row[1], 'participant')

                #assume a new relationship
                r = Relationships(row)
                key = r.get_key()

                #increment unique relationships
                if  key in self.uniqueRelationships:
                    self.uniqueRelationships[key].increment()
                else:
                    self.uniqueRelationships[key]=r

                #ALWAYS use new relationships; this allows individual instances to be
                #aligned with different findings in the figure.
                self.allRelationships.append(r)

    def createNode(self, name, type):
        if name in self.nodes:
            raise Exception("Cannot add duplicate node "+name)

        self.nodes[name]= Node(name, type)

    def highlightMessage(self, label:str, color:str="green"):
        found = False
        for key in self.uniqueRelationships:
            r = self.uniqueRelationships[key]
            if r.get_label()==label:
                found = True
                r.set_color(color)

        for r in self.allRelationships:
            if r.get_label()==label:
                found = True
                r.set_color(color)

        if not found:
            raise "Cannot find unknown message "+label

    def showEdgeCardinality(self, show:bool):
        Relationships.showCardinality = show

    def highlightMessageSequence(self, name:str, full_seq:[], color:str="00FF00", timeParam:str=None, maxTime_ms:int=1000, showBroken=False):
        """
            Highlights any list of messages following this sequence.
            Highlights a sequence of node in the linear diagram. Highlights all the edges between the nodes.

            BSD - This is known to be inefficient (pre-process to find the optimal mapping) and
            incorrect (if two sequences are back to back it will fail).

            Parameters
            ----------
            name: str
                The name for the sequence
            
            full_seq : [str]
                The name of the messages to be highlighted in the diagram.

            color: str
                The desired color for this sequence

            timeParam:str
                By default all sequence members need to be in strict order. If a timeParameter is identified, then the gap between
                members can be measured.

            maxTime_ms:int
                By default the maximum allowed gap in a sequence is 1000ms or 1 second. It can be tuned by the call to any value.
            """
        #verify that the time variable exists
        timeIndex = -1
        if timeParam:
            timeIndex = Schemata.getTitleIndex(timeParam)

            if timeIndex==-1:
                raise Exception("Invalid time parameter "+timeParam+" for sequence")

        #parse the sequence
        seq = []
        params = []
        knownValues = {}
        for sub in full_seq:
            first = sub.find("[")
            second = sub.find("]")
            tmp = {}
            if first > -1 and second > first:
                # there is a parameter set
                pieces = list(map(str.strip, sub[first+1:second].split(',')))
                for p in pieces:
                    pieces2 = list(map(str.strip, p.split('=')))
                    pname = pieces2[0]
                    pval = None
                    if len(pieces2)>1:
                        pval = pieces2[1]
                    tmp[pname]=pval
                    knownValues[pname]=None #this just creates a storage space
                    seq.append(sub[0:first])
            else:
                seq.append(sub)

            #either empty or with new parameters
            params.append(tmp)

    	#Find the Relationships sequences of same order
        found = []
        index = 0
        count = 1
        lastTime = -1
        lastNode = None
        startIndex = -1
        i = 0
        while i < len(self.allRelationships):
            r = self.allRelationships[i]
            if r.get_sequence():
                #this relationship is already part of a sequence and we skip it.
                i = i+1
                continue
            
            #deal with time issue if it is relevant
            passTime = TIME_CHECKS.NotChecked
            currTime = -1
            if index>0 and timeIndex > -1:
                currTime = float(r.getParamAt(timeIndex))
                if (1000*(currTime - lastTime) <= maxTime_ms):
                    passTime = TIME_CHECKS.Passed
                else:
                    passTime = TIME_CHECKS.Failed

            match = False
            if lastNode and not (r.get_sender()==lastNode):
                #this cannot be the right link without the receiver
                pass
            elif (not passTime == TIME_CHECKS.Failed) and (r.get_label() == seq[index]):
                #provisionally this relationships is in the sequence
                match=True
                #let's check the parameters
                for p in params[index]:
                    v = params[index][p]
                    if v==None:
                        #we want the value of the param
                        v2 = r.getParam(p)
                        #we will check this for knownValues
                        if not knownValues[p]:
                            #has not been seen yet
                            knownValues[p]=v2

                        if knownValues[p]!=v2:
                            #mismatch on some previous version of p
                            match=False
                    else:
                        #we want to find and validate the value
                        matchesType = r.validateParam(p,v)
                        match = match and matchesType
                        if matchesType:
                            #so far all is good; does it match our values
                            if not knownValues[p]:
                                #has not been seen yet
                                knownValues[p]=v

                            if knownValues[p]!=v:
                                #mismatch on some previous version of p
                                match=False

                if match:
                    #this is definitely a match
                    found.append(r)
                    index = index + 1
                    lastTime = float(r.getParamAt(timeIndex))
                    lastNode = r.get_receiver()
                    if startIndex == -1:
                        startIndex = i

                    #end of sequence
                    if index == len(seq):
                        newSq = Sequence(name+"-"+str(count), color)
                        count = count + 1

                        for r2 in found:
                            r2.set_sequence(newSq)
                        found = []

                        #spins back to the 2nd element in the sequence 
                        #because there may be some other sequence in the middle.
                        i = startIndex
                        startIndex = -1
                        index = 0
                        lastNode=None
                        #reset the known values
                        for k in knownValues:
                            knownValues[k]=None

            #is is matched???
            if not (passTime == TIME_CHECKS.Failed):
                #this could be a pass or an unknown JUST because of time
                pass
            elif passTime == TIME_CHECKS.Failed or not match:
                #this is either a failure for time OR a mismatch,
                #but it can't be a mismatch until the time expires
                #the sequence is broken; we cannot recover

                if showBroken and index>0:
                    #we are going to mark this as a broken sequence
                    newSq = Sequence(name+"-"+str(count), color, broken=True)
                    count = count + 1

                    for r2 in found:
                        r2.set_sequence(newSq)

                #reset all members
                found = []
                i = startIndex
                startIndex = -1
                index = 0
                lastNode=None
                #reset the known values
                for k in knownValues:
                    knownValues[k]=None
            i = i+1

    def highlightNodeSequence(self, name:str, seq:[], color:str="00FF00"):
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
            for node in self.superNodes[key].getNodes():
                content += node.printOut("agent")
            content += "}\n"

        for key in self.nodes:
            n = self.nodes[key]
            if len(n.get_box())==0:
                #this node is NOT in a supernode
                content += n.printOut()

        for key in self.uniqueRelationships:
            o = self.uniqueRelationships[key]
            s = self.nodes[o.get_sender()]
            r = self.nodes[o.get_receiver()]

            if s.is_visible() and r.is_visible():
                #both sender/receiver are visible
                content += s.get_tightName()
                content += " -"

                setColor = o.get_color()
                if  setColor:
                    content += "[#"+setColor+",plain,thickness=4]"
                elif  s.get_highlighted_out():
                    content += "[#"+s.get_highlighted_out()+",plain,thickness=4]"
                elif r.get_highlighted_in():
                    content += "[#"+r.get_highlighted_in()+",plain,thickness=4]"

                content += "->> "
                content += r.get_tightName()
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
            for node in self.superNodes[key].getNodes():
                content += node.printOut()
            content += "end box\n"

        for key in self.nodes:
            n = self.nodes[key]
            if len(n.get_box())==0:
                #this node is NOT in a supernode
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
                
            if s.is_visible() and r.is_visible():
                #both sender/receiver are important
                #build the relationship in several steps
                mustClose = False

                if  sequence:
                    #manage sequences
                    if not sequence in sequenceStatus:
                        #this is a new group so we create a header
                        count = count + 1  #added for a box header
                        content += "skinparam SequenceGroupBackgroundColor #"+sequence.getTitleColor()+"\n"
                        content += "skinparam SequenceGroupBorderColor #"+sequence.getTitleColor()+"\n"
                        content += "skinparam SequenceGroupHeaderFontColor #"+sequence.getFontColor()+"\n"
                        content += "skinparam SequenceGroupBodyBackgroundColor #"+sequence.getBGColor()+"\n"
                        content += "group "+sequence.getName()+" \n"
                        mustClose = True
                        if sequence.isBroken() and sequence.getMemberCount() == 1:
                            sequenceStatus[sequence]=SeqStatus.Broken
                        else:
                            sequenceStatus[sequence]=SeqStatus.Starting
                    elif sequence.lastRelationship() == o:
                        #this is the LAST element of the sequence
                        if sequence.isBroken():
                            sequenceStatus[sequence]=SeqStatus.Broken
                        else:
                            sequenceStatus[sequence]=SeqStatus.Last
                    else:
                        #this is some other element in the sequence
                        sequenceStatus[sequence]=SeqStatus.Other

                #sender
                content += s.get_tightName()

                #arrow shaft contains some color and other details
                content += " -"  #begining
                setColor = o.get_color()
                if  setColor:
                    content += "[#"+setColor+"]>"
                elif  sequence and sequenceStatus[sequence]==SeqStatus.Broken:
                    content += "[#FF0000]>x "          
                elif  sequence:
                    #just a normal sequence
                    content += "[#"+sequence.getTitleColor()+"]> "
                elif s.get_highlighted_out():
                    content += "[#"+s.get_highlighted_out()+"]> "
                elif r.get_highlighted_in():
                    content += "[#"+r.get_highlighted_in()+"]> "
                else:
                    content += "> "

                #receiver
                content += r.get_tightName()

                #sequences may activate/deactivate lifelines
                if sequence:
                    if sequence.getMemberCount() == 1:
                        #this is a rare case with only ONE relationship
                        #so it doesn't have to deactivate anyone
                        pass
                    elif sequenceStatus[sequence]==SeqStatus.Broken:
                        content += " --"
                    elif sequenceStatus[sequence]==SeqStatus.Starting:
                        content += " ++ #"+sequence.getBGColor()+" "
                    elif sequenceStatus[sequence]==SeqStatus.Last:
                        content += " --"
                    else:
                        content += " --++ #"+sequence.getBGColor()+" "

                content += " : "
                content += str(i)+"_"+str(o.get_label()).replace(" ", "")
                content += " \n"

                if mustClose:
                    content += "end \n"

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
    #                     content += 'participant "' + str(n1.get_name()) + '" as ' + n1.get_tightName()
    #                     content += "\n"
    #                 elif n1.is_visible():
    #                     content += 'participant "' + n1.get_name() + '" as ' + n1.get_tightName() + " #red"
    #                     content += "\n"
    #                 elif n2.is_visible():
    #                     content += 'participant "' + n1.get_name() + '" as ' + n1.get_tightName()+" #green"
    #                     content += "\n"
    #                 else:
    #                     print("error comparing " + n1.get_name() + " and " + n2.get_name())
    #     for n in nodecopy1:
    #         content += 'participant "' + n.get_name() + '" as ' + n.get_tightName() + " #red"
    #         content += "\n"
    #     for n in nodecopy2:
    #         content += 'participant "' + n.get_name() + '" as ' + n.get_tightName() + " #green"
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

import math
from collections.abc import Iterable
from MBSE_Library.linear_diagrams.schemata import Schemata, Source, Sink, Label
##############################################################################
# Stores the amount of connections between nodes (for communication diagrams)#
##############################################################################
class Sequence:
    def __init__(self, name:str, color:str):
        self.name = name
        self.color = color
        self.BGColor = "DDDDDD"
        self.TColor = "AAAAAA"
        self.FColor = "000000"

        def formatHex2(val):
            v2 = str(hex(val)[2:4])
            if len(v2)==1:
                v2 = "0"+v2
            return v2

        if len(self.color)==6:
            try:
                rVal = int(self.color[0:2], 16)
                gVal = int(self.color[2:4], 16)
                bVal = int(self.color[4:6], 16)

                hsp = math.sqrt((0.299 * (rVal * rVal)) + (0.587 * (gVal * gVal)) + (0.114 * (bVal * bVal)) )
                if (hsp>127.5):
                    self.FColor = "FFFFFF"
                else:
                    self.FColor = "000000"

                #we need to "lighten" the color by increasing values by 50% toward white
                rValL = int(rVal + ((255-rVal)/2))
                gValL = int(gVal + ((255-gVal)/2))
                bValL = int(bVal + ((255-bVal)/2))

                self.BGColor = formatHex2(rValL)+formatHex2(gValL)+formatHex2(bValL)

                #we need to "darken" the color by decreasing values by 50% toward black
                rValL = int(rVal/2)
                gValL = int(gVal/2)
                bValL = int(bVal/2)

                self.TColor = formatHex2(rValL)+formatHex2(gValL)+formatHex2(bValL)
            except:
                #this failed, just keep white
                pass

    def __str__(self):
        return self.name

    def getName(self):
        return self.name
    
    def getBGColor(self):
        return self.BGColor

    def getTitleColor(self):
        return self.TColor

    def getFontColor(self):
        return self.FColor

    def getLinkColor(self):
        return self.TColor


class Relationships:
    schema = Schemata.DefaultSchema()
    schemaLength = 3
    SenderIndex = 0
    ReceiverIndex = 1
    LabelIndex = 2
    showCardinality = True

    @staticmethod
    def SetSchema(schema:Iterable[Schemata]):
        Relationships.schema = schema
        Relationships.schemaLength = len(schema)
        Relationships.SenderIndex = -1
        Relationships.ReceiverIndex = -1
        Relationships.LabelIndex = -1
        index = 0
        for s in schema:
            if s==Source:
                Relationships.SenderIndex = index
            elif s==Sink:
                Relationships.ReceiverIndex = index
            elif s==Label:
                Relationships.LabelIndex = index
            index = index + 1
        if Relationships.SenderIndex==-1 or Relationships.ReceiverIndex == -1 or Relationships.LabelIndex == -1:
            raise "Invalid Relationship Schema: must have Source, Sink, and Label in some position"

    def __init__(self, data:Iterable[str]):

        if len(data) != Relationships.schemaLength:
            raise "Invalid Relationship: must match schema cardinality  "+str(len(data))+"<>"+str(Relationships.schemaLength)
        for i in range(Relationships.schemaLength):
            if not Relationships.schema[i].datatype.validate(data[i]):
                raise "Invalid Relationship: "+str(i)+"th element "+str(data[i])+" does not match schema type "+str(Relationships.schema[i])

        self.sender = data[Relationships.SenderIndex]
        self.receiver = data[Relationships.ReceiverIndex]
        self.label = data[Relationships.LabelIndex]
        self.data = data

        #auxuliary data
        self.amount = 1  # the amount of times the nodes communicate between one another in the specific direction
        self.sequence = None

    def __str__(self):
        answer ="Relationships["+self.sender+"->"+self.receiver+": "+self.label+"]"

        if len(self.data)>3:
            answer += "{"
            voids = [Relationships.SenderIndex, Relationships.ReceiverIndex, Relationships.LabelIndex]
            for i in range(len(self.data)):
                if not i in voids:
                    answer += str(self.data[i])+", "
            answer += "}"
        return answer

    def __eq__(self, other): 
        if not isinstance(other, Relationships):
            return NotImplemented

        for i in range(len(self.data)):
            if self.data[i] != other.data[i]:
                return False
        return True
    
    def printLabel(self):
        if Relationships.showCardinality:
            return "("+str(self.amount)+"): "+self.get_label()
        
        return self.get_label()

    #required types are strings by policy
    def get_sender(self):
        return self.sender

    def get_receiver(self):
        return self.receiver

    def get_label(self):
        return self.label

    #auxiliary value amount is managed through these two functions
    def increment(self):
        self.amount += 1

    def get_amount(self):
        return self.amount

    #auxiliaryvalue sequence is managed through these two functions
    def set_sequence(self, seq:Sequence):
        self.sequence = seq

    def get_sequence(self):
        return self.sequence

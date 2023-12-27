
class ColorCode:
    def __init__(self, label:str, color:str):
        self.label = label
        self.color = color

    def __str__(self):
        return "ColorCode(#"+self.color+")-"+self.label

    def getLabel(self):
        return self.label

    def getColor(self):
        return self.color

class StatusRun:
    def __init__(self, cc:ColorCode, start_ms):
        self.color = cc
        self.start = start_ms
        self.stop = start_ms

    def __str__(self):
        return "Status Run - "+str(self.color)+"["+self.start+"-"+self.stop+"]"

    def getColorCode(self):
        return self.color

    def setEndTime(self, time_ms):
        self.stop = time_ms

    def getStartTime_ms(self):
        return self.start

    def getStopTime_ms(self):
        return self.stop

    def isInTimeRange(self, time_ms):
        return (time_ms >= self.start) and (time_ms <= self.stop)

class StatusDictionary:
    def __init__(self):
        self.members = {}
        self.antimap = {}
        
    def addColorCode(self, id:str, cc:ColorCode):
        if id in self.members:
            raise Exception("Dictionary already contains ID "+id)

        self.members[id]=cc
        self.antimap[cc]=id

    def reverse(self, cc:ColorCode):
        return self.antimap[cc]

    def getColorCode(self, id:str):
        if not (id in self.members):
            raise Exception("Dictionary does not contain ID "+id)

        return self.members[id]

    def getLabel(self, id:str):
        if not (id in self.members):
            raise Exception("Dictionary does not contain ID "+id)

        return self.members[id].getLabel()

    def getColor(self, id:str):
        if not (id in self.members):
            raise Exception("Dictionary does not contain ID "+id)

        return self.members[id].getColor()

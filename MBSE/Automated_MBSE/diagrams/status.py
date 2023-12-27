import sys
import os
import pickle
import csv
from parts.dictionary import ColorCode, StatusDictionary, StatusRun
from parts.schemata import Schemata

MAX_PAGE = 50

class StatusDiagram:
    def __init__(self, filename, dict:StatusDictionary):
        self.Dictionary = dict
        self.dataset={}
        self.timeIndex = Schemata.findTimeInSchema()
        if self.timeIndex < 0:
            raise Exception("No time identified in Schema")
        lastTime = -1

        self.tightName = {}
        for i in range(Schemata.getSchemaLength()):
            if i== self.timeIndex:
                continue
            name = Schemata.getNthSchemaTitle(i)
            self.tightName[i] = name.replace(" ", "_")

        with open(filename, 'r') as file:  # Reads a csv file and appends it to the uniqueSender/uniqueReceiver/uniqueLabel arrays
            reader = csv.reader(file, delimiter=',')


            #for first row we create a StatusRun
            row = next(reader)
            currentTime = row[self.timeIndex]
            #thic creates the first row of StatusRun
            for i in range(Schemata.getSchemaLength()):
                self.dataset[i]=[]
                if i == self.timeIndex:
                    #skipping the time
                    continue
                self.dataset[i].append(StatusRun(self.Dictionary.getColorCode(row[i]), currentTime))

            #for the rest of all rows
            for row in reader:
                #deal with next member

                #keep track of the last and current time
                lastTime = currentTime
                currentTime = row[self.timeIndex]
                for i in range(Schemata.getSchemaLength()):
                    if i == self.timeIndex:
                        #skipping the time
                        continue

                    #verify the status didn't change
                    cc = self.Dictionary.getColorCode(row[i])
                    if not (cc == self.dataset[i][-1].getColorCode()):
                        #this is a change in status
                        self.dataset[i][-1].setEndTime(lastTime)
                        self.dataset[i].append(StatusRun(cc, currentTime))

            #close out the last one
            for i in range(len(self.dataset)):
                if i == self.timeIndex:
                    #skipping the time
                    continue

                self.dataset[i][-1].setEndTime(lastTime)

    def getTightName(self, i):
        return self.tightName[i]

    def print_status_diagram(self, fileName):
        #this is a series of lifelines vertically across the page with connections between

        file = open(fileName, "w")
        content = "@startuml\n"

        for i in range(Schemata.getSchemaLength()):
            if i == self.timeIndex:
                #skipping the time
                continue
            content += "participant "+ self.getTightName(i) + "\n"
        content += "\n"

        content += "skinparam SequenceGroupBackgroundColor #DDDDDD\n"
        content += "skinparam SequenceGroupBodyBackgroundColor #FFFFFF\n"

        indices = {}
        for i in range(Schemata.getSchemaLength()):
            indices[i]=0
            if i == self.timeIndex:
                #skipping the time
                continue
            content += "Activate "+ self.getTightName(i) + "#" + str(self.dataset[i][indices[i]].getColorCode().getColor()) + "\n"
        content += "|||\n"

        continuing = True
        count = 0
        page=2
        while(continuing):
            #find the next change
            nextTime = sys.maxsize
            continuing = False
            nextChange = -1

            for i in range(Schemata.getSchemaLength()):
                if i == self.timeIndex:
                    #skipping the time
                    continue
            
                #it will be the first (lowest) time
                if len(self.dataset[i])==indices[i]:
                    continue

                tmp = float(self.dataset[i][indices[i]].getStopTime_ms())
                if tmp < nextTime:
                    #this runs for each i for each loop
                    continuing = True
                    nextChange = i
                    nextTime = tmp
                    name = self.getTightName(i)
                    oldstatus = self.dataset[i][indices[i]].getColorCode().getLabel()
                    if len(self.dataset[i])>indices[i]+1:
                        newColor = self.dataset[i][indices[i]+1].getColorCode().getColor()
                        status = self.dataset[i][indices[i]+1].getColorCode().getLabel()
                    else:
                        newColor = "000000"
                        status = "Don't know"

            if nextChange > -1:
                #at this point which know which on is next
                #so we increment it
                indices[nextChange] = indices[nextChange] + 1

                content += "group "+name+" goes from "+oldstatus+" to "+ status +"\n"
                content += "end group\n"
                content += "|||\n"
                content += "Deactivate "+name+"\n"
                content +=  name+" <- "+name+": Time-"+str(nextTime)+"s \n"
                content += "Activate "+name+" #"+newColor+"\n"
                content += "|||\n"
                count = count + 4
            if count > MAX_PAGE:
                count = 0
                content += "newpage ...Page"+str(page)+"...\n"

        #don't worry about the last one

        content += "@enduml"
        file.writelines(content)
        file.close()
        print("Status Diagram created successfully")
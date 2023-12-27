from diagrams.core import MBSE
from parts.style import ActorStyle, Sprite, Icons
from parts.relationships import Relationships
from parts.schemata import DataType, Schemata, _checkFloat, Source, Sink, Label, Int, Time
from parts.dictionary import ColorCode, StatusDictionary

############################################
# Need to have only one import from library#
############################################
def _check4Digit(x):
    if not(type(x)==type("1")):
        return False
    if len(x)==0:
        return True
    if not(len(x)==4):
        return False
    if not (x.isdigit()):
        return False
    if not(int(x)>=0 and int(x)<10000):
        return False

    return True

def TestSwimLane():
    Schemata.SetSchema([Source, Sink, Label])
    ActorStyle.setActorStyle(ActorStyle.Bust)
    model = MBSE.createSwimLaneDiagram("swimlane.csv")

    model.createSwimLane("Enemy","participant",sprite="redair", spriteColor=Sprite.RED)
    model.createSwimLane("Plane","participant",sprite="blueair", spriteColor=Sprite.BLUE)
    model.createSwimLane("Enterprise","participant",image=Icons.NIMITZ)
    model.createSwimLane("CO1","actor")
    model.createSwimLane("CO2","actor")
    model.createSwimLane("Roosevelt","participant",sprite="bluesea", spriteColor=Sprite.BLUE)
    model.createSwimLane("Drone","participant",sprite="blueair", spriteColor=Sprite.BLUE)

    model.print_swimlane_diagram("swimlane_plantuml.txt")
    MBSE.outputUML("swimlane_plantuml.txt")

def TestUseCase():
    model = MBSE.createUseCaseDiagram()
    model.setActorStyle(ActorStyle.Bust)

    model.createNode("Alpha","actor")
    model.createNode("Beta","actor")
    model.createNode("Gamma","actor")
    model.createNode("Dining Hall","usecase")
    model.createSuperNode("People",["Alpha","Beta","Gamma"])

    model.print_usecase_diagram("usecase_plantuml.txt")
    MBSE.outputUML("usecase_plantuml.txt")

def TestStatus():
    Schemata.SetSchema([Schemata("System A",Int,"0"), Schemata("System B",Int,"0"), 
        Schemata("System C",Int,"0"), Schemata("System D",Int,"0"), 
	Time])
    redGreenDict = StatusDictionary()
    redGreenDict.addColorCode("1", ColorCode("Red","FF0000"))
    redGreenDict.addColorCode("2", ColorCode("Orange","FF8000"))
    redGreenDict.addColorCode("3", ColorCode("Yellow","FFFF00"))
    redGreenDict.addColorCode("4", ColorCode("Lime","80FF00"))
    redGreenDict.addColorCode("5", ColorCode("Forest ","00AA00"))
    
    model = MBSE.createStatusDiagram("statusDatav2.csv", redGreenDict)

    model.print_status_diagram("status_diagram_plantuml.txt")
    MBSE.outputUML("status_diagram_plantuml.txt")

def TestLinear():
    Schemata.SetSchema([Source, Sink, Label, Schemata("Time", Time, "0"),
        Schemata("TN", DataType("4 Digits", _check4Digit),"0000")])
    Relationships.ValidateSchema()
    model = MBSE.createLinearDiagram("testset.csv")
    model.createSuperNode("USS_Roosevelt_DDG_80", ["A_Missile", "A_WeaponSystem", "A_TrackServer", "A_Radar", "A_WeaponControl", "A_Link"])
    model.createSuperNode("USS_Enterprise_CVN_65", ["B_Link", "B_WeaponControl", "B_TrackServer", "B_Radar", "B_WeaponSystem", "B_Missile"])
    model.setNodeColor("A_WeaponControl","FFAAAA")
    model.setNodeColor("B_WeaponControl","AAAAFF")
    model.highlightSender("A_Link")
    model.highlightSender("B_Link")
    #model.highlightMessage("Error_UNK_223","FF0000")
    #model.highlightMessage("EUNK_J03","FF0000")
    model.highlightMessageSequence("Wpn Heartbeat ", ["Heartbeat_101","Heartbeat_102"], color="FFFF00", timeParam="Time", maxTime_ms=1001)
    model.highlightMessageSequence("Radar Heartbeat", ["Heartbeat_111","Heartbeat_112"], color="FF00FF", timeParam="Time", maxTime_ms=1001)
    model.highlightMessageSequence("Radar Acq", ["Acquire_201[TN]","Track_221[TN]","Track_J01[TN]","Track_221[TN]"], color="0000FF", timeParam="Time", maxTime_ms=1001, showBroken=True)
    model.highlightMessageSequence("Radar Update", ["Update_202[TN]","Track_221[TN]","Track_J01[TN]","Track_221[TN]"], color="8888FF", timeParam="Time", maxTime_ms=1001, showBroken=True)

    model.showEdgeCardinality(True)
    model.print_communication_diagram("communication_diagram_plantuml.txt")
    MBSE.outputUML("communication_diagram_plantuml.txt")
    model.print_sequence_diagram("sequence_diagram_plantuml.txt")
    MBSE.outputUML("sequence_diagram_plantuml.txt")

if __name__ == '__main__':    
    TestSwimLane()

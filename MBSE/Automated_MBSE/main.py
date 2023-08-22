from MBSE_Library import MBSE

############################################
# Need to have only one import from library#
############################################

if __name__ == '__main__':
    ##########################################
    # Testing methods to ensure proper output#
    ##########################################

    model = MBSE.createLinearDiagram("OTHER.csv")
    model.setNodeColor("C","red")
    model.createSuperNode("Box1", ["A", "B"])
    model.highlightSender("D")
    model.highlightReceiver("B")
    model.hideNode("E")
    model.highlight_sequence("Green Bug", ["C", "D"], "44FF44")
    model.highlight_sequence("Rare", ["B", "D", "C"], "FFAA00")
    model.highlight_sequence("Eggplant", ["A","B","C"], "AA00AA")
    model.showEdgeCardinality(False)
    model.print_communication_diagram("communication_diagram_plantuml.txt")
    MBSE.outputUML("communication_diagram_plantuml.txt")
    model.print_sequence_diagram("sequence_diagram_plantuml.txt")
    MBSE.outputUML("sequence_diagram_plantuml.txt")
    #MBSE.compare("graph11", "graph12")
    #MBSE.save_code_diagram("project1")
    #MBSE.save_linear_diagram("graph12")

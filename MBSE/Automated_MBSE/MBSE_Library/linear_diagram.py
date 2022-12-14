import os
import pickle

from MBSE_Library import Relationships, Node
import csv


class LinearDiagram:
    # // developer's note: should be moved to code_diagrams package so that core.py is the only file in this directory

    # creates a model for the LinearDiagram
    sender = []  # every node that sends something
    receiver = []  # every node that receives something
    message_type = []  # the message that is being sent/received
    # these three should be lined up so that they are parallel, i.e., sender[3] is the node that sends to receiver[3]
    # and message_type[3] is the message that is being sent from sender[3] to receiver[3]

    nodes = []  # an array of every single unique node object
    order_list = []  # an array of every single existing sender[] to receiver[] combination
    boxes = []  # list of names of all boxes

    @staticmethod
    def load_file(filename):  # Load file as in, csv file, not loading in a previously created model but rather creating
        # a brand new one
        with open(filename, 'r') as file:  # Reads a csv file and appends it to the sender/receiver/message_type arrays
            reader = csv.reader(file, delimiter=',')
            for row in reader:
                LinearDiagram.sender.append(row[0])
                LinearDiagram.receiver.append(row[1])
                LinearDiagram.message_type.append(row[2])

        auxiliary_list = []
        for i in LinearDiagram.sender:
            if i not in auxiliary_list:
                n = Node(i)
                LinearDiagram.nodes.append(n)
                auxiliary_list.append(i)
        for i in LinearDiagram.receiver:
            if i not in auxiliary_list:
                n = Node(i)
                LinearDiagram.nodes.append(n)
                auxiliary_list.append(i)
        for i in range(len(LinearDiagram.sender)):
            updated = False
            for c in LinearDiagram.order_list:
                if c.get_sender() == LinearDiagram.sender[i] and c.get_receiver() == LinearDiagram.receiver[i]:
                    c.increment()
                    updated = True
                    break
            if not updated:
                r = Relationships(LinearDiagram.sender[i], LinearDiagram.receiver[i])
                LinearDiagram.order_list.append(r)

    @staticmethod
    def print_communication_diagram():
        file = open("communication_diagram_plantuml.txt", "w")
        content = "@startuml\n"
        auxiliary_list = []
        for n in LinearDiagram.nodes:
            if (n.get_name not in auxiliary_list) and n.get_importance():
                auxiliary_list.append(n.get_name)
                content += 'agent "' + str(n.get_name()) + '" as ' + n.get_name().replace(" ", "")
                if n.has_color:
                    content += " #" + n.get_color()
                if n.get_highlighted_out():
                    content += " #yellow"
                elif n.get_highlighted_in():
                    content += " #lightblue"
                content += "\n"

        for o in LinearDiagram.order_list:
            stop = False
            for n in LinearDiagram.nodes:
                if o.get_sender() == n.get_name() and not n.get_importance():
                    stop = True
            for n in LinearDiagram.nodes:
                if o.get_receiver() == n.get_name() and not n.get_importance():
                    stop = True
            if not stop:
                content += str(o.get_sender()).replace(" ", "")
                content += " -"
                for n in LinearDiagram.nodes:
                    if n.get_name() == o.get_sender() and n.get_highlighted_out():
                        content += "[#gold,plain,thickness=4]"
                    elif n.get_name() == o.get_receiver() and n.get_highlighted_in():
                        content += "[#powderblue,plain,thickness=4]"
                content += "->> "
                content += str(o.get_receiver()).replace(" ", "")
                content += " : "
                content += str(o.get_amount())
                content += " \n"
        content += "@enduml"
        file.writelines(content)
        file.close()
        print("Communication Diagram created successfully")

    @staticmethod
    def print_sequence_diagram():
        file = open("sequence_diagram_plantuml.txt", "w")
        content = "@startuml\n"
        auxiliary_list = []
        for b in LinearDiagram.boxes:
            content += 'box "' + b + '"\n'
            for n in LinearDiagram.nodes:
                if n.get_box() == b:
                    if (n.get_name not in auxiliary_list) and n.get_importance():
                        auxiliary_list.append(n.get_name)
                        content += 'participant "' + str(n.get_name()) + '" as ' + n.get_name().replace(" ", "")
                        if n.has_color:
                            content += " #" + n.get_color()
                        if n.get_highlighted_out():
                            content += " #yellow"
                        elif n.get_highlighted_in():
                            content += " #lightblue"
                        content += "\n"
            content += "end box\n"

        for n in LinearDiagram.nodes:
            if not n.get_box == "":
                if (n.get_name not in auxiliary_list) and n.get_importance():
                    auxiliary_list.append(n.get_name)
                    content += 'participant "' + str(n.get_name()) + '" as ' + n.get_name().replace(" ", "")
                    if n.has_color:
                        content += " #" + n.get_color()
                    if n.get_highlighted_out():
                        content += " #yellow"
                    elif n.get_highlighted_in():
                        content += " #lightblue"
                    content += "\n"

        for i in range(len(LinearDiagram.sender)):
            stop = False
            for n in LinearDiagram.nodes:
                if LinearDiagram.sender[i] == n.get_name() and not n.get_importance():
                    stop = True
            for n in LinearDiagram.nodes:
                if LinearDiagram.receiver[i] == n.get_name() and not n.get_importance():
                    stop = True
            if not stop:
                out_list = []
                in_list = []
                for n in LinearDiagram.nodes:
                    if n.get_highlighted_in():
                        in_list.append(n.get_name())
                    if n.get_highlighted_out():
                        out_list.append(n.get_name())

                content += str(LinearDiagram.sender[i]).replace(" ", "")
                content += " -"
                if LinearDiagram.sender[i] in out_list:
                    content += "[#yellow]>"
                elif LinearDiagram.receiver[i] in in_list:
                    content += "[#lightblue]>"
                else:
                    content += ">"

                content += str(LinearDiagram.receiver[i]).replace(" ", "")
                content += " : "
                content += str(LinearDiagram.message_type[i]).replace(" ", "")
                content += " \n"
        content += "@enduml"
        file.writelines(content)
        file.close()
        print("Sequence Diagram created successfully")

    @staticmethod
    def ld_compare(model1, model2):  # compares two linear diagrams and shows the differences between them. Only works
        # for sequence diagrams and does not show the changes between edges yet, only differences between nodes

        # create model of first diagram
        sender1 = []
        receiver1 = []
        message1 = []
        order1 = []
        node1 = []

        # create model of second diagram
        sender2 = []
        receiver2 = []
        message2 = []
        order2 = []
        node2 = []

        # Load model1 to model
        cd = os.path.join(model1, "linear_diagrams", "nodes")
        for file in os.scandir(cd):
            name, extension = os.path.splitext(file)
            if extension == '.txt':
                file_pi2 = open(file, 'rb')
                c = pickle.load(file_pi2)
                node1.append(c)

        with open(model1 + "/linear_diagrams/edges/edges.csv", 'r') as file:
            reader = csv.reader(file, delimiter=',')
            for row in reader:
                sender1.append(row[0])
                receiver1.append(row[1])
                message1.append(row[2])

        for i in range(len(sender1)):
            updated = False
            for o in order1:
                if o.get_sender() == sender1[i] and o.get_receiver() == receiver1[i]:
                    o.increment()
                    updated = True
                    break
            if not updated:
                r = Relationships(sender1[i], receiver1[i])
                order1.append(r)
        cd = os.path.join(model2, "linear_diagrams", "nodes")
        for file in os.scandir(cd):
            name, extension = os.path.splitext(file)
            if extension == '.txt':
                file_pi2 = open(file, 'rb')
                c = pickle.load(file_pi2)
                node2.append(c)

        # Load model2 to model
        with open(model2 + "/linear_diagrams/edges/edges.csv", 'r') as file:
            reader = csv.reader(file, delimiter=',')
            for row in reader:
                sender2.append(row[0])
                receiver2.append(row[1])
                message2.append(row[2])

        for i in range(len(sender2)):
            updated = False
            for o in order2:
                if o.get_sender() == sender2[i] and o.get_receiver() == receiver2[i]:
                    o.increment()
                    updated = True
                    break
            if not updated:
                r = Relationships(sender2[i], receiver2[i])
                order2.append(r)

        # Compare/print diagrams (Sequence)
        file = open("compared.txt", "w")
        content = "@startuml\n"

        nodecopy1 = []
        nodecopy2 = []

        for n1 in node1:
            nodecopy1.append(n1)
        for n2 in node2:
            nodecopy2.append(n2)

        for n1 in node1:
            for n2 in node2:
                if n1.get_name() == n2.get_name():
                    nodecopy1.remove(n1)
                    nodecopy2.remove(n2)
                    if n1.get_importance() and n2.get_importance():
                        content += 'participant "' + str(n1.get_name()) + '" as ' + n1.get_name().replace(" ", "")
                        content += "\n"
                    elif n1.get_importance():
                        content += 'participant "' + n1.get_name() + '" as ' + n1.get_name().replace(" ", "") + " #red"
                        content += "\n"
                    elif n2.get_importance():
                        content += 'participant "' + n1.get_name() + '" as ' + n1.get_name().replace(" ", "")+" #green"
                        content += "\n"
                    else:
                        print("error comparing " + n1.get_name() + " and " + n2.get_name())
        for n in nodecopy1:
            content += 'participant "' + n.get_name() + '" as ' + n.get_name().replace(" ", "") + " #red"
            content += "\n"
        for n in nodecopy2:
            content += 'participant "' + n.get_name() + '" as ' + n.get_name().replace(" ", "") + " #green"
            content += "\n"

        # TODO
        # need to compare edges in the comparing of two linear diagrams
        # below code prints out a normal sequence diagram, for reference when writing edge comparison
        '''for i in range(len(LinearDiagram.sender)):
            stop = False
            for n in LinearDiagram.nodes:
                if LinearDiagram.sender[i] == n.get_name() and not n.get_importance():
                    stop = True
            for n in LinearDiagram.nodes:
                if LinearDiagram.receiver[i] == n.get_name() and not n.get_importance():
                    stop = True
            if not stop:
                out_list = []
                in_list = []
                for n in LinearDiagram.nodes:
                    if n.get_highlighted_in():
                        in_list.append(n.get_name())
                    if n.get_highlighted_out():
                        out_list.append(n.get_name())

                content += str(LinearDiagram.sender[i]).replace(" ", "")
                content += " -"
                if LinearDiagram.sender[i] in out_list:
                    content += "[#yellow]>"
                elif LinearDiagram.receiver[i] in in_list:
                    content += "[#lightblue]>"
                else:
                    content += ">"

                content += str(LinearDiagram.receiver[i]).replace(" ", "")
                content += " : "
                content += str(LinearDiagram.message_type[i]).replace(" ", "")
                content += " \n"'''
        content += "@enduml"
        file.writelines(content)
        file.close()
        print("Diagrams compared successfully")

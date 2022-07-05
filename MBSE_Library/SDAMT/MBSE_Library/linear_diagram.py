from MBSE_Library import Relationships, Node
import csv


class LinearDiagram:
    sender = []
    receiver = []
    message_type = []
    order_list = []
    nodes = []
    boxes = []

    @staticmethod
    def load_file(filename):
        with open(filename, 'r') as file:
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
    def set_unimportant(node):
        for n in LinearDiagram.nodes:
            if n.get_name == node:
                n.set_unimporatant()

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

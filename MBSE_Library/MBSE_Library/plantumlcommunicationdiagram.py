import csv


class PlantUmlCommunicationDiagram:
    sender = []
    receiver = []
    message_type = []
    order_list = []

    def __init__(self, filename):
        self.content = ""
        self.filename = filename
        with open(filename, 'r') as file:
            reader = csv.reader(file, delimiter=',')
            for row in reader:
                self.sender.append(row[0])
                self.receiver.append(row[1])
                self.message_type.append(row[2])

        for i in range(len(self.sender)):
            updated = False
            for c in self.order_list:
                if c.get_sender() == self.sender[i] and c.get_receiver() == self.receiver[i]:
                    c.increment()
                    updated = True
                    break
            if not updated:
                sr = SenderReceiverRelationship(self.sender[i], self.receiver[i])
                self.order_list.append(sr)

    def print_uml(self):
        # Prints out one connected between boxes
        file = open(self.filename.replace(".txt", "") + "_communication_diagram_plantuml.txt", "w")
        content = ""
        auxiliary_list = []
        for i in self.sender:
            if i not in auxiliary_list:
                auxiliary_list.append(i)
                content += 'agent "' + str(i) + '" as ' + i.replace(" ", "") + "\n"
        for i in self.receiver:
            if i not in auxiliary_list:
                auxiliary_list.append(i)
                content += 'agent "' + str(i) + '" as ' + i.replace(" ", "") + "\n"
        content += "\n"

        for c in self.order_list:
            content += str(c.get_sender()).replace(" ", "")
            content += " -- "
            content += str(c.get_receiver()).replace(" ", "")
            content += " : "
            content += str(c.get_amount())
            content += " \n"

        self.content = content
        file.writelines(content)
        file.close()

        # Prints out all connections between boxes
        file = open(self.filename.replace(".txt", "") + "_communication_diagram_full_plantuml.txt", "w")
        content = ""
        auxiliary_list = []
        for i in self.sender:
            if i not in auxiliary_list:
                auxiliary_list.append(i)
                content += 'agent "' + str(i) + '" as ' + i.replace(" ", "") + "\n"
        for i in self.receiver:
            if i not in auxiliary_list:
                auxiliary_list.append(i)
                content += 'agent "' + str(i) + '" as ' + i.replace(" ", "") + "\n"
        content += "\n"

        for j in range(len(self.sender)):
            content += str(self.sender[int(j)]).replace(" ", "")
            content += " -> "
            content += str(self.receiver[j]).replace(" ", "")
            content += " : "
            content += str(self.message_type[j]).replace(" ", "")
            content += " \n"

        self.content = content
        file.writelines(content)
        file.close()

    def print_sequence_uml(self, sender, receiver):
        file = open(self.filename.replace(".txt", "") + "_sequence_plantuml.txt", "w")
        content = ""
        j = 0
        for i in self.sender:
            if (i == sender and self.receiver[j] == receiver) or (i == receiver and self.receiver[j] == sender):
                content += str(self.sender[int(j)]).replace(" ", "")
                content += " -> "
                content += str(self.receiver[j]).replace(" ", "")
                content += " : "
                content += str(self.message_type[j]).replace(" ", "")
                content += " \n"
            j = j + 1

        self.content = content
        file.writelines(content)
        file.close()


class SenderReceiverRelationship:

    def __init__(self, sender, receiver):
        self.sender = sender
        self.receiver = receiver
        self.amount = 1

    def increment(self):
        self.amount += 1

    def get_sender(self):
        return str(self.sender)

    def get_receiver(self):
        return str(self.receiver)

    def get_amount(self):
        return self.amount

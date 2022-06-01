import csv


class PlantUmlCommunicationDiagram:
    """
        Instantiate a communication diagram creation.
        Reads csv files and outputs plantUML for communication diagram.

        :param filename: The name of the file the csv information is stored.
        :type filename: String
        """

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
            c = Comdia(self.sender[i], self.receiver[i])
            if c not in self.order_list:
                self.order_list.append(c)
            else:
                c.increment()

    def print_uml(self):
        file = open(self.filename.replace(".txt", "") + "_plantuml.txt", "w")
        content = ""
        auxiliary_list = []
        for i in self.receiver:
            if i not in auxiliary_list:
                auxiliary_list.append(i)
                content += "agent " + i.replace(" ", "") + "\n"

        content += "\n"

        # for i in range(len(self.sender)):
        # content += str(self.sender[int(i)]).replace(" ", "")
        # content += " -- "
        # content += str(self.receiver[i]).replace(" ", "")
        # content += " : "
        # content += str(self.message_type[i]).replace(" ", "")
        # content += " \n"

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


class Comdia:

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

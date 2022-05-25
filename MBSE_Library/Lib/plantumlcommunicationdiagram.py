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

    def __init__(self, filename):
        self.content = ""
        self.filename = filename
        with open(filename, 'r') as file:
            reader = csv.reader(file, delimiter=',')
            for row in reader:
                self.sender.append(row[0])
                self.receiver.append(row[1])
                self.message_type.append(row[2])

    def print_uml(self):
        file = open(self.filename.replace(".txt", "") + "_plantuml.txt", "w")
        content = ""
        for i in self.receiver:
            content += "agent " + i.replace(" ", "") + "\n"

        content += "\n"
        for i in range(len(self.sender)):
            content += str(self.sender[int(i)]).replace(" ", "")
            content += " -- "
            content += str(self.receiver[i]).replace(" ", "")
            content += " : "
            content += str(self.message_type[i]).replace(" ", "")
            content += " \n"

        self.content = content
        file.writelines(content)
        file.close()

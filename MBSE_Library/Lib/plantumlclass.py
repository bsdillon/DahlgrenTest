class Plantumlclass:
    classlist = []
    def __init__(self, UMLclass):
        self.UMLclass = UMLclass
        self.methods = []
        self.content = ""
        self.addClasslist(self)

    @staticmethod
    def getClasslist():
        return Plantumlclass.classlist

    @staticmethod
    def addClasslist(Plantumlclass):
        Plantumlclass.classlist.append(Plantumlclass)

    def getClassName(self):
        return self.UMLclass

    def addmethod(self, method):
        m1 = Plantumlmethod(method, "")
        self.methods.append(m1)
        return m1

    def printUML(self):
        #print(self.UMLclass)
        #print(self.methods)

        file1 = open(self.UMLclass + ".txt", "w")
        content = ["class " + self.UMLclass + ' {\n' + ' \n--\n']
        for i in self.methods:
            if i.getStatic():
                content += '--'
            content += i.getMethod()
            content += ': '
            content += i.getType()
            content += ' \n'
        content += '\n}'
        self.content = content
        file1.writelines(content)
        file1.close()
        # need to pull image from plant uml

    def getcontent(self):
        return self.content

class Plantumlmethod:
    def __init__(self, method, type):
        self.method = method
        self.type = type
        self.static = False

    def getMethod(self):
        return self.method

    def getType(self):
        return self.type

    def setType(self, type):
        self.type = type

    def setStatic(self):
        self.static = True

    def getStatic(self):
        return self.static
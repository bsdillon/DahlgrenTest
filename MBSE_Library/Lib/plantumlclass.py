
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

    def addvoidmethod(self, method):
        m1 = Plantumlmethod(method, "void")
        self.methods.append(m1)

    def addmethodint(self, method):
        m1 = Plantumlmethod(method, "Int")
        self.methods.append(m1)

    def addmethodstring(self, method):
        m1 = Plantumlmethod(method, "String")
        self.methods.append(m1)

    def addmethod(self, method):
        m1 = Plantumlmethod(method, "")
        self.methods.append(m1)

    def printUML(self):
        #print(self.UMLclass)
        #print(self.methods)

        file1 = open(self.UMLclass + ".txt", "w")
        content = [self.UMLclass + ' {\n' + ' \n']
        for i in self.methods:
            content += i.getMethod()
            content += ': '
            content += i.getType()
            content += ' \n'
        content += '\n}'
        self.content = content
        file1.writelines(content)
        file1.close()

    def getcontent(self):
        return self.content

class Plantumlmethod:
    def __init__(self, method, type):
        self.method = method
        self.type = type

    def getMethod(self):
        return self.method

    def getType(self):
        return self.type
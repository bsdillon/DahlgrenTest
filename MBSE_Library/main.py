# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.


def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print_hi('PyCharm')

# See PyCharm help at https://www.jetbrains.com/help/pycharm/

# Import Multiplication from your library
from Lib import Multiplication

# Instantiate a Multiplication object
multiplication = Multiplication(2)

# Call the multiply method
print(multiplication.multiply(5))

from Lib import Plantumlclass
c1 = Plantumlclass("class1")

c1.addvoidmethod("c1m1")
c1.addmethodstring("c1m2")

c2 = Plantumlclass("class2")
c2.addmethodint("c2m1")
c1.addmethod("c1m3")
c1.printUML()
c2.printUML()

#need to pull image from plant uml
#containorization
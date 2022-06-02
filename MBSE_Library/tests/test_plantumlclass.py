#######################################
#Test does not curently work due do ###
#how formatted strings are returned,###
#need to work on getting test to work##
#######################################
import unittest
from MBSE_Library import Plantumlclass


class PlantUMLTestCase(unittest.TestCase):

    def __init__(self, methodName: str = ...):
        super().__init__(methodName)
        self.plantumlclass = None

    def setUp(self):
        self.plantumlclass = Plantumlclass("class1")
        
    def testclass1(self):
        """Class 1 with 3 methods"""

        
        self.plantumlclass.addvoidmethod("c1m1")
        self.plantumlclass.addmethodstring("c1m2")
        self.plantumlclass.addmethod("c1m3")
        self.plantumlclass.printUML()
        result = self.plantumlclass.getcontent()
        self.assertEqual(result, "['class1 {\n \n', 'c', '1', 'm', '1', ':', ' ', 'v', 'o', 'i', 'd', ' ', '\n', 'c', '1', 'm', '2', ':', ' ', 'S', 't', 'r', 'i', 'n', 'g', ' ', '\n', 'c', '1', 'm', '3', ':', ' ', ' ', '\n', '\n', '}']")







if __name__ == '__main__':
    unittest.main()

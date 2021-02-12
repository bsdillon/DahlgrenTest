"""Usage: check_test_times.py seconds inpath [outpath]

Reads test execution result from an output XML file and checks that no test
took longer than given amount of seconds to execute.

Optional `outpath` specifies where to write processed results. If not given,
results are written over the original file.
"""
import sys
from robot.api import ExecutionResult, ResultVisitor


class ExecutionTimeChecker(ResultVisitor):  #sets class for checking time, using ResultVisitor to access xml file

    def __init__(self, seconds):   #transfers user inputted max seconds to milliseconds.
       self.max_milliseconds = seconds * 1000

    def visit_test(self, test):
        print(test.elapsedtime)
        if test.elapsedtime > self.max_milliseconds:
            print('Test execution took too long')
            test.status = 'FAIL' #edits state in .xml file
            test.message = 'Test execution took too long.'   #edits message in xml file.


def check_tests(seconds, inpath):
    result = ExecutionResult(inpath) #Sets results to xml file
    result.visit(ExecutionTimeChecker(float(seconds))) #Checks times and prints.


if __name__ == '__main__':
    try:
        check_tests(*sys.argv[1:])
    except TypeError:
        print(__doc__)

import sys
from robot.api import ExecutionResult, ResultWriter
from robot.reporting.jsmodelbuilders import JsModelBuilder
from robot.result.executionerrors import ExecutionErrors
from robot.result.model import Message


result = ExecutionResult('output.xml')
writer = ResultWriter('output.xml')
builder = JsModelBuilder('output.xml')
m = Message('alpha')
b = Message('bravo')
errors = ExecutionErrors(messages=[m, b]) #creates instance of Execution Errors using list of message objects

print(errors.messages) #prints messages
writer.write_results(report='custom.html', log=None, xunit='xunit.xml') #writes new result files
print(builder.build_from(result))  #builds a js model

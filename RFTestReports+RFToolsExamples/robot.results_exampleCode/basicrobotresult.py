from robot.api import ExecutionResult, ResultVisitor

result = ExecutionResult("output3.xml")

stats = result.statistics
total_tests= stats.total.all.total
passed_tests= stats.total.all.passed
failed_tests= stats.total.all.failed

print (total_tests)
print (passed_tests)
print (failed_tests)

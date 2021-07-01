ROBOT_LISTENER_API_VERSION = 2


def start_suite(name, attrs):
    testrun = '"' + attrs['starttime'] + '"'
    with open("demodata.js", 'r') as file:
        lines = file.readlines()
        new_last_line = " "
        lines[-1] = new_last_line
    open("demodata.js", 'w').writelines(lines)
    with open("demodata.js", 'a') as file:
        file.write(testrun + " : [\n")
    print(testrun)
def start_test(name, attrs):
    with open("demodata.js", 'a') as file:
        file.write("{ Parameters: '")
def end_keyword(name, attrs):
    args = attrs['args']
    params = ""
    # traverse in the string
    for ele in args:
        params += ele
    print(params)
    with open("demodata.js", 'a') as file:
        file.write(params + " " )

def end_test(name, attrs):
    testname = attrs['originalname']
    status = attrs['status']
    message = '"' + attrs['message'] + '"'
    timepassed = attrs['elapsedtime']
    with open("demodata.js", 'a') as file:
        file.write("', Test: '" + testname +"', Status: '" + status +"', Message: " + message +"}, \n ")

def end_suite(name, attrs):
    with open("demodata.js", 'a') as file:
        file.write("], \n };")

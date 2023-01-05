*** Settings ***
#Libraries, resources - code reuse, standard behaviors

#Suite Setup        Suite Start
#Test Setup         Test Start
Test Template      Test Demo
#Test Teardown      Test End
#Suite Teardown     Suite End

*** Variables *** 
#track some value throughout the test/suite

*** Test Cases ***
#Data Driven Testing DDT  TESTNAME    val    value 
Test 1    alpha
Test 2    beta    7
Test 3    gamma    4
Test 4    delta    3

*** Keywords ***
Test Demo
    [ARGUMENTS]    ${arg1}    ${arg2}=7
    ${answer} =    Demonstrate The Keywords    ${arg1}    ${arg2}
    Log    The answer was ${answer}
    Log to Console   The answer was ${answer}

Demonstrate The Keywords
    [ARGUMENTS]    ${param}    ${defaulty}=7
    Log    Hello World
    Log    Parameter 1 is ${param}
    Log to Console    Parameter 1 is ${param}
    Run Keyword If    ${defaulty}==7    Log    This is default behavior
    Run Keyword If    ${defaulty}!=7    Fail    Non-default behavior
    [RETURN]    ${defaulty}
*** Settings ***
Resource   arith.resource

Suite Setup    Start Up
Test Template    Operation
Suite Teardown    Stop Test

*** Variables ***
${DATA PATH} =    C:/Users/Benny/Documents/RFData

*** Test Cases ***
1+5 = 6        1    5    add       6
2x8 = 16       2    8    multiply    16 
30 / 6 = 5    30    6    divide    5
9 - 4 = 5      9    4    minus     5

*** Keywords ***
Operation
    [ARGUMENTS]    ${operand1}    ${operand2}    ${op}    ${answer}
    New Test Event    ${TEST NAME}
    ${msg} =    Evaluate    'Failed to clear data'
    ${status} =    FAIL Token
    Clear Data
    ${msg} =    Evaluate    'Failed to enter first number ${operand1}'
    Type Number    ${operand1}
    ${msg} =    Evaluate    'Failed to enter operation ${op}'
    Op Button    ${op}
    ${msg} =    Evaluate    'Failed to enter second number ${operand2}'
    Type Number    ${operand2}
    ${msg} =    Evaluate    'Failed to get answer'
    Press Equals
    ${msg} =    Evaluate    'Failed to verify answer ${answer}'
    Read Value    ${answer}
    ${msg} =    Evaluate    'Success'
    ${status} =    PASS Token
    [TEARDOWN]    Keyword Final    ${TEST NAME}    --    ${status}    ${msg}

Start Up
    Configure Image Library    Sikuli    ${DATA PATH}
    Archive Any Previous Data
    Start Arithmetic Calculator    ${DATA PATH}

Stop Test
    Stop Arithmetic Calculator

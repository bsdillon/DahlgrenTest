*** Settings ***
Library    genericwindow    WITH NAME    main
Resource   DataExtraction.resource
Library    String

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
    main.Find
    Clear Data
    ${msg} =    Evaluate    'Failed to enter math problem'
    Math Problem    ${operand1}    ${op}    ${operand2}
    ${a} =    main.Read    output
    ${msg} =    Run Keyword If    ${a}==${answer}    Evaluate    'Success!'    ELSE    Evaluate    'Calculation was wrong: ${a}'
    Run Keyword If    ${a}!=${answer}    Fail
    ${status} =    PASS Token
    [TEARDOWN]    Keyword Final    ${TEST NAME}    --    ${status}    ${msg}

Math Problem
    [ARGUMENTS]    ${n1}    ${op}    ${n2}
    ${status} =    FAIL Token
    Banner    Math Problem
    Type Number    ${n1}
    ${a} =    main.Read    output
    ${tmp1} =    Assert OQE Values Equal    ${TEST NAME}    First operand    ${a}    ${n1}
    ${file} =    main.Capture Image    output
    Record Screen Image    ${file}   ${TEST NAME}    First operand
    Record Action    ${TEST NAME}    Operation: ${op}
    main.Click    ${op}
    Type Number    ${n2}
    ${a} =    main.Read    output
    ${tmp2} =    Assert OQE Values Equal    ${TEST NAME}    First operand    ${a}    ${n2}
    ${file} =    main.Capture Image    output
    Record Screen Image    ${file}   ${TEST NAME}    Second operand
    main.Click    equals
    ${a} =    main.Read    output
    Record Data    ${TEST NAME}    Answer    ${a}
    ${file} =    main.Capture Image    output
    Record Screen Image    ${file}   ${TEST NAME}    Answer
    ${status} =    Run Keyword If    '${tmp1}'=='${tmp2}' and '${tmp1}'=='PASS'    PASS Token    ELSE    FAIL Token
    Run Keyword If    '${status}'=='FAIL'    Fail
    Keyword Final    --    Math Problem    ${status}    --

Clear Data
    Record Action    ${TEST NAME}    Clearing previous data
    main.Click    clear
    ${file} =    main.Capture Image    output
    Record Screen Image    ${file}   ${TEST NAME}    Clearing data
    ${a} =    main.Read    output
    ${result} =    Assert OQE Values Equal    ${TEST NAME}    Value zero    ${a}    0
    Run Keyword If    '${result}'=='FAIL'    FAIL
    Keyword Final    --    Clearing previous data    ${result}    --

Type Number
    [ARGUMENTS]    ${NUM}
    ${digits} =    Split String To Characters    ${NUM}
    FOR  ${digit}  IN  @{digits}
        main.Click    ${digit}_button
    END

Start Up
    #starts the calculator process
    Start Process    calc

    #sets up sikuli to process all data at this location
    Configure Image Library    Sikuli    ${DATA PATH}
    Archive Any Previous Data

    #sets up the auto-generated GUI from our config
    main.Configure    Sikuli    C:/Users/Benny/Documents/github/DahlgrenTest/RFGUIHelper/configs/arith/    ${DATA PATH}

    #locate the calculator app
    Wait Until Keyword Succeeds    2x    3s    main.Find

Stop Test
    #use the calculator app to close itself
    main.Click    closeButton



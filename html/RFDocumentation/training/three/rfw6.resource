*** Settings ***
Library    genericwindow    WITH NAME    main
Resource   DataExtraction.resource
Library    String

*** Variables ***

*** Keywords ***
Start Arithmetic Calculator
    [ARGUMENTS]    ${DATA PATH}
    Start Process    calc
    main.Configure    Sikuli    C:/Users/Benny/Documents/github/DahlgrenTest/RFGUIHelper/configs/arith/    ${DATA PATH}
    Wait Until Keyword Succeeds    2x    3s    main.Find

Stop Arithmetic Calculator
    main.Find
    main.Click    closeButton

Drag Calculator
    [ARGUMENTS]    ${x}    ${y}
    main.Find
    main.Move    ${x}    ${y}

Read Value
    [ARGUMENTS]    ${answer}
    ${a} =    main.Read    output
    ${msg} =    Run Keyword If    ${a}==${answer}    Evaluate    'Success!'    ELSE    Evaluate    'Calculation was wrong: ${a}'
    Run Keyword If    ${a}!=${answer}    Fail

Clear Data
    Record Action    ${TEST NAME}    Clearing previous data
    main.Find
    main.Click    clear
    ${file} =    main.Capture Image    output
    Record Screen Image    ${file}   ${TEST NAME}    Clearing data
    ${a} =    main.Read    output
    ${result} =    Assert OQE Values Equal    ${TEST NAME}    Value zero    ${a}    0
    Run Keyword If    '${result}'=='FAIL'    FAIL
    Keyword Final    --    Clearing previous data    ${result}    --

Type Number
    [ARGUMENTS]    ${NUM}
    main.Find
    Record Action    ${TEST NAME}    Enter number: ${NUM}
    ${digits} =    Split String To Characters    ${NUM}
    FOR  ${digit}  IN  @{digits}
        Run Keyword If    '${digit}'=='-'    main.Click    flip_sign
        Run Keyword If    '${digit}'=='.'    main.Click    decimal
        Run Keyword If    '${digit}' in "0123456789"    main.Click    ${digit}_button
    END
    ${a} =    main.Read    output
    ${tmp1} =    Assert OQE Values Equal    ${TEST NAME}    First operand    ${a}    ${NUM}
    ${file} =    main.Capture Image    output
    Record Screen Image    ${file}   ${TEST NAME}    First operand

Square Value
    main.Find
    Record Action    ${TEST NAME}    Operation: x²
    main.Click    square
    
Square Root Value
    main.Find
    Record Action    ${TEST NAME}    Operation: √x
    main.Click    sqrt

Inverse Value
    main.Find
    Record Action    ${TEST NAME}    Operation: 1/x
    main.Click    inverse

Op Button
    [ARGUMENTS]    ${op}
    main.Find
    Record Action    ${TEST NAME}    Operation: ${op}
    main.Click    ${op}

Press Equals
    main.Find
    main.Click    equals
    ${a} =    main.Read    output
    Record Data    ${TEST NAME}    Answer    ${a}
    ${file} =    main.Capture Image    output
    Record Screen Image    ${file}   ${TEST NAME}    Answer

Math Problem
    [ARGUMENTS]    ${n1}    ${op}    ${n2}
    ${status} =    FAIL Token
    main.Find
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

*** Settings ***
Resource    ./../OQE/DataExtraction.resource
Library    ./genericwindow.py    Sikuli    C:/Users/Benny/Documents/github/DahlgrenTest/RFGUIHelper/configs/calculator    C:/Users/Benny/Documents/RFData    WITH NAME    calc
Library    Process
Library    String

Suite Setup        Suite Start
Test Setup         Test Start
Test Template      Test Calculator
Test Teardown      Test End
Suite Teardown     Suite End

*** Variables ***
${DATA PATH} =    C:/Users/Benny/Documents/RFData

*** Test Cases ***
Calc 1+4=5     1    4    add    5
Calc 2-7=-5    2    7    subtract    -5
Calc 3x5=15    3    5    times    15
Calc 8/2=4     8    2    divide    4

*** Keywords ***
Test Calculator
    [ARGUMENTS]    ${operand1}    ${operand2}    ${operator}    ${output}
    Log    ${TEST NAME}
    ${answer} =    Math Problem    ${operand1}    ${operator}    ${operand2}
    ${r} =    Assert OQE Values Equal    ${TEST NAME}    Answer    ${answer}    ${output}
    Run Keyword If    '${r}'=='PASS'    Record Action    ${TEST NAME}    Successful Output    ELSE    Fail    Output mismatch

Math Problem
    [ARGUMENTS]    ${NUMBER1}    ${op}    ${NUMBER2}
    Parse Number    ${NUMBER1}
    BuiltIn.Log To Console    Image capture operand1
    ${file} =    calc.Capture Image    Output
    Record Screen Image    ${file}    ${TEST NAME}    Operand 1
    BuiltIn.Log To Console    Check operand1
    ${n} =    calc.Read    Output
    ${r1} =    Assert OQE Values Equal    ${TEST NAME}    First Operand    ${n}    ${NUMBER1}
    Record Test Case    --    Operand 1 matches    ${r1}    --

    calc.Click    ${op}
    Parse Number    ${NUMBER2}
    ${file} =    calc.Capture Image    Output
    Record Screen Image    ${file}    ${TEST NAME}    Operand 2
    ${n} =    calc.Read    Output
    ${r2} =    Assert OQE Values Equal    ${TEST NAME}    Second Operand    ${n}    ${NUMBER2}
    Record Test Case    --    Operand 2 matches    ${r2}    --
    calc.Click    equals
    ${file} =    calc.Capture Image    Output
    Record Screen Image    ${file}    ${TEST NAME}    Answer
    ${n} =    calc.Read    Output
    ${r3} =    Assert OQE True    ${TEST NAME}    Operands Match    '${r1}'=='PASS' and '${r2}'=='PASS'
    Record Test Case    --    Answers Match    ${r3}    --
    Run Keyword If    '${r3}'=='PASS'    Record Action    ${TEST NAME}    Successful Input    ELSE    Fail    Input failed
    [RETURN]    ${n}

Parse Number
    [ARGUMENTS]    ${NUM}
    ${digits} =    Split String To Characters    ${NUM}
    FOR  ${digit}  IN  @{digits}
        Run Keyword    calc.Click    ${digit}_button
    END

Suite Start
    Configure Image Library    Sikuli    ${DATA PATH}
    Set Log Level    TRACE
    Start Process   calc
    Wait Until Keyword Succeeds    2x    3s    calc.Find
    Archive Any Previous Data
    ${tmp} =    calc.Document API
    Log    ${tmp}

Test Start
    New Test Event    ${TEST NAME}

Test End
    calc.Click    clear
    calc.Click    clear
    ${n} =    calc.Read    Output
    ${r} =    Assert OQE Values Equal    ${TEST NAME}    Verify Clear    ${n}    0

Suite End
    calc.Click    close_button
    Log    All done
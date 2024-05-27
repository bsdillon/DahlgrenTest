*** Settings ***
Library    genericwindow    WITH NAME    calc
Library    String

Resource    switch.resource

Suite Setup        Suite Start
Test Setup         Test Start
Test Template      Test Calculator
Test Teardown      Test End
Suite Teardown     Suite End

*** Variables ***
${REMOTE} =    192.168.0.199;5900;password

*** Test Cases ***
Calc 1+4=5     1    4    add    5

*** Keywords ***
Test Calculator
    [ARGUMENTS]    ${operand1}    ${operand2}    ${operator}    ${output}
    Verify Calculator Mode    Standard
    Log    ${TEST NAME}
    ${answer} =    Math Problem    ${operand1}    ${operator}    ${operand2}
    ${r} =    Assert OQE Values Equal    ${TEST NAME}    Answer    ${answer}    ${output}
    Run Keyword If    '${r}'=='PASS'    Record Action    ${TEST NAME}    Successful Output    ELSE    Fail    Output mismatch

Math Problem
    [ARGUMENTS]    ${NUMBER1}    ${op}    ${NUMBER2}
    Parse Number    ${NUMBER1}
    Sleep    2
    BuiltIn.Log To Console    Image capture operand1
    ${file} =    calc.Capture Image    Output
    Record Screen Image    ${file}    ${TEST NAME}    Operand 1
    BuiltIn.Log To Console    Check operand1
    ${n} =    calc.Read    Output
    ${r1} =    Assert OQE Values Equal    ${TEST NAME}    First Operand    ${n}    ${NUMBER1}
    Record Test Case    --    Operand 1 matches    ${r1}    --

    calc.Click    ${op}
    Parse Number    ${NUMBER2}
    Sleep    2
    ${file} =    calc.Capture Image    Output
    Record Screen Image    ${file}    ${TEST NAME}    Operand 2
    ${n} =    calc.Read    Output
    ${r2} =    Assert OQE Values Equal    ${TEST NAME}    Second Operand    ${n}    ${NUMBER2}
    Record Test Case    --    Operand 2 matches    ${r2}    --
    calc.Click    equals
    Sleep    2
    ${file} =    calc.Capture Image    Output
    Record Screen Image    ${file}    ${TEST NAME}    Answer
    ${n} =    calc.Read    Output
    ${r3} =    Assert OQE True    ${TEST NAME}    Operands Match    '${r1}'=='PASS' and '${r2}'=='PASS'
    Record Test Case    --    Answers Match    ${r3}    --
    Run Keyword If    '${r3}'=='PASS'    Record Action    ${TEST NAME}    Successful Input    ELSE    Fail    Input failed
    RETURN    ${n}

Parse Number
    [ARGUMENTS]    ${NUM}
    ${digits} =    Split String To Characters    ${NUM}
    FOR  ${digit}  IN  @{digits}
        Run Keyword    calc.Click    ${digit}_button
    END

Suite Start
    Setup Header    ${REMOTE}

    calc.Configure    Sikuli    C:/Users/Benny/Documents/github/DahlgrenTest/RFGUIHelper/configs/calculator    ${DATA PATH}    ${REMOTE}

    calc.Find
    ${tmp} =    calc.Document API
    Log    ${tmp}
    #calc.Debug Window
    
Test End
    calc.Click    clear
    calc.Click    clear
    ${n} =    calc.Read    Output
    ${r} =    Assert OQE Values Equal    ${TEST NAME}    Verify Clear    ${n}    0


*** Settings ***
Resource    ./../OQE/DataExtraction.resource
Library    ./PaintTester.py    C:/Users/Benny/Documents/github/DahlgrenTest/RFGUIHelper/configs/paint    C:/Users/Benny/Documents/RFData    WITH NAME    paint
Library    Process

Suite Setup        Suite Start
Test Setup         Test Start
Test Template      Test Paint
# Test Teardown      Test End
Suite Teardown     Suite End

*** Variables ***
${DATA PATH} =    C:/Users/Benny/Documents/RFData
${myproc} =    MadeupProcessID

*** Test Cases ***
One Test     None

*** Keywords ***
Test Paint
    [ARGUMENTS]    ${empty}
    Log    ${TEST NAME}
    paint.Press    fill
    paint.Press    red
    paint.Press    canvas
    Sleep    2s
    # ${file} =    paint.Capture Image    canvas
    # Record Screen Image    ${file}    ${TEST NAME}    Red Screen
    paint.Press    green
    paint.Press    canvas
    # ${file} =    paint.Capture Image    canvas
    # Record Screen Image    ${file}    ${TEST NAME}    Green Screen


Suite Start
    Configure Image Library    Sikuli    ${DATA PATH}
    Set Log Level    TRACE
    ${proc} =    Start Process   mspaint
    Set Suite Variable    ${myProc}    ${proc}
    Sleep    5s
    Wait Until Keyword Succeeds    2x    3s    paint.Find
    Archive Any Previous Data
    ${tmp} =    paint.Document API
    Log    ${tmp}

Test Start
    New Test Event    ${TEST NAME}

Suite End
    Log    Terminating Process ${myproc}
    Terminate Process    ${myproc}    kill=True
    Log    All done
*** Settings ***
Library    genericwindow.py    WITH NAME    program
Library    genericwindow.py    WITH NAME    radioMenu

Resource    switch.resource

Suite Setup        Suite Start
Test Setup         Test Start
Test Template      Test Calculator
#Test Teardown      Test End
Suite Teardown     Suite End

*** Variables ***

*** Test Cases ***
Dummy Case    None

*** Keywords ***
Test Calculator
    [ARGUMENTS]    ${dummy}
    Verify Calculator Mode    ProgrammerXXXXXX

    #formatting
    #actions
    #data from actions
    #contrast before/after
    #screen capture


    program.Click    bitshiftMenu
    Sleep    .5s
    radioMenu.Find
    radioMenu.Click    rotateRadio

Suite Start
    program.Configure    Sikuli    C:/Users/Benny/Documents/github/DahlgrenTest/RFGUIHelper/configs/programmerCal    ${DATA PATH}
    radioMenu.Configure    Sikuli    C:/Users/Benny/Documents/github/DahlgrenTest/RFGUIHelper/configs/radioMenu    ${DATA PATH}

    Setup Header

    program.Find
    #program.Debug Window

    ${tmp} =    program.Document API
    Log    ${tmp}
    ${tmp} =    radioMenu.Document API
    Log    ${tmp}

*** Settings ***
Resource   DataExtraction.resource
Library    genericwindow.py    WITH NAME    main

*** Variables ***
${DATA PATH} =    C:/Users/Benny/Documents/RFData
${PROC}

*** Test Cases ***
Test Case
    Start Up
    Log    Successful Start
    ${a}    main.Document API
    Log    ${a}
    main.Debug Window
    [TEARDOWN]    Stop Test

*** Keywords ***
Start Up
    #starts the calculator process
    Start Process    calc

    #sets up sikuli to process all data at this location
    Configure Image Library    Sikuli    ${DATA PATH}

    #sets up the auto-generated GUI from our config
    main.Configure    Sikuli    C:/Users/Benny/Documents/github/DahlgrenTest/RFGUIHelper/configs/arith/    ${DATA PATH}

    #locate the calculator app
    Wait Until Keyword Succeeds    2x    3s    main.Find

Stop Test
    #use the calculator app to close itself
    main.Click    closeButton



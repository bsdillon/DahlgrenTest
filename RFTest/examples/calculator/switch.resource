*** Settings ***
Resource   DataExtraction.resource
Library    genericwindow.py    WITH NAME    header
Library    genericwindow.py    WITH NAME    typeMenu

*** Variables ***
${DATA PATH} =    C:/Users/Benny/Documents/RFData

*** Keywords ***
Verify Calculator Mode
    [ARGUMENTS]    ${mode}
    Banner    Check Mode
    ${status} =    FAIL Token
    Record Action    ${TEST NAME}    Verifying Calculator Mode
    header.Find
    ${type} =    header.Read    typeText
    Assert OQE Values Equal    ${TEST NAME}    Check current mode    ${type}    ${mode}
    Run Keyword If    '${type}'!='${mode}'    Switch Calculator Type    ${mode}
    ${status} =    PASS Token
    [TEARDOWN]    Keyword Final    --    Verifying Calculator Mode    ${status}    --

Switch Calculator Type
    [ARGUMENTS]    ${type}
    ${message} =    Evaluate    Could not change to mode ${type}
    Soft Break
    Record Action    ${TEST NAME}    Switch Calculator Type
    header.Click    hamburgerMenu
    Sleep    1s
    typeMenu.Find
    #typeMenu.Debug Window
    ${status} =     Run Keyword And Return Status    typeMenu.Click    ${type}
    #Only click on menu header if the menu selection failed
    Run Keyword If    not ${status}    header.Click    calcIcon
    ${message} =    Run Keyword If    not ${status}    Evaluate    Menu did not have ${type}    ELSE    Evaluate    ${message}
    Sleep    1s
    ${new_type} =    header.Read    typeText
    ${file} =    header.Capture Image    typeText
    Record Screen Image    ${file}    ${TEST NAME}    Correct Mode
    ${a} =    Assert OQE Values Equal    ${TEST NAME}    Verify mode change    ${new_type}    ${type}
    Run Keyword If    '${a}'=='FAIL'    Fail    ${message}

Setup Header
    #sets up sikuli to process all data at this location
    Configure Image Library    Sikuli    ${DATA PATH}

    #RFW Logging and empties any current data from data path
    Set Log Level    TRACE
    Archive Any Previous Data

    header.Configure    Sikuli    C:/Users/Benny/Documents/github/DahlgrenTest/RFGUIHelper/configs/calculatorHead    ${DATA PATH}
    typeMenu.Configure    Sikuli    C:/Users/Benny/Documents/github/DahlgrenTest/RFGUIHelper/configs/calcMenu    ${DATA PATH}

    Start Process    calc
    Wait Until Keyword Succeeds    2x    3s    header.Find

Test Configuration Validation
    #verifies connection to sikuli, tesseract, and DataExtraction
    Test Check
    #verifies connection to output.py
    ${a} =    Prove it works
    Log    ${a}
    #verifying connection to the oqe report
    Insert Dummy Test Data

Test Start
    New Test Event    ${TEST NAME}

Suite End
    header.Click    closeButton


*** Settings ***
Resource   DataExtraction.resource
Library    genericwindow    WITH NAME    main

*** Variables ***
${DATA PATH} =    C:/Users/Owner/OneDrive/Documents/RFData3_1

*** Test Cases ***
DDT Test
    Suite Start
    Test Start
    Run Test
    Test Stop

*** Keywords ***
Suite Start
    Configure Image Library    Sikuli    ${DATA PATH}
    Set Log Level    TRACE
    Archive Any Previous Data
    New Test Event    GUI Survey
    Record Action    Suite Start    Done

Test Start
    Banner    Starting Test Suite
    #Start the application
    Start Process    python    C:/Users/Owner/OneDrive/Documents/RFWDeployment/RFGUIHelper/RFGUIHelp.py

    #sets up sikuli to process all data at this location
    main.Configure    Sikuli    C:/Users/Owner/OneDrive/Documents/RFWDeployment/RFTest/examples/rfgui/rfguihelper.json     ${DATA PATH}

    #locate the app
    Wait Until Keyword Succeeds    2x    3s    main.Find

    Log    Successful Start
    Log To Console    Successful Start
    Record Action    Test Start    Successful Start
    [Teardown]    Keyword Final    ${TEST NAME}    Test Start    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

Run Test
    Banner    Running Test
    ${a}    main.Document API
    Log    ${a}
    main.Debug Window
    [Teardown]    Keyword Final    ${TEST NAME}    Run Test    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

Test Stop
    Banner    Stopping Test
    main.Click    closeButton
    [Teardown]    Keyword Final    ${TEST NAME}    Test Stop    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

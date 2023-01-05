*** Settings ***
Resource   DataExtraction.resource
Library    genericwindow.py    WITH NAME    paintHome
Library    genericwindow.py    WITH NAME    paintView
Library    Process

Suite Setup        Suite Start
Test Setup         Test Start
Test Template      Test Paint
# Test Teardown      Test End
Suite Teardown     Suite End

*** Variables ***
${DATA PATH} =    C:/Users/Benny/Documents/RFData

*** Test Cases ***
One Test     None

*** Keywords ***
Test Paint
    [ARGUMENTS]    ${empty}
    Log    ${TEST NAME}
    paintHome.Move     200    50
    paintHome.Click    viewTab

    paintView.Find
    ${a} =   paintView.Check State    rulerBox
    Run Keyword If    '${a}'=='Checked'    paintView.Click    rulerBox
    ${a} =   paintView.Check State    gridBox
    Run Keyword If    '${a}'=='Checked'    paintView.Click    gridBox
    ${a} =   paintView.Check State    statusBox
    Run Keyword If    '${a}'=='Checked'    paintView.Click    statusBox

    paintHome.Find
    paintHome.Click    homeTab
    paintHome.Scroll    vertScroll    Down
    paintHome.Scroll    vertScroll    Up

    # ${file} =    paint.Capture Image    canvas
    # Record Screen Image    ${file}    ${TEST NAME}    Red Screen
    # ${file} =    paint.Capture Image    canvas
    # Record Screen Image    ${file}    ${TEST NAME}    Green Screen


Suite Start
    paintHome.Configure    Sikuli    C:/Users/Benny/Documents/github/DahlgrenTest/RFGUIHelper/configs/paint    C:/Users/Benny/Documents/RFData
    paintView.Configure    Sikuli    C:/Users/Benny/Documents/github/DahlgrenTest/RFGUIHelper/configs/paint2    C:/Users/Benny/Documents/RFData
    Configure Image Library    Sikuli    ${DATA PATH}
    Set Log Level    TRACE
    ${proc} =    Start Process    mspaint
    Wait Until Keyword Succeeds    2x    3s    paintHome.Find
    Archive Any Previous Data
    ${tmp} =    paintHome.Document API
    Log    ${tmp}
    ${tmp} =    paintView.Document API
    Log    ${tmp}

Test Start
    New Test Event    ${TEST NAME}

Suite End
    paintHome.Click    closeButton
    Log    All done
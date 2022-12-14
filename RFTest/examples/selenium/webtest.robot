*** Settings ***
Resource    ./../OQE/DataExtraction.resource
Library    ./genericwindow.py    Sikuli    C:/Users/Benny/Documents/github/DahlgrenTest/RFGUIHelper/configs/webpage_primary    C:/Users/Benny/Documents/RFData    WITH NAME    primary
Library    ./genericwindow.py    Sikuli    C:/Users/Benny/Documents/github/DahlgrenTest/RFGUIHelper/configs/secondary    C:/Users/Benny/Documents/RFData    WITH NAME    secondary
Library    ./genericwindow.py    Sikuli    C:/Users/Benny/Documents/github/DahlgrenTest/RFGUIHelper/configs/red_figure    C:/Users/Benny/Documents/RFData    WITH NAME    red
Library    ./genericwindow.py    Sikuli    C:/Users/Benny/Documents/github/DahlgrenTest/RFGUIHelper/configs/blue_figure    C:/Users/Benny/Documents/RFData    WITH NAME    blue
Library    ./genericwindow.py    Sikuli    C:/Users/Benny/Documents/github/DahlgrenTest/RFGUIHelper/configs/color_menu    C:/Users/Benny/Documents/RFData    WITH NAME    colorMenu
Library    ./genericwindow.py    Sikuli    C:/Users/Benny/Documents/github/DahlgrenTest/RFGUIHelper/configs/item_menu    C:/Users/Benny/Documents/RFData    WITH NAME    itemMenu
Library    ./genericwindow.py    Sikuli    C:/Users/Benny/Documents/github/DahlgrenTest/RFGUIHelper/configs/calendar    C:/Users/Benny/Documents/RFData    WITH NAME    calendar
Library    Process

Suite Setup        Suite Start
Test Setup         Test Start
Test Template      Test Web
# Test Teardown      Test End
#Suite Teardown     Suite End

*** Variables ***
${DATA PATH} =    C:/Users/Benny/Documents/RFData
${myproc} =    MadeupProcessID

*** Test Cases ***
One Test    None

*** Keywords ***
Test Web
    [Arguments]    ${dummy}
    Log    Nothing
    ${anchor} =    primary.Find
    ${origText} =    primary.Read    menu_label
    ${r1} =    Assert OQE Values Equal    ${TEST NAME}    Before Menu Selection    ${origText}    "No selection"
    ${all} =    Create List    ${r1}
    Record Action    ${TEST NAME}    Click Menu
    primary.Click    menu_button
    ${anchor} =    itemMenu.Find
    Record Action    ${TEST NAME}    Click Item 1
    itemMenu.Click    item_1
    primary.Click    empty_button
    ${newText} =    primary.Read    menu_label
    ${r2} =    Assert OQE Values Equal    ${TEST NAME}    After Menu Selection    ${newText}    "item1"
    Append To List    ${all}    ${r2}
    primary.RightClick    empty_button
    ${anchor} =    itemMenu.Find
    Record Action    ${TEST NAME}    Click Item 3
    itemMenu.Click    item_3
    primary.Click    menu_label
    ${finalText} =    primary.Read    menu_label
    ${r3} =    Assert OQE Values Equal    ${TEST NAME}    Final Menu Selection    ${newText}    "item3"
    Append To List    ${all}    ${r2}
    ${answer} =    All Pass Or Fail    ${all}
    Record Test Case   ${TEST NAME}    Item Menu Validation    ${answer}    --

    # primary
    # secondary
    # red
    # blue
    # colorMenu
    # itemMenu
    # calendar

Suite Start
    Set Log Level    TRACE
    Configure Image Library    Selenium    C:/Users/Benny/Documents/RFData    browser=CH    url=https://bsdillon.github.io/DahlgrenTest/html/Testing/jsprimary.html
    Archive Any Previous Data
    ${tmp} =    primary.Document API
    Log    ${tmp}

Test Start
    New Test Event    ${TEST NAME}

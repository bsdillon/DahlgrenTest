*** Settings ***
Resource   DataExtraction.resource
Library    genericwindow    WITH NAME    myScreen

*** Variables *** 
${name} =    Work with Screen
${DATA PATH} =    C:/Users/Benny/Documents/RFData

*** Test Cases ***
Starting
    Configure Image Library    Sikuli    ${DATA PATH}
    Set Log Level    TRACE
    Archive Any Previous Data
    Setup Screen
    New Test Event    ${name}

Snapshot
    ${file} =    myScreen.Capture Image    screen
    Record Screen Image    ${file}    ${name}    Screenshot

*** Keywords ***
Setup Screen
    myScreen.Configure    Sikuli    C:/Users/Benny/Documents/github/DahlgrenTest/RFGUIHelper/configs/BlankScreen    ${DATA PATH}

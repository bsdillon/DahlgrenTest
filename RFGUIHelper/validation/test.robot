*** Settings ***
Resource   DataExtraction.resource
Library    genericwindow.py    WITH NAME    gui

*** Variables ***
${DATA PATH} =    C:/Users/Benny/Documents/RFData

*** Test Cases ***
Configuration Checks
    Configure Image Library    Sikuli    ${DATA PATH}
    Set Log Level    TRACE
    Archive Any Previous Data
    gui.Configure    Sikuli    C:/Users/Benny/Documents/github/DahlgrenTest/RFTest/validation/    ${DATA PATH}
    Test Check
    ${a} =    Prove it works
    Log    ${a}
    Insert Dummy Test Data
    New Test Event    Validation Only
    ${tmp} =    gui.Document API
    Log    ${tmp}

Test Start
    gui.Find
    ${a} =    gui.Read    targettext
    Log    Text read by tesseract: ${a}

*** Keywords ***

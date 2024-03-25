*** Settings ***
Resource    DataExtraction.resource
Resource    rfghelper.resource

*** Variables ***
${DATA PATH} =    C:/Users/Owner/OneDrive/Documents/RFData3_1
${PROJ FOLDER} =    C:/Users/Owner/OneDrive/Documents/GitHub/DahlgrenTest/RFTest/examples/RFGHelper/testOnly
${PROJ FILE} =    testOnly

*** Test Cases ***
Startup
    Suite Start
    RF GUI Helper: Open     ${DATA PATH}

Verify Menus
    RF GUI Helper: Click Menu and Verify    fMenu
    RF GUI Helper: Click Menu and Verify    aMenu    expectFail=True
    RF GUI Helper: Click Menu and Verify    nullMenu

Open Project
    RF GUI Helper: Open Project File    ${PROJ FOLDER}    ${PROJ FILE}

Close Project
    RF GUI Helper: Close Project
    Test Teardown

*** Keywords ***
Test Teardown
    RF GUI Helper: Close

Suite Start
    Configure Image Library    Sikuli    ${DATA PATH}
    Set Log Level    TRACE
    Archive Any Previous Data
    New Test Event    ${TEST NAME}

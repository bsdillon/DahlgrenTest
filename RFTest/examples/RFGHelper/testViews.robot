*** Settings ***
Resource    DataExtraction.resource
Resource    rfghelper.resource

*** Variables ***
${DATA PATH} =    C:/Users/Owner/OneDrive/Documents/RFData3_1
${PROJ FOLDER} =    C:/Users/Owner/OneDrive/Documents/GitHub/DahlgrenTest/RFTest/examples/RFGHelper/testOnly
${PROJ FILE} =    testOnly
${IMG FOLDER} =    C:/Users/Owner/OneDrive/Documents/GitHub/DahlgrenTest/RFTest/examples/RFGHelper
${viewFile} =    dummy
${viewFile2} =    dummy2

*** Test Cases ***
Startup
    Suite Start
    RF GUI Helper: Open     ${DATA PATH}

Open Project
    RF GUI Helper: Open Project File    ${PROJ FOLDER}    ${PROJ FILE}

Add View
    RF GUI Helper: Add View    ${IMG FOLDER}    ${viewFile}    dummy

Edit View Image
    RF GUI Helper: Edit View Image    ${IMG FOLDER}    ${viewFile2}    dummy

Rename View
    RF GUI Helper: Rename View    dummy    dummy2

Delete View
    RF GUI Helper: Delete View    dummy2

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
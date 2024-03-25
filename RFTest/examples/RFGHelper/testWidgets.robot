*** Settings ***
Resource    DataExtraction.resource
Resource    rfghelper.resource

*** Variables ***
${DATA PATH} =    C:/Users/Owner/OneDrive/Documents/RFData3_1
${PROJ FOLDER} =    C:/Users/Owner/OneDrive/Documents/GitHub/DahlgrenTest/RFTest/examples/RFGHelper/testOnly
${PROJ FILE} =    allMembers
${IMG FOLDER} =    C:/Users/Owner/OneDrive/Documents/GitHub/DahlgrenTest/RFTest/examples/RFGHelper
${IMG FILE} =    allMembers

*** Test Cases ***
Startup
    Suite Start
    RF GUI Helper: Open     ${DATA PATH}

Create New Project
    RF GUI Helper: New Project    ${PROJ FOLDER}    ${PROJ FILE}    ${IMG FOLDER}    ${IMG FILE}

# Create Widgets
#     Log    do nothing

Close Project
    RF GUI Helper: Close Project
    #delete the project files?
    Test Teardown

*** Keywords ***
Test Teardown
    RF GUI Helper: Close

Suite Start
    Configure Image Library    Sikuli    ${DATA PATH}
    Set Log Level    TRACE
    Archive Any Previous Data
    New Test Event    ${TEST NAME}
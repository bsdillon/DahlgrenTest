*** Comments ***
This test file verifies the watchers and the concurrent GIF formation

*** Settings ***
Resource    DataExtraction.resource
Resource    rfghelper.resource

*** Variables ***
${DATA PATH} =    C:/Users/Owner/OneDrive/Documents/RFData3_1
${PROJ FOLDER} =    C:/Users/Owner/OneDrive/Documents/GitHub/DahlgrenTest/RFTest/examples/RFGHelper/test_views
${PROJ FILE} =    testOnly

*** Test Cases ***
Startup
    RF GUI Helper: Suite Start    ${DATA PATH}
    RF GUI Helper: Open     ${DATA PATH}

Create Watcher
    Log To Console    Creating Watcher
    RF GUI Helper: Watch    primary    widgetList    Growing_List
    Log To Console    Opening project
    RF GUI Helper: Open Project File    ${PROJ FOLDER}    ${PROJ FILE}
    Log To Console    Halting Watcher
    RF GUI Helper: Stop Watcher    primary    Growing_List

Close Project
    RF GUI Helper: Stop Test

*** Keywords ***

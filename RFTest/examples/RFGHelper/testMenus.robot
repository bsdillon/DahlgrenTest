*** Comments ***
This test file verifies the menu operation and especially their relaitonship to the open/close project
- File menu should always be available
- Action menu should ONLY be available when a project is open

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

Verify Menus
    RF GUI Helper: Click Menu or Fail    fMenu
    RF GUI Helper: Click Menu or Fail    aMenu    expectFail=True
    RF GUI Helper: Click Menu or Fail    nullMenu

Open Project
    RF GUI Helper: Open Project File    ${PROJ FOLDER}    ${PROJ FILE}

Close Project
    RF GUI Helper: Stop Test

*** Keywords ***

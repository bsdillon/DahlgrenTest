*** Comments ***
This test file verifies the creation, edition, and deletion of views.

*** Settings ***
Resource    DataExtraction.resource
Resource    rfghelper.resource

*** Variables ***
${DATA PATH} =    C:/Users/Owner/OneDrive/Documents/RFData3_1
${PROJ FOLDER} =    C:/Users/Owner/OneDrive/Documents/GitHub/DahlgrenTest/RFTest/examples/RFGHelper/test_views
${PROJ FILE} =    testOnly
${IMG FOLDER} =    C:/Users/Owner/OneDrive/Documents/GitHub/DahlgrenTest/RFTest/examples/RFGHelper
${viewFile} =    dummy
${viewFile2} =    dummy2

*** Test Cases ***
Startup
    RF GUI Helper: Suite Start    ${DATA PATH}
    RF GUI Helper: Open     ${DATA PATH}

Open Project
    RF GUI Helper: Open Project File    ${PROJ FOLDER}    ${PROJ FILE}

Add View and Delete
    RF GUI Helper: Add View    ${IMG FOLDER}    ${viewFile}    dummy
    RF GUI Helper: Delete View    dummy

Add View and Widget
    RF GUI Helper: Add View    ${IMG FOLDER}    ${viewFile}    dummy
    RF GUI Helper: Create Widget    10    10    10     10    myButton         Button

Edit View Image
    RF GUI Helper: Edit View Image    ${IMG FOLDER}    ${viewFile2}    dummy

Rename View
    RF GUI Helper: Rename View    dummy    dummy2

Delete View
    RF GUI Helper: Delete View    dummy2

Close Project
    RF GUI Helper: Stop Test

*** Keywords ***

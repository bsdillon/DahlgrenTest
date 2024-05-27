*** Settings ***
Resource    DataExtraction.resource

*** Variables ***
${DATA PATH} =    C:/Users/Owner/OneDrive/Documents/RFData3_1

*** Test Cases ***
Suite Start
    Configure Image Library    Sikuli    ${DATA PATH}
    Set Log Level    TRACE
    Archive Any Previous Data
    New Test Event    ${TEST NAME}
    Record Action     ${TEST NAME}    Doing something
    Record Data    ${TEST NAME}    Just data    1=1
    ${promise} =    Promise Data    ${TEST NAME}    Just a promise
    Third Party Analysis    ./OQE/thirdpartyanalyst.py    ${promise}    Nothing


*** Keywords ***
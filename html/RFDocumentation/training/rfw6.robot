*** Settings ***
Resource    DataExtraction.resource
Resource    rfw6.resource

*** Variables ***
${DATA PATH} =    C:/Users/Owner/OneDrive/Documents/RFData3_1

*** Test Cases ***
DDT Test
    Suite Start
    RF GUI Helper: Open     ${DATA PATH}
    Click and Verify    fMenu
    Click and Verify    aMenu    expectFail=True
    [TEARDOWN]    RF GUI Helper: Close

*** Keywords ***
Suite Start
    Configure Image Library    Sikuli    ${DATA PATH}
    Set Log Level    TRACE
    Archive Any Previous Data
    New Test Event    ${TEST NAME}

Click and Verify
    [Arguments]    ${menuName}    ${expectFail}=False
    Banner    Selecting ${menuName}
    IF    ${expectFail}
        ${msg} =    Run Keyword and Expect Error    *    RF GUI Helper: Click Menu    ${menuName}    
        Record Data    ${TEST NAME}    Selecting ${menuName}    Expected Failure: ${msg}
    ELSE
        RF GUI Helper: Click Menu    ${menuName}
    END
    [TEARDOWN]    Keyword Final    ${TEST NAME}    Selecting ${menuName}    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}
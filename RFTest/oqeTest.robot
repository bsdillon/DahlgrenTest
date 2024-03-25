*** Settings ***
Resource   DataExtraction.resource

*** Variables ***
${TEST NAME} =    Some Test
${DATA PATH} =    C:/Users/Owner/OneDrive/Documents/RFData3_1

*** Test Cases ***
Default Test
    Configure Image Library    Sikuli    ${DATA PATH}
    Set Log Level    TRACE
    Archive Any Previous Data
    New Test Event    ${TEST NAME}
    Test Check
    ${a} =    Prove it works
    Record Data    Validation    Connection to OQE    ${a}

*** Keywords ***
*** Settings ***
Library   kw_DataExtraction.py    ./../OQE/test2.js    ./../OQE/test2other.js    WITH NAME    oqe
Library   OperatingSystem
Library   Collections

*** Variables ***

*** Keywords ***
Test Check
    Log    DataExtraction.resource is connected

New Test Event
    [Arguments]    ${CASE NAME}
    ${TEST_CASE_TIME}       oqe.Test Case Start Time
    oqe.Create Test Case    ${CASE NAME} ${TEST_CASE_TIME}

Assert OQE Value
    [Arguments]    ${CASE NAME}    ${STEP NAME}    ${actual}    ${expected}
    ${TEST_STATUS}    oqe.Compare Results     ${actual}    ${expected}
    oqe.Write Results    ${CASE NAME}    ${STEP NAME}    ${TEST_STATUS}     Actual: ${actual}, Expected: ${expected}
    [RETURN]    ${TEST_STATUS}

Get Image File Name
   [Arguments]   ${CASE NAME}    ${STEP NAME}
   ${newFileName}    oqe.Get Next Img File   ${CASE NAME}_${STEP NAME}
   [Return]    ${newFileName}
  
Record Data
   [Arguments]   ${CASE NAME}    ${STEP NAME}    ${DATA}
   oqe.Write Data   ${CASE NAME}    ${STEP NAME}    Data     ${Data}   

Record Test Case
   [Arguments]   ${CASE NAME}    ${STEP NAME}    ${STATUS}    ${MESSAGE}
   oqe.Write Results   ${CASE NAME}    ${STEP NAME}    ${STATUS}     ${MESSAGE}

Capture Element Image
   [Arguments]    ${CSS-IDENTIFIER}    ${CASE NAME}    ${STEP NAME}
   ${FILE} =    Get Image File Name    ${CASE NAME}    ${STEP NAME}
   Capture Element Screenshot    ${CSS-IDENTIFIER}    ${FILE}
   oqe.Write Image    ${CASE NAME}    ${STEP NAME}    Screenshot     ${FILE}

Capture Screen Image
   [Arguments]    ${CASE NAME}    ${STEP NAME}
   ${FILE} =    Get Image File Name    ${CASE NAME}    ${STEP NAME}
   Capture Page Screenshot    ${FILE}
   oqe.Write Image    ${CASE NAME}    ${STEP NAME}    Screenshot     ${FILE}

Data Break
   oqe.Write Data   --    --    --     --   

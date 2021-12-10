*** Settings ***
Library   kw_DataExtraction.py    ./../OQE/test2.js    ./../OQE/test2other.js    WITH NAME    oqe
Library   OperatingSystem
Library   Collections

*** Variables ***
${TEST_STATUS}
${TEST_MESSAGE}
${ACTUAL}
${EXPECTED}
${DETAILS}

*** Keywords ***
Test Check
    Log    DataExtraction.resource is connected

New Test Event
    [Arguments]    ${TEST_NAME}
    ${TEST_CASE_TIME}       oqe.Test Case Start Time
    oqe.Create Test Case    ${TEST_NAME} ${TEST_CASE_TIME}

Assert OQE Value
    [Arguments]    ${testCaseName}    ${testStepName}    ${actual}    ${expected}
    ${TEST_STATUS}    oqe.Compare Results     ${actual}    ${expected}
    oqe.Write Results    ${testCaseName}    ${testStepName}    ${TEST_STATUS}     Actual: ${actual}, Expected: ${expected}

Get Image File Name
   [Arguments]    ${TEST}    ${STEP}
   ${newFileName}    oqe.Get Next Img File    ${TEST}_${STEP}
   [Return]    ${newFileName}

Record OQE Image
   [Arguments]    ${TEST}    ${STEP}    ${FILE}
   oqe.Write Image    ${TEST}    ${STEP}    Screenshot     ${FILE}
   
Record Data
   [Arguments]    ${TEST}    ${STEP}    ${DATA}
   oqe.Write Data    ${TEST}    ${STEP}    Data     ${Data}   

Record Test Case
   [Arguments]    ${TEST}    ${STATUS}    ${MESSAGE}
   oqe.Write Results    ${TEST}    --    ${STATUS}     ${MESSAGE}




Record OQE 2
    [Arguments]             ${actual}    ${expected}    ${testCaseName}    ${testStepCount}    ${testCaseTime}    ${testStepName}    ${TEST_STEP_START_TIME}
    ${TEST_STATUS}          kw_DataExtraction.CompareResults     ${actual}    ${expected}
    Write Results & End Individual Test Case        ${testStepCount}    ${actual}    ${expected}    ${testCaseName}    ${testStepName}    ${TEST_STEP_START_TIME}    ${TEST_STATUS}     ${DETAILS}

Write Results & End Individual Test CAse
    [Arguments]             ${testStepCount}    ${actual}    ${expected}    ${testCaseName}    ${testStepName}    ${TEST_STEP_START_TIME}    ${TEST_STATUS}     ${DETAILS}
    kw_DataExtraction.WriteResults    ${TEST_CASE_TIME}    ${testStepCount}    ${actual}    ${expected}    ${testCaseName}    ${TEST_STATUS}     ${testStepName}    ${TEST_STEP_START_TIME}    ${DETAILS}
    kw_DataExtraction.EndOfIndividualTestCase
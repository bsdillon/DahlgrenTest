*** Settings ***
Library   kw_DataExtraction.py    ./../OQE/test2.js    ./../OQE/test2other.js
Library   OperatingSystem
Library   Collections

*** Variables ***
${TEST_STATUS}
${TEST_MESSAGE}
${ACTUAL}
${EXPECTED}
${DETAILS}

*** Keywords ***
Test Case Time
    ${TEST_CASE_TIME}       kw_DataExtraction.getTime
    [Return]                ${TEST_CASE_TIME}

Test Check
    Log    The test check works

Record OQE
    [Arguments]             ${actual}    ${expected}    ${testCaseName}    ${testStepCount}    ${testCaseTime}    ${testStepName}    ${TEST_STEP_START_TIME}
    ${TEST_STATUS}          kw_DataExtraction.CompareResults     ${actual}    ${expected}
    Write Results & End Individual Test Case        ${testStepCount}    ${actual}    ${expected}    ${testCaseName}    ${testStepName}    ${TEST_STEP_START_TIME}    ${TEST_STATUS}     ${DETAILS}

Write Results & End Individual Test CAse
    [Arguments]             ${testStepCount}    ${actual}    ${expected}    ${testCaseName}    ${testStepName}    ${TEST_STEP_START_TIME}    ${TEST_STATUS}     ${DETAILS}
    kw_DataExtraction.WriteResults    ${TEST_CASE_TIME}    ${testStepCount}    ${actual}    ${expected}    ${testCaseName}    ${TEST_STATUS}     ${testStepName}    ${TEST_STEP_START_TIME}    ${DETAILS}
    kw_DataExtraction.EndOfIndividualTestCase
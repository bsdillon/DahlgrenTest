*** Settings ***
Library   kw_DataExtraction.py
Library   OperatingSystem
Library   Collections

*** Variables ***
${ARCHIVED_TEST_RESULTS}         ArchivedTestResults
${TEST_RESULTS_FILE}             demodata.js
${START_OF_TEST_RESULTS_FILE}    var testRuns = { ${\n} ${\n}
${TEST_STATUS}
${TEST_MESSAGE}
${ACTUAL}
${EXPECTED}
${DETAILS}

*** Keywords ***
Test Case Time
    ${TEST_CASE_TIME}       kw_DataExtraction.getTime
    [Return]                ${TEST_CASE_TIME}

Result File Setup
    #Needs to be done only 1 time for a test suite
    Move File               ${TEST_RESULTS_FILE}    ${ARCHIVED_TEST_RESULTS}
    Append to file          ${TEST_RESULTS_FILE}    ${START_OF_TEST_RESULTS_FILE}

Record OQE
    [Arguments]             ${actual}    ${expected}    ${testCaseName}    ${testStepCount}    ${testCaseTime}    ${testStepName}    ${TEST_STEP_START_TIME}
    ${TEST_STATUS}          kw_DataExtraction.CompareResults     ${actual}    ${expected}
    Write Results & End Individual Test Case        ${testStepCount}    ${actual}    ${expected}    ${testCaseName}    ${testStepName}    ${TEST_STEP_START_TIME}    ${TEST_STATUS}     ${DETAILS}

Write Results & End Individual Test CAse
    [Arguments]             ${testStepCount}    ${actual}    ${expected}    ${testCaseName}    ${testStepName}    ${TEST_STEP_START_TIME}    ${TEST_STATUS}     ${DETAILS}
    kw_DataExtraction.WriteResults    ${TEST_CASE_TIME}    ${testStepCount}    ${actual}    ${expected}    ${testCaseName}    ${TEST_STATUS}     ${testStepName}    ${TEST_STEP_START_TIME}    ${DETAILS}
    kw_DataExtraction.EndOfIndividualTestCase
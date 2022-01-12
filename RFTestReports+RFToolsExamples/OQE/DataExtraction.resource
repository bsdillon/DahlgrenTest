*** Settings ***
Library   kw_DataExtraction.py    ./../../../../RFData/test2.js    ./../../../../RFData/test2other.js    WITH NAME    oqe
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
    [Return]    ${CASE NAME} ${TEST_CASE_TIME}

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

####################################
#### Suite level data recording ####
####################################
Suite Data
   [Arguments]    ${TITLE}    ${LABEL}    ${VALUE}
   oqe.Structured Suite Data    ${TITLE}    ${VALUE}    ${LABEL}

Suite Multi Data
   [Arguments]    ${TITLE}    ${LABEL}    @{VALUES}
   ${i} =    Evaluate    0
   FOR    ${v}    IN    @{VALUES}
      oqe.Structured Suite Data    ${TITLE}-${i}    ${v}    ${LABEL}
      ${i} =     Evaluate    ${i}+1
   END

Suite Line
   [Arguments]    ${STYLE}    ${MODES}    ${TITLE}    ${XAXIS}    ${YAXIS}    ${SERIES}
   oqe.Add Suite Structure    ${STYLE}    ${TITLE}    ${XAXIS}    ${YAXIS}    ${SERIES}    ${MODES}

Suite Multi Line
   [Arguments]    ${STYLE}    ${MODES}    ${TITLE}    ${XAXIS}    ${YAXIS}    @{SERIES}
   ${i} =    Evaluate    0
   FOR    ${s}    IN    @{SERIES}
      oqe.Add Suite Structure    ${STYLE}    ${TITLE}-${i}    ${XAXIS}    ${YAXIS}    ${s}    ${MODES}_Multi
      ${i} =     Evaluate    ${i}+1
   END

Suite Pie
   [Arguments]    ${MODES}    ${TITLE}    ${XAXIS}    ${YAXIS}    ${SERIES}
   oqe.Add Suite Structure    Pie    ${TITLE}    ${XAXIS}    ${YAXIS}    ${SERIES}    ${MODES}

Suite Color Scheme
   [Arguments]    ${TITLE}    @{COLORS}
   oqe.Set Suite Color Scheme     ${TITLE}    ${COLORS}

Suite Color Group
   [Arguments]    ${TITLE}    ${GROUP}
   oqe.Set Suite Color Group     ${TITLE}    ${GROUP}

####################################
####  Test level data recording ####
####################################
Test Data
   [Arguments]    ${TEST}    ${TITLE}    ${LABEL}    ${VALUE}
   oqe.Structured Test Data    ${TEST}    ${TITLE}    ${VALUE}    ${LABEL}

Test Multi Data
   [Arguments]    ${TEST}    ${TITLE}    ${LABEL}    @{VALUES}
   ${i} =    Evaluate    0
   FOR    ${v}    IN    @{VALUES}
      oqe.Structured Test Data    ${TEST}    ${TITLE}-${i}    ${v}    ${LABEL}
      ${i} =     Evaluate    ${i}+1
   END

Test Line
   [Arguments]    ${TEST}    ${STYLE}    ${MODES}    ${TITLE}    ${XAXIS}    ${YAXIS}    ${SERIES}
   oqe.Add Test Structure    ${TEST}    ${STYLE}    ${TITLE}    ${XAXIS}    ${YAXIS}    ${SERIES}    ${MODES}

Test Multi Line
   [Arguments]    ${TEST}    ${STYLE}    ${MODES}    ${TITLE}    ${XAXIS}    ${YAXIS}    @{SERIES}
   ${i} =    Evaluate    0
   FOR    ${s}    IN    @{SERIES}
      oqe.Add Test Structure    ${TEST}    ${STYLE}    ${TITLE}-${i}    ${XAXIS}    ${YAXIS}    ${s}    ${MODES}_Multi
      ${i} =     Evaluate    ${i}+1
   END

Test Pie
   [Arguments]    ${TEST}    ${MODES}    ${TITLE}    ${XAXIS}    ${YAXIS}    ${SERIES}
   oqe.Add Test Structure    ${TEST}    Pie    ${TITLE}    ${XAXIS}    ${YAXIS}    ${SERIES}    ${MODES}

Test Color Scheme
   [Arguments]    ${TEST}    ${TITLE}    @{COLORS}
   oqe.Set Test Color Scheme     ${TEST}    ${TITLE}    ${COLORS}

Test Color Group
   [Arguments]    ${TEST}    ${TITLE}    ${GROUP}
   oqe.Set Test Color Group     ${TEST}    ${TITLE}    @{GROUP}

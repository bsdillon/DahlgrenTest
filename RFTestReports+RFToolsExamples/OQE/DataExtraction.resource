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

Special Data
   [Arguments]    ${TITLE}    ${LABEL}    ${VALUE}
   oqe.Structured Data    ${TITLE}    ${VALUE}    ${LABEL}

Report Line
   [Arguments]    ${STYLE}    ${TITLE}    ${XAXIS}    ${YAXIS}    ${SERIES}
   oqe.Add Structure    Line_${STYLE}    ${TITLE}    ${XAXIS}    ${YAXIS}    ${SERIES}

Report VBar
   [Arguments]    ${STYLE}    ${TITLE}    ${XAXIS}    ${YAXIS}    ${SERIES}
   oqe.Add Structure    VBar_${STYLE}    ${TITLE}    ${XAXIS}    ${YAXIS}    ${SERIES}

Report Pie
   [Arguments]    ${TITLE}    ${XAXIS}    ${YAXIS}    ${SERIES}
   oqe.Add Structure    Pie    ${TITLE}    ${XAXIS}    ${YAXIS}    ${SERIES}

Special Multi Data
   [Arguments]    ${TITLE}    ${LABEL}    @{VALUES}
   ${i} =    Evaluate    0
   FOR    ${v}    IN    @{VALUES}
      oqe.Structured Data    ${TITLE}-${i}    ${v}    ${LABEL}
      ${i} =     Evaluate    ${i}+1
   END

Report Multi Line
   [Arguments]    ${STYLE}    ${TITLE}    ${XAXIS}    ${YAXIS}    @{SERIES}
   ${i} =    Evaluate    0
   FOR    ${s}    IN    @{SERIES}
      oqe.Add Structure    Multi_Line_${STYLE}    ${TITLE}-${i}    ${XAXIS}    ${YAXIS}    ${s}
      ${i} =     Evaluate    ${i}+1
   END

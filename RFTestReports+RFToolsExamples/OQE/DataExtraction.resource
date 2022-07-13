*** Settings ***
Library   kw_DataExtraction.py    ./../../../../RFData/test2.js    ./../../../../RFData/test2.js    WITH NAME    oqe
Library   OperatingSystem
Library   Collections
Library   ./kw_simplesikuli.py    WITH NAME    sSikuli

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

Record Action
   [Arguments]   ${CASE NAME}   ${ACT DESCRIPTION}
   oqe.Write Data    ${CASE NAME}    ${ACT DESCRIPTION}    Action    --

Record Test Case
   [Arguments]   ${CASE NAME}    ${STEP NAME}    ${STATUS}    ${MESSAGE}
   oqe.Write Results   ${CASE NAME}    ${STEP NAME}    ${STATUS}     ${MESSAGE}

Keyword Final
   [Arguments]   ${CASE NAME}    ${STEP NAME}    ${STATUS}    ${MESSAGE}
   oqe.Write Results   ${CASE NAME}    ${STEP NAME}    ${STATUS}    ${MESSAGE}
   Data Break

Record Screen Image
   [Arguments]   ${FILE}   ${CASE NAME}    ${STEP NAME}
   oqe.Write Image   ${CASE NAME}   ${STEP NAME}   Screenshot   ${FILE}

#Sikuli
Screen Capture
   [Arguments]    ${PROPOSED NAME}   ${x}    ${y}    ${w}    ${h}    ${STEP NAME}
   ${canCapture} =    Evaluate    not(${x}==${y} and ${w}==${h} and ${x}==${w} and {x}==0)
   ${a} =    Run Keyword If    ${canCapture}    Get Next Img File    ${PROPOSED NAME}
   sSikuli.Label Region    ${x}    ${y}    ${w}    ${h}    Label Me
   Run Keyword If    ${canCapture}    sSikuli.Capture Screen At    ${x}    ${y}    ${w}    ${h}    ${a}
   Run Keyword If    ${canCapture}    Record Screen Image    ${a}    ${TEST NAME}    ${STEP NAME}
   Run Keyword If    not ${canCapture}    Record Test Case    ${TEST NAME}    ${STEP NAME}    FAIL    Image ERROR: No Region found - ${PROPOSED NAME}

#Sikuli
Screen Animation
   [Arguments]    ${PROPOSED NAME}   ${x}    ${y}    ${w}    ${h}    ${STEP NAME}    ${number}=3
   ${canCapture} =    Evaluate    not(${x}==$[y} and ${w}==${h} and ${x}==${w} and {x}==0)
   ${a} =    Run Keyword If    ${canCapture}    Get Next Animation File    ${PROPOSED NAME}
   Run Keyword If    ${canCapture}    sSikuli.Capture Animation At    ${x}    ${y}    ${w}    ${h}    ${a}[0]    ${a}[1]    ${number}
   Run Keyword If    ${canCapture}    Record Screen Image    ${a}[1]    ${TEST NAME}    ${STEP NAME}
   Run Keyword If    not ${canCapture}    Record Test Case    ${TEST NAME}    ${STEP NAME}    FAIL    Image ERROR: No Region found - ${PROPOSED NAME}

#Sikuli
Store Animation
   [Arguments]    ${PROPOSED NAME}   ${x}    ${y}    ${w}    ${h}
   ${canCapture} =    Evaluate    not(${x}==$[y} and ${w}==${h} and ${x}==${w} and {x}==0)
   ${a} =    Run Keyword If    ${canCapture}    Get Next Temp Img File    ${PROPOSED NAME}
   Run Keyword If    ${canCapture}    sSikuli.Capture Screen At    ${x}    ${y}    ${w}    ${h}    ${a}
   Run Keyword If    not ${canCapture}    Record Test Case    ${TEST NAME}    Store Animation    FAIL    Image ERROR: No Region found - ${PROPOSED NAME}

#Sikuli
Finalize Animation
   [Arguments]    ${STEP NAME}    ${PROPOSED NAME}
   ${a} =    Get Last Temp Img File    ${PROPOSED NAME}
   sSikuli.Complete Animation    ${a}[0]    ${a}[1]
   Record Screen Image    ${a}[1]    ${TEST NAME}    ${STEP NAME}

#Selenium
Capture Element Image
   [Arguments]    ${CSS-IDENTIFIER}    ${CASE NAME}    ${STEP NAME}
   ${FILE} =    Get Image File Name    ${CASE NAME}    ${STEP NAME}
   Capture Element Screenshot    ${CSS-IDENTIFIER}    ${FILE}
   oqe.Write Image    ${CASE NAME}    ${STEP NAME}    Screenshot     ${FILE}

#selenium
Capture Screen Image
   [Arguments]    ${CASE NAME}    ${STEP NAME}
   ${FILE} =    Get Image File Name    ${CASE NAME}    ${STEP NAME}
   Capture Page Screenshot    ${FILE}
   oqe.Write Image    ${CASE NAME}    ${STEP NAME}    Screenshot     ${FILE}

Data Break
   oqe.Write Data   --    --    --     --   

Soft Break
   oqe.Write Data   **    **    --     --

Banner
   [ARGUMENTS]    ${Title}
   oqe.Write Data    ==    ==    --    ${Title}

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
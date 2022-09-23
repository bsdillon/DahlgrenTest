*** Settings ***
Library    ./Output.py    ./../../../../RFData/test2.js    WITH NAME    oqe
#Library    ./sikuliLibrary.py    ./../../../../RFData    WITH NAME    images
Library    ./seleniumLibrary.py    ./../../../../RFData    CH    file:///C:/Users/Benny/Documents/github/DahlgrenTest/RFTestReports+RFToolsExamples/sikuliTesting/testable.html    WITH NAME    images
Library    ./textReader.py    WITH NAME    text
Library    OperatingSystem
Library    Collections

*** Variables ***
${DATA PATH} =    ./../../../../RFData

*** Keywords ***
####################################
####  Configuration Validation  ####
####################################
Test Check
    Log    DataExtraction.resource is connected

####################################
####    OQE Output Functions    ####
####################################
New Test Event
    [Arguments]    ${CASE NAME}
    ${TEST_CASE_TIME}       oqe.Test Case Start Time
    oqe.Create Test Case    ${CASE NAME} ${TEST_CASE_TIME}
    [Return]    ${CASE NAME} ${TEST_CASE_TIME}

#formatters
Data Break
   oqe.Write Data   --    --    --     --   

Soft Break
   oqe.Write Data   **    **    --     --

Banner
   [ARGUMENTS]    ${Title}
   oqe.Write Data    ==    ==    --    ${Title}

#assertions
Assert OQE True
   [Arguments]    ${CASE NAME}    ${STEP NAME}    ${case}
   ${TEST_STATUS}    oqe.Result True     ${case}    passCase=True
   oqe.Write Results    ${CASE NAME}_${STEP NAME}    Result True    ${TEST_STATUS}     ~~~~
   [RETURN]    ${TEST_STATUS}

Assert OQE False
   [Arguments]    ${CASE NAME}    ${STEP NAME}    ${case}
   ${TEST_STATUS}    oqe.Result True     ${case}    passCase=False
   oqe.Write Results    ${CASE NAME}_${STEP NAME}    Result False    ${TEST_STATUS}     ~~~~
   [RETURN]    ${TEST_STATUS}

Assert OQE Values Not Equal
   [Arguments]    ${CASE NAME}    ${STEP NAME}    ${actual}    ${expected}
   ${TEST_STATUS}    oqe.Compare Results     ${actual}    ${expected}    equal=True
   oqe.Write Results    ${CASE NAME}_${STEP NAME}    Values NOT equal    ${TEST_STATUS}     Actual: ${actual}, Expected: ${expected}
   [RETURN]    ${TEST_STATUS}

Assert OQE Values Equal
   [Arguments]    ${CASE NAME}    ${STEP NAME}    ${actual}    ${expected}
   ${TEST_STATUS}    oqe.Compare Results     ${actual}    ${expected}
   oqe.Write Results    ${CASE NAME}_${STEP NAME}    Values Equal    ${TEST_STATUS}     Actual: ${actual}, Expected: ${expected}
   [RETURN]    ${TEST_STATUS}

Assert OQE Values Starts With Text
   [Arguments]    ${CASE NAME}    ${STEP NAME}    ${actual}    ${expected}
   ${TEST_STATUS}    oqe.Compare Limited Text     ${actual}    ${expected}
   oqe.Write Results    ${CASE NAME}_${STEP NAME}    Initial Text Match    ${TEST_STATUS}     Actual: ${actual}, Expected: ${expected}
   [RETURN]    ${TEST_STATUS}

Assert OQE Values Within Error
   [Arguments]    ${CASE NAME}    ${STEP NAME}    ${actual}    ${expected}    ${errorPercent}
   ${TEST_STATUS}    oqe.Compare To Range     ${actual}    ${expected}    ${errorPercent}
   oqe.Write Results    ${CASE NAME}_${STEP NAME}    Match +/- ${errorPercent}%   ${TEST_STATUS}     Actual: ${actual}, Expected: ${expected}
   [RETURN]    ${TEST_STATUS}

#included for backwards compatibility
Assert OQE Value
   [Arguments]    ${CASE NAME}    ${STEP NAME}    ${actual}    ${expected}
   ${a} =    Assert OQE Values Equal    ${CASE NAME}    ${STEP NAME}    ${actual}    ${expected}
   [RETURN]    ${a}

#recording
Record Data
   [Arguments]   ${CASE NAME}    ${STEP NAME}    ${DATA}
   oqe.Write Data   ${CASE NAME}    ${STEP NAME}    Data     ${Data}   

Record Action
   [Arguments]   ${CASE NAME}   ${ACT DESCRIPTION}
   oqe.Write Data    ${CASE NAME}    ${ACT DESCRIPTION}    Action    --

Record Screen Image
   [Arguments]   ${FILE}   ${CASE NAME}    ${STEP NAME}
   oqe.Write Image   ${CASE NAME}   ${STEP NAME}   Screenshot   ${FILE}

Record Test Case
   [Arguments]   ${CASE NAME}    ${STEP NAME}    ${STATUS}    ${MESSAGE}
   oqe.Write Results   ${CASE NAME}    ${STEP NAME}    ${STATUS}     ${MESSAGE}

Keyword Final
   [Arguments]   ${CASE NAME}    ${STEP NAME}    ${STATUS}    ${MESSAGE}
   oqe.Write Results   ${CASE NAME}    ${STEP NAME}    ${STATUS}    ${MESSAGE}
   Data Break

####################################
####    Image Capture Library   ####
####################################
Get Image File Name
   [Arguments]   ${CASE NAME}    ${STEP NAME}
   ${newFileName} =    image.Get Next Img File   ${CASE NAME}_${STEP NAME}
   [Return]    ${newFileName}

Screen Capture
   [Arguments]    ${PROPOSED NAME}   ${x}    ${y}    ${w}    ${h}    ${STEP NAME}
   ${canCapture} =    Evaluate    not(${x}==${y} and ${w}==${h} and ${x}==${w} and {x}==0)
   ${file} =    Run Keyword If    ${canCapture}    images.Capture Screen At    ${x}    ${y}    ${w}    ${h}    ${PROPOSED NAME}
   Run Keyword If    ${canCapture}    Record Screen Image    ${file}    ${TEST NAME}    ${STEP NAME}
   Run Keyword If    not ${canCapture}    Record Test Case    ${TEST NAME}    ${STEP NAME}    FAIL    Image ERROR: No Region found - ${PROPOSED NAME}

Screen Animation
   [Arguments]    ${PROPOSED NAME}   ${x}    ${y}    ${w}    ${h}    ${STEP NAME}    ${number}=3
   ${canCapture} =    Evaluate    not(${x}==$[y} and ${w}==${h} and ${x}==${w} and {x}==0)
   Run Keyword If    ${canCapture}    images.Capture Small GIF at    ${x}    ${y}    ${w}    ${h}    ${number}    ${PROPOSED NAME}
   Run Keyword If    ${canCapture}    Record Screen Image    ${a}[1]    ${TEST NAME}    ${STEP NAME}
   Run Keyword If    not ${canCapture}    Record Test Case    ${TEST NAME}    ${STEP NAME}    FAIL    Image ERROR: No Region found - ${PROPOSED NAME}

Store Animation
   [Arguments]    ${PROPOSED NAME}   ${x}    ${y}    ${w}    ${h}
   ${canCapture} =    Evaluate    not(${x}==$[y} and ${w}==${h} and ${x}==${w} and {x}==0)
   Run Keyword If    ${canCapture}    images.Capture Temporary Image at    ${x}    ${y}    ${w}    ${h}
   Run Keyword If    not ${canCapture}    Record Test Case    ${TEST NAME}    Store Animation    FAIL    Image ERROR: No Region found - ${PROPOSED NAME}

Finalize Animation
   [Arguments]    ${STEP NAME}    ${PROPOSED NAME}   
   ${fileName} =    images.Convert to GIF    ${PROPOSED NAME}
   Record Screen Image    ${fileName}    ${TEST NAME}    ${STEP NAME}

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

#Depricated
# Simple Test
#    [Arguments]    ${name}    ${button}    ${red}    ${green}    ${blue}    ${reverse}
#    ${bob} =    images.Start Watcher At Element    Bob    ${name}    rateSeconds=.25    limit=20
#    Sleep    10
#    ${img} =    images.Halt Watcher    ${bob}
#    Record Screen Image    ${img}    ${TEST NAME}    ${STEP NAME}

# Simple Test
#    [Arguments]    ${name}    ${button}    ${red}    ${green}    ${blue}    ${reverse}
#    ${bob} =    images.Start Watcher At    Bob    100    100    200    100
#    Sleep    10
#    images.Halt Watcher    ${bob}

# Simple Test
#    [Arguments]    ${name}    ${button}    ${red}    ${green}    ${blue}    ${reverse}
#    images.Start Watcher    Bob
#    ${a} =    images.Read from Element    ${name}
#    Log    ${a}
#    ${a} =    images.Read from    100    100    20    20
#    Log    ${a}
#    images.Click At Element    ${button}
#    images.Click At    3    55    40    15
#    ${img} =    images.Capture Image at    3    55    40    15
#    ${txt} =    text.Read Text from Image File    ${img}
#    Log    ${txt}
#    ${a} =    images.Read from Element    ${button}
#    Log    ${a}
#    ${a} =    images.Read from Element    css:div.data
#    Log    ${a}
#    Sleep    5
#    images.Halt Watcher    Bob

Simple Test
   [Arguments]    ${name}    ${button}    ${red}    ${green}    ${blue}    ${reverse}
   ${img} =    images.Capture Image at Element    ${red}
   Record Screen Image    ${img}    Element capture    ${red}
   ${txt} =    text.Read Text from Image File    ${img}    deleteAfter=False
   Assert OQE Values Equal    Element Text    ${red}    ${txt}    This is red text
   ${img} =    images.Capture Image at Element    ${blue}
   Record Screen Image    ${img}    Element capture    ${blue}
   ${txt} =    text.Read Text from Image File    ${img}    deleteAfter=False
   Assert OQE Values Equal    Element Text    ${blue}    ${txt}    This is blue text
   ${img} =    images.Capture Image at Element    ${green}
   Record Screen Image    ${img}    Element capture    ${green}
   ${txt} =    text.Read Text from Image File    ${img}    deleteAfter=False
   Assert OQE Values Equal    Element Text    ${green}    ${txt}    This is green text
   ${img} =    images.Capture Image at Element    ${reverse}
   Record Screen Image    ${img}    Element capture    ${reverse}
   ${txt} =    text.Read Text from Image File    ${img}    deleteAfter=False
   Assert OQE Values Equal    Element Text    ${reverse}    ${txt}    This is reverse text

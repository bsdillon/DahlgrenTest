*** Settings ***
DOCUMENTATION    DataExtraction is a resource file meant to handle all OQE gathering
...    and publication. It hides the interface to supporting libraries. It is divided 
...    into 8 function types.\n\n
...    == Creating a valid test ==
...    *Configuration Validation* - Verify the connection between the test script 
...    and the report.\n\n
...    *Test Setup* - Create and configure individual tests. 
...    == Generating test data ==
...    *Comparisons* - Derive Pass/Fail criteria by comparing value(s)\n\n
...    *Report Formatting* - Add formatting markings to the report\n\n
...    *Recording Data* - Add data content to the report\n\n
...    *Image Functions* - Add images to the report
...    == Graphing data ==
...    *Suite Chart Functions* - Create data charts for the suite. Add data, change format, etc.\n\n
...    *Test Chart Functions* - Create data charts for a single test. Add data, change format, etc.

Library    output.py    WITH NAME    oqe
Library    sikulilibrary.py    WITH NAME    sikuliLib
Library    seleniumlibrary.py    WITH NAME    seleniumLib
Library    textreader.py    WITH NAME    text
Library    OperatingSystem
Library    Collections
Library    Process

*** Variables ***
${imageLib} =     sikuliLib

*** Keywords ***
####################################
####  Configuration Validation  ####
####################################
Test Check
    [DOCUMENTATION]    Part of *Configuration Validation*\n\n
    ...    Test check generates a logging message in the default RFW report.
    ...    Documents the connection to the resource file and Tesseract.
    Log    DataExtraction.resource is connected
    ${a} =    text.Verify Tesseract
    Run Keyword If    '${a}'=='True'    Log    Text reader is confirmed    ELSE    Log    Text reader is NOT connected
    Run Keyword If    '${a}'!='True'    Fail    No text reader; connect tesseract.

####################################
####    OQE Output Functions    ####
####################################
New Test Event
    [DOCUMENTATION]    Part of *Test Setup*.\n
    ...    New Test Event corresponds with output functions that create a new
    ...    data structure in the test data and a new line in the report.
    [Arguments]    ${CASE NAME}
    ${FULL TEST} =    oqe.Create Test Case    ${CASE NAME}
    [Return]    ${FULL TEST}

Configure Image Library
    [DOCUMENTATION]    Part of *Test Setup*.\n
    ...    Determines the _type_ of test as either Sikuli or Selenium. Other options may follow
    ...    The function also sets the datapath for all images and test data files.
    ...    Only in the case of a Selenium test, the browser and URL are also identified.
    ...    *NOTE* You must call _Configure Image Libaray_ before any of a number of functions
    ...    Using the data path and image library. Best to do so during test setup.
    [ARGUMENTS]    ${type}    ${datapath}    ${browser}=None    ${url}=None
    Run Keyword If    '${type}'=='Sikuli'    Set Suite Variable    ${imageLib}    sikuliLib    ELSE    Set Suite Variable    ${imageLib}    seleniumLib
    Run Keyword If    '${type}'=='Selenium'    ${imageLib}.Configure Selenium    ${browser}    ${url}
    Run Keyword    ${imageLib}.Configure Image Path    ${datapath}
    Log    Data Path configured
    oqe.Configure Data Path    ${datapath}

#formatters
Banner
    [DOCUMENTATION]    Part of *Report Formatting*\n\n
    ...    One of the optional formatting lines that separates lines in the report. 
    ...    Displays a single _title_ across the report.\n\n
    ...    Meant to start a segment of the test.
   [ARGUMENTS]    ${Title}
   oqe.Write Data    ==    ==    --    ${Title}

Soft Break
    [DOCUMENTATION]    Part of *Report Formatting*\n\n
    ...    One of the optional formatting lines that separates lines in the report.\n\n
    ...    Meat to separate partions within a single segment of the test.
   oqe.Write Data   **    **    --     --

Data Break
    [DOCUMENTATION]    Part of *Report Formatting*\n\n
    ...    One of the optional formatting lines that separates lines in the report.\n\n
    ...    [#All Pass Or Fail|NOTHING] Meant to terminate a segment of the test
   oqe.Write Data   --    --    --     --   

#assertions
All Pass Or Fail
    [DOCUMENTATION]    Part of *Comparisons*\n\n
    ...    Returns PASS by default, but will return FAIL if any of the 
    ...   _VALUES_ is a FAIL.
   [ARGUMENTS]    @{VALUES}
   ${answer} =    oqe.PASS Token
   FOR    ${v}    IN    @{VALUES}
      ${answer} =    Run Keyword    '${v}'!='${answer}'    oqe.FAIL Token    ELSE    ${answer}
   END
   [RETURN]    ${answer}

Assert OQE True
    [DOCUMENTATION]    Part of *Comparisons*\n\n
    ...    Evaluates _case_ and returns PASS only if true.
   [Arguments]    ${CASE NAME}    ${STEP NAME}    ${case}
   ${TEST_STATUS}    oqe.Result True     ${case}    passCase=True
   oqe.Write Results    ${CASE NAME}_${STEP NAME}    Result True    ${TEST_STATUS}     ~~~~
   [RETURN]    ${TEST_STATUS}

Assert OQE False
    [DOCUMENTATION]    Part of *Comparisons*\n\n
    ...    Complement to _Assert OQE True_. Returns PASS only if _case_ is false.
   [Arguments]    ${CASE NAME}    ${STEP NAME}    ${case}
   ${TEST_STATUS}    oqe.Result True     ${case}    passCase=False
   oqe.Write Results    ${CASE NAME}_${STEP NAME}    Result False    ${TEST_STATUS}     ~~~~
   [RETURN]    ${TEST_STATUS}

Assert OQE Values Not Equal
    [DOCUMENTATION]    Part of *Comparisons*\n\n
    ...    Complement to _Assert OQE Values Equal. Returns PASS only if _actual_ and _expected_ mismatch.
   [Arguments]    ${CASE NAME}    ${STEP NAME}    ${actual}    ${expected}
   ${TEST_STATUS}    oqe.Compare Results     ${actual}    ${expected}    equal=True
   oqe.Write Results    ${CASE NAME}_${STEP NAME}    Values NOT equal    ${TEST_STATUS}     Actual: ${actual}, Expected: ${expected}
   [RETURN]    ${TEST_STATUS}

Assert OQE Values Equal
    [DOCUMENTATION]    Part of *Comparisons*\n\n
    ...    Returns PASS if _actual_ and _expected_ match 
   [Arguments]    ${CASE NAME}    ${STEP NAME}    ${actual}    ${expected}
   ${TEST_STATUS}    oqe.Compare Results     ${actual}    ${expected}
   oqe.Write Results    ${CASE NAME}_${STEP NAME}    Values Equal    ${TEST_STATUS}     Actual: ${actual}, Expected: ${expected}
   [RETURN]    ${TEST_STATUS}

Assert OQE Values Starts With Text
    [DOCUMENTATION]    Part of *Comparisons*\n\n
    ...    Return PASS if _actual_ starts with the _expected_ value. Useful when
    ...    full text values may contain unpredictable details.\n\n
    ...    Ex.    "Clearance" starts with "Clear"
   [Arguments]    ${CASE NAME}    ${STEP NAME}    ${actual}    ${expected}
   ${TEST_STATUS}    oqe.Compare Limited Text     ${actual}    ${expected}
   oqe.Write Results    ${CASE NAME}_${STEP NAME}    Initial Text Match    ${TEST_STATUS}     Actual: ${actual}, Expected: ${expected}
   [RETURN]    ${TEST_STATUS}

Assert OQE Values Within Error
    [DOCUMENTATION]    Part of *Comparisons*\n\n
    ...    Returns PASS if _actual_ valls within a range _expected +/- _errorPercent_
   [Arguments]    ${CASE NAME}    ${STEP NAME}    ${actual}    ${expected}    ${errorPercent}
   ${TEST_STATUS}    oqe.Compare To Range     ${actual}    ${expected}    ${errorPercent}
   oqe.Write Results    ${CASE NAME}_${STEP NAME}    Match +/- ${errorPercent}%   ${TEST_STATUS}     Actual: ${actual}, Expected: ${expected}
   [RETURN]    ${TEST_STATUS}

#included for backwards compatibility
Assert OQE Value
    [DOCUMENTATION]    Part of *Comparisons*\n\n
    ...    *DEPRECATED*  Effectively the same as _Assert OQE Values Equal
   [Arguments]    ${CASE NAME}    ${STEP NAME}    ${actual}    ${expected}
   ${a} =    Assert OQE Values Equal    ${CASE NAME}    ${STEP NAME}    ${actual}    ${expected}
   [RETURN]    ${a}

#recording
Record Data
    [DOCUMENTATION]    Part of *Recording Data*\n\n
    ...    The basic data recorder puts a series of plain-text data lines into the
    ...    report. Each line of _DATA_ is delimited by '; '.
   [Arguments]   ${CASE NAME}    ${STEP NAME}    ${DATA}
   oqe.Write Data   ${CASE NAME}    ${STEP NAME}    Data     ${Data}   

Record Action
    [DOCUMENTATION]    Part of *Recording Data*\n\n
    ...    Used to insert report lines that record specific actions\n\n
    ...    Ex.  Press Button X\n\n
    ...    Ex.  Remove Barrier
   [Arguments]   ${CASE NAME}   ${ACT DESCRIPTION}
   oqe.Write Data    ${CASE NAME}    ${ACT DESCRIPTION}    Action    --

Record Screen Image
    [DOCUMENTATION]    Part of *Recording Data*\n\n
    ...    Adds an image from _FILE_ to the report 
   [Arguments]   ${FILE}   ${CASE NAME}    ${STEP NAME}
   oqe.Write Image   ${CASE NAME}   ${STEP NAME}   Screenshot   ${FILE}

Record Test Case
    [DOCUMENTATION]    Part of *Recording Data*\n\n
    ...    Records a specific test _STATUS_ (either PASS or FAIL) and any _MESSAGE_
    ...    At the end of some test step.
   [Arguments]   ${CASE NAME}    ${STEP NAME}    ${STATUS}    ${MESSAGE}
   oqe.Write Results   ${CASE NAME}    ${STEP NAME}    ${STATUS}     ${MESSAGE}

Keyword Final
    [DOCUMENTATION]    Part of *Recording Data*\n\n
    ...    Replicates dual actions of _Record Test Case_ and _Data Break_ in one.
    ...    This is perfect for inclusion in a keyword [TEARDOWN] as a final action.
   [Arguments]   ${CASE NAME}    ${STEP NAME}    ${STATUS}    ${MESSAGE}
   oqe.Write Results   ${CASE NAME}    ${STEP NAME}    ${STATUS}    ${MESSAGE}
   Data Break

####################################
####    Image Capture Library   ####
####################################
Get Image File Name
    [DOCUMENTATION]    Part of *Image Functions*.\n\n
    ...    *DEPRECATED*   Used to identify the next available image file name in your target folder.
   [Arguments]   ${CASE NAME}    ${STEP NAME}
   ${newFileName} =    Run Keyword    ${imageLib}.Get Next Img File   ${CASE NAME}_${STEP NAME}
   [Return]    ${newFileName}

Screen Capture
    [DOCUMENTATION]    Part of *Image Functions*.\n\n
    ...    Used to take a picture of the screen region [_x_, _y_, _w_, _h_].
   [Arguments]    ${PROPOSED NAME}   ${x}    ${y}    ${w}    ${h}    ${STEP NAME}
   ${canCapture} =    Evaluate    not(${x}==${y} and ${w}==${h} and ${x}==${w} and {x}==0)
   ${file} =    Run Keyword If    ${canCapture}    ${imageLib}.Capture Screen At    ${x}    ${y}    ${w}    ${h}    ${PROPOSED NAME}
   Run Keyword If    ${canCapture}    Record Screen Image    ${file}    ${TEST NAME}    ${STEP NAME}
   Run Keyword If    not ${canCapture}    Record Test Case    ${TEST NAME}    ${STEP NAME}    FAIL    Image ERROR: No Region found - ${PROPOSED NAME}

Screen Animation
    [DOCUMENTATION]    Part of *Image Functions*.\n\n
    ...    Creates a set of _number_ screen captures and then produces a single GIF.
   [Arguments]    ${PROPOSED NAME}   ${x}    ${y}    ${w}    ${h}    ${STEP NAME}    ${number}=3
   ${canCapture} =    Evaluate    not(${x}==${y} and ${w}==${h} and ${x}==${w} and {x}==0)
   ${file} =    Run Keyword If    ${canCapture}    Run Keyword    ${imageLib}.Capture Small GIF at    ${x}    ${y}    ${w}    ${h}    ${number}    ${PROPOSED NAME}
   Run Keyword If    ${canCapture}    Record Screen Image    ${file}    ${TEST NAME}    ${STEP NAME}
   Run Keyword If    not ${canCapture}    Record Test Case    ${TEST NAME}    ${STEP NAME}    FAIL    Image ERROR: No Region found - ${PROPOSED NAME}

Store Animation
    [DOCUMENTATION]    Part of *Image Functions*.\n\n
    ...    Creates a single screen capture in a temporary folder which will eventually
    ...    be part of a future GIF. Unlike _Screen Animation_, this function gives frame-by-frame
    ...    control over the capture process.
   [Arguments]    ${PROPOSED NAME}   ${x}    ${y}    ${w}    ${h}
   ${canCapture} =    Evaluate    not(${x}==$[y} and ${w}==${h} and ${x}==${w} and {x}==0)
   Run Keyword If    ${canCapture}    Run Keyword    ${imageLib}.Capture Temporary Image at    ${x}    ${y}    ${w}    ${h}
   Run Keyword If    not ${canCapture}    Record Test Case    ${TEST NAME}    Store Animation    FAIL    Image ERROR: No Region found - ${PROPOSED NAME}

Finalize Animation
    [DOCUMENTATION]    Part of *Image Functions*.\n\n
    ...    Ends a sequence of _Store Animation_s by generating a single GIF.
   [Arguments]    ${STEP NAME}    ${PROPOSED NAME}   
   ${fileName} =    Run Keyword    ${imageLib}.Convert to GIF    ${PROPOSED NAME}
   Record Screen Image    ${fileName}    ${TEST NAME}    ${STEP NAME}

####################################
#### Suite level data recording ####
####################################
Suite Data
    [DOCUMENTATION]    Part of *Suite Chart Functions*\n\n
    ...    Incrememntally addes data to a specific chart by title. This manages the
    ...    Suite scalar charts.\n\n
    ...    _VALUE_: y-value\n\n
    ...    _LABEL_: x-value
   [Arguments]    ${TITLE}    ${LABEL}    ${VALUE}
   oqe.Structured Suite Data    ${TITLE}    ${VALUE}    ${LABEL}

Suite Multi Data
    [DOCUMENTATION]    Part of *Suite Chart Functions*\n\n
    ...    Incrememntally addes data to a specific chart by title. This manages the
    ...    Suite multi-dataset charts.\n\n
    ...    _VALUES_: y-value - a list which must be consistently in the same order 0 to n\n\n
    ...    _LABEL_: x-value
   [Arguments]    ${TITLE}    ${LABEL}    @{VALUES}
   ${i} =    Evaluate    0
   FOR    ${v}    IN    @{VALUES}
      oqe.Structured Suite Data    ${TITLE}-${i}    ${v}    ${LABEL}
      ${i} =     Evaluate    ${i}+1
   END

Suite Line
    [DOCUMENTATION]    Part of *Suite Chart Functions*\n\n
    ...    Defines the details of a new chart item.\n\n
    ...    _STYLE_: Select one {Line, VBar, HBar, Area, Scatter}\n\n
    ...    _MODES_: Select None or multiple of {Progressive, Multi, Stacked, Trend}\n\n
    ...    _TITLE_: Any text\n\n
    ...    _XAXIS_: Any text; it is suggested that units be included\n\n
    ...    _YAXIS_: Any text; it is suggested that units be included\n\n
    ...    _SERIES_: Any text; allows multiple data series in one chart.
    ...    Each title must be enumerated as in MyTitle-0, MyTitle-1, etc.
   [Arguments]    ${STYLE}    ${MODES}    ${TITLE}    ${XAXIS}    ${YAXIS}    ${SERIES}
   oqe.Add Suite Structure    ${STYLE}    ${TITLE}    ${XAXIS}    ${YAXIS}    ${SERIES}    ${MODES}

Suite Multi Line
    [DOCUMENTATION]    Part of *Suite Chart Functions*\n\n
    ...    Defines the details of a new chart item.\n\n
    ...    _STYLE_: Select one {Line, VBar, HBar, Area, Scatter}\n\n
    ...    _MODES_: Select None or multiple of {Progressive, Stacked, Trend}\n\n
    ...   *NOTE* Multi is included in each case.\n\n
    ...    _TITLE_: Any text\n\n
    ...    _XAXIS_: Any text; it is suggested that units be included\n\n
    ...    _YAXIS_: Any text; it is suggested that units be included\n\n
    ...    _SERIES_: Any text; allows multiple data series in one chart.\n\n
    ...    Each title must be enumerated as in MyTitle-0, MyTitle-1, etc.
   [Arguments]    ${STYLE}    ${MODES}    ${TITLE}    ${XAXIS}    ${YAXIS}    @{SERIES}
   ${i} =    Evaluate    0
   FOR    ${s}    IN    @{SERIES}
      oqe.Add Suite Structure    ${STYLE}    ${TITLE}-${i}    ${XAXIS}    ${YAXIS}    ${s}    ${MODES}_Multi
      ${i} =     Evaluate    ${i}+1
   END

Suite Pie
    [DOCUMENTATION]    Part of *Suite Chart Functions*\n\n
    ...    Defines the details of a new Pie chart item.\n\n
    ...    _MODES_: Select None or multiple of {Progressive, Multi, Stacked, Trend}\n\n
    ...    *NOTE* None of these make sense in a PIE chart\n\n
    ...    _TITLE_: Any text\n\n
    ...    _XAXIS_: Any text; it is suggested that units be included\n\n
    ...    _YAXIS_: Any text; it is suggested that units be included\n\n
    ...    _SERIES_: Any text; allows multiple data series in one chart.\n\n
    ...    Each title must be enumerated as in MyTitle-0, MyTitle-1, etc.
   [Arguments]    ${MODES}    ${TITLE}    ${XAXIS}    ${YAXIS}    ${SERIES}
   oqe.Add Suite Structure    Pie    ${TITLE}    ${XAXIS}    ${YAXIS}    ${SERIES}    ${MODES}

Suite Color Scheme
    [DOCUMENTATION]    Part of *Suite Chart Functions*\n\n
    ...    By default, all charts use the same rainbow color scheme, but the user may
    ...    define a series of RGB color sets for each chart by title. This manages the
    ...    Suite, scalar, and multi-dataset charts.\n\n
    ...    Ex. 'rgb(164,100,174)'  Each numerical value on interval [0,255]
   [Arguments]    ${TITLE}    @{COLORS}
   oqe.Set Suite Color Scheme     ${TITLE}    ${COLORS}

Suite Color Group
    [DOCUMENTATION]    Part of *Suite Chart Functions*\n\n
    ...    By default, all charts use the same rainbow color scheme, but the user may
    ...    define a series of RGB color sets for each chart by title. This manages the
    ...    Suite, scalar, and multi-dataset charts.\n\n
    ...    Ex. _GROUP_=1  Various shades of yellow
   [Arguments]    ${TITLE}    ${GROUP}
   oqe.Set Suite Color Group     ${TITLE}    ${GROUP}

####################################
####  Test level data recording ####
####################################
Test Data
    [DOCUMENTATION]    Part of *Test Chart Functions*\n\n
    ...    Incrememntally addes data to a specific chart by test and title. This 
    ...    manages the test, scalar, and multi-dataset charts.\n\n
    ...    _data_: y-value\n\n
    ...    _label_: x-value
   [Arguments]    ${TEST}    ${TITLE}    ${LABEL}    ${VALUE}
   oqe.Structured Test Data    ${TEST}    ${TITLE}    ${VALUE}    ${LABEL}

Test Multi Data
    [DOCUMENTATION]    Part of *Test Chart Functions*\n\n
    ...    Incrememntally addes data to a specific chart by test and title. This manages the
    ...    Suite multi-dataset charts.\n\n
    ...    _VALUES_: y-value - a list which must be consistently in the same order 0 to n\n\n
    ...    _LABEL_: x-value
   [Arguments]    ${TEST}    ${TITLE}    ${LABEL}    @{VALUES}
   ${i} =    Evaluate    0
   FOR    ${v}    IN    @{VALUES}
      oqe.Structured Test Data    ${TEST}    ${TITLE}-${i}    ${v}    ${LABEL}
      ${i} =     Evaluate    ${i}+1
   END

Test Line
    [DOCUMENTATION]    Part of *Test Chart Functions*\n\n
    ...    Defines the details of a new chart item.\n\n
    ...    _TEST_: Name of the test to which this chart applies\n\n
    ...    _STYLE_: Select one {Line, VBar, HBar, Area, Scatter}\n\n
    ...    _MODES_: Select None or multiple of {Progressive, Multi, Stacked, Trend}\n\n
    ...    _TITLE_: Any text\n\n
    ...    _XAXIS_: Any text; it is suggested that units be included\n\n
    ...    _YAXIS_: Any text; it is suggested that units be included\n\n
    ...    _SERIES_: Any text; allows multiple data series in one chart.\n\n
    ...    Each title must be enumerated as in MyTitle-0, MyTitle-1, etc.
   [Arguments]    ${TEST}    ${STYLE}    ${MODES}    ${TITLE}    ${XAXIS}    ${YAXIS}    ${SERIES}
   oqe.Add Test Structure    ${TEST}    ${STYLE}    ${TITLE}    ${XAXIS}    ${YAXIS}    ${SERIES}    ${MODES}

Test Multi Line
    [DOCUMENTATION]    Part of *Test Chart Functions*\n\n
    ...    Defines the details of a new chart item.\n\n
    ...    _TEST_: Name of the test to which this chart applies\n\n
    ...    _STYLE_: Select one {Line, VBar, HBar, Area, Scatter}\n\n
    ...    _MODES_: Select None or multiple of {Progressive, Stacked, Trend}\n\n
    ...    *NOTE* Multi is included in each case.\n\n
    ...    _TITLE_: Any text\n\n
    ...    _XAXIS_: Any text; it is suggested that units be included\n\n
    ...    _YAXIS_: Any text; it is suggested that units be included\n\n
    ...    _SERIES_: Any text; allows multiple data series in one chart.\n\n
    ...    Each title must be enumerated as in MyTitle-0, MyTitle-1, etc.
   [Arguments]    ${TEST}    ${STYLE}    ${MODES}    ${TITLE}    ${XAXIS}    ${YAXIS}    @{SERIES}
   ${i} =    Evaluate    0
   FOR    ${s}    IN    @{SERIES}
      oqe.Add Test Structure    ${TEST}    ${STYLE}    ${TITLE}-${i}    ${XAXIS}    ${YAXIS}    ${s}    ${MODES}_Multi
      ${i} =     Evaluate    ${i}+1
   END

Test Pie
    [DOCUMENTATION]    Part of *Test Chart Functions*\n\n
    ...    Defines the details of a new Pie chart item.\n\n
    ...    _MODES_: Select None or multiple of {Progressive, Multi, Stacked, Trend}\n\n
    ...    *NOTE* None of these make sense in a PIE chart\n\n
    ...    _TITLE_: Any text\n\n
    ...    _XAXIS_: Any text; it is suggested that units be included\n\n
    ...    _YAXIS_: Any text; it is suggested that units be included\n\n
    ...    _SERIES_: Any text; allows multiple data series in one chart.\n\n
    ...    Each title must be enumerated as in MyTitle-0, MyTitle-1, etc.
   [Arguments]    ${TEST}    ${MODES}    ${TITLE}    ${XAXIS}    ${YAXIS}    ${SERIES}
   oqe.Add Test Structure    ${TEST}    Pie    ${TITLE}    ${XAXIS}    ${YAXIS}    ${SERIES}    ${MODES}

Test Color Scheme
    [DOCUMENTATION]    Part of *Test Chart Functions*\n\n
    ...    By default, all charts use the same rainbow color scheme, but the user may
    ...    define a series of RGB color sets for each chart by title. This manages the
    ...    Test, scalar, and multi-dataset charts.\n\n
    ...    Ex. 'rgb(164,100,174)'  Each numerical value on interval [0,255]
   [Arguments]    ${TEST}    ${TITLE}    @{COLORS}
   oqe.Set Test Color Scheme     ${TEST}    ${TITLE}    ${COLORS}

Test Color Group
    [DOCUMENTATION]    Part of *Test Chart Functions*\n\n
    ...    By default, all charts use the same rainbow color scheme, but the user may
    ...    define a series of RGB color sets for each chart by title. This manages the
    ...    Test, scalar, and multi-dataset charts.\n\n
    ...    Ex. _GROUP_=1  Various shades of yellow
   [Arguments]    ${TEST}    ${TITLE}    ${GROUP}
   oqe.Set Test Color Group     ${TEST}    ${TITLE}    @{GROUP}

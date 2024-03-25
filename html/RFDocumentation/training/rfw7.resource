*** Settings ***
Resource   DataExtraction.resource
Library    genericwindow    WITH NAME    main

*** Variables ***
${test app} =    C:/Users/Owner/OneDrive/Documents/GitHub/DahlgrenTest/RFGUIHelper/RFGUIHelp.py
${config path} =    C:/Users/Owner/OneDrive/Documents/GitHub/DahlgrenTest/RFTest/examples/rfgui/rfguihelper.json

*** Keywords ***
RF GUI Helper: Open
    [Arguments]    ${d Path}    ${remote}=None
    Banner    Starting RF GUI Helper
    Start Process    python    ${test app}
    main.Configure    Sikuli    ${config path}     ${d Path}    ${remote}
    TRY
        Sleep    1s
        Wait Until Keyword Succeeds    2x    3s    main.Find
    EXCEPT
        Fail    Could not find the RF GUI Helper
    END

    RF GUI Helper: Verify View
    [Teardown]    Keyword Final    ${TEST NAME}    Starting RF GUI Helper    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

RF GUI Helper: Close
    Banner    Stopping Test
    RF GUI Helper: Restore Main View
    main.Click    closeButton
    [Teardown]    Keyword Final    ${TEST NAME}    Test Stop    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

RF GUI Helper: Document
    Banner    Documenting RF GUI Helper
    ${a}    main.Document API
    Log    ${a}
    main.Debug Window
    [Teardown]    Keyword Final    ${TEST NAME}    Run Test    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

RF GUI Helper: Click Menu
    [Arguments]    ${menu}     ${verify view}=True
    Log To Console    RF GUI Helper: Clicking on ${menu}
    RF GUI Helper: Restore Main View
    Record Action     ${TEST NAME}    Click ${menu}
    main.Click    ${menu}
    Sleep    1s

    Run Keyword If    ${verify view}    RF GUI Helper: Verify View

RF GUI Helper: Restore Main View
    ${current} =    RF GUI Helper: Expected View    verboseLog=False
    IF    '${current}' != 'View[main]'
        main.Click    nullMenu
    END

RF GUI Helper: Expected View
    [ARGUMENTS]    ${verboseLog}=True
    ${e} =    main.Expected View
    IF    ${verboseLog}
        Log To Console    \nExpected View: ${e}
        Record Data     ${TEST NAME}    Current View    ${e}
    END
    RETURN    ${e}

RF GUI Helper: Verify View
    Log To Console    RF GUI Helper: Verify View
    ${e} =    main.Expected View
    ${a} =    main.Actual View
    IF    '${e}'=='${a}'
        ${token} =    PASS TOKEN
        ${msg} =    Evaluate    'Opened ${e}'
        Log To Console    *** MATCH ***
    ELSE
        ${token} =    PASS TOKEN
        ${msg} =    Evaluate    'Expected ${e} but got ${a}'
        Log To Console    *** FAIL ***
    END
    Record Test Case    ${TEST NAME}    RF GUI Helper: Verify View    ${token}    ${msg}
    Run Keyword If    '${e}'!='${a}'    Fail    ${msg}

*** Settings ***
Resource   DataExtraction.resource
Library    genericwindow    WITH NAME    primary
Library    genericwindow    WITH NAME    secondary
Library    genericwindow    WITH NAME    auxiliary

*** Variables ***
${test app} =    C:/Users/Owner/OneDrive/Documents/GitHub/DahlgrenTest/RFGUIHelper/RFGUIHelp.py
${main config path} =    C:/Users/Owner/OneDrive/Documents/GitHub/DahlgrenTest/RFTest/examples/RFGHelper/mainwindow/mainwindow.json
${img config path} =    C:/Users/Owner/OneDrive/Documents/GitHub/DahlgrenTest/RFTest/examples/RFGHelper/imgwindow/imgWindow.json
${aux config path} =    C:/Users/Owner/OneDrive/Documents/GitHub/DahlgrenTest/RFTest/examples/RFGHelper/auxwindows/auxwindows.json

*** Keywords ***
#==================================================
#                   App Actions                   #
#==================================================
RF GUI Helper: Open
    [Arguments]    ${d Path}    ${remote}=None
    Banner    Starting RF GUI Helper
    Start Process    python    ${test app}
    primary.Configure    Sikuli    ${main config path}     ${d Path}    ${remote}
    secondary.Configure    Sikuli    ${img config path}     ${d Path}    ${remote}
    auxiliary.Configure    Sikuli    ${aux config path}     ${d Path}    ${remote}

    RF GUI Helper: Locate Window    primary
    [Teardown]    Keyword Final    ${TEST NAME}    Starting RF GUI Helper    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

RF GUI Helper: Close
    RF GUI Helper: Close Project

    Banner    Stopping Test
    RF GUI Helper: Restore Main View
    RF GUI Helper: Make Picture    primary    closeButton    Close primary window
    primary.Click    closeButton
    [Teardown]    Keyword Final    ${TEST NAME}    Test Stop    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

RF GUI Helper: Document
    Banner    Documenting RF GUI Helper
    ${a}    primary.Document API
    Log    ${a}
    primary.Debug Window
    [Teardown]    Keyword Final    ${TEST NAME}    Run Test    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

#==================================================
#                   Menu Actions                  #
#==================================================
RF GUI Helper: Click Menu and Verify
    [Arguments]    ${menuName}    ${expectFail}=False
    Banner    Selecting ${menuName}
    IF    ${expectFail}
        ${msg} =    Run Keyword and Expect Error    *    RF GUI Helper: Click Menu    ${menuName}    
        Record Data    ${TEST NAME}    Selecting ${menuName}    Expected Failure: ${msg}
    ELSE
        RF GUI Helper: Click Menu    ${menuName}
    END
    [TEARDOWN]    Keyword Final    ${TEST NAME}    Selecting ${menuName}    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

RF GUI Helper: Menu Action
    [Arguments]    ${menu}    ${action}    ${memo}    ${shouldBeOpen}=True
    #verify the project is open
    ${isOpen} =    RF GUI Helper: Check Is Project Open
    IF    ${shouldBeOpen}!=${isOpen} and ${isOpen}
        Fail    Attempt ${memo} with an already-open project
    ELSE IF    ${shouldBeOpen}!=${isOpen}
        Fail    Attempt ${memo} before opening a project
    END

    # Switch to project action menu
    RF GUI Helper: Click Menu and Verify    ${menu}
    RF GUI Helper: Make Picture    primary    ${action}    ${memo} function
    primary.Click    ${action}

RF GUI Helper: Click Menu
    [Arguments]    ${menu}     ${verifyView}=True
    Log To Console    RF GUI Helper: Clicking on ${menu}
    RF GUI Helper: Screen Capture    primary    Before opening menu
    RF GUI Helper: Restore Main View
    Record Action     ${TEST NAME}    Click ${menu}
    RF GUI Helper: Make Picture    primary    ${menu}    Clicking ${menu}
    primary.Click    ${menu}
    Sleep    1s

    IF    ${verify view}
        Wait Until Keyword Succeeds    2x    1s    RF GUI Helper: Verify View    
    ELSE
        RF GUI Helper: Screen Capture    primary    After opening menu
    END

#==================================================
#                 Project Actions                 #
#==================================================
RF GUI Helper: New Project
    [Arguments]    ${projectFolder}    ${projectName}    ${imgFolder}    ${imgName}
    RF GUI Helper: Menu Action    fMenu    newProject    New Project    shouldBeOpen=False

    #this is the save location
    RF GUI Helper: Select File    ${projectFolder}    ${projectName}

    #dialog
    RF GUI Helper: Find Window    auxiliary    projectStartAnchor
    auxiliary.Click    psOK

    #this is the first view image
    RF GUI Helper: Select File    ${imgFolder}    ${imgName}

    #dialog
    RF GUI Helper: Find Window    auxiliary    saveProgessAnchor
    auxiliary.Click    spOK

    [TEARDOWN]    Keyword Final    ${TEST NAME}    New Project ${projectName}    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

RF GUI Helper: Open Project File
    [ARGUMENTS]    ${folder}    ${filename}

    RF GUI Helper: Close Project

    Banner    Opening Project ${filename}
    RF GUI Helper: Click Menu    fMenu

    # Switch to file menu
    Record Action    ${TEST NAME}    Click open button
    RF GUI Helper: Make Picture    primary    openProject    Opening...
    primary.Click    openProject

    RF GUI Helper: Select File    ${folder}    ${filename}

    RF GUI Helper: Locate Window    secondary

    [Teardown]    Keyword Final    ${TEST NAME}    Opening Project ${filename}    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

RF GUI Helper: Close Project
    [ARGUMENTS]    ${answer}=No
    RF GUI Helper: Find Window    primary    mainTitleFocused

    ${isOpen} =    RF GUI Helper: Check Is Project Open

    IF    ${isOpen}
        Record Data     ${TEST NAME}    Close Project    Some project is open
        RF GUI Helper: Click Menu    fMenu    verifyView=False

        # Switch to file menu
        Record Action    ${TEST NAME}    Click close button
        RF GUI Helper: Make Picture    primary    closeProject    Close button
        primary.Click    closeProject
        Sleep    1s    # this takes a bit more than usual

        # Switch to save popup
        Record Action    ${TEST NAME}    Click ${answer} button
        RF GUI Helper: Find Window    auxiliary    saveChangeAnchor
        RF GUI Helper: Make Picture    auxiliary    sc${answer}Button    ${answer}
        auxiliary.Click    sc${answer}Button

        RF GUI Helper: Verify View
    END

    RF GUI Helper: Screen Capture    primary    End State
    Record Data     ${TEST NAME}    Close Project    Project is closed
    [Teardown]    Keyword Final    ${TEST NAME}    Verifying Project Closed    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

RF GUI Helper: Check Is Project Open
    Banner    Verifying Project Closed
    ${answer} =    Evaluate    True
    TRY
        RF GUI Helper: Find Window    secondary
        # if successful then we have an open project
        # Otherwise it will fail to except
    EXCEPT
        Record Data    ${TEST NAME}     RF GUI Helper: Closing Project    Project already closed
        ${answer} =    Evaluate    False
    END

    RETURN    ${answer}

#==================================================
#                   View Actions                  #
#==================================================
RF GUI Helper: Add View
    [Arguments]    ${imgFolder}    ${imgFile}    ${viewName}
    RF GUI Helper: Menu Action    aMenu    avButton    Add view

    RF GUI Helper: Select File    ${imgFolder}    ${imgFile}

    # should be in the auxliary window
    RF GUI Helper: Find Window    auxiliary    vdAnchor
    auxiliary.Write    viewName    ${viewName}
    auxiliary.Click    idOk

    # should be in the auxliary window
    RF GUI Helper: Find Window    auxiliary    saveProgressAnchor
    Record Action    ${TEST NAME}    Complete view add
    RF GUI Helper: Make Picture    auxiliary    spOK    OK Button
    auxiliary.Click    spOK

    #TODO Verify the View was added
    #Need to verify the 
    # Sleep    1s
    # Wait Until Keyword Succeeds    2x    1s    secondary.Find
    # RF GUI Helper: Screen Capture    secondary    Found secondary
    [TEARDOWN]    Keyword Final    ${TEST NAME}    Add View ${viewName}    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

RF GUI Helper: Edit View Image
    [Arguments]    ${imgFolder}    ${imgFile}    ${viewName}
    RF GUI Helper: Menu Action    aMenu    rvButton    Replace view

    # should be in the auxliary window
    RF GUI Helper: Find Window    auxiliary    singleViewAnchor

    # select the name to replace
    Record Action    ${TEST NAME}    Select ${viewName}
    auxiliary.Write    viewNameText    ${viewName}
    auxiliary.Click    svsDoneButton

    # should be in the auxliary window
    RF GUI Helper: Find Window    auxiliary    updateAnchor
    auxiliary.Click    iuOK

    RF GUI Helper: Select File    ${imgFolder}    ${imgFile}

    # should be in the auxliary window
    RF GUI Helper: Find Window    auxiliary    saveProgressAnchor
    Record Action    ${TEST NAME}    Complete view image update
    RF GUI Helper: Make Picture    auxiliary    spOK    OK Button
    auxiliary.Click    spOK

    #TODO Verify the View was added
    #Need to verify the 
    # Sleep    1s
    # Wait Until Keyword Succeeds    2x    1s    secondary.Find
    # RF GUI Helper: Screen Capture    secondary    Found secondary
    [TEARDOWN]    Keyword Final    ${TEST NAME}    Edit View ${viewName} Image    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

RF GUI Helper: Rename View
    [Arguments]    ${oldName}    ${newName}
    RF GUI Helper: Menu Action    aMenu    evButton    Rename view

    # should be in the auxliary window
    RF GUI Helper: Find Window    auxiliary    singleViewAnchor

    # select the name to replace
    Record Action    ${TEST NAME}    Select ${oldName}
    auxiliary.Write    viewNameText    ${oldName}
    auxiliary.Click    svsDoneButton

    # should be in the auxliary window
    RF GUI Helper: Find Window    auxiliary    vdAnchor
    auxiliary.Write    viewName    ${newName}
    auxiliary.Click    idOk

    # should be in the auxliary window
    RF GUI Helper: Find Window    auxiliary    saveProgressAnchor
    Record Action    ${TEST NAME}    Complete view rename
    RF GUI Helper: Make Picture    auxiliary    spOK    OK Button
    auxiliary.Click    spOK

    [TEARDOWN]    Keyword Final    ${TEST NAME}    Rename View ${oldName}->${newName}    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

RF GUI Helper: Delete View
    [Arguments]    ${viewName}
    RF GUI Helper: Menu Action    aMenu    dvButton    Delete view

    # should be in the auxliary window
    RF GUI Helper: Find Window    auxiliary    singleViewAnchor

    # select the name to replace
    Record Action    ${TEST NAME}    Select ${viewName}
    auxiliary.Write    viewNameText    ${viewName}
    auxiliary.Click    svsDoneButton

    # should be in the auxliary window
    RF GUI Helper: Find Window    auxiliary    deleteAnchor
    auxiliary.Click    dvYes

    # should be in the auxliary window
    RF GUI Helper: Find Window    auxiliary    saveProgressAnchor
    Record Action    ${TEST NAME}    Complete view deletion
    RF GUI Helper: Make Picture    auxiliary    spOK    OK Button
    auxiliary.Click    spOK

    #TODO Verify the View was added
    #Need to verify the 
    # Sleep    1s
    # Wait Until Keyword Succeeds    2x    1s    secondary.Find
    # RF GUI Helper: Screen Capture    secondary    Found secondary
    [TEARDOWN]    Keyword Final    ${TEST NAME}    Delete View ${viewName}    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

RF GUI Helper: Restore Main View
    ${current} =    RF GUI Helper: Expected View    verboseLog=False
    IF    '${current}' != 'View[main]'
        primary.Click    nullMenu
        RF GUI Helper: Screen Capture    primary    Restored View[main]
    END

RF GUI Helper: Expected View
    [ARGUMENTS]    ${verboseLog}=True
    ${e} =    primary.Expected View
    IF    ${verboseLog}
        Log To Console    \nExpected View: ${e}
        Record Data     ${TEST NAME}    Current View    ${e}
    END
    RETURN    ${e}

RF GUI Helper: Verify View
    Log To Console    RF GUI Helper: Verify View
    ${e} =    primary.Expected View
    ${a} =    primary.Actual View
    RF GUI Helper: Screen Capture    primary    Actual view: ${a}
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

#==================================================
#                 Helper Actions                  #
#==================================================
RF GUI Helper: Select File
    [Arguments]    ${folder}    ${file}
    # should be in the auxliary window
    RF GUI Helper: Find Window    auxiliary    openProjectAnchor

    # Switch to Open image dialog
    Record Action    ${TEST NAME}    Update folder: ${folder}
    auxiliary.Write    folderText    ${folder}\n
    RF GUI Helper: Screen Capture    auxiliary    In folder: ${folder}

    Record Action    ${TEST NAME}    Update file: ${file}
    auxiliary.Write    fileText    ${file}
    RF GUI Helper: Make Picture    auxiliary    fileText    File: ${file}

    Record Action    ${TEST NAME}    Click Open
    RF GUI Helper: Make Picture    auxiliary    ofOpen    Open button
    auxiliary.Click    ofOpen

RF GUI Helper: Find Window
    [Arguments]    ${window}    ${expectedView}=None
    Sleep    1s
    ${foundView} =    Wait Until Keyword Succeeds    2x    1s    ${window}.Find
    Record Data    ${TEST NAME}    Finding ${window} Window    ${window} Window: ${foundView}
    ${answer} =    Evaluate    '${expectedView}'!='None'

    IF    '${expectedView}'!='None'    #when a specific view is required
        Run Keyword If    '${foundView}'!='${expectedView}'    Fail
    END

    #Did not fail, record image
    RF GUI Helper: Screen Capture    ${window}    Window

RF GUI Helper: Gain Focus
    [ARGUMENTS]    ${window}
    Sleep    1s
    ${name} =    Run Keyword    ${window}.Find
    Run Keyword    ${window}.Click    ${name}
    Run Keyword    ${window}.Find
    Wait Until Keyword Succeeds    2x    1s    RF GUI Helper: Verify View
    
RF GUI Helper: Locate Window
    [Arguments]    ${window}
    ${view} =    Evaluate    'mainTitleFocused'
    ${x} =    Evaluate    240
    ${y} =    Evaluate    50

    IF    '${window}'=='secondary'
        ${view} =    Evaluate    'None'
        ${x} =    Evaluate    840
    END

    TRY
        RF GUI Helper: Find Window    ${window}    ${view}
    EXCEPT
        Fail    Could not find the ${window} window
    END
    RF GUI Helper: Screen Capture    ${window}    Found ${window}
    Run Keyword    ${window}.Move    ${x}    ${y}
    RF GUI Helper: Screen Capture    ${window}    After move

    #(re)focus on primary window
    RF GUI Helper: Gain Focus    primary

RF GUI Helper: Screen Capture
    [ARGUMENTS]    ${window}    ${title}
    ${file} =    Run Keyword    ${window}.Capture Window
    Record Screen Image    ${file}    ${TEST NAME}    ${title}

RF GUI Helper: Make Picture
    [ARGUMENTS]    ${window}    ${widget}    ${title}
    ${file} =    Run Keyword    ${window}.Capture Image    ${widget}
    Record Screen Image    ${file}    ${TEST NAME}    ${title}

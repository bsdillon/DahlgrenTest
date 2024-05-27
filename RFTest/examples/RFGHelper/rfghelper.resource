*** Settings ***
Resource   DataExtraction.resource
Library    genericwindow    WITH NAME    primary
Library    genericwindow    WITH NAME    secondary
Library    genericwindow    WITH NAME    auxiliary

*** Variables ***
${test_app} =    C:/Users/Owner/OneDrive/Documents/GitHub/DahlgrenTest/RFGUIHelper/RFGUIHelp.py
${main_config_path} =    C:/Users/Owner/OneDrive/Documents/GitHub/DahlgrenTest/RFTest/examples/RFGHelper/mainwindow/mainwindow.json
${img_config_path} =    C:/Users/Owner/OneDrive/Documents/GitHub/DahlgrenTest/RFTest/examples/RFGHelper/imgwindow/imgWindow.json
${aux_config_path} =    C:/Users/Owner/OneDrive/Documents/GitHub/DahlgrenTest/RFTest/examples/RFGHelper/auxwindows/auxwindows.json

*** Keywords ***
#==================================================
#                   App Actions                   #
#==================================================
RF GUI Helper: Suite Start
    [Documentation]      This keyword is the preferred way to start a test against the RFGUIHelper
    ...    It configures the OQE library, manages logging, archives data, and sets up the new test event.
    ...    = Examples =
    ...    | | = DATA PATH = |
    ...    | RF GUI Helper: Suite Start | c:/somefolder/datafolder |
    [Arguments]    ${DATA_PATH}
    Configure Image Library    Sikuli    ${DATA_PATH}
    Set Log Level    TRACE
    Archive Any Previous Data
    New Test Event    ${TEST NAME}

RF GUI Helper: Open
    [Documentation]      This keyword is the preferred way to open the RFGUIHelper application.
    ...    It starts the application and then further configures each of the three parts of the 
    ...    application: primary, secondary, and auxiliary. Each option requires the same DATA PATH 
    ...    and REMOTE to configure completely. REMOTE is the ip and port OR ip, port, and password
    ...    to enable a test on another machine. REMOTE is optional
    ...    = Examples =
    ...    | | = DATA PATH = | = REMOTE = |
    ...    | RF GUI Helper: Open | c:/somefolder/datafolder | |
    ...    | RF GUI Helper: Open | c:/somefolder/datafolder | 192.168.1.13;5900 |
    ...    | RF GUI Helper: Open | c:/somefolder/datafolder | 192.168.1.13;5900;password |
    [Arguments]    ${DATA PATH}    ${REMOTE}=None
    Banner    Starting RF GUI Helper
    Start Process    python    ${test_app}
    primary.Configure    Sikuli    ${main_config_path}     ${DATA PATH}    ${REMOTE}
    secondary.Configure    Sikuli    ${img_config_path}     ${DATA PATH}    ${REMOTE}
    auxiliary.Configure    Sikuli    ${aux_config_path}     ${DATA PATH}    ${REMOTE}

    RF GUI Helper: Locate Window    primary
    [Teardown]    Keyword Final    ${TEST NAME}    Starting RF GUI Helper    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

RF GUI Helper: Stop Test
    [Documentation]      This keyword is the preferred method to stop a test against the RFGUIHelper application.
    ...    It will close any existing project and then close the main window.
    RF GUI Helper: Close Project

    Banner    Stopping Test
    RF GUI Helper: Restore Main View
    RF GUI Helper: Make Picture    primary    closeButton    Close primary window
    primary.Click    closeButton
    [Teardown]    Keyword Final    ${TEST NAME}    Test Stop    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

RF GUI Helper: Document
    [Documentation]      Uses the standard GenericWindow methods to log all member functions and highlight
    ...    members on the primary window.
    Banner    Documenting RF GUI Helper
    ${a}    primary.Document API
    Log    ${a}
    primary.Debug Window
    [Teardown]    Keyword Final    ${TEST NAME}    Run Test    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

#==================================================
#                   Menu Actions                  #
#==================================================
RF GUI Helper: Click Menu or Fail
    [Documentation]      This keyword will click on one of the menus on the primary window.
    ...    There is an optional parameter to which controls whether or not the failure is
    ...    normal and expected for this event e.g. some menu will not be operational.
    ...    = Examples =
    ...    | | = menuName = | = expectFail = | |
    ...    | RF GUI Helper: Click Menu or Fail | fMenu | | This should succeed in opening the fMenu |
    ...    | RF GUI Helper: Click Menu or Fail | aMenu | True | This should fail to open the aMenu |
    [Arguments]    ${menuName}    ${expectFail}=False
    Banner    Selecting ${menuName}
    IF    ${expectFail}
        ${msg} =    Run Keyword and Expect Error    *    RF GUI Helper: Click Menu    ${menuName}    
        Record Data    ${TEST NAME}    Selecting ${menuName}    Expected Failure: ${msg}
    ELSE
        RF GUI Helper: Click Menu    ${menuName}
    END
    [Teardown]    Keyword Final    ${TEST NAME}    Selecting ${menuName}    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

RF GUI Helper: Menu Action
    [Documentation]      Selects a menu and a sub-menu action on the primary window. The Memo
    ...    indicates the text the tester wants in the report.
    ...    The test always checks first if a project is open and uses the optional parameter
    ...    to verify that the open/closed state is in keeping with this action. In these examples
    ...    the close menu would only be called on an open project while the open menu would only 
    ...    be called on a closed one.
    ...    = Examples =
    ...    | | = menu = | = action = | = memo = | = shouldBeOpen = | |
    ...    | RF GUI Helper: Menu Action | fMenu | close | Close | | This will only work if a project is already loaded |
    ...    | RF GUI Helper: Menu Action | fMenu | open | Open | False | This will only work if no project has been loaded |
    [Arguments]    ${menu}    ${action}    ${memo}    ${shouldBeOpen}=True
    #verify the project is open
    ${isOpen} =    RF GUI Helper: Check Is Project Open
    IF    ${shouldBeOpen}!=${isOpen} and ${isOpen}
        Fail    Attempt ${memo} with an already-open project
    ELSE IF    ${shouldBeOpen}!=${isOpen}
        Fail    Attempt ${memo} before opening a project
    END

    # Switch to project action menu
    RF GUI Helper: Click Menu or Fail    ${menu}
    RF GUI Helper: Make Picture    primary    ${action}    ${memo} function
    primary.Click    ${action}

RF GUI Helper: Click Menu
    [Documentation]      This keyword only clicks on the menus from the primary window and it 
    ...    has an optional parameter that verifies (or not) the final window state.
    ...    = Examples =
    ...    | | = menu = | = verifyView = |
    ...    | RF GUI Helper: Click Menu | fMenu | |
    ...    | RF GUI Helper: Click Menu | fMenu | False |
    [Arguments]    ${menu}     ${verifyView}=True
    Log To Console    RF GUI Helper: Clicking on ${menu}
    RF GUI Helper: Screen Capture    primary    Before opening menu
    RF GUI Helper: Restore Main View
    Record Action     ${TEST NAME}    Click ${menu}
    RF GUI Helper: Make Picture    primary    ${menu}    Clicking ${menu}
    primary.Click    ${menu}
    Sleep    1s

    IF    ${verify view}
        Wait Until Keyword Succeeds    2x    1s    RF GUI Helper: Verify View    primary
    ELSE
        RF GUI Helper: Screen Capture    primary    After opening menu
    END

#==================================================
#                 Project Actions                 #
#==================================================
RF GUI Helper: New Project
    [Documentation]      Creates a new project in the folder and with this file name. It also selects
    ...    the first image from the image folder. Now that the project is open, it finds and moves the
    ...    ImageWindow into its standard location.
    ...    = Examples =
    ...    | | = projectFolder = | = projectName = | = imgFolder = | = imgName = |
    ...    | RF GUI Helper: New Project | c:/somefolder/projectfolder | projectfile.json | c:/otherfolder/imagefolder | windowimg.png |
    [Arguments]    ${projectFolder}    ${projectName}    ${imgFolder}    ${imgName}
    RF GUI Helper: Menu Action    fMenu    newProject    New Project    shouldBeOpen=False

    # this is the save location
    RF GUI Helper: Select File    ${projectFolder}    ${projectName}    open=False

    # dialog
    RF GUI Helper: Find Window    auxiliary    projectStartAnchor
    auxiliary.Click    psOK

    # should be in the auxliary window
    RF GUI Helper: Find Window    auxiliary    vdAnchor
    auxiliary.Write    viewName    main
    auxiliary.Click    idOk

    #this is the first view image
    RF GUI Helper: Select File    ${imgFolder}    ${imgName}

    #dialog
    RF GUI Helper: Find Window    auxiliary    saveProgressAnchor
    auxiliary.Click    spOK

    RF GUI Helper: Locate Window    secondary

    [Teardown]    Keyword Final    ${TEST NAME}    New Project ${projectName}    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

RF GUI Helper: Open Project File
    [Documentation]      Uses the primary window to open an existing project file in the given folder.
    ...    = Examples =
    ...    | | = folder = | = filename = |
    ...    | RF GUI Helper: Open Project File | c:/somefolder/projectfolder | projectfile.json |
    [Arguments]    ${folder}    ${filename}

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
    [Documentation]      Closes the existing project and uses the optional parameter
    ...    to save (Yes) or not (No) the changes made.
    ...    = Examples =
    ...    | | = answer = |
    ...    | RF GUI Helper: Close Project | | Closes the project without saving |
    ...    | RF GUI Helper: Close Project | Yes | Closes the project after saving |
    [Arguments]    ${answer}=No
    RF GUI Helper: Gain Focus    primary

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

        RF GUI Helper: Verify View    primary
    END

    RF GUI Helper: Screen Capture    primary    End State
    Record Data     ${TEST NAME}    Close Project    Project is closed
    [Teardown]    Keyword Final    ${TEST NAME}    Verifying Project Closed    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

RF GUI Helper: Check Is Project Open
    [Documentation]      Returns True if there is an open project at this moment. False otherwise.
    ...    = Examples =
    ...    | = Return = | |
    ...    | ${isClosed} = | RF GUI Helper: Check Is Project Open |
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
    [Documentation]      Opens the action menu and adds a new view using the image file in the given folder
    ...    and with the given name.
    ...    = Examples =
    ...    | | = imgFolder = | = imgFile = | = viewName = |
    ...    | RF GUI Helper: Add View | c:/somefolder/images | windowX.png | Window X |
    [Arguments]    ${imgFolder}    ${imgFile}    ${viewName}
    RF GUI Helper: Menu Action    aMenu    avButton    Add view

    # should be in the auxliary window
    RF GUI Helper: Find Window    auxiliary    vdAnchor
    auxiliary.Write    viewName    ${viewName}
    auxiliary.Click    idOk

    RF GUI Helper: Select File    ${imgFolder}    ${imgFile}

    # should be in the auxliary window
    RF GUI Helper: Find Window    auxiliary    saveProgressAnchor
    Record Action    ${TEST NAME}    Complete view add
    RF GUI Helper: Make Picture    auxiliary    spOK    OK Button
    auxiliary.Click    spOK

    [Teardown]    Keyword Final    ${TEST NAME}    Add View ${viewName}    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

RF GUI Helper: Edit View Image
    [Documentation]      Opens the action menu and changes the image for an existing view by name 
    ...    and using the new image in the given folder.
    ...    = Examples =
    ...    | | = imgFolder = | = imgFile = | = viewName = |
    ...    | RF GUI Helper: Edit View Image | c:/somefolder/images | newimage.png | ExistingView |
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

    [Teardown]    Keyword Final    ${TEST NAME}    Edit View ${viewName} Image    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

RF GUI Helper: Rename View
    [Documentation]      Opens the action menu and alters the name of the view to the new one.
    ...    = Examples =
    ...    | | = oldName = | = newName = |
    ...    | RF GUI Helper: Rename View | OldViewName | NewViewName |
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

    [Teardown]    Keyword Final    ${TEST NAME}    Rename View ${oldName}->${newName}    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

RF GUI Helper: Delete View
    [Documentation]      Opens the action menu and deletes the existing view by name
    ...    = Examples =
    ...    | | = viewName = |
    ...    | RF GUI Helper: Delete View | existingView |
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

    [TEARDOWN]    Keyword Final    ${TEST NAME}    Delete View ${viewName}    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

RF GUI Helper: Restore Main View
    [Documentation]      Returns the primary window back to the main view i.e. no menus open.
    ${current} =    RF GUI Helper: Expected View    primary    verboseLog=False
    IF    '${current}' != 'View[main]'
        primary.Click    nullMenu
        RF GUI Helper: Screen Capture    primary    Restored View[main]
    END

RF GUI Helper: Expected View
    [Documentation]      Gets the expected view from the given window according to its 
    ...    internal state machine and records the value as data if verbose logging is 
    ...    required.
    ...    = Examples =
    ...    | = Return = | | = verboseLog = |
    ...    | ${expected} = | RF GUI Helper: Expected View | primary | |
    ...    | ${expected} = | RF GUI Helper: Expected View | secondary | False |
    [Arguments]    ${window}    ${verboseLog}=True
    ${e} =    Run Keyword    ${window}.Expected View
    IF    ${verboseLog}
        Log To Console    \nExpected View: ${window}.${e}
        Record Data     ${TEST NAME}    Current View    ${window}.${e}
    END
    RETURN    ${e}

RF GUI Helper: Verify View
    [Documentation]      Compares the expected and actual views for a given window. Will fail
    ...    if they do not match.
    ...    = Examples =
    ...    | | = window = |
    ...    | RF GUI Helper: Verify View | primary |
    [Arguments]     ${window}
    Log To Console    RF GUI Helper: Verify View
    ${e} =    Run Keyword    ${window}.Expected View
    ${a} =    Run Keyword    ${window}.Actual View
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
#                 Widget Actions                  #
#==================================================
RF GUI Helper: Create Widget
    [Documentation]      Creates a widget in the existing view. Optional parameters are used depending on the type of 
    ...    the widget.
    ...    type: Button|Text|Label|List|Tab|Checkbox|Radio|ScrollButton|Anchor|MovePoint
    ...    group: any string name; used to associate two or more widgets e.g. yes and no radio buttons.
    ...    dir: north|south|east|west
    ...    = Examples =
    ...    | | = x = | = y = | = w = | = h = | = name = | = type = | = group = | = value = | = dir = |
    ...    | RF GUI Helper: Create Widget | 10 | 20 | 15 | 15 | someButton | Button | | | |
    ...    | RF GUI Helper: Create Widget | 70 | 20 | 150 | 350 | someList | List | listGroup | | |
    ...    | RF GUI Helper: Create Widget | 40 | 20 | 15 | 15 | noRadio | Radio | radioGroup | No | |
    ...    | RF GUI Helper: Create Widget | 225 | 20 | 15 | 15 | someScroll | ScrollButton | listGroup | | dir=north |
    [Arguments]    ${x}    ${y}    ${w}    ${h}    ${name}    ${type}    ${group}=None    ${value}=None    ${dir}=None
    Log To Console    Creating widget ${name}
    RF GUI Helper: Gain Focus    secondary

    ${x2} =    Evaluate    ${x}+${w}
    ${y2} =    Evaluate    ${y}+${h}

    Log To Console    Clicking on (${x}, ${y})
    secondary.Click At    mainPanel    ${x}    ${y}
    Log To Console    Clicking on (${x2}, ${y2})
    secondary.Click At    mainPanel    ${x2}    ${y2}

    RF GUI Helper: Find Window    auxiliary    widgetEditAnchor    target_only=True
    #required fields
    auxiliary.Write    weNameText    ${name}    
    # BSD This is not working as I would like. e.g. tends to find 'W' instead of 17 and '20,' instead of 20
    # RF GUI Helper: Set Value    x_value    ${x}    long_left      left      right    long_right
    # RF GUI Helper: Set Value    y_value    ${y}    long_up        up        down     long_down
    # RF GUI Helper: Set Value    w_value    ${w}    long_narrow    narrow    wide     long_wide
    # RF GUI Helper: Set Value    h_value    ${h}    long_short     short     tall     long_tall
    
    #Change the widget type
    auxiliary.Click    weDrop
    RF GUI Helper: Find Window    auxiliary    widgetTypeAnchor    target_only=True
    auxiliary.Click    wt${type}

    #type specific fields
    IF   '${dir}'!='None'
        auxiliary.Click    direction_dd
        RF GUI Helper: Find Window    auxiliary    direction_anchor    target_only=True
        auxiliary.Click    ${dir}_button
    END

    #both of the previous widgets reference a different view
    #so we return to the widget editor main page
    RF GUI Helper: Find Window    auxiliary    widgetEditAnchor    target_only=True

    IF   '${group}'!='None'
        auxiliary.Write    group_text    ${group}
    END

    IF   '${value}'!='None'
        auxiliary.Write    value_text    ${value}
    END

    # can add these later, but need a new auxliary window
    # "checked_select", 
    # "unchecked_select", 
    auxiliary.Click    add_widget

RF GUI Helper: Set Value
    [Documentation]      Used in conjuction with ValueButtons which have four buttons << < [12] > >> to adjust
    ...    until the target value is reached. The named widget is the label with the numeric value while the
    ...    last four parameters are the four buttons as distinct widgets.
    ...    = Examples =
    ...    | | = widget name = | = target = | = less5 = | = less1 = | = more1 = | = more5 = |
    ...    | RF GUI Helper: Set Value | widthValue | 18 | narrower5 | narrower1 | wider1 | wider5 |
    [Arguments]    ${widget name}    ${target}    ${less5}    ${less1}    ${more1}    ${more5}
    Log To Console    Reading ${widget name}
    ${current} =    auxiliary.Read    ${widget name}
    Log To Console    Current value ${current}
    ${diff} =    Evaluate    ${target}-${current}
    WHILE    ${diff}!=0

    IF    ${diff}>=5
        auxiliary.Click    ${more5}
        ${current} =    Evaluate    ${current}+5
    ELSE IF    ${diff}>=1
        auxiliary.Click    ${more1}
        ${current} =    Evaluate    ${current}+1
    ELSE IF    ${diff}<=-5
        auxiliary.Click    ${less5}
        ${current} =    Evaluate    ${current}-5
    ELSE IF    ${diff}<=-1
        auxiliary.Click    ${less1}
        ${current} =    Evaluate    ${current}-1
    END

    ${diff} =    Evaluate    ${target}-${current}

    END
    Log To Console    Final value ${widget name}: ${current}

#==================================================
#                 Helper Actions                  #
#==================================================
RF GUI Helper: Select File
    [Documentation]      Used to open/save a file in the given folder. The operation is much the same
    ...    whether this is a project file or an image file.
    ...    = Examples =
    ...    | | = folder = | = file = | = open = |
    ...    | RF GUI Helper: Select File | c:/someFolder | sourcefile.json | |
    ...    | RF GUI Helper: Select File | c:/someFolder | destinationfile.json | False |
    [Arguments]    ${folder}    ${file}    ${open}=True
    ${anchor} =    Evaluate    'openProjectAnchor'
    ${folderWidget} =    Evaluate    'folderText'
    ${fileWidget} =    Evaluate    'fileText'
    ${buttonWidget} =    Evaluate    'ofOpen'

    IF    '${open}'=='False'
        ${anchor} =    Evaluate    'saveProjectAnchor'
        ${folderWidget} =    Evaluate    'saveFolderText'
        ${fileWidget} =    Evaluate    'saveFileText'
        ${buttonWidget} =    Evaluate    'sfSave'
    END

    # should be in the auxliary window
    RF GUI Helper: Find Window    auxiliary    ${anchor}

    # Switch to Open image dialog
    Record Action    ${TEST NAME}    Update folder: ${folder}
    auxiliary.Write    ${folderWidget}    ${folder}\n
    RF GUI Helper: Screen Capture    auxiliary    Folder set

    Record Action    ${TEST NAME}    Update file: ${file}
    auxiliary.Write    ${fileWidget}    ${file}
    RF GUI Helper: Make Picture    auxiliary    ${fileWidget}    File: ${file}

    Record Action    ${TEST NAME}    Click Open
    RF GUI Helper: Make Picture    auxiliary    ${buttonWidget}    Open button
    auxiliary.Click    ${buttonWidget}

RF GUI Helper: Find Window
    [Documentation]      Searches for the specified window and optionally verifies against an expected view name.
    ...    If targetting ONLY the expected view, no other view is acceptable. If an expected value is given, then
    ...    failing to find that view is a failure.
    ...    = Examples =
    ...    | = Return = | | = window = | = expectedView = | = target_only = |
    ...    | ${viewName} = | RF GUI Helper: Find Window | primary | | |
    ...    | ${viewName} = | RF GUI Helper: Find Window | auxiliary | saveProjectAnchor | |
    ...    | ${viewName} = | RF GUI Helper: Find Window | auxiliary | saveProjectAnchor | True |
    [Arguments]    ${window}    ${expectedView}=None    ${target_only}=False
    Sleep    1s
    IF    ${target_only}
        Log To Console    RF GUI Helper: Find Window ${window} with view ${expectedView}
        ${foundView} =    Wait Until Keyword Succeeds    2x    1s    ${window}.Find    ${expectedView}
    ELSE
        Log To Console    RF GUI Helper: Find Window ${window}
        ${foundView} =    Wait Until Keyword Succeeds    2x    1s    ${window}.Find
    END

    Record Data    ${TEST NAME}    Finding ${window} Window    ${window} Window: ${foundView}
    ${answer} =    Evaluate    '${expectedView}'!='None'

    IF    '${expectedView}'!='None'    #when a specific view is required
        Run Keyword If    '${foundView}'!='${expectedView}'    Fail
    END

    #Did not fail, record image
    RF GUI Helper: Screen Capture    ${window}    Window
    RETURN    ${foundView}

RF GUI Helper: Gain Focus
    [Documentation]      Finds the given window, which may be unfocused. By clicking on the window, it 
    ...    gains focus again. It then finds again to ensure we are in the focused view.
    ...    = Examples =
    ...    | | = window = |
    ...    | RF GUI Helper: Gain Focus | primary |
    [Arguments]    ${window}
    Sleep    1s
    ${name} =    Run Keyword    ${window}.Find
    Run Keyword    ${window}.Click    ${name}
    Run Keyword    ${window}.Find
    Wait Until Keyword Succeeds    2x    1s    RF GUI Helper: Verify View    ${window}
    
RF GUI Helper: Locate Window
    [Documentation]      Finds and moves the specified window to a default position for all tests. The primary
    ...    window is at (240, 50) and the secondary at (840, 50).
    ...    = Examples =
    ...    | | = window = |
    ...    | RF GUI Helper: Locate Window | primary |
    [Arguments]    ${window}
    ${view} =    Evaluate    'mainFocused'
    ${x} =    Evaluate    240
    ${y} =    Evaluate    50

    IF    '${window}'=='secondary'
        ${view} =    Evaluate    'None'
        ${x} =    Evaluate    840
    END

    Log To Console    RF GUI Helper: Locate Window ${window} @ (${x}, ${y})
    RF GUI Helper: Gain Focus    ${window}
    RF GUI Helper: Screen Capture    ${window}    Found ${window}
    Run Keyword    ${window}.Move    ${x}    ${y}
    RF GUI Helper: Screen Capture    ${window}    After move

    #(re)focus on primary window
    RF GUI Helper: Gain Focus    primary

RF GUI Helper: Screen Capture
    [Documentation]      Takes a full pacture of the window and records it with the given title.
    ...    = Examples =
    ...    | | = window = | = title = |
    ...    | RF GUI Helper: Screen Capture | primary | Main Window |
    [Arguments]    ${window}    ${title}
    ${file} =    Run Keyword    ${window}.Capture Window
    Record Screen Image    ${file}    ${TEST NAME}    ${title}

RF GUI Helper: Make Picture
    [Documentation]      Takes a picture of the specified widget in the specified window and 
    ...    records it with the given title.
    ...    = Examples =
    ...    | | = window = | = widget = | = title = |
    ...    | RF GUI Helper: Make Picture | primary | fMenu | File Menu |
    [Arguments]    ${window}    ${widget}    ${title}
    ${file} =    Run Keyword    ${window}.Capture Image    ${widget}
    Record Screen Image    ${file}    ${TEST NAME}    ${title}

RF GUI Helper: Watch
    [Documentation]      Starts a watcher that will record a GIF until halted.
    ...    = Examples =
    ...    | | = window = | = widget = | = name = |
    ...    | RF GUI Helper: Watch | primary | widgetList | List of Widgets |
    [Arguments]    ${window}    ${widget}    ${name}
    RF GUI Helper: Gain Focus    ${window}
    Run Keyword    ${window}.Start Watcher For    ${widget}    ${name}

RF GUI Helper: Stop Watcher
    [Documentation]      Halts an existing watcher and records the GIF as "${name} Watcher"
    ...    = Examples =
    ...    | | = window = | = name = |
    ...    | RF GUI Helper: Stop Watcher | primary | List of Widgets |
    [Arguments]    ${window}    ${name}
    RF GUI Helper: Gain Focus    ${window}
    ${file} =    Run Keyword    ${window}.Stop Watcher For    ${name}
    Record Screen Image    ${file}    ${TEST NAME}    ${name} Watcher

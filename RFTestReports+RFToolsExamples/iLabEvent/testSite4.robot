*** Settings ***
Library    SeleniumLibrary
Resource    ./../OQE/DataExtraction.resource
Resource    ./resource3.robot
Suite Setup        Test Setup
Suite Teardown     Test Teardown
Test Template      Test Menu
#Test Setup         Test Setup
#Test Teardown      Test Teardown

*** Variables ***
${Time VAR} =    Test Time
${Scatter VAR} =    Dot Data
${CASE VAR} =    Case Time
${Multi VAR} =   Contrast Time
${Stacked Time} =    Stack Time
${Stacked Time2} =    Stack Time2
@{Test Cases} =    Create List    Featureset    Content Search    Stories    Units    News Alerts    Media    Home

*** Test Cases ***	M			H1		H2    		T								R
Featureset		menuLinkfeatures	Features	/feature	DVIDS - Features - Date_modified - Page 1			${TRUE}
Content Search		menuLinkcontent		Content		/search		DVIDS - Search							${TRUE}
Stories			menuLinkstories		Stories		/portfolio	DVIDS - Digital Portfolio					${TRUE}
Units			menuLinkunits		Units		/unit	 	Broken test								${TRUE}
News Alerts		menuLinknewswire	Newswire	/alerts	 	DVIDS - Manage Newswire						${TRUE}
Media			menuLinkmedia		Media Requests	/mediarequest	DVIDS - Media Request						${TRUE}
Home			menuLinkhome		Home		/		DVIDS - Defense Visual Information Distribution Service		${FALSE}

*** Keywords ***
Test Menu
   [Arguments]     ${MENU_ID}    ${HTML}    ${HREF}    ${PTITLE}    ${RETURN}
   New Test Event    Check ${TEST NAME} Menu
   Mark Time
   Find Menu Item    ${MENU_ID}    ${HTML}    ${HREF}
   ${tValue} =    Time Done
   ${index} =    Get Index From List    ${Test Cases}    ${TEST NAME}
   Special Data    ${Stacked Time2}-${index}    Find Menu Item    ${tValue}
   @{allTimes} =    Create List    ${tValue}
   ${total} =    Evaluate    ${tValue} + 0
   Special Data    ${Time VAR}    ${TEST NAME}-Find Menu Item    ${tValue}
   @{values} =    Evaluate  random.sample(range(200, 1000),3)
   Special Multi Data    ${Multi VAR}    ${TEST NAME}-Find Menu Item    @{values}
   @{lons} =    Evaluate    random.sample(range(-180, 180),1)
   ${lats} =    Function    ${lons}[0]
   Special Data    ${Scatter VAR}    ${lons}[0]    ${lats}
   Data Break
   Mark Time
   Click Menu Item    ${MENU_ID}    ${HTML}    ${PTITLE}    ${RETURN}
   ${tValue} =    Time Done
   Special Data    ${Stacked Time2}-${index}    Click Menu Item    ${tValue}
   Append To List    ${allTimes}    ${tValue}
   ${total} =    Evaluate    ${total} + ${tValue}
   Special Data    ${Time VAR}    ${TEST NAME}-Click Menu Item    ${tValue}
   @{values} =    Evaluate  random.sample(range(200, 1000),3)
   Special Multi Data    ${Multi VAR}    ${TEST NAME}-Click Menu Item    @{values}
   @{lons} =    Evaluate    random.sample(range(-180, 180),1)
   ${lats} =    Function    ${lons}[0]
   Special Data    ${Scatter VAR}    ${lons}[0]    ${lats}
   Data Break
   Mark Time
   Return to Root    ${HTML}    ${RETURN}
   ${tValue} =    Time Done
   Special Data    ${Stacked Time2}-${index}    Return to Root    ${tValue}
   Append To List    ${allTimes}    ${tValue}
   ${total} =    Evaluate    ${total} + ${tValue}
   Special Data    ${Time VAR}    ${TEST NAME}-Return to Root    ${tValue}
   @{values} =    Evaluate  random.sample(range(200, 1000),3)
   Special Multi Data    ${Multi VAR}    ${TEST NAME}-Return to Root    @{values}
   Special Data    ${CASE VAR}    ${TEST NAME}    ${total}
   Special Multi Data    ${Stacked Time}    ${TEST NAME}    @{allTimes}
   @{lons} =    Evaluate    random.sample(range(-180, 180),1)
   ${lats} =    Function    ${lons}[0]
   #@{lons} =    Evaluate  random.sample(range(-180, 180),1)
   #@{lats} =    Evaluate  random.sample(range(-90, 90),1)
   Special Data    ${Scatter VAR}    ${lons}[0]    ${lats}
   [TEARDOWN]    Record Test Case    ${TEST NAME}    --    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

Find Menu Item
   [Arguments]    ${MENU_ID}    ${HTML}    ${HREF}
   ${text} =    Find Tag and Get Attribute    css:#${MENU_ID}    innerHTML
   ${href} =    Find Tag and Get Attribute    css:#${MENU_ID}    href
   ${a1} =    Assert OQE Value    ${HTML}    Verify HTML    ${text}    ${HTML}
   ${a2} =    Assert OQE Value    ${HTML}    Verify link    ${href}    ${HREF}
   Record Data    ${HTML}    Menu selection    ID: ${MENU_ID}; Menu Text: ${text}; Link: ${href}
   Capture Element Image    css:#${MENU_ID}    ${HTML}    Menu button
   IF    '''${a1}'''>='''${a2}'''
      Record Test Case    --    Found Matching Menu Item    ${a1}    --
   ELSE
      Record Test Case    --    Found Matching Menu Item    ${a2}    --
   END
   [TEARDOWN]    Record Test Case    --    Find Menu Item Test    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

Click Menu Item
   [Arguments]    ${MENU_ID}    ${HTML}    ${PTITLE}    ${RETURN}
   Click Element    css:#${MENU_ID}
   IF    ${RETURN}
      Wait Until Page Does Not Contain    YOU TELL THE STORY, WE TELL THE    5
   END
   ${title} =    Find Tag and Get Attribute    css:title    innerHTML
   ${a1} =    Assert OQE Value    ${HTML}    Verify link    ${title}    ${PTITLE}
   Capture Screen Image    ${HTML}    Linked page
   Record Test Case    --    Arrive at desired page    ${a1}    --
   [TEARDOWN]    Record Test Case    --    Click Menu Item Test    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

Return to Root
   [Arguments]    ${HTML}    ${RETURN}
   IF    ${RETURN}
      Go Back
      Sleep    2
      Wait Until Page Contains    YOU TELL THE STORY, WE TELL THE    5
   END
   ${title} =    Find Tag and Get Attribute    css:title    innerHTML
   ${a1} =    Assert OQE Value    ${HTML}    Return to main page    ${title}    ${TITLE}
   Record Test Case    --    Returned to root page    ${a1}    --
   [TEARDOWN]    Record Test Case    --    Return to Root Test    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

Test Setup
   Open and Verify Site
   Archive Any Previous Data
   ${modes} =    Set Variable    Discrete
   Report Line    VBar    ${modes}    ${Time VAR}    Steps    Time (ms)    Total
   ${modes} =    Set Variable    None
   Report Line    Scatter    ${modes}    ${Scatter VAR}    Lon    Lat    Position
   Report Pie    ${modes}    ${CASE VAR}    Cases    Time (ms)    --
   @{titles} =    Create List    Alpha    Beta   Gamma
   ${modes} =    Set Variable    Progressive
   Report Multi Line    Area    ${modes}    ${Multi VAR}    Steps    Time (ms)    @{titles}
   ${modes} =    Set Variable    Discrete_Stacked   
   @{titles} =    Create List    Find Menu Item    Click Menu Item    Return to Root
   Report Multi Line    VBar    ${modes}    ${Stacked Time}    Case    Time (ms)    @{titles}
   Report Multi Line    VBar    ${modes}    ${Stacked Time2}    Case    Time (ms)    @{Test Cases}

Function
   [Arguments]   ${x}
   ${value} =    Evaluate    (${x}*${x}*${x}/100000) + (${x}*${x}/1000) + (${x}/100)
   [Return]    ${value}

Test Teardown
   Close Site

*** Settings ***
Library    SeleniumLibrary
Resource    ./../OQE/DataExtraction.resource
Resource    ./resource3.robot
Suite Setup        Suite Setup
Suite Teardown     Test Teardown
Test Template      Test Menu
Test Setup         Test Setup
#Test Teardown      Test Teardown
 
*** Variables ***
${time-line} =    Test Time
${time-line2} =    Time Requirements

*** Test Cases ***	M			H1		H2    		T								R
Featureset		menuLinkfeatures	Features2	/feature	DVIDS - Features - Date_modified - Page 1			${TRUE}
Content Search		menuLinkcontent		Content		/search		DVIDS - Search							${TRUE}
Stories			menuLinkstories		Stories		/portfolio	DVIDS - Digital Portfolio					${TRUE}
Units			menuLinkunits		Units		/units	 	Broken test								${TRUE}
News Alerts		menuLinknewswire	Newswire	/alerts	 	DVIDS - Manage Newswire						${TRUE}
Media			menuLinkmedia		Media Requests	/mediarequest	DVIDS - Media Request						${TRUE}
Home			menuLinkhome		Home		/		DVIDS - Defense Visual Information Distribution Service		${FALSE}

*** Keywords ***
Test Menu
   [Arguments]     ${MENU_ID}    ${HTML}    ${HREF}    ${PTITLE}    ${RETURN}
   Mark Time
   Find Menu Item    ${MENU_ID}    ${HTML}    ${HREF}
   ${tmp} =    Time Done
   Test Data    ${currentTest}    ${time-line}    Find Menu Item    ${tmp}
   Data Break

   Mark Time
   Click Menu Item    ${MENU_ID}    ${HTML}    ${PTITLE}    ${RETURN}
   ${tmp2} =    Time Done
   Test Data    ${currentTest}    ${time-line}    Click Menu Item    ${tmp2}
   Data Break

   Mark Time
   Return to Root    ${HTML}    ${RETURN}
   ${tmp3} =    Time Done
   Test Data    ${currentTest}    ${time-line}    Return to Root    ${tmp3}

   ${times} =    Create List     ${tmp}     ${tmp2}     ${tmp3}
   Suite Multi Data    ${time-line2}    ${TEST NAME}    @{times}

   [TEARDOWN]    Record Test Case    ${TEST NAME}    --    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

Find Menu Item
   [Arguments]    ${MENU_ID}    ${HTML}    ${HREF}
   ${text} =    Find Tag and Get Attribute    css:#${MENU_ID}    innerHTML
   ${href} =    Find Tag and Get Attribute    css:#${MENU_ID}    href
   ${a1} =    Assert OQE Value    ${HTML}    Verify HTML    ${text}    ${HTML}
   ${a2} =    Assert OQE Value    ${HTML}    Verify link    ${href}    ${HREF}
   Record Data    ${HTML}    Menu selection    ID: ${MENU_ID}; Menu Text: ${text}; Link: ${href}
   Capture Element Image    css:#${MENU_ID}    ${HTML}    Menu button
   IF    '''${a1}'''=='''${a2}''' and '''${a2}'''=='''PASS'''
      Record Test Case    --    Found Matching Menu Item    ${a1}    --
   ELSE
      Record Test Case    --    Found Matching Menu Item    FAIL    --
   END
   [TEARDOWN]    Record Test Case    --    Find Menu Item Test    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

Click Menu Item
   [Arguments]    ${MENU_ID}    ${HTML}    ${PTITLE}    ${RETURN}
   Click Element    css:#${MENU_ID}
   Record Action    ${TEST NAME}    Click ${MENU_ID} menu
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
      Record Action    ${TEST NAME}    Returned to home screen
   END
   ${title} =    Find Tag and Get Attribute    css:title    innerHTML
   ${a1} =    Assert OQE Value    ${HTML}    Return to main page    ${title}    ${TITLE}
   Record Test Case    --    Returned to root page    ${a1}    --
   [TEARDOWN]    Record Test Case    --    Return to Root Test    ${KEYWORD STATUS}    ${KEYWORD MESSAGE}

Suite Setup
   Open and Verify Site
   Archive Any Previous Data
   ${tmp} =    Create List    Find Menu Item    Click Menu Item    Return to Root
   Suite Multi Line     VBar    Stacked    ${time-line2}    Test    Step Time (ms)    @{tmp}

Test Setup
   ${tmp} =    New Test Event    Check ${TEST NAME} Menu
   Set Global Variable    ${currentTest}    ${tmp}
   Test Line     ${currentTest}    Line    Progressive    ${time-line}    Steps    Time (ms)    ${TEST NAME}

Test Teardown
   Close Site

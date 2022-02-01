*** Settings ***
Library   SeleniumLibrary
Resource   ./resource2.robot
Resource   ./../OQE/DataExtraction.resource

*** Variables ***

*** Keywords ***

*** Test Cases ***
Test Setup
   Open and Verify Site
   Archive Any Previous Data
   New Test Event    Test Site 2
   [Teardown]    Record Test Case    ${TEST NAME}    --    ${TEST STATUS}    ${TEST MESSAGE}

#Verify OQE
#   Test Check
#   ${something} =    Prove it works
#   Log    ${something}
#   Archive Any Previous Data
#   Insert Dummy Test Data

Find Content Menu
   ${text} =    Find Tag and Get Attribute    css:#menuLinkcontent    innerHTML
   ${href} =    Find Tag and Get Attribute    css:#menuLinkcontent    href
   Record Data    ${TEST NAME}    Menu selection    Menu Text: ${text}; Link: ${href}
   Capture Element Image    css:#menuLinkcontent    ${TEST NAME}    Content Menu
   Click Element    css:#menuLinkcontent
   ${title} =    Find Tag and Get Attribute    css:title    innerHTML
   Assert OQE Value    ${TEST NAME}    Link to search page    ${title}    DVIDS - Search
   Capture Screen Image    ${TEST NAME}    Search Page
   Go Back
   ${title} =    Find Tag and Get Attribute    css:title    innerHTML
   Assert OQE Value    ${TEST NAME}    Return to main page    ${title}    ${TITLE}
   [Teardown]    Record Test Case    ${TEST NAME}    --    ${TEST STATUS}    ${TEST MESSAGE}

Search for Rubber Duck
   Input Text    index-search-input    Rubber Duck
   Capture Element Image    index-search-input    ${TEST NAME}    Search term
   Press Keys    index-search-input    ENTER
   Capture Screen Image    ${TEST NAME}    Search results
   Go Back
   ${title} =    Find Tag and Get Attribute    css:title    innerHTML
   Assert OQE Value    ${TEST NAME}    Return to main page    ${title}    ${TITLE}
   [Teardown]    Record Test Case    ${TEST NAME}    --    ${TEST STATUS}    ${TEST MESSAGE}

Search for NSWC Dahlgren
   Input Text    index-search-input    nswc
   Sleep    2
   Capture Element Image    css:#dvids_home_search_form div    ${TEST NAME}    Search term
   Mouse Over    css:#dvids_home_search_form div ul li[data-value="nswc dahlgren"] a
   Capture Screen Image    ${TEST NAME}    Auto-complete results
   Input Text    index-search-input    ""
   Sleep    2
   [Teardown]    Record Test Case    ${TEST NAME}    --    ${TEST STATUS}    ${TEST MESSAGE}

Repeat Step for Failure
   Input Text    index-search-input    nswc
   Sleep    2
   Mouse Over    css:#dvids_home_search_form div ul li[data-value="nswc dahlgren"] a
   Input Text    no-such-name    ""
   Sleep    2
   [Teardown]    Record Test Case    ${TEST NAME}    --    ${TEST STATUS}    ${TEST MESSAGE}

Search for Contact Us Link
   Capture Element Image    css:a[alt="Contact Us"]    ${TEST NAME}    Menu link
   Click Element    css:a[alt="Contact Us"]
   Capture Screen Image    ${TEST NAME}    Menu link
   Go Back
   ${title} =    Find Tag and Get Attribute    css:title    innerHTML
   Assert OQE Value    ${TEST NAME}    Return to main page    ${title}    ${TITLE}
   [Teardown]    Record Test Case    ${TEST NAME}    --    ${TEST STATUS}    ${TEST MESSAGE}

Test Teardown
   Close Site

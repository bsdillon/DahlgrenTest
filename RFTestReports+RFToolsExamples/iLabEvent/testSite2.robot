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
   [Teardown]    Record Test Case    ${TEST NAME}    ${TEST STATUS}    ${TEST MESSAGE}

#Verify OQE
#   Test Check
#   ${something} =    Prove it works
#   Log    ${something}
#   Archive Any Previous Data
#   Insert Dummy Test Data

Find Content Menu
   ${text} =    Get Element Attribute    css:#menuLinkcontent    innerHTML
   ${href} =    Get Element Attribute    css:#menuLinkcontent    href
   Record Data    ${TEST NAME}    Menu selection    Menu Text: ${text}; Link: ${href}
   ${img} =    Get Image File Name    ${TEST NAME}    Content Menu
   Capture Element Screenshot    css:#menuLinkcontent    ${img}
   Record OQE Image    ${TEST NAME}    Content Menu    ${img}
   Click Element    css:#menuLinkcontent
   ${title} =    Get Element Attribute    css:title    innerHTML
   Assert OQE Value    ${TEST NAME}    Link to search page    ${title}    DVIDS - Search
   ${img} =    Get Image File Name    ${TEST NAME}    Search Page
   Capture Page Screenshot    ${img}
   Record OQE Image    ${TEST NAME}    Search page    ${img}
   Go Back
   ${title} =    Get Element Attribute    css:title    innerHTML
   Assert OQE Value    ${TEST NAME}    Return to main page    ${title}    ${TITLE}
   [Teardown]    Record Test Case    ${TEST NAME}    ${TEST STATUS}    ${TEST MESSAGE}

Search for Rubber Duck
   Input Text    index-search-input    Rubber Duck
   ${img} =    Get Image File Name    ${TEST NAME}    Search term
   Capture Element Screenshot    index-search-input    ${img}
   Record OQE Image    ${TEST NAME}    Search term    ${img}
   Press Keys    index-search-input    ENTER
   ${img} =    Get Image File Name    ${TEST NAME}    Search results
   Capture Page Screenshot    ${img}
   Record OQE Image    ${TEST NAME}    Search results    ${img}
   Go Back
   ${title} =    Get Element Attribute    css:title    innerHTML
   Assert OQE Value    ${TEST NAME}    Return to main page    ${title}    ${TITLE}
   [Teardown]    Record Test Case    ${TEST NAME}    ${TEST STATUS}    ${TEST MESSAGE}

Search for NSWC Dahlgren
   Input Text    index-search-input    nswc
   Sleep    2
   ${img} =    Get Image File Name    ${TEST NAME}    Search term
   Capture Element Screenshot    css:#dvids_home_search_form div    ${img}
   Record OQE Image    ${TEST NAME}    Search term    ${img}
   Mouse Over    css:#dvids_home_search_form div ul li[data-value="nswc dahlgren"] a
   ${img} =    Get Image File Name    ${TEST NAME}    Auto-complete
   Capture Page Screenshot    ${img}
   Record OQE Image    ${TEST NAME}    Auto-complete results    ${img}
   Input Text    index-search-input    ""
   Sleep    2
   [Teardown]    Record Test Case    ${TEST NAME}    ${TEST STATUS}    ${TEST MESSAGE}

Repeat Step for Failure
   Input Text    index-search-input    nswc
   Sleep    2
   Mouse Over    css:#dvids_home_search_form div ul li[data-value="nswc dahlgren"] a
   Input Text    no-such-name    ""
   Sleep    2
   [Teardown]    Record Test Case    ${TEST NAME}    ${TEST STATUS}    ${TEST MESSAGE}

Search for Contact Us Link
   ${img} =    Get Image File Name    ${TEST NAME}    Menu link
   Capture Element Screenshot    css:a[alt="Contact Us"]    ${img}
   Record OQE Image    ${TEST NAME}    Menu link    ${img}
   Click Element    css:a[alt="Contact Us"]
   ${img} =    Get Image File Name    ${TEST NAME}    Contact Page
   Capture Page Screenshot    ${img}
   Record OQE Image    ${TEST NAME}    Contact Page    ${img}
   Go Back
   ${title} =    Get Element Attribute    css:title    innerHTML
   Assert OQE Value    ${TEST NAME}    Return to main page    ${title}    ${TITLE}
   [Teardown]    Record Test Case    ${TEST NAME}    ${TEST STATUS}    ${TEST MESSAGE}

Test Teardown
   Close Site

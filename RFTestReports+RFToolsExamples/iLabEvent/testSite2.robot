*** Settings ***
Library   SeleniumLibrary
Resource   ./resource2.robot
Resource   ./../OQE/DataExtraction.resource

*** Variables ***

*** Keywords ***

*** Test Cases ***
Test Setup
   Open and Verify Site

Setup OQE
   Test Check
   ${something} =    Prove it works
   Log    ${something}
   Archive Any Previous Data
   Insert Dummy Test Data

Find Content Menu
   Log   Selecting Content Menu
   ${text} =    Get Element Attribute    css:#menuLinkcontent    innerHTML
   Log   Menu label: ${text}
   ${href} =    Get Element Attribute    css:#menuLinkcontent    href
   Log   HREF: ${href}
   Capture Element Screenshot    css:#menuLinkcontent    EMBED
   Click Element    css:#menuLinkcontent
   Title Should Be    DVIDS - Search
   Capture Page Screenshot    EMBED
   Go Back
   Title Should Be    ${TITLE}

Search for Rubber Duck
   Input Text    index-search-input    Rubber Duck
   Capture Element Screenshot    index-search-input    EMBED
   Press Keys    index-search-input    ENTER
   Capture Page Screenshot    EMBED
   Go Back
   Title Should Be    ${TITLE}

Search for NSWC Dahlgren
   Input Text    index-search-input    nswc
   Sleep    2
   Capture Element Screenshot    css:#dvids_home_search_form div    EMBED
   Mouse Over    css:#dvids_home_search_form div ul li[data-value="nswc dahlgren"] a
   Capture Page Screenshot    EMBED
   Input Text    index-search-input    ""
   Sleep    2

Search for Contact Us Link
   Capture Element Screenshot    css:a[alt="Contact Us"]    EMBED
   Click Element    css:a[alt="Contact Us"]
   Capture Page Screenshot    EMBED
   Go Back
   Title Should Be    ${TITLE}

Test Teardown
   Close Site

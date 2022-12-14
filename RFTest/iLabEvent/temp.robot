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

Search for Rubber Duck
   Banner    Start Menu Tests
   Input Text    index-search-input    Rubber Duck
   Capture Element Image    index-search-input    ${TEST NAME}    Search term
   Press Keys    index-search-input    ENTER
   Record Action    ${TEST NAME}    Search for Rubber Duck
   Capture Screen Image    ${TEST NAME}    Search results
   Go Back
   Record Action    ${TEST NAME}    Go back to home screen
   ${title} =    Find Tag and Get Attribute    css:title    innerHTML
   Assert OQE Value    ${TEST NAME}    Return to main page    ${title}    ${TITLE}
   Soft Break

Search for Contact Us Link
   Capture Element Image    css:a[alt="Contact Us"]    ${TEST NAME}    Menu link
   Click Element    css:a[alt="Contact Us"]
   Record Action    ${TEST NAME}    Clicked Contact Us link
   Capture Screen Image    ${TEST NAME}    Menu link
   Go Back
   Record Action    ${TEST NAME}    Return to main page
   ${title} =    Find Tag and Get Attribute    css:title    innerHTML
   Assert OQE Value    ${TEST NAME}    Return to main page    ${title}    ${TITLE}
   ${a} =    Evaluate    1 / 0
   [Teardown]    Keyword Final    --    Menu Tests    ${TEST STATUS}    ${TEST MESSAGE}

Test Teardown
   Close Site

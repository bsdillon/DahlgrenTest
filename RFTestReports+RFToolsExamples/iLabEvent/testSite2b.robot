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
   Input Text    index-search-input    Rubber Duck
   Capture Element Image    index-search-input    ${TEST NAME}    Search term
   Press Keys    index-search-input    ENTER
   Capture Screen Image    ${TEST NAME}    Search results
   Go Back
   ${title} =    Find Tag and Get Attribute    css:title    innerHTML
   Assert OQE Value    ${TEST NAME}    Return to main page    ${title}    ${TITLE}
   [Teardown]    Record Test Case    ${TEST NAME}    --    ${TEST STATUS}    ${TEST MESSAGE}

Test Teardown
   Close Site

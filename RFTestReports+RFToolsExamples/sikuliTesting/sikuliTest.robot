*** Settings ***
Resource   ./../OQE/DataExtraction.resource

*** Variables ***

*** Keywords ***

*** Test Cases ***
Test Sikuli
   New Test Event    Testing Sikuli
   Screen Capture    Test Shot   0    0    300    300    Some Picture

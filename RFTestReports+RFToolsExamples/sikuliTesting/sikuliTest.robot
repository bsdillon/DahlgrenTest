*** Settings ***
Resource   ./../OQE/DataExtraction.resource

*** Variables ***

*** Keywords ***
#.all_colors    Example of class CSS
#css:#main      Example of id CSS

*** Test Cases ***
Test Sikuli
   Archive Any Previous Data
   New Test Event    Testing Sikuli
   Simple Test    css:#first    css:#clickable    css:#red    css:#blue    css:#green    css:#reverse
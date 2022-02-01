*** Settings ***
Library   SeleniumLibrary
Resource   ./resource2.robot
Resource   ./../OQE/DataExtraction.resource

*** Variables ***

*** Keywords ***

*** Test Cases ***
Setup OQE
   New Test Event    Test Site 2
   Test Check
   ${something} =    Prove it works
   Log    ${something}
   Archive Any Previous Data
   Insert Dummy Test Data
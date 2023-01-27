*** Settings ***
Library   SeleniumLibrary

*** Variables ***

${SITE URL}     https://bsdillon.github.io/DahlgrenTest/html/Testing/jsprimary.html  

${BROWSER}      Chrome

*** Keywords ***
#Open SUT
kw_testsite_open  
   Open Browser   ${SITE URL}   ${BROWSER}
   Title Should Be   JavaScript Test Tool

#Simple Test (Passes)
kw_radios_click
   Click Button   Radio1
   Click Button   Radio2
   Click Button   Radio3

#Check Against Expected Behavior (Passes)
kw_textbox_input
   Get Web Element    fileName
   Input Text         fileName   textfile1.txt  
   Click Button       openfile
   Element Should Contain    fileOutput   Value1

#Compares Data Output (Fails)
kw_calendar_selectdate
   Get Web Element    date
   Input Text         date    12/17/2020
   Element Attribute Value Should Be     date    value    2020-12-17


*** Test Cases ***
#Run keywords in test cases
Open Site
   kw_testsite_open
 
Read Date
   Get Web Element    date
   Input Text         date    12/17/2020
   ${value} =         Get Element Attribute     //*[@id="date"]    valueAsNumber
   Log     ${value}
   ${value} =         Get Element Attribute     //*[@id="date"]    value
   Log     ${value}

Date Test [Fails]
   kw_calendar_selectdate
   [Teardown]    Close Browser


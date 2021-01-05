*** Settings ***
Library   SeleniumLibrary

*** Variables ***

${SITE URL}     https://bsdillon.github.io/DahlgrenTest/html/Testing/jsprimary.html  

${BROWSER}      Firefox

*** Keywords ***
#Open SUT
kw_testsite_open  
   Open Browser   ${SITE URL}   ${BROWSER}
   Title Should Be   JavaScript Test Tool
#Simple Test Passed

kw_radios_click
   Click Button   Radio1
   Click Button   Radio2
   Click Button   Radio3
#Compares Data Output

kw_textbox_input
   Get Web Element    fileName
   Input Text         fileName   textfile1.txt  
   Click Button       openfile
   Element Should Contain    fileOutput   Value1
#Checks against expected output [Fails]

kw_calendar_selectdate
   Get Web Element    date
   Input Text         date    13/12/2020
   Element Should Contain  date   13/12/2020

*** Test Cases ***
#Run keywords in test cases
 Open Site
   kw_testsite_open
 
 Radio Test
   kw_radios_click
  
Textbox Test
   kw_textbox_input

 Date Test [Fails]
   kw_calendar_selectdate
   [Teardown]    Close Browser

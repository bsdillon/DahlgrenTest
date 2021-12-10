*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${BROWSER}      Chrome
${SITE URL}     https://www.dvidshub.net/
${TITLE}        DVIDS - Defense Visual Information Distribution Service

*** Keywords ***
Open and Verify Site
   Open Browser   ${SITE URL}   ${BROWSER}
   Title Should Be    ${TITLE}
   Capture Page Screenshot    EMBED

Close Site
   Close Browser

Find Tag and Get Attribute
   [Arguments]    ${CSS-IDENTIFIER}    ${ATTRIBUTE-NAME}
   ${value} =    Get Element Attribute    ${CSS-IDENTIFIER}    ${ATTRIBUTE-NAME}
   [Return]    ${value}

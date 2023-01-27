*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${BROWSER}      Chrome
${SITE URL}     https://www.dvidshub.net/
${TITLE}        DVIDS - Defense Visual Information Distribution Service

*** Keywords ***

*** Test Cases ***
Open Site
   Open Browser   ${SITE URL}   ${BROWSER}

Verify Site OQE
   Title Should Be    ${TITLE}
   Capture Page Screenshot    filename=MainSite-{index}.png
   Capture Page Screenshot    EMBED

Close Site
   Close Browser


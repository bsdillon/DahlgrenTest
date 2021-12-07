*** Settings ***
Library   SeleniumLibrary
Resource  ./resource1.robot

*** Variables ***

*** Keywords ***
Find More Button
   ${id}=	Get Element Attribute	css:#footer div div div a    id
   Log     Found ${id}

Find More Button 2
   ${id}=	Execute Javascript    return document.getElementById("footer").firstElementChild.firstElementChild.firstElementChild.firstElementChild.id;
   Log     Found ${id}

*** Test Cases ***
Test Setup
   Open and Verify Site

Find Three Bar Menu
   #Element Attribute Value Should Be    offcanvas-nav    aria-hidden    true
   Click Element     dvids_mobile_nav_icon
   #Element Attribute Value Should Be    offcanvas-nav    aria-hidden    false
   Sleep 5
   Click Element     dvids_mobile_nav_icon
   #Element Attribute Value Should Be    offcanvas-nav    aria-hidden    true



#* Find the search bar and use Input Text to set the search text
#* After you type something into the search, find and click text on the autocomplete panel 
#* Find the websupport email at the bottom of the page


Test Teardown
   Close Site

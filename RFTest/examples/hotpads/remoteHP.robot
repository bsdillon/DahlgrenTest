*** Settings ***
Library    genericwindow.py    WITH NAME    site
Library    genericwindow.py    WITH NAME    price
Library    genericwindow.py    WITH NAME    rooms
Resource   DataExtraction.resource

Suite Setup        Suite Start
Test Setup         Test Start
Test Template      Test Site
#Test Teardown      
#Suite Teardown     

*** Variables ***
${REMOTE} =    192.168.0.199;5900;password
${DATA PATH} =    C:/Users/Benny/Documents/RFData

*** Test Cases ***      City          Min    Max    Rooms    
Warsaw;100-200;3        Warsaw, VA    100    200    3        

*** Keywords ***
Suite Start
    Configure Image Library    Sikuli    ${DATA PATH}    remoteVNC=${REMOTE}

    Archive Any Previous Data
    Set Log Level    TRACE

    site.Configure    Sikuli    C:/Users/Benny/Documents/github/DahlgrenTest/RFGUIHelper/configs/hotpads    ${DATA PATH}    ${REMOTE}
    price.Configure    Sikuli    C:/Users/Benny/Documents/github/DahlgrenTest/RFGUIHelper/configs/pricemenu    ${DATA PATH}    ${REMOTE}
    rooms.Configure    Sikuli    C:/Users/Benny/Documents/github/DahlgrenTest/RFGUIHelper/configs/bedroommenu    ${DATA PATH}    ${REMOTE}

    site.Find
    ${tmp} =    site.Document API
    Log    ${tmp}
    ${tmp} =    price.Document API
    Log    ${tmp}
    ${tmp} =    rooms.Document API
    Log    ${tmp}

Test Start
    New Test Event    ${TEST NAME}

Test Site
    [ARGUMENTS]    ${CITY}    ${MIN}    ${MAX}    ${ROOM}
    site.Find
    site.Write    citystate    ${CITY}
    site.Click    price
    Sleep    2
    price.Find
    price.Write    lowprice    ${MIN}
    price.Write    maxprice    ${MAX}
    price.Click    done_button

    # site.Click    beds
    # Sleep    2
    # rooms.Find
    # rooms.Click    ${ROOM}_button
    # rooms.Click    done_button

    site.Find
    site.Click    search
    ${file} =    site.Capture Image    listings
    Record Screen Image    ${file}    ${TEST NAME}    Answer


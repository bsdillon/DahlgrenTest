*** Comments ***
This test file verifies the addition of all the widget types and the functions related to their creation.

*** Settings ***
Resource    DataExtraction.resource
Resource    rfghelper.resource

*** Variables ***
${DATA PATH} =    C:/Users/Owner/OneDrive/Documents/RFData3_1
${PROJ FOLDER} =    C:/Users/Owner/OneDrive/Documents/GitHub/DahlgrenTest/RFTest/examples/RFGHelper/test_widgets
${PROJ FILE} =    allMembers
${IMG FOLDER} =    C:/Users/Owner/OneDrive/Documents/GitHub/DahlgrenTest/RFTest/examples/RFGHelper
${IMG FILE} =    allMembers

*** Test Cases ***
Startup
    RF GUI Helper: Suite Start    ${DATA PATH}
    RF GUI Helper: Open     ${DATA PATH}

Create New Project
    RF GUI Helper: New Project    ${PROJ FOLDER}    ${PROJ FILE}    ${IMG FOLDER}    ${IMG FILE}

Create Widgets
    RF GUI Helper: Create Widget    199    180    69     19    myButton         Button
    RF GUI Helper: Create Widget    18     53     102    21    myText           Text
    RF GUI Helper: Create Widget    13     22     209    24    myLabel          Label
    RF GUI Helper: Create Widget    24     99     74     80    myList           List            group=theList
    RF GUI Helper: Create Widget    141    97     41     18    myTab            Tab             group=theTabs
    RF GUI Helper: Create Widget    146    69     18     14    myCheckBox       Checkbox
    RF GUI Helper: Create Widget    217    54     15     15    myRadioButton    Radio           group=theRadios    value=Plane
    RF GUI Helper: Create Widget    100    99     18     18    upButton         ScrollButton    group=theList    dir=north
    RF GUI Helper: Create Widget    15     0      71     19    myAnchor         Anchor
    RF GUI Helper: Create Widget    123    0      55     15    myMovePoint      MovePoint

    # Only need one of the scroll buttons
    # RF GUI Helper: Create Widget    100    183    18     16    downButton       ScrollButton    group=theList    dir=south
    # RF GUI Helper: Create Widget    19     180    19     19    leftButton       ScrollButton    group=theList    dir=west
    # RF GUI Helper: Create Widget    81     181    21     18    rightButton      ScrollButton    group=theList    dir=east

    RF GUI Helper: Click Menu    fMenu    verifyView=False
    primary.Click    saveProject

Close Project
    #delete the project files?
    RF GUI Helper: Stop Test

*** Keywords ***

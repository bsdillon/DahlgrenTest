*** Settings ***
Library    String
Test Template    Read Character

*** Variables ***
${fruit}    eggplant
${num}    sixteen
${town}    Dahlgren
${state}    Virginia

*** Test Cases ***   String     Index    Char    Match
Find g               ${state}   3        g       True
No find g            ${state}   2        g       False
No find r            ${state}   3        r       False
Find r               ${state}   2        r       True
Eggpla[n]t is N      ${fruit}   6        n       True
Eggp[l]ant not N     ${fruit}   4        n       False
sixt[e]en is e       ${num}     4        e       True   
sixte[e]n is e       ${num}     5        e       True 
Dahl[g]ren is g      ${town}    4        g       True
D[a]hlgren no g      ${town}    1        g       True

*** Keywords ***
Read Character
    [ARGUMENTS]    ${text}    ${n}     ${answer}    ${match}
    ${a} =    Find Nth Character    ${text}    ${n}
    Log    ${a}
    Run Keyword If    ${match}    Should Be Equal    ${a}    ${answer}    ELSE    Should Not Be Equal    ${a}    ${answer}

Find Nth Character
    [ARGUMENTS]    ${text}    ${n}
    @{characters} =    Split String To Characters    ${text}
    [RETURN]    ${characters}[${n}]

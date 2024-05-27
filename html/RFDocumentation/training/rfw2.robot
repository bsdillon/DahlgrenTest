*** Settings ***
Library    String

*** Variables ***
${state}    Virginia
${num}    ${3}

*** Test Cases ***
Read Character 1
    ${a} =    Find Nth Character    ${state}    ${num}
    Log    ${a}
    Should Be Equal    ${a}    g

Read Character 2
    ${a} =    Find Nth Character    ${state}    2
    Log    ${a}
    Should Be Equal    ${a}    g

Read Character 3
    ${a} =    Find Nth Character    ${state}    ${num}
    Log    ${a}
    Should Be Equal    ${a}    i

Read Character 4
    ${a} =    Find Nth Character    ${state}    2
    Log    ${a}
    Should Be Equal    ${a}    r

*** Keywords ***
Find Nth Character
    [ARGUMENTS]    ${text}    ${n}
    @{characters} =    Split String To Characters    ${text}
    RETURN    ${characters}[${n}]

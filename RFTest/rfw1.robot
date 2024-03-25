*** Settings ***
Library    String

*** Variables ***
${state}    Virginia
${num}    ${3}

*** Test Cases ***
First Case
    Call this

Second Case
    Call that

*** Keywords ***
Call this
    Fail    Hello World

Call that
    Log    I passed!
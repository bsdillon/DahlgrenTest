*** Settings ***
Library    String

*** Variables ***
${state}    Virginia
${num}    ${3}

*** Test Cases ***
Dummy Case
    Call this

*** Keywords ***
Call this
    Fail    Hello World

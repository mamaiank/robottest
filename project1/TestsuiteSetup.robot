*** Settings ***
Suite Setup       Log To Console    Test Suite Start
Suite Teardown    Log To Console    Test Suite Complete

*** Test Cases ***
testlogin
    Open Browser    https://opensource-demo.orangehrmlive.com/    firefox
    Input Text    id=txtUsername    Admin
    Input Password    id=txtPassword    admin123
    Click Button    id=btnLogin

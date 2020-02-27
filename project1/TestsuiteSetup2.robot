*** Settings ***
Suite Setup       Open Browser    https://opensource-demo.orangehrmlive.com/    chrome
Library           SeleniumLibrary

*** Test Cases ***
testlogin
    Input Text    id=txtUsername    Admin
    Input Password    id=txtPassword    admin123
    Click Button    id=btnLogin

*** Settings ***
Suite Setup       GoToHomePage
Library           SeleniumLibrary

*** Variables ***
${url}            https://opensource-demo.orangehrmlive.com/

*** Test Cases ***
testlogin
    Input Text    id=txtUsername    Admin
    Input Password    id=txtPassword    admin123
    Click Button    id=btnLogin

*** Keywords ***
GoToHomePage
    Open Browser    ${url}    chrome

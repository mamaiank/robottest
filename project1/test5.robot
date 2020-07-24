*** Settings ***
Library     ExcelLibrary
Library     Collections

*** Variables ***
${DataTable}            ../Resource/datatest.xlsx
${sheetName}            Data_Test
${testcaseName}         TC01
${function}             adddecrease


*** Test Cases ***
LoginADMIN
    Open Browser    ${urlLogin}  ${browser}  alias=tabAdmin
    Maximize browser Window
    Input Text  id=inputEmail   ${usernameAdmin}
    Input Text  id=inputPassword    ${passwordAdmin}
    Click Button    id=btn-signin
    Wait Spinner Load
    Wait Until Element Is Visible   //div[@class="table-responsive tableFixHeadImcon"]//tbody//tr   30
    ${count} =	Get Element Count	//div[@class="table-responsive tableFixHeadImcon"]//tbody//tr
    Log To Console      \nCount tr = ${count}
    Scroll Element Into View    //div[@class="table-responsive tableFixHeadImcon"]//tbody//tr[${count}]
    # Close Browser

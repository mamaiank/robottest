*** Settings ***
Library     ExcelLibrary
Library     Collections
Library     OperatingSystem  
Library     common.py

*** Variables ***
${DataTable}            ../Resource/datatest.xlsx
${sheetName}            Data_Test
${testcaseName}         TC54
${function}             newcombination


*** Test Cases ***
LoginADMIN
    Open Browser    ${urlLogin}  ${browser}  alias=tabAdmin
    Input Text  id=inputEmail   ${usernameAdmin}
    Input Text  id=inputPassword    ${passwordAdmin}
    Click Button    id=btn-signin
    Wait Spinner Load
    Go To   ${urlMap}
    Set Selenium speed  0.3
    Wait Until Element Is Visible   //ng-select[@name="SQGroup"]//input     30
    Input Text      //ng-select[@name="SQGroup"]//input   PlastFilm
    Click Element   (//div[@class="ng-dropdown-panel-items scroll-host"]//div[contains(@class,"ng-option")])[1]
    Sleep   2
    Wait Until Element Is Visible   (//div[@class="resultCard col-md-6"][2]//div[@class="resultCard col-md-12"][1])     30
    ${js}        Get File              ../Resource/drag-n-drop.js
    Execute Javascript    ${js}; return DragNDropByPath("//div[@class='resultCard col-md-6'][2]//div[@class='resultCard col-md-12'][1]", "//div[@class='bigCard row']//div[@class='resultCard col-md-6'][1]");
    Execute Javascript    ${js}; return DragNDropByPath("//div[@class='resultCard col-md-6'][2]//div[@class='resultCard col-md-12'][1]", "//div[@class='bigCard row']//div[@class='resultCard col-md-6'][1]");
    Execute Javascript    ${js}; return DragNDropByPath("//div[@class='resultCard col-md-6'][2]//div[@class='resultCard col-md-12'][1]", "//div[@class='bigCard row']//div[@class='resultCard col-md-6'][1]");

    # Close Browser
         # Drag And Drop                   
    # //div[@class="resultCard col-md-6"][2]//div[@class="resultCard col-md-12"][2]   
    # //div[@class="bigCard row"]//div[@class="resultCard col-md-6"][1]
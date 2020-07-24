*** Settings ***
Library     ExcelLibrary
Library     Collections

*** Variables ***
${DataTable}            ../Resource/datatest.xlsx
${sheetName}            Data_Test
${testcaseName}         Test09
${function}             Test_Calendar

*** Test Cases ***
Test Click Calendar Month
   ${data_month}=           get month only
   ${get_row_month}=        get row month calendar          ${data_month}
   ${get_column_month}=     get column month calendar       ${data_month}      ${get_row_month}
   OpenBrowserDMO
   Go To    https://domain.co/priceTableUpload
   Wait Spinner Load
   Wait Until Element Is Visible   //input[@name="shipmentMonth"]   30
   Click Element    //input[@name="shipmentMonth"]
   Click Element    //table[@class="months"]//tr[${get_row_month}]//td[${get_column_month}]


*** Settings ***
Library     Selenium2Library
Library     Collections
Library     common.py

*** Variables ***
${DataTable}            ../Resource/datatest.xlsx
${sheetName}            Data_Test
${testcaseName}         TC01

# *** Keywords ***
# Get Month Many
#     [Arguments]     ${start}=0    ${count}=1
#     ${data_date}=    Set Variable    ${EMPTY}
#     ${count}=  Run Keyword If  ${count} < 1   Set Variable      1
#     ...  ELSE  Set Variable  ${count}
#     FOR     ${ELEMENT}      IN RANGE    0      ${count}
#     # 
#     ${addmonth}=    Evaluate     ${start}+${ELEMENT}
#     ${get_date}=    get month       ${addmonth}
#     ${get_date} =    Run Keyword If    ${ELEMENT} == 0
#     ...  Set variable    ${get_date}
#     ...  ELSE    
#     ...  Set variable    ,${get_date}
#     ${data_date}=    Set Variable    ${data_date}${get_date}
#     # 
#     END
#     [Return]    ${data_date}

*** Test Cases ***
Test Date
    Log To Console      \n
    ${datatest}=  get data test case    ${DataTable}    ${sheetName}     ${testcaseName}
    &{search_parm}=       Set Variable    ${datatest}[Data Test][search]
    ${res}=    get month       -5    12
    # Log To Console      \n${res}
    Set To Dictionary  ${search_parm}  period  ${res}
    Log To Console      \n${search_parm}

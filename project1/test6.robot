*** Settings ***
Library     ExcelLibrary
Library     Collections

*** Variables ***
${DataTable}            ../Resource/datatest.xlsx
${Connect_String}       Driver={SQL Server Native Client 11.0}; server=database.windows.net,1433;database=dbnaME;uid=USER; pwd=ps;

${sheetName}            Month_End
${testcaseName}         Monthend1
${sheetName2}            Data_Test
${testcaseName2}         TC50

*** Test Cases ***
GET DATA TEST
    ${datatest}=  get data test case    ${DataTable}    ${sheetName}     ${testcaseName}
    Log To Console      \ndatatest: ${datatest}
    ${datatest2}=  get data test case    ${DataTable}    ${sheetName2}     ${testcaseName2}
    Log To Console      \ndatatest2: ${datatest2}
    # ${sq_ty}=       Set Variable    ${datatest}[sq_ty]
    # Log To Console      \nsq_ty: ${sq_ty}
    # ${chnl_cd}=       Set Variable    ${datatest}[chnl_cd]
    # Log To Console      \nchnl_cd: ${chnl_cd}
    # ${rgn_cd}=       Set Variable    ${datatest}[rgn_cd]
    # Log To Console      \nrgn_cd: ${rgn_cd}
    # ${sls_grp_cd}=       Set Variable    ${datatest}[sls_grp_cd]
    # Log To Console      \nsls_grp_cd: ${sls_grp_cd}
    # ${cust_cd}=       Set Variable    ${datatest}[cust_cd]
    # Log To Console      \ncust_cd: ${cust_cd}
    # ${mat_cd}=       Set Variable    ${datatest}[mat_cd]
    # Log To Console      \nmat_cd: ${mat_cd}
    # ${mth_cd}=       Set Variable    ${datatest}[mth_cd]
    # Log To Console      \nmth_cd: ${mth_cd}
    # ${init_vol}=       Set Variable    ${datatest}[init_vol]
    # Log To Console      \ninit_vol: ${init_vol}

    # Log To Console      \nConnect_String: ${Connect_String}
    # ${ datatest }=  get data test case   ${ DataTable }     ${ sheetName }  ${ testcaseName } 
    # &{params}=  Create Dictionary   sq_ty='MIN'     chnl_cd='10'    rgn_cd='TH'     sls_grp_cd='G51'    cust_cd='0000000011'    mat_cd='Z10D777CFZ0750P'    mth_cd='2020-10'    init_vol='19' 
    # ${ output }=    insert sq sql   ${ Connect_String }     &{ params } 
    # Log To Console ${ output }

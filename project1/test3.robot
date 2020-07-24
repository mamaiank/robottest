*** Settings ***
Library     Selenium2Library
Library     DatabaseLibrary

*** Variables ***
${DBHost}         ip
${DBUser}         user
${DBPass}         pass
${DBPort}         1433
${DBNAME}         HBG_SALES

*** Test Cases ***
Test Database
    Log To Console      \n
    Connect To Database Using Custom Params      pymssql    database='${DBNAME}', user='${DBUser}', password='${DBPass}', host='${DBHost}', port=${DBPort}
    # ${output} =    QUERY      SELECT PlanID, PlanTypeID FROM [HBG_SALES].[dbo].[St_SalePlan];     #command text
    # ${output} =    QUERY      SELECT * FROM [HBG_BASE].[dbo].[Bv3_Emp_Team];                      #command view
    # ${output} =    QUERY      exec [HBG_BASE].[dbo].[Bs3_Ampor_Get] '','',0,0,'',1,''             #command stored procedure
    # ${output} =    Execute Sql String       INSERT INTO [HBG_SALES].[dbo].[St_SalePlan] (CustomerID, PlanTypeID, EMP_ID, Team_ID, RecDate, UpdDate) VALUES (1,1,1,1,GETDATE(), GETDATE());             #command stored procedure
    # Log To Console      ${output}
    # Log To Console      ${output[0]}
    # Log To Console      ${output[1]}
    # Log To Console      ${output[2]}
*** Settings ***
Library     Selenium2Library
Library    RequestsLibrary

*** Variables ***
${URL_GET}    https://api.test.co.th
${akey}    aKeyTest
${token}    jwtToken

*** Keywords ***
Get API TEST
    # ${checkOption}=         Create List         
    # ${headerInfo_data}=     Create Dictionary   channelCode=30   closingTime=${EMPTY}    companyCode=0480  customerCode=0000007651   messageId={{$guid}}  regionCode=CH  salesCoName=Boom   sourceSystem=SDFC_CHEM_DEV  transactionId=INQ01_C2   transactionNumber=INQ01_C2  transactionStatus=Requested    transactionType=INQ   transactionCreatedDate=159227293 
    # ${itemInfo_data}=       Create Dictionary   itemId=01  checkPriority=2  sqType=MIN  itemStatus=Requested  salesGroupCode=GB1  loadDate=2020/06/16  materialCode=Z103982PNZ0025P  checkDate=1592272932  checkOption=${checkOption}
    # ${checkOption_data}=    Create Dictionary   optionCode=Check_Type   optionValue=CHCK_RSRV          
    # Append To List	        ${checkOption}      ${checkOption_data}
    # ${checkOption_data}=    Create Dictionary   optionCode=BiddingBySQGrp   optionValue=N          
    # Append To List	        ${checkOption}      ${checkOption_data}
    # ${checkOption_data}=    Create Dictionary   optionCode=MIN_By_SQ_Grp   optionValue=Y          
    # Append To List	        ${checkOption}      ${checkOption_data}
    # ${checkOption_data}=    Create Dictionary   optionCode=ByPassMinCust   optionValue=Y          
    # Append To List	        ${checkOption}      ${checkOption_data}
    # ${checkOption_data}=    Create Dictionary   optionCode=ByPassPrice   optionValue=N          
    # Append To List	        ${checkOption}      ${checkOption_data}
    # ${itemInfo}=            Create List         ${itemInfo_data}
    # ${body_json}=           Create Dictionary   headerInfo=${headerInfo_data}     itemInfo=${itemInfo_data}
    # Log To Console      ${body_json}

    # ${json_string}=    catenate
    # ...  {
    # ...      "headerInfo": {
    # ...        "channelCode": "30",
    # ...        "closingTime": "",
    # ...        "companyCode": "0480",
    # ...        "customerCode": "0000007651",
    # ...        "messageId": "{{$guid}}",
    # ...        "regionCode": "CH",
    # ...        "salesCoName": "Boom",
    # ...        "sourceSystem": "SDFC_CHEM_DEV",
    # ...        "transactionId": "INQ01_C2",
    # ...        "transactionNumber": "INQ01_C2",
    # ...        "transactionStatus": "Requested",
    # ...        "transactionType": "INQ",
    # ...        "transactionCreatedDate": "1592272932"
    # ...      },
    # ...      "itemInfo": [
    # ...        {
    # ...          "itemId": "01",
    # ...          "checkPriority": "2",
    # ...          "sqType": "MIN",
    # ...          "itemStatus": "Requested",
    # ...          "salesGroupCode": "GB1",
    # ...          "loadDate": "2020/06/16",
    # ...          "materialCode": "Z103982PNZ0025P",
    # ...          "checkDate": "1592272932",
    # ...          "checkOption": [
    # ...            {
    # ...              "optionCode": "Check_Type",
    # ...              "optionValue": "CHCK_RSRV"
    # ...            },
    # ...            {
    # ...              "optionCode": "BiddingBySQGrp",
    # ...              "optionValue": "N"
    # ...            },
    # ...            {
    # ...              "optionCode": "MIN_By_SQ_Grp",
    # ...              "optionValue": "Y"
    # ...            },
    # ...            {
    # ...              "optionCode": "ByPassMinCust",
    # ...              "optionValue": "Y"
    # ...            },
    # ...            {
    # ...              "optionCode": "ByPassPrice",
    # ...              "optionValue": "N"
    # ...            }        
    # ...          ],
    # ...          "itemCreatedBy": "tanapolt",
    # ...          "itemCreatedDate": "1592272932",
    # ...          "itemNumber": "01",
    # ...          "itemUpdatedBy": "Boom",
    # ...          "itemUpdatedDate": "1592272932",
    # ...          "oldInquiry": [
    # ...            {
    # ...              "oldInquiryId": "",
    # ...              "oldInquiryItemId": ""
    # ...            }
    # ...          ],
    # ...          "price": [
    # ...            {
    # ...              "amount": 1150,
    # ...              "price_currency": "USD/TON",
    # ...              "name": "fob"
    # ...            }
    # ...          ],
    # ...          "quantity": {
    # ...            "giQuantity": 0,
    # ...            "requestQuantity": 999999,
    # ...            "unit": "TON"
    # ...          },
    # ...          "relationship": [
    # ...            {
    # ...              "refTransactionId": "",
    # ...              "refTransactionItemId": ""
    # ...            }
    # ...          ],      
    # ...          "shipToCode": "0000007651",
    # ...          "soldToCode": "0000007651",
    # ...          "etd": "2020/06/30"
    # ...        }
    # ...      ]
    # ...  }
    # &{json}=             evaluate        json.loads('${json_string}')    json
    # log to console       \nNew JSON headerInfo:\n${json['headerInfo']}
    # log to console       \nNew JSON itemInfo:\n${json['itemInfo']}
    # log to console       \nNew JSON itemInfo-0-checkOption:\n${json['itemInfo'][0]['checkOption']}

    &{headers} =     Create Dictionary    aKeys=${akey}     token=${token}      Authorization=Bearer 1234   #สร้างตัวแปร header
    Create Session    TestApi    ${URL_GET}     headers=${headers}  #ตั้งค่า Url
    ${resp}=    Get Request    TestApi    /crm/api/saleplan?Team_ID=310&EMP_ID=584  #ยิง service
    # Should Contain  ${resp.text}    200  # เช็คว่า OK หรือ 200 ไหม
    Should Contain  ${resp.text}    OK  # เช็คว่า OK หรือ 200 ไหม
    ${resultJson}=     To Json    ${resp.content}   #แปลง content จาก text ให้เป็น JSON
    &{result}=    Convert To Dictionary    ${resultJson['DataResult']}  #แปลง content จาก JSON ให้เป็น DICTIONARY
    Log To Console     ${result}    # แสดง content

PUT API TEST
    &{headers} =     Create Dictionary    aKeys=${akey}     token=${token}      Authorization=Bearer 1234   Content-Type=application/x-www-form-urlencoded
    Create Session    TestApi    ${URL_GET}     headers=${headers}
    &{data}=    Create Dictionary    PlanTypeID=3   EMP_ID=584  Team_ID=310     CustomerID=14092
    ${resp}=    PUT Request     TestApi     /crm/api/saleplan/12    data=${data}
    Log     ${resp.text}
    ${resultJson}=     To Json    ${resp.content}
    Log To Console     ${resultJson}
    Should Contain  ${resp.text}    OK

POST API TEST
    &{headers} =     Create Dictionary    aKeys=${akey}     token=${token}      Authorization=Bearer 1234   Content-Type=application/x-www-form-urlencoded
    Create Session    TestApi    ${URL_GET}     headers=${headers}
    &{data}=    Create Dictionary    PlanTypeID=3   EMP_ID=584  Team_ID=310     CustomerID=14092
    ${resp}=    PUT Request     TestApi     /crm/api/saleplan    data=${data}
    Log     ${resp.text}
    ${resultJson}=     To Json    ${resp.content}
    Log To Console     ${resultJson}
    Should Contain  ${resp.text}    OK

DELETE API TEST
    &{headers} =     Create Dictionary    aKeys=${akey}     token=${token}      Authorization=Bearer 1234   Content-Type=application/x-www-form-urlencoded
    Create Session    TestApi    ${URL_GET}     headers=${headers}
    ${resp}= DELETE Request    TestApi    /crm/api/saleplan/57
    Log     ${resp.text}
    ${resultJson}=     To Json    ${resp.content}
    Log To Console     ${resultJson}
    Should Contain  ${resp.text}    OK

*** Test Cases ***
Test API
   Get API TEST
    # PUT API TEST
    # POST API TEST
    # DELETE API TEST


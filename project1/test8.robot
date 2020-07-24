*** Settings ***
Library     Selenium2Library
Library    RequestsLibrary
Library     ../Resource/common.py
Library     Collections

*** Variables ***
${URL_GET}    https://api.test.co.th
${akey}    aKeyTest
${token}    jwtToken

*** Keywords ***
Get API TEST
    ${get_today}=    get today
    ${get_today_timestamp}=    get today timestamp
    ${json_string}=    catenate
    ...  {
    ...      "headerInfo": {
    ...        "channelCode": "30",
    ...        "closingTime": "",
    ...        "companyCode": "0480",
    ...        "customerCode": "0000007651",
    ...        "messageId": "{{$guid}}",
    ...        "regionCode": "CH",
    ...        "salesCoName": "Boom",
    ...        "sourceSystem": "SDFC_CHEM_DEV",
    ...        "transactionId": "INQ01_C2",
    ...        "transactionNumber": "INQ01_C2",
    ...        "transactionStatus": "Requested",
    ...        "transactionType": "INQ",
    ...        "transactionCreatedDate": "${get_today_timestamp}"
    ...      },
    ...      "itemInfo": [
    ...        {
    ...          "itemId": "01",
    ...          "checkPriority": "2",
    ...          "sqType": "MIN",
    ...          "itemStatus": "Requested",
    ...          "salesGroupCode": "GB1",
    ...          "loadDate": "${get_today}",
    ...          "materialCode": "Z103982PNZ0025P",
    ...          "checkDate": "1592272932",
    ...          "checkOption": [
    ...            {
    ...              "optionCode": "Check_Type",
    ...              "optionValue": "CHCK_RSRV"
    ...            },
    ...            {
    ...              "optionCode": "BiddingBySQGrp",
    ...              "optionValue": "N"
    ...            },
    ...            {
    ...              "optionCode": "MIN_By_SQ_Grp",
    ...              "optionValue": "Y"
    ...            },
    ...            {
    ...              "optionCode": "ByPassMinCust",
    ...              "optionValue": "Y"
    ...            },
    ...            {
    ...              "optionCode": "ByPassPrice",
    ...              "optionValue": "N"
    ...            }        
    ...          ],
    ...          "itemCreatedBy": "tanapolt",
    ...          "itemCreatedDate": "1592272932",
    ...          "itemNumber": "01",
    ...          "itemUpdatedBy": "Boom",
    ...          "itemUpdatedDate": "1592272932",
    ...          "oldInquiry": [
    ...            {
    ...              "oldInquiryId": "",
    ...              "oldInquiryItemId": ""
    ...            }
    ...          ],
    ...          "price": [
    ...            {
    ...              "amount": 1150,
    ...              "price_currency": "USD/TON",
    ...              "name": "fob"
    ...            }
    ...          ],
    ...          "quantity": {
    ...            "giQuantity": 0,
    ...            "requestQuantity": 999999,
    ...            "unit": "TON"
    ...          },
    ...          "relationship": [
    ...            {
    ...              "refTransactionId": "",
    ...              "refTransactionItemId": ""
    ...            }
    ...          ],      
    ...          "shipToCode": "0000007651",
    ...          "soldToCode": "0000007651",
    ...          "etd": "2020/06/30"
    ...        }
    ...      ]
    ...  }
    &{json}=             evaluate        json.loads('${json_string}')    json
    Log To Console  \n${json['headerInfo']['channelCode']}
    Set To Dictionary  ${json['headerInfo']}  channelCode  asd
    Log To Console  \n${json['headerInfo']['channelCode']}

*** Test Cases ***
Test API
   Get API TEST
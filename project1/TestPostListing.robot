*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
typeCondoSell
    Open Browser    http://localhost:3000/%E0%B8%A5%E0%B8%87%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%81%E0%B8%B2%E0%B8%A8    gc
    Set Browser Implicit Wait    5
    SeleniumLibrary.Input Text    //input[@aria-label="Username"]    as
    Sleep    1
    Click Element    //*[@class="result-parent"]
    Select From List By Index    //select[@class="form-control"][1]    1
    Click Element    //button[@class="btn-submit"]
    Comment    Select From List By Label    id=day    11
    Comment    Select From List By Index    //select[@class="form-control"][2]    1
    Comment    Select From List By Index    //select[@class="form-control"][3]    1
    Comment    Select From List By Value    id=year    1994
    SeleniumLibrary.Input Text    //textarea[@class="form-control"][1]    a1
    SeleniumLibrary.Input Text    //input[@id="formNumberRef"]    22
    SeleniumLibrary.Input Text    //input[@placeholder="ราคาขาย (บาท)"]    33
    SeleniumLibrary.Input Text    //input[@placeholder="ตารางเมตร"]    44
    SeleniumLibrary.Input Text    //input[@placeholder="ค่าส่วนกลาง (บาท/เดือน)"]    55
    SeleniumLibrary.Input Text    //input[@placeholder="ปีละ (บาท/ปี)"]    66
    Click Element    //button[@class="btn-submit"][2]
    SeleniumLibrary.Input Text    (//textarea[@class="form-control"])[2]    a2
    SeleniumLibrary.Input Text    (//textarea[@class="form-control"])[3]    a3
    Click Element    (//div[@class="step-3-section-1-child row"]//button[contains(@class,'btn-block')])[2]
    Click Element    //button[@class="btn-submit"][2]
    Comment    Input Text    (//input[@type="file"])[1]    C:\\Users\\nookcs\\Downloads\\SE1.png
    Choose File    (//span[@class="ant-upload"])[1]    \\Users\\nookcs\\Downloads\\SE1.png

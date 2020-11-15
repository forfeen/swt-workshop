*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
Test post status on Facebook
    Open browser facebook.com
    Type User name
    Type Password
    Press ENTER
    Click create post
    Type 'สวัสดี robotframework'
    Click post

*** Keywords ***
Open browser facebook.com
    ${options}=    Evaluate  sys.modules['selenium.webdriver.chrome.options'].Options()    sys
    Call Method     ${options}    add_argument    --disable-notifications
    Open Browser    https://www.facebook.com/    chrome    options=${options}

Type Username
    Input Text    name:email    

Type Password
    Input Text    name:pass    

Press ENTER
    Press Keys    None    RETURN    
    Wait Until Page Contains    Fin Chananya    100

Click create post
    Click Element    xpath://div[@class='m9osqain a5q79mjw jm1wdb64 k4urcfbm']/span[@class='a8c37x1j ni8dbmo4 stjgntxs l9j0dhe7']

Type 'สวัสดี robotframework'
    Wait Until Page Contains    Add to Your Post    100
    Press Keys    None    สวัสดีrobotframework

Click post
    Click Element    xpath://*[@id="mount_0_0"]/div/div[1]/div[1]/div[4]/div/div/div[1]/div/div[2]/div/div/div/form/div/div[1]/div/div/div[3]/div[2]/div
    
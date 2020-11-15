*** Settings ***
Library    SeleniumLibrary

*** Variables ***      

*** Test Cases ***
Test search keyword and verify search result on Google
    พิมพ์ google.com
    พิมพ์คำค้น USElection2020
    กด Enter
    ตรวจสอบ US Election 2020 - BBC News

*** Keywords ***
พิมพ์ google.com
    Open Browser    https://www.google.com    chrome

พิมพ์คำค้น USElection2020
    Input Text    name:q    USElection2020

กด Enter
    Press Keys    None    RETURN

ตรวจสอบ US Election 2020 - BBC News
    Wait Until Page Contains    US Election 2020 - BBC News

เลือก US Election 2020 - BBC News
    Click Link    https://www.bbc.com/news/election/us2020
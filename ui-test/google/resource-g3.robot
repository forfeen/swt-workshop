*** Keywords ***
พิมพ์ google.com
    Open Browser    ${URL}    ${BROWSER}

พิมพ์คำค้น 
    Input Text    name:q    ${KEYWORD}

กด Enter
    Press Keys    None    RETURN

ตรวจสอบผลการค้นหา
    Wait Until Page Contains    ${EXPECTED_RESULT}

เลือก US Election 2020 - BBC News
    Click Link    https://www.bbc.com/news/election/us2020
    Close Browser

*** Variables ***
${URL}    https://www.google.com
${BROWSER}    chrome
${KEYWORD}    USElection2020
${EXPECTED_RESULT}    US Election 2020 - BBC News
*** Settings ***
Resource    ../resources/api_keywords.resource
Suite Setup    Start Session
Suite Teardown    End Session
*** Test Cases ***
Test Case 04 - Päivitetään olemassaoleva postaus
    [Documentation]    Testataan, että olemassaolevaa postausta voidaan päivittää onnistuneesti.
    ${post_id}=    Set Variable    1
    ${payload}=    Create Dictionary    id=${post_id}    title=Päivitetty otsikko    body=Päivitetty sisältö    userId=1
    ${resp}=    PUT On Session    ${SESSION}    /posts/${post_id}    json=${payload}
    Status Should Be    ${resp}    200
    Log    Postaus päivitetty onnistuneesti. Vastaus: ${resp.text}
    Should Contain    ${resp.text}    "title": "Päivitetty otsikko"
    Should Contain    ${resp.text}    "body": "Päivitetty sisältö"
    Should Contain    ${resp.text}    "userId": "1"
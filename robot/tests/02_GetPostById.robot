*** Settings ***
Resource    ../resources/api_keywords.resource
Suite Setup    Start Session
Suite Teardown    End Session
*** Test Cases ***
Test Case 02 - Hae postaus ID:llä
    ${resp}=    GET    /posts/1
    Status Should Be    ${resp}    200
    Log    Postaus ID:llä 1 haettu onnistuneesti. Vastaus: ${resp.text}
    Should Contain    ${resp.text}    "id": 1
    Should Contain    ${resp.text}    "userId": 1
    Should Contain    ${resp.text}    title
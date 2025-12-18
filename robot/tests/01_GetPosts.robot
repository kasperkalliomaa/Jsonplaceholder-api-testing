*** Settings ***
Resource    ../resources/api_keywords.resource
Suite Setup    Start Session
Suite Teardown    End Session    
*** Test Cases ***
Test Case 01 - Hae kaikki postaukset
    [Documentation]    Testataan, että kaikki postaukset saadaan haettua onnistuneesti.
    ${resp}=    GET    /posts
    Status Should Be    ${resp}    200
    Log    Kaikki postaukset haettu onnistuneesti. Vastaus: ${resp.text}
    Should Contain    ${resp.text}    userId
    Should Contain    ${resp.text}    title
    Should Contain    ${resp.text}    body
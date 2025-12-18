*** Settings ***
Resource    ../resources/api_keywords.resource
Suite Setup    Start Session
Suite Teardown    End Session
*** Test Cases ***
Test Case 03 - Luodaan uusi postaus
    [Documentation]    Testataan, että uusi postaus voidaan luoda onnistuneesti.
    ${payload}=    Create Dictionary    title=Testausta    body=Testisisältöä    userId=3
    ${resp}=    POST On Session    ${SESSION}    /posts    json=${payload}
    Status Should Be    ${resp}    201
    Log    Uusi postaus luotu onnistuneesti. Vastaus: ${resp.text}
    Should Contain    ${resp.text}    "title": "Testausta"
    Should Contain    ${resp.text}    "body": "Testisisältöä"
    Should Contain    ${resp.text}    "userId": "3"
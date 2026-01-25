*** Settings ***
Resource    ../resources/api_keywords.resource
Suite Setup    Start Session
Suite Teardown    End Session
*** Test Cases ***
Test Case 06 - Poistetaan postaus
    [Documentation]    Testataan, että postaus voidaan poistaa onnistuneesti.
    ${post_id}=    Set Variable    1

    ${resp}=    DELETE On Session    ${SESSION}    /posts/${post_id}
    Status Should Be    ${resp}    200

    Log    Postaus poistettu onnistuneesti. Vastaus: ${resp.text}

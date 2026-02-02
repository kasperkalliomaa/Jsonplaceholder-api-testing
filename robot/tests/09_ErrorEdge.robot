*** Settings ***
Resource    ../resources/api_keywords.resource
Suite Setup    Start Session
Suite Teardown    End Session
*** Test Cases ***
Test Case 09a - Haetaan olematonta postausta
    [Documentation]    Testataan, että olematonta postausta haettaessa saadaan virhe ilmoitus tai tyhjä vastaus.
    ${post_id}=    Set Variable    9999
    ${resp}=    Get On Session    ${SESSION}    /posts/${post_id}    expected_status=anything
    ${status}=    Set Variable    ${resp.status_code}
    Run Keyword If    ${status} == 404    Log    OK: 404 virheilmoitus saatiin.
    ...    ELSE IF    ${status} == 200    Should Be Equal As Strings    ${resp.text}    {}
    ...    ELSE    Fail    Odotettiin 404 tai 200 + {}, mutta saatiin ${status}. Vastaus: ${resp.text}


Test Case 09b - Virheellinen POST-pyyntö
    [Documentation]    Testataan ettei API kaadu virheellisestä POST-pyynnöstä.
    ${payload}=    Create Dictionary    foo=bar
    ${resp}=    Post On Session    ${SESSION}    /WRONG_endpoint    json=${payload}    expected_status=anything
    ${status}=    Set Variable    ${resp.status_code}
    Should Be True    ${status} >= 400


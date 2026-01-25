*** Settings ***
Resource    ../resources/api_keywords.resource
Suite Setup    Start Session
Suite Teardown    End Session
*** Test Cases ***
Test Case 05 - Päivitetään postauksen otsikko Patchilla
    [Documentation]    Testataan, että postauksen otsikko voidaan päivittää onnistuneesti Patch-pyynnöllä.
    ${post_id}=    Set Variable    1

    ${payload}=    Create Dictionary    title=Osittain päivitetty otsikko

    ${resp}=    PATCH API    /posts/${post_id}    ${payload}
    Status Should Be    ${resp}    200

    Log    Postauksen otsikko päivitetty onnistuneesti Patchilla. Vastaus: ${resp.text}

    Should Contain    ${resp.text}    "title": "Osittain päivitetty otsikko"
    Should Contain    ${resp.text}    "id": 1
    Should Contain    ${resp.text}    "userId"
    Should Contain    ${resp.text}    "body"
*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    BuiltIn
*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com
${SESSION}    jsonph
${TIMEOUT}    30
*** Keywords ***
Start Session
    [Documentation]    Aloittaa HTTP-istunnon JSONPlacceholder apiin
    Create Session    ${SESSION}    ${BASE_URL}    timeout=${TIMEOUT}
End Session
    [Documentation]    Lopettaa HTTP-istunnon
    Delete All Sessions
Status Should Be
    [Arguments]    ${resp}    ${expected}
    Should Be Equal As Integers    ${resp.status_code}    ${expected}
GET
    [Arguments]    ${path}
    ${resp}=    GET On Session    ${SESSION}    ${path}
    RETURN    ${resp}
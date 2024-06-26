*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/variables.robot

*** Variables ***


*** Keywords ***
Begin Web Test
    Open browser    about:blank    ${BROWSER}
    Maximize Browser Window

End Web Test
    Close all browsers
    
Verify URL
    [Arguments]    ${expected_url}
    ${current_url}    Get Location
    Should Be Equal As Strings    ${current_url}    ${expected_url}

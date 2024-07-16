*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/variables.robot
Resource    ../Resources/Login.robot


*** Keywords ***
Begin Web Test
    Open browser    about:blank    ${BROWSER}
    Maximize Browser Window

Begin Web Test As Logged In User
    Begin Web Test
    Login.Go to Item List Page As Logged In User

End Web Test
    Close all browsers
    
Verify URL
    [Arguments]    ${expected_url}
    ${current_url}    Get Location
    Should Be Equal As Strings    ${current_url}    ${expected_url}

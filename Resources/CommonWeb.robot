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
    Login.Go To Item List Page As Logged In User

End Web Test
    Close all browsers

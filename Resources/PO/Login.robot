*** Settings ***
Library    SeleniumLibrary
Resource    ../variables.robot

*** Variables ***
${LOGIN_BUTTON}      id=login-button
${USERNAME_FIELD}    id=user-name
${PASSWORD_FIELD}    id=password

*** Keywords ***
Navigate To
    Go to    ${URL}

Verify Page Loaded
    Wait until page contains element    ${LOGIN_BUTTON}
    
Fill in "username" field
    [Arguments]    ${username}
    Input Text    ${USERNAME_FIELD}    ${USERNAME}
    
Fill in "password" field
    [Arguments]    ${password}
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD}
    
Click "Login" button
    Click Button    ${LOGIN_BUTTON}

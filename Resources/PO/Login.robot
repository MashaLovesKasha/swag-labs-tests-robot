*** Settings ***
Library     SeleniumLibrary
Resource    ../variables.robot

*** Variables ***
# I could use data-test attribute here, but it works easier with id
${LOGIN_BUTTON}      id=login-button
${USERNAME_FIELD}    id=user-name
${PASSWORD_FIELD}    id=password

*** Keywords ***
Navigate To
    Go to    ${URL}

Verify Page Loaded
    Wait until page contains element    ${LOGIN_BUTTON}
    
Fill In "Username" Field
    [Arguments]    ${username}
    Input Text    ${USERNAME_FIELD}    ${USERNAME}
    
Fill In "Password" Field
    [Arguments]    ${password}
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD}
    
Click "Login" Button
    Click Button    ${LOGIN_BUTTON}

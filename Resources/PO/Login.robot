*** Settings ***
Library     SeleniumLibrary
Resource    ../variables.robot

*** Variables ***
${LOGIN_BUTTON}      //*[@data-test="login-button"]
${USERNAME_FIELD}    //*[@data-test="username"]
${PASSWORD_FIELD}    //*[@data-test="password"]

*** Keywords ***
Navigate To
    Go to    ${URL}

Verify Page Loaded
    Wait until page contains element    ${LOGIN_BUTTON}
    
Fill In "Username" Field
    [Arguments]    ${username}
    Input Text     ${USERNAME_FIELD}    ${USERNAME}
    
Fill In "Password" Field
    [Arguments]    ${password}
    Input Text     ${PASSWORD_FIELD}    ${PASSWORD}
    
Click "Login" Button
    Click Button    ${LOGIN_BUTTON}

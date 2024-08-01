*** Settings ***
Resource    ../Resources/Login.robot
Resource    ../Resources/CommonWeb.robot
Resource    ../Resources/variables.robot

Test Setup       CommonWeb.Begin Web Test
Test Teardown    CommonWeb.End Web Test

*** Variables ***
${ERROR_MESSAGE}    Epic sadface: Sorry, this user has been locked out.

*** Test Cases ***
User successfully logged in
    [Tags]    login    success
    Login.Navigate
    Login.Standard User
    Location Should Be    ${ITEM_LIST_URL}

User is locked out from the platform
    [Tags]    login    failure
    Login.Navigate
    Login.Locked Out User
    Page Should Contain    ${ERROR_MESSAGE}

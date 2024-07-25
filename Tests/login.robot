*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Login.robot
Resource    ../Resources/CommonWeb.robot

Test Setup       CommonWeb.Begin Web Test
Test Teardown    CommonWeb.End Web Test

*** Test Cases ***
User successfully logged in
    Login.Go To Login Page
    Login.Log In    ${STANDARD_USERNAME}    ${PASSWORD}
    Location Should Be    ${URL}/inventory.html

User is locked out from the platform
    Login.Go To Login Page
    Login.Log In    ${LOCKED_OUT_USERNAME}    ${PASSWORD}
    Page Should Contain    Epic sadface: Sorry, this user has been locked out.

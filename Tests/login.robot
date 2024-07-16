*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Login.robot
Resource    ../Resources/CommonWeb.robot
Resource    ../Resources/variables.robot

Test Setup       Begin Web Test
Test Teardown    End Web Test
Suite Setup      Set Selenium Speed    0.5s


*** Test Cases ***
User successfully logged in
    Login.Go to Login Page
    Login.Log in    ${STANDARD_USERNAME}    ${PASSWORD}
    Verify URL    ${URL}/inventory.html

User is locked out from the platform
    Login.Go to Login Page
    Login.Log in    ${LOCKED_OUT_USERNAME}    ${PASSWORD}
    Page Should Contain    Epic sadface: Sorry, this user has been locked out.

*** Settings ***
Resource    ./PO/Login.robot

*** Variables ***


*** Keywords ***
Go to Login Page
    Login.Navigate To
    Login.Verify Page Loaded

Log in
    [Arguments]    ${username}    ${password}
    Login.Fill in "username" field    ${username}
    Login.Fill in "password" field    ${password}
    Login.Click "Login" button

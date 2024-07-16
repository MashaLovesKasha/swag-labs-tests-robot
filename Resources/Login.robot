*** Settings ***
Resource    ./PO/Login.robot
Resource    ./PO/ItemList.robot
Resource    ./CommonWeb.robot


*** Keywords ***
Go to Login Page
    Login.Navigate To
    Login.Verify Page Loaded

Log in
    [Arguments]    ${username}    ${password}
    Login.Fill in "username" field    ${username}
    Login.Fill in "password" field    ${password}
    Login.Click "Login" button

Go to Item List Page As Logged In User
    Login.Go to Login Page
    Login.Log in     ${STANDARD_USERNAME}     ${PASSWORD}
    Verify URL     ${URL}/inventory.html
    ItemList.Verify Page Loaded

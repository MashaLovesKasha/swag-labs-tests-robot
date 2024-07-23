*** Settings ***
Resource    ./PO/Login.robot
Resource    ./PO/ItemList.robot
Resource    ./CommonWeb.robot


*** Keywords ***
Go To Login Page
    Login.Navigate To
    Login.Verify Page Loaded

Log In
    [Arguments]     ${username}     ${password}
    Login.Fill In "Username" Field     ${username}
    Login.Fill In "Password" Field     ${password}
    Login.Click "Login" Button

Go To Item List Page As Logged In User
    Login.Go To Login Page
    Login.Log In     ${STANDARD_USERNAME}     ${PASSWORD}
    Verify URL     ${URL}/inventory.html
    ItemList.Verify Page Loaded

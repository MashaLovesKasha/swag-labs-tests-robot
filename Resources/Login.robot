*** Settings ***
Resource    ./PO/Login.robot
Resource    ./PO/ItemList.robot
Resource    ./variables.robot

*** Keywords ***
Navigate
    Login.Navigate To
    Login.Verify Page Loaded

Authenticate
    [Arguments]     ${username}     ${password}
    Login.Fill In "Username" Field     ${username}
    Login.Fill In "Password" Field     ${password}
    Login.Click "Login" Button

Standard User
    Login.Authenticate    ${STANDARD_USERNAME}    ${PASSWORD}

Locked Out User
    Login.Authenticate    ${LOCKED_OUT_USERNAME}    ${PASSWORD}

Go To Item List Page As Logged In User
    Login.Navigate
    Login.Standard User
    Location Should Be     ${ITEM_LIST_URL}
    ItemList.Verify Page Loaded

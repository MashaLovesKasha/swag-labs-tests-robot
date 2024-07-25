*** Settings ***
Library  SeleniumLibrary
Resource    ../variables.robot

*** Variables ***
${ADD_TO_CART_BUTTON}     //*[@data-test="add-to-cart"]

*** Keywords ***
Verify Page Loaded
    [Arguments]     ${item_name}
    Wait until page contains     Back to products
    Page Should Contain     ${item_name}
    Location Should Contain      ${URL}/inventory-item.html

Click "Add To Cart" Button
    Click Element     ${ADD_TO_CART_BUTTON}

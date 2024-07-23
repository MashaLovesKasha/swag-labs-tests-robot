*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${ADD_TO_CART_BUTTON}     //*[@data-test="add-to-cart"]

*** Keywords ***
Verify Page Loaded
    [Arguments]     ${item_name}
    Wait until page contains     Back to products
    Wait until page contains     ${item_name}
    Location Should Contain      /inventory-item.html

Click Add To Cart Button
    Click Element     ${ADD_TO_CART_BUTTON}

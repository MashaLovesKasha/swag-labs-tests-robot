*** Settings ***
Library  SeleniumLibrary
Resource    ../variables.robot

*** Variables ***
${CART_ICON}     //*[@data-test="shopping-cart-link"]
${CART_ITEM}     //*[@data-test="inventory-item"]

*** Keywords ***
Navigate To
    Click Element     ${CART_ICON}

Verify Page Loaded
    Wait until page contains     Your Cart
    Location Should Be     ${URL}/cart.html

Count Number Of Cart Items
    ${cart_items_count}     Get Element Count     ${CART_ITEM}
    RETURN     ${cart_items_count}

Verify Number Of Cart Items
    [Arguments]     ${expected_items_count}
    ${actual_items_count}     Count Number Of Cart Items
    Should Be Equal As Numbers     ${actual_items_count}     ${expected_items_count}     The number of items in the cart is incorrect

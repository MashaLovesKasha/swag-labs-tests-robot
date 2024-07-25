*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${CART_ITEM}     //*[@data-test="inventory-item"]

*** Keywords ***
Count Number Of Items
    [Documentation]     Count the number of items in the cart or at the second step of checkout
    ${cart_items_count}     Get Element Count     ${CART_ITEM}
    RETURN     ${cart_items_count}

Verify Number Of Items
    [Arguments]     ${expected_items_count}
    [Documentation]     Verify the number of items in the cart or at the second step of checkout
    ${actual_items_count}     Count Number Of Items
    Should Be Equal As Numbers     ${actual_items_count}     ${expected_items_count}     The number of items in the cart is incorrect

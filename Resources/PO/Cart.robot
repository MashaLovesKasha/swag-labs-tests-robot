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

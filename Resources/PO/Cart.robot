*** Settings ***
Library  SeleniumLibrary
Resource    ../variables.robot

*** Variables ***
${CART_ICON}      //*[@data-test="shopping-cart-link"]
${CART_ITEM}      //*[@data-test="inventory-item"]
${CART_TITLE}     Your Cart

*** Keywords ***
Navigate To
    Click Element     ${CART_ICON}

Verify Page Loaded
    Wait until page contains     ${CART_TITLE}
    Location Should Be     ${CART_URL}

*** Settings ***
Library  SeleniumLibrary
Resource    ../variables.robot

*** Variables ***
${ADD_TO_CART_BUTTON}        //*[@data-test="add-to-cart"]
${BACK_TO_PRODUCTS_TEXT}     Back to products

*** Keywords ***
Verify Page Loaded
    [Arguments]     ${item_name}
    Wait until page contains     ${BACK_TO_PRODUCTS_TEXT}
    Page Should Contain     ${item_name}
    Location Should Contain      ${ITEM_PAGE_URL}

Click "Add To Cart" Button
    Click Element     ${ADD_TO_CART_BUTTON}

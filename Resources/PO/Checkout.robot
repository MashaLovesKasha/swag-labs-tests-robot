*** Settings ***
Library  SeleniumLibrary
Resource    ../variables.robot

*** Variables ***
${CHECKOUT_BUTTON}       //*[@data-test="checkout"]
${FIRST_NAME_FIELD}      //*[@data-test="firstName"]
${LAST_NAME_FIELD}       //*[@data-test="lastName"]
${POSTAL_CODE_FIELD}     //*[@data-test="postalCode"]
${CONTINUE_BUTTON}       //*[@data-test="continue"]
${FINISH_BUTTON}         //*[@data-test="finish"]

*** Keywords ***
Navigate To
    Click Element     ${CHECKOUT_BUTTON}

Verify First Step Loaded
    Wait until page contains     Checkout: Your Information
    Location Should Be     ${URL}/checkout-step-one.html

Verify Second Step Loaded
    Wait until page contains     Checkout: Overview
    Location Should Be     ${URL}/checkout-step-two.html

Verify Finish Step Loaded
    Wait until page contains     Checkout: Complete!
    Location Should Be      ${URL}/checkout-complete.html
    Page Should Contain     Thank you for your order!
    Page Should Contain     Your order has been dispatched, and will arrive just as fast as the pony can get there!

Fill In User Info
    [Arguments]     ${first_name}     ${last_name}     ${postal_code}
    [Documentation]     Fill in user information on the first checkout step
    Input Text     ${FIRST_NAME_FIELD}     ${first_name}
    Input Text     ${LAST_NAME_FIELD}     ${last_name}
    Input Text     ${POSTAL_CODE_FIELD}     ${postal_code}

Click Continue
    Click Button     ${CONTINUE_BUTTON}

Verify Overview Details
    Page Should Contain     Payment Information:
    Page Should Contain     Shipping Information:
    Page Should Contain     Price Total
    Page Should Contain     Total:

Click Finish
    Click Button     ${FINISH_BUTTON}

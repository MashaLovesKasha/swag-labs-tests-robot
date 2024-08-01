*** Settings ***
Library  SeleniumLibrary
Resource    ../variables.robot

*** Variables ***
${CHECKOUT_BUTTON}               //*[@data-test="checkout"]
${FIRST_NAME_FIELD}              //*[@data-test="firstName"]
${LAST_NAME_FIELD}               //*[@data-test="lastName"]
${POSTAL_CODE_FIELD}             //*[@data-test="postalCode"]
${CONTINUE_BUTTON}               //*[@data-test="continue"]
${FINISH_BUTTON}                 //*[@data-test="finish"]

${PAYMENT_INFORMATION_TEXT}      Payment Information:
${SHIPPING_INFORMATION_TEXT}     Shipping Information:
${PRICE_TOTAL_TEXT}              Price Total
${TOTAL_TEXT}                    Total:

${CHECKOUT_STEP_1_TITLE}         Checkout: Your Information
${CHECKOUT_STEP_2_TITLE}         Checkout: Overview
${CHECKOUT_COMPLETE_TITLE}       Checkout: Complete!
${ORDER_SUCCESS_MESSAGE}         Thank you for your order!
${ORDER_DISPATCH_MESSAGE}        Your order has been dispatched, and will arrive just as fast as the pony can get there!

*** Keywords ***
Navigate To
    Click Element     ${CHECKOUT_BUTTON}

Verify First Step Loaded
    Wait until page contains     ${CHECKOUT_STEP_1_TITLE}
    Location Should Be     ${CHECKOUT_STEP_1_URL}

Verify Second Step Loaded
    Wait until page contains     ${CHECKOUT_STEP_2_TITLE}
    Location Should Be     ${CHECKOUT_STEP_2_URL}

Verify Finish Step Loaded
    Wait until page contains     ${CHECKOUT_COMPLETE_TITLE}
    Location Should Be      ${CHECKOUT_COMPLETE_URL}
    Page Should Contain     ${ORDER_SUCCESS_MESSAGE}
    Page Should Contain     ${ORDER_DISPATCH_MESSAGE}

Fill In User Info
    [Arguments]     ${first_name}     ${last_name}     ${postal_code}
    [Documentation]     Fill in user information on the first checkout step
    Input Text     ${FIRST_NAME_FIELD}     ${first_name}
    Input Text     ${LAST_NAME_FIELD}     ${last_name}
    Input Text     ${POSTAL_CODE_FIELD}     ${postal_code}

Click Continue
    Click Button     ${CONTINUE_BUTTON}

Verify Overview Details
    Page Should Contain     ${PAYMENT_INFORMATION_TEXT}
    Page Should Contain     ${SHIPPING_INFORMATION_TEXT}
    Page Should Contain     ${PRICE_TOTAL_TEXT}
    Page Should Contain     ${TOTAL_TEXT}

Click Finish
    Click Button     ${FINISH_BUTTON}

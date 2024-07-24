*** Settings ***
Library  SeleniumLibrary
Resource    ../variables.robot

*** Variables ***
${CHECKOUT_BUTTON}       //*[@data-test="checkout"]
${FIRST_NAME_FIELD}      //*[@data-test="firstName"]
${LAST_NAME_FIELD}       //*[@data-test="lastName"]
${POSTAL_CODE_FIELD}     //*[@data-test="postalCode"]
${CONTINUE_BUTTON}       //*[@data-test="continue"]

*** Keywords ***
Navigate To Checkout First Step
    Click Element     ${CHECKOUT_BUTTON}

Verify Checkout First Step Loaded
    Wait until page contains     Checkout: Your Information
    Location Should Be     ${URL}/checkout-step-one.html

Verify Checkout Second Step Loaded
    Wait until page contains     Checkout: Overview
    Location Should Be     ${URL}/checkout-step-two.html

Fill User Info
    [Arguments]     ${first_name}     ${last_name}     ${postal_code}
    [Documentation]     Fill in user information on the first checkout step
    Input Text     ${FIRST_NAME_FIELD}     ${first_name}
    Input Text     ${LAST_NAME_FIELD}     ${last_name}
    Input Text     ${POSTAL_CODE_FIELD}     ${postal_code}

Click Continue
    Click Button  ${CONTINUE_BUTTON}

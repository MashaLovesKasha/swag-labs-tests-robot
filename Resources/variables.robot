*** Variables ***
${URL}        https://www.saucedemo.com
${BROWSER}    chrome

# Log in variables
${STANDARD_USERNAME}      standard_user
${LOCKED_OUT_USERNAME}    locked_out_user
${PASSWORD}               secret_sauce

# Checkout variables
${FIRST_NAME}     Mariia
${LAST_NAME}      Testonen
${POSTAL_CODE}    00250

# Page URLs
${ITEM_LIST_URL}            ${URL}/inventory.html
${ITEM_PAGE_URL}            ${URL}/inventory-item.html
${CART_URL}                 ${URL}/cart.html
${CHECKOUT_STEP_1_URL}      ${URL}/checkout-step-one.html
${CHECKOUT_STEP_2_URL}      ${URL}/checkout-step-two.html
${CHECKOUT_COMPLETE_URL}    ${URL}/checkout-complete.html

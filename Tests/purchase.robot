*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Login.robot
Resource    ../Resources/Purchase.robot
Resource    ../Resources/CommonWeb.robot
Resource    ../Resources/PO/Checkout.robot

Test Setup        CommonWeb.Begin Web Test As Logged In User
Test Teardown     CommonWeb.End Web Test
Suite Setup       Set Selenium Speed     0.3s


*** Test Cases ***
Customer successfully purchases products
    Log     Add 2 items to the cart from the item list
    Purchase.Add Item To Cart From Item List     Sauce Labs Fleece Jacket
    Purchase.Add Item To Cart From Item List     Test.allTheThings() T-Shirt (Red)

    Log     Go to the item page and add it to the cart from the item page
    Purchase.Add Item To Cart From Item Page     Sauce Labs Backpack

    Log     Go to the cart and check the number of items
    Purchase.Verify Number Of Cart Items     3

    Log     Go to checkout, fill user info, check the number of items and important overview details
    Purchase.Fill User Info     ${FIRST_NAME}    ${LAST_NAME}     ${POSTAL_CODE}
    Purchase.Verify Number Of Checkout Items     3
    Checkout.Verify Overview Details

    Log     Finish checkout and check the success message
    Purchase.Finish Checkout

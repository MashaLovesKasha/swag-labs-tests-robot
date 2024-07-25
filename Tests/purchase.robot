*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Purchase.robot
Resource    ../Resources/CommonWeb.robot
Resource    ../Resources/PO/Checkout.robot

Test Setup        CommonWeb.Begin Web Test As Logged In User
Test Teardown     CommonWeb.End Web Test

*** Test Cases ***
Customer successfully purchases products
    Log     Add 2 items to the cart from the item list
    Purchase.Add Item To Cart From Item List     Sauce Labs Fleece Jacket
    Purchase.Add Item To Cart From Item List     Test.allTheThings() T-Shirt (Red)

    Log     Go to the item page and add it to the cart from the item page
    Purchase.Add Item To Cart From Item Page     Sauce Labs Backpack

    Log     Go to the cart and check the number of items
    Purchase.Verify Number Of Cart Items     3

    Log     Go to checkout, fill in user info, check the number of items and important overview details
    Purchase.Fill In User Info     ${FIRST_NAME}    ${LAST_NAME}     ${POSTAL_CODE}
    Purchase.Verify Number Of Checkout Items     3
    Checkout.Verify Overview Details

    Log     Finish checkout and check the success message
    Purchase.Finish Checkout

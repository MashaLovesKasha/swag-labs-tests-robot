*** Settings ***
Resource    ./PO/ItemList.robot
Resource    ./PO/ItemPage.robot
Resource    ./PO/Cart.robot
Resource    ./PO/Checkout.robot
Resource    ./PO/Common.robot


*** Keywords ***
Add Item To Cart From Item List
    [Arguments]     ${item_name}
    [Documentation]     Add the specified item to the cart from the item list page
    ItemList.Click Add To Cart Button     ${item_name}
    Log     Item ${item_name} added to cart

Add Item To Cart From Item Page
    [Arguments]     ${item_name}
    [Documentation]     Click the specified item name to go to the item page and add it to the cart
    ItemList.Click Item Name     ${item_name}
    ItemPage.Verify Page Loaded    ${item_name}
    ItemPage.Click Add To Cart Button
    Log     Item ${item_name} added to cart

Check Number Of Cart Items
    [Arguments]     ${expected_items_count}
    Cart.Navigate To
    Cart.Verify Page Loaded
    Common.Verify Number Of Items     ${expected_items_count}

Fill User Info
    [Arguments]     ${first_name}     ${last_name}     ${postal_code}
    Checkout.Navigate To Checkout First Step
    Checkout.Verify Checkout First Step Loaded
    Checkout.Fill User Info     ${first_name}     ${last_name}     ${postal_code}
    Checkout.Click Continue

Check Number Of Checkout Items
    [Arguments]     ${expected_items_count}
    Checkout.Verify Checkout Second Step Loaded
    Common.Verify Number Of Items     ${expected_items_count}




*** Settings ***
Resource    ./PO/ItemList.robot
Resource    ./PO/ItemPage.robot
Resource    ./PO/Cart.robot
Resource    ./PO/Checkout.robot
Resource    ./PO/OverviewItemList.robot

*** Keywords ***
Add Item To Cart From Item List
    [Arguments]     ${item_name}
    [Documentation]     Add the specified item to the cart from the item list page
    ItemList.Click "Add To Cart" Button     ${item_name}

Add Item To Cart From Item Page
    [Arguments]     ${item_name}
    [Documentation]     Click the specified item name to go to the item page and add it to the cart
    ItemList.Click Item Name     ${item_name}
    ItemPage.Verify Page Loaded    ${item_name}
    ItemPage.Click "Add To Cart" Button

Verify Number Of Cart Items
    [Arguments]     ${expected_items_count}
    Cart.Navigate To
    Cart.Verify Page Loaded
    OverviewItemList.Verify Number Of Items     ${expected_items_count}

Fill In User Info
    [Arguments]     ${first_name}     ${last_name}     ${postal_code}
    Checkout.Navigate To
    Checkout.Verify First Step Loaded
    Checkout.Fill In User Info     ${first_name}     ${last_name}     ${postal_code}
    Checkout.Click Continue

Verify Number Of Checkout Items
    [Arguments]     ${expected_items_count}
    Checkout.Verify Second Step Loaded
    OverviewItemList.Verify Number Of Items     ${expected_items_count}

Finish Checkout
    Checkout.Click Finish
    Checkout.Verify Finish Step Loaded

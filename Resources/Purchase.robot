*** Settings ***
Resource    ./PO/ItemList.robot


*** Keywords ***
Add Item To Cart
    [Arguments]     ${item_name}
    [Documentation]     Add the specified item to the cart from the item list page
    ItemList.Click Add To Cart Button     ${item_name}
    Log     Item ${item_name} added to cart



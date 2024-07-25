*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../variables.robot

*** Variables ***
${SORTING_DROPDOWN}    //*[@data-test="product-sort-container"]
${ITEM_PRICES}         //*[@data-test="inventory-item-price"]
${ITEM_NAMES}          //*[@data-test="inventory-item-name"]

*** Keywords ***
Navigate To
    Go to     ${URL}/inventory.html

Verify Page Loaded
    Wait until page contains     Products
    Location Should Be     ${URL}/inventory.html

Select Sorting Option
    [Arguments]     ${option}
    Select From List By Label     ${SORTING_DROPDOWN}     ${option}
    Sleep     0.1 s

Convert Price Text To Numeric Price
    [Arguments]     ${text}
    ${cleaned_text}     Evaluate     float(${text.replace('$', '').strip()})
    RETURN     ${cleaned_text}

Get Item Prices
    [Documentation]     Get prices of all items and convert them to numbers
    @{prices}     Get WebElements     ${ITEM_PRICES}
    ${prices_text}     Create List
    FOR     ${element}     IN     @{prices}
      ${text}     Get Text     ${element}
      ${price}     Convert Price Text To Numeric Price     ${text}
      Append To List     ${prices_text}     ${price}
    END
    RETURN     ${prices_text}

Get Item Names
    [Documentation]     Get names of all items
    @{names}     Get WebElements     ${ITEM_NAMES}
    ${names_text}     Create List
    FOR     ${element}     IN     @{names}
      ${text}     Get Text     ${element}
      Append To List     ${names_text}     ${text}
    END
    RETURN     ${names_text}

Get Attribute Values
    [Arguments]     ${attribute}
    [Documentation]     Get names or prices of all items
    ${values} =     Run Keyword If     '${attribute}' == 'price'     Get Item Prices     ELSE     Get Item Names
    RETURN     ${values}

Transform Item Name To Data Test Attribute
    [Arguments]     ${item_name}
    [Documentation]  Transform the item name to create the data-test attribute for "Add to cart" button
    ${add_to_cart_data_test-attribute}     Set Variable     add-to-cart-${item_name.lower().replace(' ', '-')}
    RETURN     ${add_to_cart_data_test-attribute}

Click "Add To Cart" Button
    [Arguments]     ${item_name}
    [Documentation]  Click the "Add to cart" button for the specified item
    ${add_to_cart_data_test-attribute}     Transform Item Name To Data Test Attribute     ${item_name}
    Click Element     //*[@data-test="${add_to_cart_data_test-attribute}"]

Click Item Name
    [Arguments]     ${item_name}
    Click Link      ${item_name}

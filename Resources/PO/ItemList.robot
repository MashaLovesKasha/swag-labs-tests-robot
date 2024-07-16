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

Select Sorting Option
    [Arguments]     ${option}
    Select From List By Label     ${SORTING_DROPDOWN}     ${option}
    Sleep     1s

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
    ${values} =     Run Keyword If     '${attribute}' == 'price'     Get Item Prices     ELSE     Get Item Names
    RETURN     ${values}

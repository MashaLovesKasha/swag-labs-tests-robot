*** Settings ***
Library     Collections
Resource    ./PO/ItemList.robot


*** Keywords ***
# I have 2 solutions to check sorting here - separate keywords for price and name sorting
# and common keyword, which can check both. Depending on the sorting future I'd keep one or another solution.
# If there're going to be more sorting options, that I can't easily join in the common keyword -
# I'd have separate keywords for each option (code would be simplier and easier to maintain).
# If there're going to be only 2 current sorting optins - I'd keep one common keyword
# (less duplication, not difficult to maintain yet).

Check Sorting By Price
    [Arguments]     ${order}

    # Get the original list of item prices
    ${prices_before_sorting}     ItemList.Get Item Prices
    # Sort the original list choosing the sorting option in UI
    ItemList.Select Sorting Option     ${order}
    ${prices_after_sorting}     ItemList.Get Item Prices
    # Create a copy of the original list to sort it programmatically
    ${expected_sorted_prices}     Copy List     ${prices_before_sorting}
    Sort List     ${expected_sorted_prices}
    Run Keyword If     '${order}' == 'Price (high to low)'     Reverse List     ${expected_sorted_prices}
    # Compare the programmatically sorted list with the list obtained after sorting in UI
    Should Be Equal     ${prices_after_sorting}     ${expected_sorted_prices}


Check Sorting By Name
    [Arguments]     ${order}

    # Get the original list of item names
    ${names_before_sorting}     ItemList.Get Item Names
    # Sort the original list choosing the sorting option in UI
    ItemList.Select Sorting Option     ${order}
    ${names_after_sorting}     ItemList.Get Item Names
    # Create a copy of the original list to sort it programmatically
    ${expected_sorted_names}     Copy List     ${names_before_sorting}
    Sort List     ${expected_sorted_names}
    Run Keyword If     '${order}' == 'Name (Z to A)'     Reverse List     ${expected_sorted_names}
    # Compare the programmatically sorted list with the list obtained after sorting in UI
    Should Be Equal     ${names_after_sorting}     ${expected_sorted_names}


Check Sorting
    [Documentation]     Validates the sorting functionality based on the specified attribute and order
    [Arguments]     ${attribute}     ${order}
    #  ${attribute} - the item attribute to sort by (e.g., 'price', 'name')
    #  ${order} - the order to sort by, which can include 'Price (low to high)', 'Price (high to low)', 'Name (A to Z)', or 'Name (Z to A)'

    # Get the original list of attribute values
    ${values_before_sorting}  ItemList.Get Attribute Values  ${attribute}

    # Sort the original list choosing the sorting option in UI
    ItemList.Select Sorting Option  ${order}
    ${values_after_sorting}  ItemList.Get Attribute Values  ${attribute}

    # Create a copy of the original list to sort it programmatically
    ${expected_sorted_values}   Copy List   ${values_before_sorting}
    Sort List  ${expected_sorted_values}
    Run Keyword If  '${order}' == 'Name (Z to A)' or '${order}' == 'Price (high to low)'  Reverse List  ${expected_sorted_values}

    # Compare the programmatically sorted list with the list obtained after sorting in UI
    Should Be Equal  ${values_after_sorting}  ${expected_sorted_values}

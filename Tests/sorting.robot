*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Sorting.robot
Resource    ../Resources/Login.robot
Resource    ../Resources/CommonWeb.robot

Test Setup        Begin Web Test As Logged In User
Test Teardown     End Web Test
#Suite Setup       Set Selenium Speed     0.3s


*** Test Cases ***
Customer sorts product items by price (low to high)
    Sorting.Check Sorting By Price    Price (low to high)

Customer sorts product items by price (high to low)
    Sorting.Check Sorting    price    Price (high to low)

Customer sorts product items by name (A to Z)
    Sorting.Check Sorting By Name    Name (A to Z)

Customer sorts product items by name (Z to A)
    Sorting.Check Sorting    name    Name (Z to A)

*** Settings ***
Resource    ../resources/ProductDetailsPage.robot
Resource    ../resources/CartPage.robot
Resource    ../resources/HomePage.robot
Resource    ../variables/CommonVariables.robot

*** Variables ***
${CHECKOUT_BUTTON}    xpath=//input[@name='proceedToRetailCheckout']

*** Keywords ***
Proceed To Checkout
    [Documentation]    Proceeds to the checkout page from the cart.
    Wait Until Element Is Visible    ${CHECKOUT_BUTTON}    30s
    Click Button    ${CHECKOUT_BUTTON}
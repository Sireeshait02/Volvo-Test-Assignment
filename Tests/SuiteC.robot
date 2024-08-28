*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${URL}    https://www.amazon.in
${BROWSER}    chrome
${SEARCH_TERM}    smartphone
${ADD_TO_CART_BUTTON}    xpath=//button[@id='a-autoid-1-announce']
${GO_TO_CART_BUTTON}    xpath=//*[@data-csa-c-id='2nrmxy-pvh6xy-i7ymz8-vhigv0']
${CHECKOUT_BUTTON}    xpath=//input[@name='proceedToRetailCheckout']

*** Test Cases ***
Search Add To Cart And Checkout
    [Documentation]    This test case opens the Amazon homepage, searches for a smartphone, adds the product to the cart, and proceeds to checkout.
    Log    Starting test case: Search Add To Cart And Checkout
    Open Amazon Homepage
    Log    Amazon homepage opened successfully.
    Search For Product    ${SEARCH_TERM}
    Log    Searched for ${SEARCH_TERM}.
    Log    Waiting for Add to Cart button to appear.
    Wait Until Element Is Visible    ${ADD_TO_CART_BUTTON}    30s
    Click Button    ${ADD_TO_CART_BUTTON}
    Log    Product added to the cart.
    Log    Waiting for Go to Cart button to appear.
    BuiltIn.Sleep    15s
    Wait Until Element Is Visible    ${GO_TO_CART_BUTTON}    30s
    Click Button    ${GO_TO_CART_BUTTON}
    Log    Navigated to cart page
    Wait Until Element Is Visible    ${CHECKOUT_BUTTON}    30s
    Click Button    ${CHECKOUT_BUTTON}
    Log    Proceeded to checkout.
    Log    Test case Search Add To Cart And Checkout completed.

*** Keywords ***
Open Amazon Homepage
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Search For Product
    [Arguments]    ${product}
    Input Text    id=twotabsearchtextbox    ${product}
    Click Button    xpath=//input[@value='Go']
    Wait Until Element Is Visible    xpath=//span[@class='a-size-medium a-color-base a-text-normal']    10s

*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ADD_TO_CART_BUTTON}    //*[@id="a-autoid-1-announce"]

*** Keywords ***
Add Product To Cart
    Click Button    ${ADD_TO_CART_BUTTON}


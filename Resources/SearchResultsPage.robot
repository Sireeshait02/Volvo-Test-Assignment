*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${FIRST_PRODUCT}    xpath=(//span[@class='a-size-medium a-color-base a-text-normal'])[1]
${FILTER_CUSTOMER_REVIEWS}    xpath=//span[text()='4 Stars & Up']

*** Keywords ***
Select First Product
    Click Element    ${FIRST_PRODUCT}

Filter By Customer Reviews
    Click Element    ${FILTER_CUSTOMER_REVIEWS}

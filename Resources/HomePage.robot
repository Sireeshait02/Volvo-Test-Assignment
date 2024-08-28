*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SEARCH_BAR}    id=twotabsearchtextbox
${SEARCH_BUTTON}    xpath=//input[@value='Go']

*** Keywords ***
Open Amazon Homepage
    Open Browser    https://www.amazon.in    chrome
    Maximize Browser Window


Search For Product
    [Arguments]    ${product_name}
    Input Text    ${SEARCH_BAR}    ${product_name}
    Click Button    ${SEARCH_BUTTON}

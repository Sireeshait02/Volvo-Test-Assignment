*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${URL}    https://www.amazon.in
${BROWSER}    chrome

*** Test Cases ***
Browse Amazon Products
    [Documentation]    Test case to browse products on Amazon.in and log actions
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Log    Browser opened and maximized
    Input Text    id=twotabsearchtextbox    smartphone
    Log    Entered search term: laptop
    Click Button    xpath=//input[@value='Go']
    Log    Clicked search button
    Wait Until Element Is Visible    xpath=//span[@class='a-size-medium a-color-base a-text-normal']    10s
    Log    Search results are visible
    Capture Page Screenshot
    Log    Screenshot captured
    Close Browser
    Log    Browser closed

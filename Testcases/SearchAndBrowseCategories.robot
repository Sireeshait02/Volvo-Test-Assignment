*** Settings ***
Resource    ../resources/HomePage.robot
Resource    ../resources/SearchResultsPage.robot

*** Variables ***
${PAGE_LOAD_TIMEOUT}    20s
${PAGINATION_BUTTON}    //a[contains(@aria-label, 'Next')]
${PRODUCT_NAME}         //span[@class='a-size-medium a-color-base a-text-normal']

*** Test Cases ***
Search And Browse Laptops
    [Documentation]    This test case opens the Amazon homepage, searches for laptops, validates the search results, browses through pagination, and closes the browser.
    Log    Starting test case: Search And Browse Laptops
    Open Amazon Homepage
    Log    Amazon homepage opened successfully.
    Search For Product    laptop
    Log    Searched for laptops.
    Validate Search Results
    Log    Search results validated successfully.
    Browse Through Pages    3
    Log    Browsed through 3 pages of search results.
    Close Browser
    Log    Browser closed successfully.
    Log    Test case Search And Browse Laptops completed.

*** Keywords ***
Validate Search Results
    Log    Validating search results.
    Wait Until Page Contains Element    ${PRODUCT_NAME}    ${PAGE_LOAD_TIMEOUT}
    ${results}=    Get WebElements    ${PRODUCT_NAME}
    Should Be True    '${results}' != 'None'    No products were found in the search results.
    Log    Search results contain products with the specified search term.

Browse Through Pages
    [Arguments]    ${pages_to_browse}
    Log    Starting pagination through ${pages_to_browse} pages.
    FOR    ${i}    IN RANGE    ${pages_to_browse}
        Log    Browsing page ${i + 1}.
        ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${PAGINATION_BUTTON}    ${PAGE_LOAD_TIMEOUT}
        Run Keyword If    ${is_visible}    Log    Pagination button found on page ${i + 1}, navigating to next page.
        Run Keyword If    ${is_visible}    Scroll Element Into View    ${PAGINATION_BUTTON}
        Run Keyword If    ${is_visible}    Click Element    ${PAGINATION_BUTTON}
        Run Keyword If    ${is_visible}    Log    Moved to page ${i + 2}.
        Run Keyword If    ${is_visible}    Sleep    2s
        Run Keyword If    not ${is_visible}    Log    Pagination button not found on page ${i + 1}, stopping navigation.
        Exit For Loop If    not ${is_visible}
    END
    Log    Completed pagination through ${pages_to_browse} pages.

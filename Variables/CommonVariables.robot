*** Variables ***
${BROWSER}    chrome
${SITE_URL}   https://www.amazon.in
${FILTER_CUSTOMER_REVIEWS}    xpath=//span[contains(text(),'Customer Reviews')]
${PAGE_LOAD_TIMEOUT}    10s
${PAGINATION_BUTTON}    //a[contains(@class,'s-pagination-next')]
${PRODUCT_NAME}         //span[@class='a-size-medium a-color-base a-text-normal']
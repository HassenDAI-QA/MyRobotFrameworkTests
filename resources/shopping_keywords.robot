*** Settings ***
Library    SeleniumLibrary
Resource  ../variables/data.robot

*** Keywords ***
Open Browser And Go To Login Page
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Login With Valid Credentials
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password     ${PASSWORD}
    Click Button  id=login-button
    Wait Until Page Contains Element    css=.inventory_list

Add Product To Cart
    Click Button    xpath=//div[text()='${PRODUCT_NAME}']/ancestor::div[@class='inventory_item']//button

Go To Cart
    Click Element   class=shopping_cart_link
    Wait Until Page Contains    Your Cart

Verify Product Is In Cart
    Page Should Contain    ${PRODUCT_NAME}

Close Browser
    Close All Browsers
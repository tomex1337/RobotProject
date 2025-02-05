*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Login
    Open Browser    https://www.saucedemo.com    firefox
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Button    //*[@id="login-button"]
    Close Browser

empty username
    Open Browser    https://www.saucedemo.com    firefox
    Input Text    //*[@id="user-name"]    ${EMPTY}
    Input Password    //*[@id="password"]    secret_sauce
    Click Button    //*[@id="login-button"]
    Element Should Contain    //*[@id="login_button_container"]/div/form/div[3]/h3    Epic sadface: Username is required
    Close Browser

empty password
    Open Browser    https://www.saucedemo.com    firefox
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    ${EMPTY}
    Click Button    //*[@id="login-button"]
    Element Should Contain    //*[@id="login_button_container"]/div/form/div[3]/h3    Epic sadface: Password is required
    Close Browser

both empty
    Open Browser    https://www.saucedemo.com    firefox
    Input Text    //*[@id="user-name"]    ${EMPTY}
    Input Password    //*[@id="password"]    ${EMPTY}
    Click Button    //*[@id="login-button"]
    Element Should Contain    //*[@id="login_button_container"]/div/form/div[3]/h3    Epic sadface: Username is required
    Close Browser

invalid username
    Open Browser    https://www.saucedemo.com    firefox
    Input Text    //*[@id="user-name"]    agf
    Input Password    //*[@id="password"]    secret_sauce
    Click Button    //*[@id="login-button"]
    Element Should Contain    //*[@id="login_button_container"]/div/form/div[3]/h3    Epic sadface: Username and password do not match any user in this service
    Close Browser

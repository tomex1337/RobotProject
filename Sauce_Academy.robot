*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Login
    Open Browser    https://www.saucedemo.com    firefox
    Close Browser

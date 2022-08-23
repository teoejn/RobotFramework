*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  Chrome

*** Test Cases ***
Google
    [Tags]    DEBUG
    # ! Danger
    Open Browser   https://www.google.com/   ${BROWSER}
    Input Text     //*[@class = "gLFyf gsfi"]  DBS Bank
    Click button   //*[@class = "gNO89b"]

Yahoo
    # * Less Important
    [Tags]    DEBUG
    Open Browser   https://sg.yahoo.com/   ${BROWSER}
    Input Text     //*[@class = "_yb_onpab"]  DBS Bank
    Click button   //*[@class = "rapid-noclick-resp _yb_1ss1u"]

*** Keywords ***
Provided precondition
    Setup system under test
*** Settings ***
Documentation    Interview-01-02
Library     SeleniumLibrary
Library     ../venv/Lib/Common/RandomNames.py

Library  Collections
*** Variables ***
${BROWSER}  Chrome
*** Test Cases ***
Google
    [Tags]    Interview-01-02
    # ! 23/8/2022 9am-11am
    Open Browser  https://todo-list-login.firebaseapp.com/    ${BROWSER}
    Login

    @{List_names}  Create List
    FOR  ${i}  IN RANGE   0  10
      Exit For Loop If  ${i}==10
      ${Names}=    get_rand_names
      Append to list  ${List_names}   ${Names}
    END

    FOR  ${List_Name}   IN   @{List_Names}
        Sleep  3s
        Input Text     //*[@ng-model = "home.list"]   ${List_Name}
        Click button   //*[@ng-click = "home.list && home.add()"]
    END

    Click Button  //*[@class="btn btn-default"]
    Click Element  //*[@class = "btn btn-social btn-github"]

    FOR  ${i}  IN RANGE   0  5
      Exit For Loop If  ${i}==5
      Sleep  3s
      Click button  //*[@ng-click = "home.delete($index)"]
    END

    close browser
*** Keywords ***
Login
    ${Handle1}=  Get Window Handles
    Log to console  ${handle1}
    Maximize Browser Window
    Sleep  2s
    Click Element  //*[@class = "btn btn-social btn-github"]
    Sleep  5s
    Switch Window  locator=NEW
    Sleep  2s
    Input Text  //*[@id = "login_field"]  dummyaccountjoshua
    Sleep  2s
    Input Text  //*[@id = "password"]  Qwert@@@123
    Sleep  2s
    Click Button   //*[@type = "submit"]
    Sleep  2s

    ${result}  Run keyword and return status
    ...   Wait Until Page Contains Element   //*[@name="authorize"]  5s
    Run keyword If   '${result}'=='True'
    ...   Click Button  //*[@data-octo-click="oauth_application_authorization"]

    Sleep  5s
    Switch Window   locator=MAIN
    Sleep  2s




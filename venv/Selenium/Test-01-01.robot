*** Settings ***
Documentation    Interview-01-01
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  Chrome

*** Test Cases ***
Google
    [Tags]    Interview-01-01
    # ! 22/8/2022 5pm
    Open Browser  https://todo-list-login.firebaseapp.com/    ${BROWSER}
     ${Handle1}=  Get Window Handles
    Log to console  ${handle1}
    Maximize Browser Window
    Sleep  2s
    Click Element  //*[@class = "btn btn-social btn-github"]
    ${Handle1}=  Get Window Handles
    Log to console  ${handle1}[0]
    Sleep  5s
    Switch Window  locator=NEW
    Sleep  2s
    Input Text  //*[@id = "login_field"]  Teoejn@gmail.com
    Sleep  2s
    Input Text  //*[@id = "password"]  493715@Asd
    Sleep  2s
    Click Button   //*[@type = "submit"]
    Sleep  2s

    ${result}  Run keyword and return status
    ...   Wait Until Page Contains Element   //*[@name="authorize"]  5s
    Run keyword If   '${result}'=='True'
    ...   Click Button  //*[@data-octo-click="oauth_application_authorization"]

    Sleep  5s
    Switch Window   ${handle1}[0]
    Sleep  2s
    Page should contain  Todo Lists
    Page should contain  Add List
    Sleep  2s
    Input Text     //*[@ng-model = "home.list"]   List1
    Click button   //*[@ng-click = "home.list && home.add()"]
    SLeep  4s
    Input Text     //*[@ng-model = "home.list"]   List2
    Click button   //*[@ng-click = "home.list && home.add()"]
    Sleep  2s
    Input Text     //*[@ng-model = "home.list"]   List3
    Click button   //*[@ng-click = "home.list && home.add()"]
    Sleep  2s
    Input Text     //*[@ng-model = "home.list"]   List4
    Click button   //*[@ng-click = "home.list && home.add()"]
    Sleep  2s
    Input Text     //*[@ng-model = "home.list"]   List5
    Click button   //*[@ng-click = "home.list && home.add()"]
    Sleep  2s
    Input Text     //*[@ng-model = "home.list"]   List6
    Click button   //*[@ng-click = "home.list && home.add()"]
    Sleep  2s
    Input Text     //*[@ng-model = "home.list"]   List7
    Click button   //*[@ng-click = "home.list && home.add()"]
    Sleep  2s
    Input Text     //*[@ng-model = "home.list"]   List8
    Click button   //*[@ng-click = "home.list && home.add()"]
    Sleep  2s
    Input Text     //*[@ng-model = "home.list"]   List9
    Click button   //*[@ng-click = "home.list && home.add()"]
    Sleep  2s
    Input Text     //*[@ng-model = "home.list"]   List10
    Click button   //*[@ng-click = "home.list && home.add()"]

    Sleep  2s
    Click button  //*[@ng-click = "home.delete($index)"]
    Sleep  2s
    Click button  //*[@ng-click = "home.delete($index)"]
    Sleep  2s
    Click button  //*[@ng-click = "home.delete($index)"]
    Sleep  2s
    Click button  //*[@ng-click = "home.delete($index)"]
    Sleep  2s
    Click button  //*[@ng-click = "home.delete($index)"]


    Click button  //*[@class="btn btn-default"]




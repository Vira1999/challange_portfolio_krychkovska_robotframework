*** Settings ***
Library     SeleniumLibrary
Documentation    Suite description #automated tests for scout website


*** Variables ***
${LOGIN URL}      https://scouts-test.futbolkolektyw.pl/en
${BROWSER}        Chrome
${SIGNINBUTTON}     xpath=//*[text() = 'Sign in']
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${PAGELOGO}     xpath=//#[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]

*** Test Cases ***
Log in to the system
    Open to the system
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown]    Close Browser
#
#    [Tags]    Debug
#    Provided precondition
#    When action
#    Then check expectations

*** Keywords ***
Open login page
    Open Browser    $ {LOGIN URL}      $ {BROWSER}
    Title Should    Be Scouts panel - sign in
Type in email
    Input Text  ${EMAILINPUT}   user07@getnada.com
Type in password
    Input Text  ${PASSWORDINPUT}    Test-1234
Click on the Submit button
    Click Element    xpath=//*[text() = 'Sign in']
Assert dashboard
    Wait Until Element Is Visible    ${PAGELOGO}
    Title Should Be    Scouts panel
    Capture Element Screenshot    alert.png
#Provided precondition
#    Setup system under test
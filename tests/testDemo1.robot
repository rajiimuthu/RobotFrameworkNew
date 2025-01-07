****** Settings ***
Documentation    To validate the login form
Library  SeleniumLibrary
Test Teardown   Close Browser
#Resource

*** Variables ***
${Error_Message_Element}  css:.alert-danger

*** Test Cases ***
Validate UnSuccessful Login
    Open the browser with specified url
    Fill in login form
    wait until it checks and display error
    verify if it is correct

*** Keywords ***
 Open the browser with specified url
    Open Browser   https://rahulshettyacademy.com/loginpagePractise/   chrome
    Maximize Browser Window

Fill in login form
    Input Text    id:username    rajiimuthu@gmail.com
    Input Password    id:password    Pass@123
    Click Button    id:signInBtn

wait until it checks and display error
    Wait Until Element Is Visible    ${Error_Message_Element}

verify if it is correct
    ${error}=   Get Text    ${Error_Message_Element}
    Should Be Equal As Strings    ${error}     Incorrect username/password.
    Element Text Should Be    ${Error_Message_Element}    Incorrect username/password.





* Settings *
Library                   SeleniumLibrary
Resource                  ../Resources/login_page.robot
Library                   DataDriver    ../Resources/credentials.csv    sheet_name=Sheet1
Suite Setup               Open Browser    ${WebSauceDemo}   ${BROWSER}
Suite Teardown            Close Browser
Test Template             Step Login with invalid credentials
* Keywords *
Step Login with invalid credentials
    [Arguments]            ${username}    ${password}
    Input Username         ${username} 
    Input Password         ${password}
    Click button login
    Should showing error login
    Sleep    1s
Step Login with empty username
    [Arguments]            ${username}    ${password}
    Input Username         ${username} 
    Input Password         ${password}
    Click button login
    Should showing username required
    Sleep    1s
Step Login with empty password
    [Arguments]            ${username}    ${password}
    Input Username         ${username} 
    Input Password         ${password}
    Click button login
    Should showing password required
    Sleep    1s
Step Login with valid credentials
    [Arguments]            ${username}    ${password}
    Input Username         ${username} 
    Input Password         ${password}
    Click button login
    Shoud showing dashboard
    Sleep    1s
Login valid credentials using csv
    [Arguments]            ${username}    ${password}
    Sleep    1s
    Input Username         ${username}
    Input Password         ${password}
    Click button login
    Click Menu
    Click Logout
    Verify on Login page
* Test Cases *
Login invalid credentials    
    Step Login with invalid credentials        XYZ                         xyz
    Sleep    1s
Login empty username
    Step Login with empty username             ${EMPTY}                    ${credentialsPassword}
    Sleep    1s
Login empty pasword
    Step Login with empty password             ${credentialsUsername}      ${EMPTY}
    Sleep    1s
Login valid credentials
    Step Login with valid credentials          ${credentialsUsername}      ${credentialsPassword}
    Sleep    1s
    Click Menu
    Click Logout
    Verify on Login page
Login using csv    ${username}    ${password}
Login valid credentials using csv    ${username}    ${password}
Step Login with invalid credentials    ${username}    ${password}
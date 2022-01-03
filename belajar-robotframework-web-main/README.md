BELAJAR ROBOTFRAMEWORK WEB


Hi Perkenalkan Namaku Irfa Ramadhanti, panggil aja iir.

Kali ini saya akan memberikan tutorial Belajar Robotframework Web 

Linkedin : https://www.linkedin.com/in/irfa-ramadhanti/

Tools :

Python 3
Visual Studio Code
Plugin "Robotframework" dan "Pylance"
Web demo https://www.saucedemo.com/
Chromedriver untuk OS masing2


Berikut adalah langkah2 nya :

1. Buat Project pada IDE, disini saya menggunakan Visual Studio Code dan buatlah folder dengan judul belajar-framework-web 
![image](https://user-images.githubusercontent.com/73830257/146033460-f571f37b-e849-4a2e-884d-2718f1ad0cb5.png)

2. Install Plugin ini "Robotframework" dan "Pylance"
![image](https://user-images.githubusercontent.com/73830257/146034041-45ce0a85-4b0c-452c-b14e-57003da18582.png)

3. Buat file TestLogin.robot lalu maskan teks seperti berikut
![image](https://user-images.githubusercontent.com/73830257/146034595-8a5621fd-0688-429e-8860-469f6b0f6ec2.png)

*** Settings ***
Library              SeleniumLibrary
Suite Setup          Open Browser    ${WebURL}        ${BROWSERS}
Suite Teardown       Close Browser
Library              DataDriver     credentials.csv       sheet_name=Sheet1
Test Template        I want to login with invalid credentials

*** Variables ***
${BROWSERS}          Chrome
${WebURL}            https://www.saucedemo.com/

*** Keywords ***
I want to login with invalid credentials
    [Arguments]            ${username}         ${password}
    Input Text             id=user-name        ${username}
    Input Text             id=password         ${password}
    Click Element          id=login-button
    Capture Page Screenshot
    Page Should Contain    Epic sadface: Username and password do not match any user in this service

*** Test Cases ***
# Login with invalid credentials userA                ${username}      ${password}
# Login with invalid credentials userB                ${username}      ${password}  
# Login with invalid credentials userC                ${username}      ${password} 
# Login with invalid credentials standar_user         standard_user     secret_sauce
Login with invalid credentials Should failed with CSV failed       ${username}       ${password}


4. Tambahkan Webdriver (disini saya menggunakan ChromeDriver dan bisa di download di "https://chromedriver.chromium.org/downloads") lalu buat Directory driver dan simpan ChromeDriver
![image](https://user-images.githubusercontent.com/73830257/146036085-454ee1fa-4283-4a3b-b669-bfd649b8c087.png)


5. Buat folder resource dan step, buat directory login_locators.yaml dan login_page.robot dalam folder resource
![image](https://user-images.githubusercontent.com/73830257/146037027-4c3d0a31-5907-4221-b9f5-2fee8fafdb3d.png)
![image](https://user-images.githubusercontent.com/73830257/146037058-9b860a5d-140d-4194-aba7-2638d1de6b9b.png)

login_locators.yaml

txtUsername : user-name
txtPassword : password
btnLogin    : login-button

login_page.robot

* Settings *
Library                    SeleniumLibrary
Variables                  ../Resources/login_locators.yaml
* Variables *
${WebSauceDemo}            https://www.saucedemo.com/
${BROWSER}                 chrome
* Keywords *
Open Browser to WebSauceDemo
    Open Browser    ${WebSauceDemo}   ${BROWSER}
    Maximize browser window
Close my Browsers
    Close Browser
Input Username
    [Arguments]     ${username}
    Input Text      ${txtUsername}    ${username}
Input Password
    [Arguments]     ${password}
    Input Text      ${txtPassword}    ${password}
Click button login
    Click Element   ${btnLogin}
    Sleep    2s
Verify on Login page
    Page Should Contain    Accepted usernames are:
Shoud showing dashboard
    Page Should Contain    Sauce Labs Backpack
Should showing error login
    Page Should Contain    Username and password do not match any user in this service
Should showing username required
    Page Should Contain    Username is required 
Should showing password required
    Page Should Contain    Password is required
    
    
6. input file credentials.csv seperti berikut
![image](https://user-images.githubusercontent.com/73830257/146037692-26e327ae-24ee-4e6c-811c-8bd235a815dd.png)

credentials.csv

${username};${password}
standard_user;xs;
standard_user;ssss;
standard_user;sw3s;
standard_user;sdas;


Dan untuk cara mencari Elementnya bagaimana? Klik kanan aja lalu klik inspect element dan arahkan pada elementnya, contoh seperti dibawah ini :
![image](https://user-images.githubusercontent.com/73830257/146038180-533da8dc-de4f-4435-8800-335533058eed.png)

![image](https://user-images.githubusercontent.com/73830257/146038290-50e02419-7838-4fa8-ad85-f6292036511d.png)

![image](https://user-images.githubusercontent.com/73830257/146038348-35b292ba-92a8-4b9a-8af3-2fdc2dd86606.png)

continue..



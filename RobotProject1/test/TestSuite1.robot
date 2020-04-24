*** Settings ***
Library    SeleniumLibrary    

Suite Setup    Log    I am inside Test Suite Setup    
Suite Teardown    Log    I am inside Test Suite Teardown    
Test Setup    Log    I am inside Test Setup    
Test Teardown    Log    I am inside Test Teardown  

Default Tags    sanity
  

*** Test Cases ***
MyFirstTest
    [Tags]    smoke
    Log    Hello World!

MySecondTest
    Log    I am in second test case
    Set Tags    regression1
    Remove Tags    regression1
    
MyThirdTest
    Log   I am in third test case
    

# FirstSeleniumTest
   # # Create Webdriver    chrome    executable path="C:\Users\Nur Islam\Downloads\chromedriver_win32\chromedriver.exe"
    # Open Browser    https://www.google.com    chrome
    # Set Browser Implicit Wait    5
    # Input Text    name=q    Automation Step by Step   
    # Press Keys    name=q    ENTER
    # #Click Button    name=btnK        
    # Sleep    2    
    # Close Browser
    # Log    Test Completed    
    
# SampleLoginTest
    # [Documentation]    This is a sample login test
    # Open Browser    https://opensource-demo.orangehrmlive.com    chrome
    # Set Browser Implicit Wait    3
    # Input Text    id=txtUsername	Admin
    # Input Text    id=txtPassword    admin123   
    # Sleep    1    
    # Click Button    id=btnLogin    
    # Click Element    id=welcome    
    # Click Element    link=Logout 
    # Close Browser   
    # Log    Test completed    

# SampleLoginTestWithVariable
    # [Documentation]    This is a sample login test
    # Open Browser    ${URL}    chrome
    # Set Browser Implicit Wait    3
    # LoginKW    #using USER DEFINE Keyword
    # Click Element    id=welcome    
    # Click Element    link=Logout  
    # Close Browser  
    # Log    Test completed
    # Log    ${TEST NAME} was executed by %{username} on %{os}    #use ENVIRONMENTAL variable

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com    #use SCALAR variable
@{CREDENTIALS}    Admin    admin123    #use LIST Variable
&{LOGINDATA}    username=Admin    password=admin123    #use DICTIONARY variable

*** Keywords ***
LoginKW
    Input Text    id=txtUsername	@{CREDENTIALS}[0]
    Input Text    id=txtPassword    &{LOGINDATA}[password]   
    Click Button    id=btnLogin 
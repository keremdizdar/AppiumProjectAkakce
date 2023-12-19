*** Settings ***
Library    AppiumLibrary
Resource    AccountsPage.robot
Resource    HomePage.robot
Resource    SearchPage.robot
*** Variables ***
${pop_up_message}  id=framePopupLyt
${execution_env}  local
${user}  standard_user1
*** Keywords ***
Open Akakce Application
  Run Keyword If    "${execution_env}"=="local"
  ...  Open Akakce Application In Local
  Run Keyword If    "${execution_env}"=="browserstack"
  ...  Open Akakce Application In BrowserStack
Open Akakce Application in Local
  Open Application
  ...  remote_url=http://localhost:4723
  ...  platformName=Android
  ...  platformVersion=11.0
  ...  deviceName=emulator
  ...  appPackage=com.akakce.akakce
  ...  appActivity=com.akakce.akakce.ui.splash.SplashActivity
  ...  automationName=Uiautomator2
Open Akakce Application in BrowserStack
  Open Application
  ...  remote_url=http://michaelmyers_rJgFDB:QxW4xzurr6NxAq5UtUfC@hub.browserstack.com/wd/hub
  ...  platformName=Android
  ...  platformVersion=11.0
  ...  deviceName=Samsung Galaxy S21
  ...  appPackage=com.akakce.akakce
  ...  appActivity=com.akakce.akakce.ui.splash.SplashActivity
  ...  automationName=Uiautomator2
  ...  app=bs://30fe1004c7b175a615fc6170d715a5149c2632f1
  ...  buildName=Smoke Tests
  ...  projectName=Akakce
Close Pop Up Message
  Wait Until Page Contains Element    ${pop_up_message}  timeout=15
  Click Element    ${pop_up_message}
Scroll To Element
  [Arguments]    ${element}
  ${iselementVisible}  Run Keyword And Return Status    Wait Until Page Contains Element    ${element}
  WHILE    "${iselementVisible}"=="False"
  Swipe By Percent    50  65  50  30  300
  ${iselementVisible}  Run Keyword And Return Status    Wait Until Page Contains Element    ${element}
  END
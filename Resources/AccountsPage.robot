*** Settings ***
Library    AppiumLibrary
Library    ../Libraries/StringGenerator.py
Variables    ../Data/user_details.yaml
Resource    Common.robot
*** Variables ***
${login_button}  id=login_btn
${login_hesap_olustur}  id=register_btn
${register_name_input_field}  id=name_edt
${register_surname_input_field}  id=surname_edt
${register_email_input_field}  xpath=(//*[@resource-id='com.akakce.akakce:id/email_edt'])[2]
${register_email2_input_field}  id=email_ag_edt
${register_password_input_field}  xpath=(//*[@resource-id='com.akakce.akakce:id/password_edt'])[2]
${register_password2_input_field}  id=password_ag_edt
${register_accept_terms}  id=privacyCheck
${register_hesap_olustur}  xpath=(//*[@text='Hesap Oluştur'])[1]
${login_username_input_field}  id=email_edt
${login_password_input_field}  id=password_edt
*** Keywords ***
Verify Login Page Displayed
  Wait Until Page Contains Element  ${login_button}
Click On Hesap Oluştur Button
  Wait Until Page Contains Element    ${login_hesap_olustur}
  Click Element    ${login_hesap_olustur}
Set Register Values
  ${register_user_name}  Generate Name
  ${register_user_surname}  Generate Surname
  ${register_email}  Generate Email
  ${register_password}  Generate Password
  Set Test Variable    ${register_user_name}
  Set Test Variable    ${register_user_surname}
  Set Test Variable    ${register_email}
  Set Test Variable    ${register_password}
Enter Register Details
  Set Register Values
  Wait Until Page Contains Element    ${register_name_input_field}
  Input Text    ${register_name_input_field}  ${register_user_name}
  Input Text    ${register_surname_input_field}  ${register_user_surname}
  Input Text    ${register_email_input_field}  ${register_email}
  Input Text    ${register_email2_input_field}  ${register_email}
  Input Text    ${register_password_input_field}  ${register_password}
  Input Text    ${register_password2_input_field}  ${register_password}
Accept Terms And Conditions
  Scroll To Element    ${register_accept_terms}
  Click Element    ${register_accept_terms}
Click On Register button
  Wait Until Page Contains Element    ${register_hesap_olustur}
  Click Element    ${register_hesap_olustur}
Verify New User Is Created
  Wait Until Page Contains    Profilim
  Log To Console    Name And Surname = ${register_user_name} ${register_user_surname}
  Wait Until Page Contains    ${register_user_name} ${register_user_surname}
Enter Standard User Login Credentials
  Log To Console    Name And Surname = ${${user}.name} ${${user}.surname}
  Input Text    ${login_username_input_field}  ${${user}.email}
  Input Text    ${login_password_input_field}  ${${user}.password}
Click On Login Button
  Wait Until Page Contains Element    ${login_button}
  Click Element    ${login_button}
Verify User is Logged in
  Wait Until Page Contains    Profilim
  Log To Console    Name And Surname = ${standard_user1.name} ${standard_user1.surname}
  Wait Until Page Contains    ${standard_user1.name} ${standard_user1.surname}
*** Settings ***
Library    AppiumLibrary
Resource    Common.robot
*** Variables ***
${search_input_field}  id=searchText
${search_input_field2}  xpath=(//*[@resource-id='com.akakce.akakce:id/searchTextView'])[2]
${second_product}  xpath=(//*[@resource-id='com.akakce.akakce:id/cellContainer'])[2]
${go_to_the_product_button}  id=detailBtnTextView
${follow_the_product}  xpath=//*[@text='Takip Et']
*** Keywords ***
Type Bilgisayar In The Search Box And Click Enter
  Wait Until Page Contains Element    ${search_input_field}
  Click Element    ${search_input_field}
  Wait Until Page Contains Element    ${search_input_field2}
  Input Text    ${search_input_field2}  Bilgisayar
  Press Keycode    66
Select First Product
  Wait Until Page Contains Element    ${second_product}
  Click Element    ${second_product}
Go To Selected Product
  Swipe    500  1500  500  700
  Wait Until Page Contains Element    ${go_to_the_product_button}
  Click Element    ${go_to_the_product_button}
Scroll To The Follow Button
  Scroll To Element    ${follow_the_product}
Click On The Follow Button
  Click Element    ${follow_the_product}
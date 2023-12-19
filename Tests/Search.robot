*** Settings ***
Resource    ../Resources/Common.robot
Test Setup    Open Akakce Applicationl
Test Teardown    Close Application
*** Test Cases ***
Search For Bilgisayar
  [Tags]    search
  Close Pop Up Message
  Type Bilgisayar In The Search Box And Click Enter
  Select First Product
  Go To Selected Product
  Scroll To The Follow Button
  Click On The Follow Button
  Verify Login Page Displayed
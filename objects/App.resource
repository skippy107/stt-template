*** Settings ***

Resource          ../adapters/SeleniumLibrary.resource

Documentation     Defines all resources and keywords for
...               handling the application object
...
...  

*** Variables ***

${App.Url}    ${APP_URL}
${App.PageTitle}    ${APP_PAGETITLE}

*** Keywords ***
# drop additional test fragments for the App object here
Open
    [Documentation]  Open the browser and navigate to the application home page

    Open Browser    ${App.Url}    ${Selenium.Browser.Name}
    Maximize Browser Window

    Set Selenium Implicit Wait    ${Selenium.ImplicitWaitTime}
    Set Selenium Timeout    ${Selenium.Timeout}
    
    Register Keyword To Run on Failure    Capture Page Screenshot

    #App.Pause Browser At    https://www.google.com    60s    A Search Term

    App.Init

Close
    [Documentation]  Close the application
    Register Keyword To Run on Failure    Capture Page Screenshot
    App.Logout
    Close Browser

    Log    Application closed successfully.

Pause Browser At
    [Documentation]  Pauses the browser at ``URL`` for ``timeout`` 
    ...              seconds until ``text`` appears on the screen
    [Arguments]    ${url}    ${timeout}    ${text}
    SeleniumLibrary.Go To    ${url}
    Wait Until Page Contains    ${text}    ${timeout}

Init
    [Documentation]  Initialize the application for the test
    # Delete All Cookies
    App.GoTo

    Log    Application initialized successfully.

GoTo
    [Documentation]  Navigate to the application home page
    ${Current.Location}=    Get Location
    Run Keyword If    '${Current.Location}'!='${App.Url}'    SeleniumLibrary.Go To    ${App.Url}
    #Sleep    5s
    Wait Until Keyword Succeeds    5x    2s    Title Should Be    ${App.PageTitle}

Login
    [Documentation]  Login to the application using the web browser
    No Operation
    Log    Keyword 'App.Login' not implemented in ${SUITE_NAME}  WARN

Logout
    [Documentation]  Logout of the application using the web browser
    No Operation
    Log    Keyword 'App.Logout' not implemented in ${SUITE_NAME}  WARN



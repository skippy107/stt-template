﻿*** Settings ***
Resource          ../adapters/SeleniumLibrary.resource

Documentation     Custom Variables for the ${SUITE NAME} tests
...
...

Resource          env/${Env}.resource

*** Variables ***
#
# The settings file includes the global variables used by any test 
# cases in the current test suite
#
#  Variable Naming Conventions
#
#  ALL-CAPS-DASH-FOR-SPACE           Robot Framework variable
#  Title-Case-Dash-For-Space         Suite level variable
#  Title Case Spaces                 Keyword Argument
#  lower_case_underscore_space       Keyword level variable, usually temporary
#

# Default Test Variables - will be used if not overidden on command line or
#                          from another resource file
#


#
# for different environments -  qa, stage, preprod, prod 
#
${Env}    dev


# These Keywords are available to any test which includes this file
#
*** Keywords ***
Click Element Using JavaScript by Xpath
    [Arguments]    ${xpath}
    [Documentation]
	...  Click element using javascript while passing location using xpath
    Execute JavaScript    document.evaluate('${xpath}',document.body,null,9,null).singleNodeValue.click();

Click Element Using JavaScript by Id
    [Arguments]    ${id}
    [Documentation]
	...  Click element using javascript while passing location using id
    Execute JavaScript    document.getElementById('${id}').click()

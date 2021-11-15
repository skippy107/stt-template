*** Settings ***

Resource    settings/All.Settings.resource                 #  suite specific variables defined here
Resource    imports/All.Imports.resource                   #  imports objects to map given/when/then
                                                           #  keywords to low level application objects


Test Teardown    Test Cleanup

Suite Setup       App.Open
Suite Teardown    App.Close

Documentation    *Example Tests*
...    
...    This test suite consists of UI tests written in Given/When/Then syntax
...    
...    Given xxx
...    When yyy 
...    Then zzz 
...    And qqq
...    

*** Keywords ***
# drop given/ when/ then/ test fragments here



#################################################################################
Test Cleanup
    Capture Page Screenshot
    Run Keyword and Ignore Error    App.Logout

#################################################################################

# The custom keywords represent the implementation of
# the Business Rules.  The custom keywords defined above are called by the 
# test cases below, each one testing the boundaries of a specific Business Rule
#
# Note how the custom keyword uses a behavior driven style and the
# test case uses a data driven style

  
| *Test Cases*                                        | *Run Keywd*           |
#  add a unique test case name for each keyword defined above
#| Unique Test Case Name                               | Keyword Name          |





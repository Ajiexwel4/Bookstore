@author
Feature: Authors page
  
  Login as admin
  I want to see authors page

  Scenario: admin can to see authors page
    Given The admin is logged in.
    When he wants to see the list of authors, provided in the shop,
    Then he clicks the Authors tab.
    And sees a list of all available authors with attributes.
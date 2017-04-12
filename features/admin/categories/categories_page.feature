@category
Feature: Categories page
  
  Login as admin
  I want to see categories page

  Scenario: admin can see categories page
    Given The admin is logged in.
    When he wants to see the list of categories,
    Then he clicks the Categories tab
    And sees the list of all available categories with attributes.
    
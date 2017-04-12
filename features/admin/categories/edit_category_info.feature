@category
Feature: Edit category info by admin
  
  Login as admin
  I want to edit category info

  Scenario: admin can edit category info
    Given The admin is logged in.   
    And he is at the Categories tab.
    When he wants to correct a category name,
    And he clicks the Edit category button,
    And The admin changes Name,
    And clicks the update category button,
    Then changes are saved.
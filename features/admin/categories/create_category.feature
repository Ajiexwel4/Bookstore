@category
Feature: Create category by admin
  
  Login as admin
  I want to create category

  Scenario: admin can create category
    Given The admin is logged in.
    And he is at the Categories tab.
    When he wants to create a new category,
    And he enters a name into the Name field,
    And he clicks the Create button,
    Then data is saved and a newly created category is shown in the list.
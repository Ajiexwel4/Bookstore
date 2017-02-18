@fail
Feature: Admin is able to change attributes of book from book view
  
  Login as admin
  I want to change any attributes of book from book view

  Scenario: admin can to change any attributes of book from book view
    Given The admin is logged in.
    And he is at the Book view.
    And he can see all book attributes,
    And he is able to change any of it (empty for new book),
    When he clicks the Save button,
    Then changes will be saved.
@author
Feature: Create author by admin
  
  Login as admin
  I want to create author

  Scenario: admin can to create author
    Given The admin is logged in.
    And he is at the Authors tab.
    When he wants to create a new author,
    And he clicks the Create button,
    Then a form appears,
    And The admin enters First Name, Last Name, and Description,
    And he clicks the Save button
    Then data is saved and a new created author is shown in the list of authors in Authors tab.
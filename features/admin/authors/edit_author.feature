@author
Feature: Edit author info by admin
  
  Login as admin
  I want to edit author info

  Scenario: admin can to edit author info
    Given The admin is logged in.
    And he is at the Authors tab.
    When he wants to correct data of a particular author,
    And he clicks the Edit button,
    Then a form appears,
    And The admin edits First Name, Last Name and Description,
    And he clicks the Update button
    Then data is saved and the author is shown in the list of authors in Authors tab.
@author @fail
Feature: Delete author by admin
  
  Login as admin
  I want to delete author

  Scenario: admin can to delete author
    Given The admin is logged in.
    And he is at the Authors tab.
    When he wants to delete some authors in the list,
    And he checks the checkbox against items,
    And he clicks the Delete button,
    Then a confirmation dialogue is shown: “Are you sure you want to delete this items? They are associated with [Quantity] of books.” Y/N
    When The admin clicks the Yes button,
    Then the dialogue closes, selected items will be deleted from the list of authors.
    When The admin clicks the No button,
    Then the dialogue closes, items stay selected.
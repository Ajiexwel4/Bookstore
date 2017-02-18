@category
Feature: Delete category by admin
  
  Login as admin
  I want to delete category

  Scenario: admin can delete category
    Given The admin is logged in.
    And he is at the Categories tab.
    When he wants to delete some categories from the list,
    And he checks the checkbox against the items,
    And he clicks the Delete button,
    Then a confirmation dialogue is shown: Are you sure you want to delete these item? They are associated with [Quantity] of books. Y/N
    When The admin clicks the Yes button,
    Then the dialogue closes, selected items will be deleted from the list of authors.
    When The admin clicks the No button,
    Then dialogue closes, items stays selected.
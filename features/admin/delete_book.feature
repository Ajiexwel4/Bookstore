@fail
Feature: Admin deletes some books

  Login as admin
  I want to delete some books

  Scenario: admin can to delete some books
    Given The admin is logged in
    And he is at the Books tab.
    When The admin wants to delete some books,
    And he checks the checkbox against items,
    And he clicks the Delete button,
    Then a confirmation dialogue is shown: “Are you sure you want to delete this items?” Y/N
    When The admin clicks the Yes button,
    Then the dialogue closes, selected items will be deleted from the list of   books.
    When The admin clicks the No button,
    Then the dialogue closes, items stay selected.
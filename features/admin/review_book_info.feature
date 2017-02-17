@admin @new
Feature: Admin review full book description

  Login as admin
  I want to see a full description of the book

  Scenario: admin can to see a full description of the book
    Given The admin is logged in
    And he is at the Books tab.
    When The admin wants to see a full description of the book
    And he clicks the View button,
    Then he will be transferred to the Book view.
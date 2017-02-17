@admin
Feature: Admin creates a new book

  Login as admin
  I want to create a new book

  Scenario: admin can creates a new book
    Given The admin is logged in
    And he is at the Books tab.
    When The admin wants to create a new one,
    And he clicks the Create button. 
    Then he will be transferred to the Book view.  
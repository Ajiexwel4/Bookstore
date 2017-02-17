@admin
Feature: Admin books page
  
  Login as admin
  I want to see admin books page

  Scenario: admin can to see his books page
    Given The admin is logged in.
    When he wants to see the list of books, provided in the shop,
    Then he clicks the Books tab
    And sees the list of all books with attributes.
@order @fail
Feature: Change state of orders
  
  Login as admin
  I want to change state of orders

  Scenario: Admin can to change state of orders
    Given The admin is logged in,
    And he is at the Orders tab.
    When he wants to change the state of order,
    And he clicks the Change State button,
    Then The state field becomes available to change,
    And The user chooses a state from the list,
    And clicks the Save button,
    Then a new status of order is show in the list.
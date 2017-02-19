@order @fail
Feature: Orders page
  
  Login as admin
  I want to see orders page

  Scenario: Admin can to see orders page
    Given The admin is logged in.
    When he wants to see a list of orders,
    Then he clicks the Orders tab
    And sees a list of processing orders with attributes in the In Progress tab.
    When he wants to see already delivered orders,
    And he clicks the Delivered tab,
    Then the admin sees the list of delivered orders with attributes.
    When he wants to see canceled orders,
    And he clicks the Canceled tab,
    Then the admin sees the list of canceled orders with attributes.
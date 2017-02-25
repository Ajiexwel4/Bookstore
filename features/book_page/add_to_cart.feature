@book
Feature: Home page
  
  As a guest user or logged in
  I want to add books to my cart

  Scenario: user can add books to his cart
    Given The user is logged in or a guest
    And he is at the Book view,
    When the user wants to add a book to his cart
    Then he chooses quantity by clicking the ‘-’/‘+’ buttons (default value=1, increment=1)
    And clicks the Add to Cart button,
    Then the specified quantity of this book will be added to his Cart.
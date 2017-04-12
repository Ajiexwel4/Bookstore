Feature: Book page
  
  As a guest user or logged in
  I want to see details about a book

  Scenario: user can sees details about a book
    Given The user is logged in or a guest
    When he wants to see details about a book
    Then he places cursor on the photo of the book
    And clicks the View icon,
    Then he will be transferred to the Book view.
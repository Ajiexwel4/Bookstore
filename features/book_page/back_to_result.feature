Feature: Back to result
  
  As a guest user or logged in, at the book view
  I want to turn back to the search result

  Scenario: user turns back to the search result
    Given The user is logged in 
    And he is at the Book view
    When he wants to turn back to the search results
    And he clicks the Back to results link
    Then he will be transferred to the Catalog page with previously applied filters.
@review @fail
Feature: Approve review
  
  Login as admin
  I want to approve review

  Scenario: Admin can to approve review
    Given The admin is logged in,
    And he is at the Reviews tab,
    When he wants to approve a review,
    And he clicks the Approve button against an item,
    Then the review is shown in the list of book reviews.
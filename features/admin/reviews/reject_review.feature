@review @fail
Feature: Reject review
  
  Login as admin
  I want to reject review

  Scenario: Admin can to reject review
    Given The admin is logged in,
    And he is at the Reviews tab,
    When he wants to reject a review,
    And he clicks the Reject button against an item,
    Then the review will not be shown in the list of book reviews.
@review @fail
Feature: Reviews page
  
  Login as admin
  I want to see reviews page

  Scenario: Admin can to see reviews page
    Given The admin is logged in,
    When he wants to see reviews,
    Then he clicks the Reviews tab
    And sees the list of new reviews(unprocessed) in New tab.
    When he wants to see already processed reviews,
    And he clicks the Processed tab,
    Then the admin sees the list of reviews with status.
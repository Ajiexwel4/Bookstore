Feature: Home page
  
  As a guest user
  I want to use 'Get started' button on home page

  Scenario: guest user can click on 'Get started' button on home page
    Given The user is logged in or a guest
    And he is at the Home page, Get Started
    When he clicks the Get Started button
    Then he will be transferred to the Catalog page.
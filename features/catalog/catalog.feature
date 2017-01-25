Feature: Catalog page
  
  As a guest user or logged in
  I want to see catalog page in the shop

  Scenario: user can click on the 'Shop' link and redirect to Catalog page
    Given The user is logged in or a guest
    When he wants to see a range of books in the shop
    Then he clicks the Shop link in the top right corner
    And will be transferred to the Catalog page.
    And he can change a filter by theme (‘All’ by default, only one filter can be chosen from this list),
    And he can change the order of displayed items. 
    When there are more search results than a page can display,
    Then the user can click the View More button at the bottom of the page,
    And next results will be displayed.
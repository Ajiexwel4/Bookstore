Feature: Write a review
  
  As a guest user or logged in, at the book view
  I want to leave a review about a book

  Scenario: user can write reviews and after creating it he can see a message
    Given The user is logged in 
    And he is at the Book view
    When he wants to leave a review about a book
    Then he scrolls down to the end of reviews to the Write a Review block,
    And he assigns a score,
    And enters a Title,
    And enters a text of review in the Review text box,
    And clicks the Post button,
    Then the user will see a message: ‘Thanks for Review. It will be published as soon as Admin will approve it.’
    And his review is sent to the Admin panel, Reviews, the New tab.
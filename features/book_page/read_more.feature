Feature: Read more
  
  As a guest user or logged in, at the book view
  I want to use 'Get started' button on home page

  Scenario: user can clic on 'Read more' button if he wants to read long book description(more 6 lines)
    Given The user is logged in or a guest
    And he is at the Book view,
    When the description of a book has more than 6 lines of text
    And the user wants to read a full description
    Then he clicks the Read More link at the end of last line,
    And the entire description will be displayed below the first 6 lines.
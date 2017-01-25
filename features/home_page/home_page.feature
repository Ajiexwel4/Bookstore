Feature: Home page
	
	As a guest user
	I want to see home page

	Scenario: guest user sees home page
	  Given The user is logged in or a guest
	  And he is on the Home page
	  Then he can see books from the Mobile development category by default 
		When he wants to change the category
		Then he clicks the Home link in the top right corner
		And chooses a filter from the following options: Mobile development, Photo, Web design, Web development.
		And respective sections are displayed for each category: Latest books, Get Started, Best sellers.
Feature: Home page
	
	As a guest user
	I want to see latest books on home page

	Scenario: guest user sees latest books on home page
		Given The user is logged in or a guest
		And he is at the Home page, Latest books
		When the user wants to flip the slide
		Then he clicks on it
		And the next slide is shown. 
		When he wants to add an item to the Cart
		Then he clicks the Buy Now button and the chosen item will be added to the cart.

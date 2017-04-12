Given(/^he is at the Book view\.$/) do
  click_on('Books')
  click_on('View')
end

Given(/^he can see all book attributes,$/) do
  expect(page).to have_content(@book.description)
end

Given(/^he is able to change any of it \(empty for new book\),$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^he clicks the Save button,$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^changes will be saved\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

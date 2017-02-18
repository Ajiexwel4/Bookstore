Given(/^he is at the Authors tab\.$/) do
  click_on 'Authors'
end

When(/^he wants to create a new author,$/) do
end

When(/^he clicks the Create button,$/) do
  click_on 'New Author'
end

Then(/^a form appears,$/) do
end

Then(/^The admin enters First Name, Last Name, and Description,$/) do
  fill_in 'Firstname', with: 'John'
  fill_in 'Lastname', with: 'Horton'
  fill_in 'Description', with: 'John Horton'
end

Then(/^he clicks the Save button$/) do
  click_on 'Create Author'
end

Then(/^data is saved and a new created author is shown in the list of authors in Authors tab\.$/) do
  visit admin_authors_path
  expect(page).to have_content('John Horton')
end

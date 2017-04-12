When(/^he wants to correct data of a particular author,$/) do
end

When(/^he clicks the Edit button,$/) do
  click_on 'Edit'
end

Then(/^The admin edits First Name, Last Name and Description,$/) do
  fill_in 'Firstname', with: 'John'
  fill_in 'Lastname', with: 'Horton'
  fill_in 'Description', with: 'John Horton'
end

Then(/^he clicks the Update button$/) do
  click_on 'Update Author'
end

Then(/^data is saved and the author is shown in the list of authors in Authors tab\.$/) do
  visit admin_authors_path
  expect(page).to have_content('John Horton')
end

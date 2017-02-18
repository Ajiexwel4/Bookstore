When(/^he wants to see the list of authors, provided in the shop,$/) do
  @author = create(:author)
end

Then(/^he clicks the Authors tab\.$/) do
  click_on 'Authors'
end

Then(/^sees a list of all available authors with attributes\.$/) do
  expect(page).to have_content(@author.firstname)
  expect(page).to have_content(@author.lastname)
  expect(page).to have_content(@author.description)
end

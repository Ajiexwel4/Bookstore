Before { @category = create(:category) }
When(/^he wants to see the list of categories,$/) do
end

Then(/^he clicks the Categories tab$/) do
  click_on 'Categories'
end

Then(/^sees the list of all available categories with attributes\.$/) do
  expect(page).to have_content(@category.name)
end

Before { @book = create(:book) }
When(/^The admin wants to see a full description of the book$/) do
  click_on 'View'
end

When(/^he clicks the View button,$/) do
  expect(page).to have_content(@book.description)
end

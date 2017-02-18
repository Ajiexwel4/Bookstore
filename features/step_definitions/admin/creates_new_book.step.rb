Given(/^The admin is logged in$/) do
end

Given(/^he is at the Books tab\.$/) do
  click_on 'Books'
end

When(/^The admin wants to create a new one,$/) do
  click_on 'New Book'
  expect(page).to have_content('New Book')
end

When(/^he clicks the Create button\.$/) do
  @book = build(:book)
  click_on 'Create Book'
  expect(page).to have_content('Book was successfully created.')
end


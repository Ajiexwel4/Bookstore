Given(/^The admin is logged in\.$/) do
  @book = create(:book)
  admin = create(:admin)
  visit root_path
  login(admin.email, admin.password)
end

When(/^he wants to see the list of books, provided in the shop,$/) do
end

Then(/^he clicks the Books tab$/) do
  click_on('Books')
end

Then(/^sees the list of all books with attributes\.$/) do
  expect(page).to have_content(@book.title)
end

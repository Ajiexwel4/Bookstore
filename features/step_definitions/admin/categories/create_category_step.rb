Given(/^he is at the Categories tab\.$/) do
  click_on 'Categories'
end

When(/^he wants to create a new category,$/) do
  click_on 'New Category'
end

When(/^he enters a name into the Name field,$/) do
  fill_in 'Name', with: 'Web dev'
  click_on 'Create Category'
end

Then(/^data is saved and a newly created category is shown in the list\.$/) do
  visit admin_categories_path
  expect(page).to have_content('Web dev')
end

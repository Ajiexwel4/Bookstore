When(/^he wants to correct a category name,$/) do
end

When(/^he clicks the Edit category button,$/) do
  find('#category_2').click_on 'Edit'
end

When(/^The admin changes Name,$/) do
  fill_in 'Name', with: 'Development'
end

When(/^clicks the update category button,$/) do
  click_on 'Update Category'
end

Then(/^changes are saved\.$/) do
  expect(page).to have_content('Development')
end


